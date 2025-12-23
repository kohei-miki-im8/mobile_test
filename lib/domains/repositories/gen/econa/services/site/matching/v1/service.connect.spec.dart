//
//  Generated code. Do not modify.
//  source: econa/services/site/matching/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_appeal.pb.dart" as econaservicessitematchingv1create_appeal;
import "create_like.pb.dart" as econaservicessitematchingv1create_like;
import "create_skip.pb.dart" as econaservicessitematchingv1create_skip;
import "get_likes.pb.dart" as econaservicessitematchingv1get_likes;
import "get_skips.pb.dart" as econaservicessitematchingv1get_skips;
import "delete_skip.pb.dart" as econaservicessitematchingv1delete_skip;

/// マッチング機能を提供するサービスです。
abstract final class MatchingService {
  /// Fully-qualified name of the MatchingService service.
  static const name = 'econa.services.site.matching.v1.MatchingService';

  /// CreateAppeal:アピールを作成します。
  static const createAppeal = connect.Spec(
    '/$name/CreateAppeal',
    connect.StreamType.unary,
    econaservicessitematchingv1create_appeal.CreateAppealRequest.new,
    econaservicessitematchingv1create_appeal.CreateAppealResponse.new,
  );

  /// CreateLike:いいねを作成します。
  static const createLike = connect.Spec(
    '/$name/CreateLike',
    connect.StreamType.unary,
    econaservicessitematchingv1create_like.CreateLikeRequest.new,
    econaservicessitematchingv1create_like.CreateLikeResponse.new,
  );

  /// CreateSkip:スキップを作成します。
  static const createSkip = connect.Spec(
    '/$name/CreateSkip',
    connect.StreamType.unary,
    econaservicessitematchingv1create_skip.CreateSkipRequest.new,
    econaservicessitematchingv1create_skip.CreateSkipResponse.new,
  );

  /// GetLikes:いいねを取得します。
  static const getLikes = connect.Spec(
    '/$name/GetLikes',
    connect.StreamType.unary,
    econaservicessitematchingv1get_likes.GetLikesRequest.new,
    econaservicessitematchingv1get_likes.GetLikesResponse.new,
  );

  /// GetSkips:スキップを取得します。
  static const getSkips = connect.Spec(
    '/$name/GetSkips',
    connect.StreamType.unary,
    econaservicessitematchingv1get_skips.GetSkipsRequest.new,
    econaservicessitematchingv1get_skips.GetSkipsResponse.new,
  );

  /// DeleteSkip:スキップを削除します。
  static const deleteSkip = connect.Spec(
    '/$name/DeleteSkip',
    connect.StreamType.unary,
    econaservicessitematchingv1delete_skip.DeleteSkipRequest.new,
    econaservicessitematchingv1delete_skip.DeleteSkipResponse.new,
  );
}
