//
//  Generated code. Do not modify.
//  source: econa/services/site/matching/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_appeal.pb.dart" as econaservicessitematchingv1create_appeal;
import "service.connect.spec.dart" as specs;
import "create_like.pb.dart" as econaservicessitematchingv1create_like;
import "create_skip.pb.dart" as econaservicessitematchingv1create_skip;
import "get_likes.pb.dart" as econaservicessitematchingv1get_likes;
import "get_skips.pb.dart" as econaservicessitematchingv1get_skips;
import "delete_skip.pb.dart" as econaservicessitematchingv1delete_skip;

/// マッチング機能を提供するサービスです。
extension type MatchingServiceClient (connect.Transport _transport) {
  /// CreateAppeal:アピールを作成します。
  Future<econaservicessitematchingv1create_appeal.CreateAppealResponse> createAppeal(
    econaservicessitematchingv1create_appeal.CreateAppealRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.MatchingService.createAppeal,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// CreateLike:いいねを作成します。
  Future<econaservicessitematchingv1create_like.CreateLikeResponse> createLike(
    econaservicessitematchingv1create_like.CreateLikeRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.MatchingService.createLike,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// CreateSkip:スキップを作成します。
  Future<econaservicessitematchingv1create_skip.CreateSkipResponse> createSkip(
    econaservicessitematchingv1create_skip.CreateSkipRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.MatchingService.createSkip,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetLikes:いいねを取得します。
  Future<econaservicessitematchingv1get_likes.GetLikesResponse> getLikes(
    econaservicessitematchingv1get_likes.GetLikesRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.MatchingService.getLikes,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetSkips:スキップを取得します。
  Future<econaservicessitematchingv1get_skips.GetSkipsResponse> getSkips(
    econaservicessitematchingv1get_skips.GetSkipsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.MatchingService.getSkips,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// DeleteSkip:スキップを削除します。
  Future<econaservicessitematchingv1delete_skip.DeleteSkipResponse> deleteSkip(
    econaservicessitematchingv1delete_skip.DeleteSkipRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.MatchingService.deleteSkip,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
