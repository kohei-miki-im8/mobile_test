import 'dart:async';

import 'package:connectrpc/connect.dart';
import 'package:connectrpc/http2.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart' as protocol;
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/advice/v1/get_approach_analysis.pb.dart';
// advice
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/advice/v1/get_ideal.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/advice/v1/service.connect.client.dart';
// block
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/get_blocked_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/update_user_block.pb.dart';
// chat
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_chat_topics.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_persona_greeting.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_persona_reply.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_chat_topics.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_counseling_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_date_intention.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_messages.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_scheduled_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_simulator_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/leave_counseling_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/leave_simulator_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/purchase_force_read_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_disconnect_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/subscribe_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_date_intention.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_pinned_chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_push_notice_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_visible_status.pb.dart';
// ekyc
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/ekyc/v1/get_service_auth.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/ekyc/v1/service.connect.client.dart';
// favorite関連
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/get_favorite_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/update_user_favorite.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/footprint/v1/get_footprints.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/footprint/v1/service.connect.client.dart';
// Global関連
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/get_announcements.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/get_notification_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/get_notifications.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/mark_notifications_as_read.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/publish_notification.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/subscribe_notification_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/update_notification_settings.pb.dart';
// 非表示関連
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/get_hidden_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/update_user_hide.pb.dart';
// カルテ関連
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/karte/v1/get_karte.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/karte/v1/service.connect.client.dart';
// matching関連
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_appeal.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_like.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_skip.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/delete_skip.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/get_likes.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/get_skips.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/service.connect.client.dart';
// media関連
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/media/v1/chunked_media_upload.pb.dart' as media_pb;
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/media/v1/service.connect.client.dart' as media_service;
// payment関連
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/payment/v1/restore_subscriptions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/payment/v1/service.connect.client.dart';
// photo関連
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/delete_profile_photo.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/update_profile_photo_caption.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/update_profile_photo_display_order.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/create_profile.pb.dart';
// profile
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/update_profile.pb.dart';
// question
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/approve_question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/create_question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/delete_question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/delete_question_answer.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/get_approved_questions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/subscribe_question_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/update_question_answer.pb.dart';
// registration
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/create_registration_step_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/get_latest_registration_step.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/service.connect.client.dart';
// search
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_affinity_recommendation_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_latest_user_search_conditions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_recommendation_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_search_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/service.connect.client.dart';
// tag
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/create_user_tag.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/delete_user_tag.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_tag_categories.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_tags.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_user_tags.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/service.connect.client.dart';
// user
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_external_user.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_user_agreement_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_user_boost.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_external_user.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_agreement_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_boost.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_inquiries.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_point_history.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_points.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_private_mode.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/update_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/update_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/upsert_user_private_mode.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/withdraw_user.pb.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/services/remote_config_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

// ディスパッチテーブルで使用するInvoker型（ライブラリスコープに配置）
typedef _UnaryInvoker = Future<dynamic> Function(
    dynamic client,
    dynamic request,
    Headers headers,
    );

// API呼び出しの結果を表すクラス
class ApiResult<T extends Object> {

  ApiResult.success(this.data, {this.headers})
      : error = null,
        isSuccess = true;

  ApiResult.failure(this.error)
      : data = null,
        headers = null,
        isSuccess = false;

  final T? data;
  final Headers? headers;
  final Object? error;
  final bool isSuccess;

  bool get isError => !isSuccess;
}

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  return ApiClient(ref);
}

class ApiClient {
  ApiClient(this._ref);

  final Ref _ref;

  String? _baseUrl;
  String? _contentType;

  // プロパティ
  String? get baseUrl => _baseUrl;
  set baseUrl(String? value) => _baseUrl = value;
  set contentType(String? value) => _contentType = value;

  // トランスポート作成
  protocol.Transport createTransport(String baseUrl) {
    return protocol.Transport(
      baseUrl: baseUrl,
      codec: const ProtoCodec(),
      httpClient: createHttpClient(),
    );
  }

  // ヘッダーを作成
  Headers createHeaders([Map<String, String>? additionalHeaders]) {
    final headers = Headers();

    // AuthRepositoryからキャッシュされた認証トークンを取得
    final authRepository = _ref.read(authRepositoryProvider);
    final authToken = authRepository.authorizationToken;

    if (authToken != null) {
      headers.add('Authorization', authToken);
    }

    if (_contentType != null) {
      headers.add('Content-Type', _contentType!);
    }

    additionalHeaders?.forEach(headers.add);
    return headers;
  }

  // サービスクライアントの作成
  T createClient<T>(T Function(protocol.Transport) clientCreator) {
    final transport = createTransport(ApiConstants.baseUrl);
    return clientCreator(transport);
  }

  // UnaryのAPI呼び出しメソッド（第1段階: タイムアウト + 1回リトライ追加）
  Future<ApiResult<T>> call<T extends Object>({
    required dynamic client,
    required ApiMethodUnary method,
    required dynamic request,
    Map<String, String>? additionalHeaders,
  }) async {

    // メンテナンスチェック
    try {
      await RemoteConfigService.fetchAndActivate(); // minimumFetchIntervalが効くので毎回でもOK
      if (RemoteConfigService.isMaintenanceMode) {
        final message = RemoteConfigService.maintenanceMessage;
        return ApiResult.failure(
          ApiException(
            message: message,
            statusCode: 503,
            code: 'MAINTENANCE',
            cause: null,
          ),
        );
      }
    } catch (e) {
      final apiError = _toApiException(e);
      return ApiResult.failure(apiError);
    }

    Future<T> doInvoke() async {
      final headers = createHeaders(additionalHeaders);
      final dynamic response = await _invokeRaw(
        client: client,
        method: method,
        request: request,
        headers: headers,
      );
      return response as T;
    }
    try {
      // タイムアウト付与
      final invoke = () => doInvoke().timeout(ApiConstants.timeout);
      // 1回だけリトライ（401はリフレッシュ試行）
      try {
        final res = await invoke();
        return ApiResult.success(res);
      } catch (e) {
        if (_isUnauthorized(e)) {
          final refreshed = await _tryRefreshAuthToken();
          if (refreshed) {
            try {
              final res = await invoke();
              return ApiResult.success(res);
            } catch (_) {
              // 下にフォールバック
            }
          }
        }
        await Future<void>.delayed(ApiConstants.retryDelay);
        final res = await invoke();
        return ApiResult.success(res);
      }
    } catch (e) {
      final apiError = _toApiException(e);
      return ApiResult.failure(apiError);
    }
  }

  // ディスパッチテーブルに集約
  Future<dynamic> _invokeRaw({
    required dynamic client,
    required ApiMethodUnary method,
    required dynamic request,
    required Headers headers,
  }) async {
    final invoker = _invokers[method];
    if (invoker == null) {
      throw Exception('Unsupported method: $method');
    }
    return invoker(client, request, headers);
  }

  late final Map<ApiMethodUnary, _UnaryInvoker> _invokers = <ApiMethodUnary, _UnaryInvoker>{
    // チャットルーム関連
    ApiMethodUnary.createChatRoom: (c, r, h) => (c as ChatServiceClient)
        .createChatRoom(r as CreateChatRoomRequest, headers: h),
    ApiMethodUnary.getChatRooms: (c, r, h) => (c as ChatServiceClient)
        .getChatRooms(r as GetChatRoomsRequest, headers: h),
    ApiMethodUnary.getCounselingChatRoom: (c, r, h) => (c as ChatServiceClient)
        .getCounselingChatRoom(r as GetCounselingChatRoomRequest, headers: h),
    ApiMethodUnary.getScheduledChatRooms: (c, r, h) => (c as ChatServiceClient)
        .getScheduledChatRooms(r as GetScheduledChatRoomsRequest, headers: h),
    ApiMethodUnary.getSimulatorChatRooms: (c, r, h) => (c as ChatServiceClient)
        .getSimulatorChatRooms(r as GetSimulatorChatRoomsRequest, headers: h),
    ApiMethodUnary.leaveSimulatorChatRoom: (c, r, h) => (c as ChatServiceClient)
        .leaveSimulatorChatRoom(r as LeaveSimulatorChatRoomRequest, headers: h),
    ApiMethodUnary.leaveCounselingChatRoom: (c, r, h) => (c as ChatServiceClient)
        .leaveCounselingChatRoom(r as LeaveCounselingChatRoomRequest, headers: h),
    ApiMethodUnary.updatePushNoticeStatus: (c, r, h) => (c as ChatServiceClient)
        .updatePushNoticeStatus(r as UpdatePushNoticeStatusRequest, headers: h),
    ApiMethodUnary.updateVisibleStatus: (c, r, h) => (c as ChatServiceClient)
        .updateVisibleStatus(r as UpdateVisibleStatusRequest, headers: h),

    // チャット関連
    ApiMethodUnary.createChatTopics: (c, r, h) => (c as ChatServiceClient)
        .createChatTopics(r as CreateChatTopicsRequest, headers: h),
    ApiMethodUnary.createPersonaGreeting: (c, r, h) => (c as ChatServiceClient)
        .createPersonaGreeting(r as CreatePersonaGreetingRequest, headers: h),
    ApiMethodUnary.createPersonaReply: (c, r, h) => (c as ChatServiceClient)
        .createPersonaReply(r as CreatePersonaReplyRequest, headers: h),
    ApiMethodUnary.getChatTopics: (c, r, h) => (c as ChatServiceClient)
        .getChatTopics(r as GetChatTopicsRequest, headers: h),
    ApiMethodUnary.purchaseForceReadStatus: (c, r, h) => (c as ChatServiceClient)
        .purchaseForceReadStatus(r as PurchaseForceReadStatusRequest, headers: h),
    ApiMethodUnary.getDateIntention: (c, r, h) => (c as ChatServiceClient)
        .getDateIntention(r as GetDateIntentionRequest, headers: h),
    ApiMethodUnary.getMessages: (c, r, h) => (c as ChatServiceClient)
        .getMessages(r as GetMessagesRequest, headers: h),
    ApiMethodUnary.publishChatMessage: (c, r, h) => (c as ChatServiceClient)
        .publishChatMessage(r as PublishChatMessageRequest, headers: h),
    ApiMethodUnary.publishDisconnectChatSession: (c, r, h) =>
        (c as ChatServiceClient).publishDisconnectChatSession(
            r as PublishDisconnectChatSessionRequest,
            headers: h),
    ApiMethodUnary.updateDateIntention: (c, r, h) => (c as ChatServiceClient)
        .updateDateIntention(r as UpdateDateIntentionRequest, headers: h),
    ApiMethodUnary.updatePinnedChatMessage: (c, r, h) => (c as ChatServiceClient)
        .updatePinnedChatMessage(r as UpdatePinnedChatMessageRequest, headers: h),

    // user関連
    ApiMethodUnary.createUserAgreementLog: (c, r, h) => (c as UserServiceClient)
        .createUserAgreementLog(r as CreateUserAgreementLogRequest, headers: h),
    ApiMethodUnary.createUserBoost: (c, r, h) => (c as UserServiceClient)
        .createUserBoost(r as CreateUserBoostRequest, headers: h),
    ApiMethodUnary.getUserAgreementLog: (c, r, h) => (c as UserServiceClient)
        .getUserAgreementLog(r as GetUserAgreementLogRequest, headers: h),
    ApiMethodUnary.getUserBoost: (c, r, h) => (c as UserServiceClient)
        .getUserBoost(r as GetUserBoostRequest, headers: h),
    ApiMethodUnary.getUserInquiries: (c, r, h) => (c as UserServiceClient)
        .getUserInquiries(r as GetUserInquiriesRequest, headers: h),
    ApiMethodUnary.getUserPrivateMode: (c, r, h) => (c as UserServiceClient)
        .getUserPrivateMode(r as GetUserPrivateModeRequest, headers: h),
    ApiMethodUnary.getUserPoints: (c, r, h) => (c as UserServiceClient)
        .getUserPoints(r as GetUserPointsRequest, headers: h),
    ApiMethodUnary.getUserPointHistory: (c, r, h) => (c as UserServiceClient)
        .getUserPointHistory(r as GetUserPointHistoryRequest, headers: h),
    ApiMethodUnary.getUserSettings: (c, r, h) => (c as UserServiceClient)
        .getUserSettings(r as GetUserSettingsRequest, headers: h),
    ApiMethodUnary.getUserStatus: (c, r, h) => (c as UserServiceClient)
        .getUserStatus(r as GetUserStatusRequest, headers: h),
    ApiMethodUnary.getExternalUser: (c, r, h) => (c as UserServiceClient)
        .getExternalUser(r as GetExternalUserRequest, headers: h),
    ApiMethodUnary.createExternalUser: (c, r, h) => (c as UserServiceClient)
        .createExternalUser(r as CreateExternalUserRequest, headers: h),
    ApiMethodUnary.updateUserSettings: (c, r, h) => (c as UserServiceClient)
        .updateUserSettings(r as UpdateUserSettingsRequest, headers: h),
    ApiMethodUnary.updateUserStatus: (c, r, h) => (c as UserServiceClient)
        .updateUserStatus(r as UpdateUserStatusRequest, headers: h),
    ApiMethodUnary.upsertUserPrivateMode: (c, r, h) =>
        (c as UserServiceClient).upsertUserPrivateMode(
          r as UpsertUserPrivateModeRequest,
          headers: h,
        ),
    ApiMethodUnary.withdrawUser: (c, r, h) => (c as UserServiceClient)
        .withdrawUser(r as WithdrawUserRequest, headers: h),

    // advice関連
    ApiMethodUnary.getIdeal: (c, r, h) => (c as AdviceServiceClient)
        .getIdeal(r as GetIdealRequest, headers: h),
    ApiMethodUnary.getApproachAnalysis: (c, r, h) => (c as AdviceServiceClient)
        .getApproachAnalysis(r as GetApproachAnalysisRequest, headers: h),

    // favorite関連
    ApiMethodUnary.getFavoriteUsers: (c, r, h) => (c as FavoriteServiceClient)
        .getFavoriteUsers(r as GetFavoriteUsersRequest, headers: h),
    ApiMethodUnary.updateUserFavorite: (c, r, h) => (c as FavoriteServiceClient)
        .updateUserFavorite(r as UpdateUserFavoriteRequest, headers: h),

    // profile関連
    ApiMethodUnary.getProfile: (c, r, h) => (c as ProfileServiceClient)
        .getProfile(r as GetProfileRequest, headers: h),
    ApiMethodUnary.createProfile: (c, r, h) => (c as ProfileServiceClient)
        .createProfile(r as CreateProfileRequest, headers: h),
    ApiMethodUnary.updateProfile: (c, r, h) => (c as ProfileServiceClient)
        .updateProfile(r as UpdateProfileRequest, headers: h),

    // payment関連
    ApiMethodUnary.restoreSubscriptions: (c, r, h) => (c as PaymentServiceClient)
        .restoreSubscriptions(r as RestoreSubscriptionsRequest, headers: h),

    // search関連
    ApiMethodUnary.getAffinityRecommendationUsers: (c, r, h) =>
        (c as SearchServiceClient).getAffinityRecommendationUsers(
            r as GetAffinityRecommendationUsersRequest,
            headers: h),
    ApiMethodUnary.getSearchUsers: (c, r, h) => (c as SearchServiceClient)
        .getSearchUsers(r as GetSearchUsersRequest, headers: h),
    ApiMethodUnary.getLatestUserSearchConditions: (c, r, h) =>
        (c as SearchServiceClient).getLatestUserSearchConditions(
            r as GetLatestUserSearchConditionsRequest,
            headers: h),
    ApiMethodUnary.getRecommendationUsers: (c, r, h) =>
        (c as SearchServiceClient).getRecommendationUsers(
            r as GetRecommendationUsersRequest, headers: h),

    // photo関連
    ApiMethodUnary.updateProfilePhotoCaption: (c, r, h) => (c as PhotoServiceClient)
        .updateProfilePhotoCaption(r as UpdateProfilePhotoCaptionRequest, headers: h),
    ApiMethodUnary.updateProfilePhotoDisplayOrder: (c, r, h) => (c as PhotoServiceClient)
        .updateProfilePhotoDisplayOrder(r as UpdateProfilePhotoDisplayOrderRequest, headers: h),
    ApiMethodUnary.deleteProfilePhoto: (c, r, h) => (c as PhotoServiceClient)
        .deleteProfilePhoto(r as DeleteProfilePhotoRequest, headers: h),

    // カルテ関連
    ApiMethodUnary.getKarte: (c, r, h) => (c as KarteServiceClient)
        .getKarte(r as GetKarteRequest, headers: h),

    // matching関連
    ApiMethodUnary.createAppeal: (c, r, h) => (c as MatchingServiceClient)
        .createAppeal(r as CreateAppealRequest, headers: h),
    ApiMethodUnary.createLike: (c, r, h) => (c as MatchingServiceClient)
        .createLike(r as CreateLikeRequest, headers: h),
    ApiMethodUnary.createSkip: (c, r, h) => (c as MatchingServiceClient)
        .createSkip(r as CreateSkipRequest, headers: h),
    ApiMethodUnary.getLikes: (c, r, h) => (c as MatchingServiceClient)
        .getLikes(r as GetLikesRequest, headers: h),
    ApiMethodUnary.getSkips: (c, r, h) => (c as MatchingServiceClient)
        .getSkips(r as GetSkipsRequest, headers: h),
    ApiMethodUnary.deleteSkip: (c, r, h) => (c as MatchingServiceClient)
        .deleteSkip(r as DeleteSkipRequest, headers: h),

    // footprint関連
    ApiMethodUnary.getFootprints: (c, r, h) => (c as FootprintServiceClient)
        .getFootprints(r as GetFootprintsRequest, headers: h),

    // 非表示関連
    ApiMethodUnary.getHiddenUsers: (c, r, h) => (c as HideServiceClient)
        .getHiddenUsers(r as GetHiddenUsersRequest, headers: h),
    ApiMethodUnary.updateUserHide: (c, r, h) => (c as HideServiceClient)
        .updateUserHide(r as UpdateUserHideRequest, headers: h),

    // ブロック関連
    ApiMethodUnary.getBlockedUsers: (c, r, h) => (c as BlockServiceClient)
        .getBlockedUsers(r as GetBlockedUsersRequest, headers: h),
    ApiMethodUnary.updateUserBlock: (c, r, h) => (c as BlockServiceClient)
        .updateUserBlock(r as UpdateUserBlockRequest, headers: h),

    // グローバル関連
    ApiMethodUnary.getNotifications: (c, r, h) => (c as GlobalServiceClient)
        .getNotifications(r as GetNotificationsRequest, headers: h),
    ApiMethodUnary.markNotificationsAsRead: (c, r, h) => (c as GlobalServiceClient)
        .markNotificationsAsRead(r as MarkNotificationsAsReadRequest, headers: h),
    ApiMethodUnary.getNotificationSettings: (c, r, h) => (c as GlobalServiceClient)
        .getNotificationSettings(r as GetNotificationSettingsRequest, headers: h),
    ApiMethodUnary.updateNotificationSettings: (c, r, h) => (c as GlobalServiceClient)
        .updateNotificationSettings(r as UpdateNotificationSettingsRequest, headers: h),
    ApiMethodUnary.getAnnouncements: (c, r, h) => (c as GlobalServiceClient)
        .getAnnouncements(r as GetAnnouncementsRequest, headers: h),
    ApiMethodUnary.publishNotification: (c, r, h) => (c as GlobalServiceClient)
        .publishNotification(r as PublishNotificationRequest, headers: h),

    // tag関連
    ApiMethodUnary.createUserTag: (c, r, h) => (c as TagServiceClient)
        .createUserTag(r as CreateUserTagRequest, headers: h),
    ApiMethodUnary.deleteUserTag: (c, r, h) => (c as TagServiceClient)
        .deleteUserTag(r as DeleteUserTagRequest, headers: h),
    ApiMethodUnary.getTagCategories: (c, r, h) => (c as TagServiceClient)
        .getTagCategories(r as GetTagCategoriesRequest, headers: h),
    ApiMethodUnary.getTags: (c, r, h) => (c as TagServiceClient)
        .getTags(r as GetTagsRequest, headers: h),
    ApiMethodUnary.getUserTags: (c, r, h) => (c as TagServiceClient)
        .getUserTags(r as GetUserTagsRequest, headers: h),

    // registration関連
    ApiMethodUnary.createRegistrationStepLog: (c, r, h) => (c as RegistrationServiceClient)
        .createRegistrationStepLog(r as CreateRegistrationStepLogRequest, headers: h),
    ApiMethodUnary.getLatestRegistrationStep: (c, r, h) => (c as RegistrationServiceClient)
        .getLatestRegistrationStep(r as GetLatestRegistrationStepRequest, headers: h),

    // しつもん関連
    ApiMethodUnary.approveQuestion: (c, r, h) => (c as QuestionServiceClient)
        .approveQuestion(r as ApproveQuestionRequest, headers: h),
    ApiMethodUnary.createQuestion: (c, r, h) => (c as QuestionServiceClient)
        .createQuestion(r as CreateQuestionRequest, headers: h),
    ApiMethodUnary.deleteQuestionAnswer: (c, r, h) => (c as QuestionServiceClient)
        .deleteQuestionAnswer(r as DeleteQuestionAnswerRequest, headers: h),
    ApiMethodUnary.deleteQuestion: (c, r, h) => (c as QuestionServiceClient)
        .deleteQuestion(r as DeleteQuestionRequest, headers: h),
    ApiMethodUnary.getApprovedQuestions: (c, r, h) => (c as QuestionServiceClient)
        .getApprovedQuestions(r as GetApprovedQuestionsRequest, headers: h),
    ApiMethodUnary.updateQuestionAnswer: (c, r, h) => (c as QuestionServiceClient)
        .updateQuestionAnswer(r as UpdateQuestionAnswerRequest, headers: h),

    // ekyc
    ApiMethodUnary.getServiceAuth: (c, r, h) => (c as EKYCServiceClient)
        .getServiceAuth(r as GetServiceAuthRequest, headers: h),
  };

  // 401/Unauthenticated 判定
  bool _isUnauthorized(Object e) {
    // 文字列ベースでの判定（Connectの例外型に依存しない）
    final s = e.toString().toLowerCase();
    return s.contains('unauthenticated') || s.contains('unauthorized') || s.contains('401');
  }

  // 認証トークンのリフレッシュ
  Future<bool> _tryRefreshAuthToken() async {
    try {
      await _ref.read(authRepositoryProvider).refreshToken();
      return true;
    } catch (_) {
      return false;
    }
  }

  // 例外 → ApiException 正規化
  ApiException _toApiException(Object e) {
    final msg = e.toString();
    final status = _extractStatusCode(msg);
    final code = _extractErrorCode(msg);
    return ApiException(message: msg, statusCode: status, code: code, cause: e);
  }

  int? _extractStatusCode(String message) {
    final match = RegExp(r'\b(4\d\d|5\d\d)\b').firstMatch(message);
    if (match != null) {
      return int.tryParse(match.group(0)!);
    }
    return null;
  }

  String? _extractErrorCode(String message) {
    final lower = message.toLowerCase();
    if (lower.contains('unauthenticated')) return 'unauthenticated';
    if (lower.contains('unauthorized')) return 'unauthorized';
    if (lower.contains('permission')) return 'PERMISSION_DENIED';
    if (lower.contains('not found')) return 'NOT_FOUND';
    return null;
  }

  // StreamのAPI呼び出しメソッド
  Stream<ApiResult<T>> callStream<T extends Object>({
    required dynamic client,
    required ApiMethodStream method,
    required dynamic request,
    Map<String, String>? additionalHeaders,
  }) async* {
    // メンテナンスチェック
    // メンテナンスチェック
    try {
      await RemoteConfigService.fetchAndActivate();
      if (RemoteConfigService.isMaintenanceMode) {
        final message = RemoteConfigService.maintenanceMessage;
        yield ApiResult.failure(
          ApiException(
            message: message,
            statusCode: 503,
            code: 'MAINTENANCE',
            cause: null,
          ),
        );
        return; // Streamを即終了
      }
    } catch (e) {
      final apiError = _toApiException(e);
      yield ApiResult.failure(apiError);
      return;
    }

    try {
      // ヘッダーを作成
      final headers = createHeaders(additionalHeaders);

      switch (method) {
        case ApiMethodStream.subscribeChatSession:
          final stream = (client as ChatServiceClient).subscribeChatSession(
            request as SubscribeChatSessionRequest,
            headers: headers,
          );
          await for (final response in stream) {
            yield ApiResult.success(response as T);
          }
        case ApiMethodStream.subscribeQuestionSession:
          final stream = (client as QuestionServiceClient).subscribeQuestionSession(
            request as SubscribeQuestionSessionRequest,
            headers: headers,
          );
          await for (final response in stream) {
            yield ApiResult.success(response as T);
          }
        case ApiMethodStream.subscribeNotificationSession:
          final stream = (client as GlobalServiceClient).subscribeNotificationSession(
            request as SubscribeNotificationSessionRequest,
            headers: headers,
          );
          await for (final response in stream) {
            yield ApiResult.success(response as T);
          }
      }

    } catch (e) {
      yield ApiResult.failure(e);
    }
  }

  // ClientStreamのAPI呼び出しメソッド
  Future<ApiResult<T>> callClientStream<T extends Object>({
    required dynamic client,
    required ApiMethodClientStream method,
    required Stream<Object> request,
    Map<String, String>? additionalHeaders,
  }) async {
    try {
      // メンテナンスチェック
      await RemoteConfigService.fetchAndActivate();
      if (RemoteConfigService.isMaintenanceMode) {
        final message = RemoteConfigService.maintenanceMessage;
        return ApiResult.failure(
          ApiException(
            message: message,
            statusCode: 503,
            code: 'MAINTENANCE',
            cause: null,
          ),
        );
      }

      final headers = createHeaders(additionalHeaders);

      switch (method) {
        case ApiMethodClientStream.chunkedMediaUpload:
          final response = await (client as media_service.MediaServiceClient).chunkedMediaUpload(
            request as Stream<media_pb.ChunkedMediaUploadRequest>,
            headers: headers,
          );
          return ApiResult.success(response as T);
      }
    } catch (e) {
      return ApiResult.failure(e);
    }
  }
}

// 共通例外型
class ApiException implements Exception {
  ApiException({required this.message, this.statusCode, this.code, this.cause});
  final String message;
  final int? statusCode;
  final String? code;
  final Object? cause;
  @override
  String toString() => 'ApiException(status=$statusCode, code=$code, message=$message)';
}
