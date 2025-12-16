/* eslint-disable max-len */
import {onDocumentCreated} from "firebase-functions/v2/firestore";
import * as logger from "firebase-functions/logger";
import {initializeApp} from "firebase-admin/app";
import {getFirestore} from "firebase-admin/firestore";
import {getMessaging, MulticastMessage} from "firebase-admin/messaging";

initializeApp();

/**
 * like_events コレクションにドキュメントが追加されたら、
 * toUserId の端末に「fromUserDisplayName さんがいいねしました」のPushを送る。
 */
export const onLikeCreated = onDocumentCreated(
  "like_events/{eventId}",
  async (event) => {
    const snap = event.data;
    if (!snap) {
      logger.warn("onLikeCreated: event.data is undefined");
      return;
    }

    const data = snap.data() as {
      fromUserId?: string;
      fromUserDisplayName?: string;
      toUserId?: string;
    };

    const {fromUserId, fromUserDisplayName, toUserId} = data;

    if (!fromUserId || !toUserId || !fromUserDisplayName) {
      logger.warn("onLikeCreated: missing fields", {data});
      return;
    }

    const db = getFirestore();
    const tokensSnap = await db
      .collection("user_fcm_tokens")
      .doc(toUserId)
      .collection("tokens")
      .get();

    if (tokensSnap.empty) {
      logger.info(
        `onLikeCreated: no FCM tokens for user ${toUserId}`,
      );
      return;
    }

    const tokens: string[] = [];
    tokensSnap.forEach((doc) => {
      const token = doc.data().token as string | undefined;
      if (token) {
        tokens.push(token);
      }
    });

    if (tokens.length === 0) {
      logger.info(
        `onLikeCreated: no valid FCM tokens for user ${toUserId}`,
      );
      return;
    }

    const message: MulticastMessage = {
      tokens,
      notification: {
        title: "いいねが届きました",
        body: `${fromUserDisplayName}さんがあなたにいいねしました`,
      },
      data: {
        type: "like_received",
        fromUserId,
      },
      android: {
        priority: "high",
      },
      apns: {
        payload: {
          aps: {
            "sound": "default",
            "content-available": 1,
          },
        },
      },
    };

    const messaging = getMessaging();
    const response = await messaging.sendEachForMulticast(message);

    const cleanupTasks: Promise<FirebaseFirestore.WriteResult>[] = [];
    response.responses.forEach((res, index) => {
      if (!res.success) {
        const error = res.error;
        const failedToken = tokens[index];

        logger.warn(
          `onLikeCreated: Failed to send to token ${failedToken}`,
          error?.code,
          error?.message,
        );

        if (
          error &&
          (error.code === "messaging/invalid-registration-token" ||
            error.code ===
              "messaging/registration-token-not-registered")
        ) {
          cleanupTasks.push(tokensSnap.docs[index].ref.delete());
        }
      }
    });

    if (cleanupTasks.length > 0) {
      await Promise.all(cleanupTasks);
    }

    logger.info(
      `onLikeCreated: sent notifications to ${tokens.length} tokens` +
        ` for user ${toUserId}`,
    );
  },
);
