import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_appeal.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_like.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_skip.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/delete_skip.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/get_likes.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/get_skips.pb.dart';

/// マッチング関連のRepository Interface
abstract class IMatchingRepository {
  /// アピール作成
  Future<CreateAppealResponse> createAppeal(CreateAppealRequest request);

  /// いいね作成
  Future<CreateLikeResponse> createLike(CreateLikeRequest request);

  /// スキップ作成
  Future<CreateSkipResponse> createSkip(CreateSkipRequest request);

  /// いいね取得
  Future<GetLikesResponse> getLikes(GetLikesRequest request);

  /// スキップ取得
  Future<GetSkipsResponse> getSkips(GetSkipsRequest request);

  /// スキップ削除
  Future<DeleteSkipResponse> deleteSkip(DeleteSkipRequest request);
}
