import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_event.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/presentations/env.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Adjust イベント送信用の共通ラッパー。
///
/// - すべてのイベントはこのクラス経由で送信する
/// - 画面からは Env の生トークンに直接触れない
class AdjustEventTracker {
  const AdjustEventTracker._();

  /// 汎用トラッカー。
  static void track(
    String token, {
    num? revenue,
    String? currency,
    String? transactionId,
  }) {
    final event = AdjustEvent(token);
    if (revenue != null && currency != null) {
      event.setRevenue(revenue, currency);
    }
    if (transactionId != null && transactionId.isNotEmpty) {
      event.transactionId = transactionId;
    }
    Adjust.trackEvent(event);
  }

  /// ログイン
  static void trackLogin() {
    track(Env.adjustEventTokenLogin);
  }

  /// 新規会員登録
  static void trackSignUp() {
    track(Env.adjustEventTokenSignUp);
  }

  /// 登録フロー完了
  static void trackRegistrationComplete() {
    track(Env.adjustEventTokenRegistrationComplete);
  }

  /// LP購入
  static void trackLpPurchase({
    required int points,
    num? revenue,
    String? currency,
    String? transactionId,
  }) {
    String? token;
    switch (points) {
      case 10:
        token = Env.adjustEventTokenPurchaseLp10;
      case 30:
        token = Env.adjustEventTokenPurchaseLp30;
      case 50:
        token = Env.adjustEventTokenPurchaseLp50;
      case 100:
        token = Env.adjustEventTokenPurchaseLp100;
    }
    if (token == null) {
      return;
    }
    track(
      token,
      revenue: revenue,
      currency: currency,
      transactionId: transactionId,
    );
  }

  /// MP購入
  static void trackMpPurchase({
    required int points,
    num? revenue,
    String? currency,
    String? transactionId,
  }) {
    String? token;
    switch (points) {
      case 10:
        token = Env.adjustEventTokenPurchaseMp10;
      case 30:
        token = Env.adjustEventTokenPurchaseMp30;
      case 50:
        token = Env.adjustEventTokenPurchaseMp50;
      case 100:
        token = Env.adjustEventTokenPurchaseMp100;
    }
    if (token == null) {
      return;
    }
    track(
      token,
      revenue: revenue,
      currency: currency,
      transactionId: transactionId,
    );
  }

  /// 通常の「いいね」
  static void trackLike() {
    track(Env.adjustEventTokenLike);
  }

  /// アピール！
  static void trackAppeal() {
    track(Env.adjustEventTokenAppeal);
  }

  /// 「いいね ありがとう」
  static void trackLikeThanks() {
    track(Env.adjustEventTokenLikeThanks);
  }

  /// メッセージ付きいいね
  static void trackLikeWithMessage() {
    track(Env.adjustEventTokenLikeWithMessage);
  }

  /// マッチング成立
  static void trackMatching() {
    track(Env.adjustEventTokenMatching);
  }

  /// スキップ
  static void trackSkip() {
    track(Env.adjustEventTokenSkip);
  }

  /// ブースト
  static void trackBoost() {
    track(Env.adjustEventTokenBoost);
  }

  /// リバース（リワインド）
  static void trackReverse() {
    track(Env.adjustEventTokenReverse);
  }

  /// なりきり挨拶・返信
  static void trackPersonaGreetingOrReply() {
    track(Env.adjustEventTokenPersonaGreetingReply);
  }

  /// プライベートモード購入
  static void trackPrivateModePurchase({
    required int months,
  }) {
    String? token;
    switch (months) {
      case 1:
        token = Env.adjustEventTokenPurchasePrivateMode1m;
      case 3:
        token = Env.adjustEventTokenPurchasePrivateMode3m;
      case 6:
        token = Env.adjustEventTokenPurchasePrivateMode6m;
    }
    if (token == null) {
      return;
    }
    track(token);
  }

  /// 有料プラン購入（ベーシック/プレミアム、通常/独身割）
  static void trackSubscriptionPurchase({
    required bool isBasicPlan,
    required GenderCode genderCode,
    required PackageType packageType,
    required bool isSingleDiscount,
    num? revenue,
    String? currency,
    String? transactionId,
  }) {
    final months = switch (packageType) {
      PackageType.monthly => 1,
      PackageType.threeMonth => 3,
      PackageType.sixMonth => 6,
      _ => null,
    };
    if (months == null) {
      return;
    }

    final isMale = genderCode == GenderCode.GENDER_CODE_MALE;
    final isFemale = genderCode == GenderCode.GENDER_CODE_FEMALE;

    String? token;

    if (isBasicPlan) {
      if (!isMale) {
        // ベーシックプランは男性のみ
        return;
      }
      if (isSingleDiscount) {
        switch (months) {
          case 1:
            token = Env.adjustEventTokenSingleDiscountBasic1mMale;
          case 3:
            token = Env.adjustEventTokenSingleDiscountBasic3mMale;
          case 6:
            token = Env.adjustEventTokenSingleDiscountBasic6mMale;
        }
      } else {
        switch (months) {
          case 1:
            token = Env.adjustEventTokenPurchaseBasic1mMale;
          case 3:
            token = Env.adjustEventTokenPurchaseBasic3mMale;
          case 6:
            token = Env.adjustEventTokenPurchaseBasic6mMale;
        }
      }
    } else {
      if (isMale) {
        if (isSingleDiscount) {
          switch (months) {
            case 1:
              token = Env.adjustEventTokenSingleDiscountPremium1mMale;
            case 3:
              token = Env.adjustEventTokenSingleDiscountPremium3mMale;
            case 6:
              token = Env.adjustEventTokenSingleDiscountPremium6mMale;
          }
        } else {
          switch (months) {
            case 1:
              token = Env.adjustEventTokenPurchasePremium1mMale;
            case 3:
              token = Env.adjustEventTokenPurchasePremium3mMale;
            case 6:
              token = Env.adjustEventTokenPurchasePremium6mMale;
          }
        }
      } else if (isFemale) {
        if (isSingleDiscount) {
          switch (months) {
            case 1:
              token = Env.adjustEventTokenSingleDiscountPremium1mFemale;
            case 3:
              token = Env.adjustEventTokenSingleDiscountPremium3mFemale;
            case 6:
              token = Env.adjustEventTokenSingleDiscountPremium6mFemale;
          }
        } else {
          switch (months) {
            case 1:
              token = Env.adjustEventTokenPurchasePremium1mFemale;
            case 3:
              token = Env.adjustEventTokenPurchasePremium3mFemale;
            case 6:
              token = Env.adjustEventTokenPurchasePremium6mFemale;
          }
        }
      }
    }

    if (token == null) {
      return;
    }
    track(
      token,
      revenue: revenue,
      currency: currency,
      transactionId: transactionId,
    );
  }

  /// プロフィール詳細閲覧
  static void trackProfileDetailView() {
    track(Env.adjustEventTokenProfileDetailView);
  }

  /// 本人確認完了
  static void trackIdentityVerification() {
    track(Env.adjustEventTokenIdentityVerification);
  }

  /// 独身証明完了
  static void trackSingleVerification() {
    track(Env.adjustEventTokenSingleVerification);
  }

  /// しつもん投稿
  static void trackQuestionPost() {
    track(Env.adjustEventTokenQuestionPost);
  }

  /// しつもんへの回答
  static void trackQuestionAnswer() {
    track(Env.adjustEventTokenQuestionAnswer);
  }

  /// しつもん回答の閲覧
  static void trackQuestionAnswerView() {
    track(Env.adjustEventTokenQuestionAnswerView);
  }

  /// メッセージ送信
  static void trackMessageSent() {
    track(Env.adjustEventTokenMessageSent);
  }

  /// メッセージ受信
  static void trackMessageReceived() {
    track(Env.adjustEventTokenMessageReceived);
  }

  /// ブロック
  static void trackBlock() {
    track(Env.adjustEventTokenBlock);
  }

  /// 非表示
  static void trackHide() {
    track(Env.adjustEventTokenHide);
  }

  /// 違反報告
  static void trackReport() {
    track(Env.adjustEventTokenReport);
  }

  /// 退会
  static void trackWithdrawal() {
    track(Env.adjustEventTokenAccountWithdrawal);
  }
}


