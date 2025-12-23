import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_affinity_recommendation_users.pb.dart'
    as pb;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'matching_reason.freezed.dart';

/// マッチング理由を表すエンティティ
@freezed
abstract class MatchingReason with _$MatchingReason {
  const factory MatchingReason({
    /// メインタイトル(最大26文字)
    String? mainTitle,

    /// 理由タイトル (最大50文字)
    String? reasonTitle,

    /// 理由内容(最大200文字)
    String? reasonContent,
  }) = _MatchingReason;

  const MatchingReason._();

  /// protobufのMatchingReasonからエンティティを作成
  factory MatchingReason.fromProto(pb.MatchingReason matchingReason) {
    return MatchingReason(
      mainTitle:
          matchingReason.hasMainTitle() ? matchingReason.mainTitle : null,
      reasonTitle:
          matchingReason.hasMainTitle() ? matchingReason.mainTitle : null,
      reasonContent: matchingReason.hasMainContent()
          ? matchingReason.mainContent
          : null,
    );
  }
}
