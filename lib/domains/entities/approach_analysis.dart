import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/advice/v1/get_approach_analysis.pb.dart'
    as proto;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'approach_analysis.freezed.dart';

@freezed
abstract class ApproachFootprintHistory with _$ApproachFootprintHistory {
  const factory ApproachFootprintHistory({
    required DateTime historyDate,
    required int footprintAmount,
  }) = _ApproachFootprintHistory;

  factory ApproachFootprintHistory.fromProto(
    proto.GetApproachAnalysisResponse_FootprintHistory p,
  ) =>
      ApproachFootprintHistory(
        historyDate: DateTime.fromMillisecondsSinceEpoch(
            p.historyDate.seconds.toInt() * 1000,),
        footprintAmount: p.footprintAmount,
      );
}

@freezed
abstract class ApproachLikeHistory with _$ApproachLikeHistory {
  const factory ApproachLikeHistory({
    required DateTime historyDate,
    required int likeAmount,
  }) = _ApproachLikeHistory;

  factory ApproachLikeHistory.fromProto(
    proto.GetApproachAnalysisResponse_LikeHistory p,
  ) =>
      ApproachLikeHistory(
        historyDate: DateTime.fromMillisecondsSinceEpoch(
            p.historyDate.seconds.toInt() * 1000,),
        likeAmount: p.likeAmount,
      );
}

@freezed
abstract class ApproachAnalysis with _$ApproachAnalysis {
  const factory ApproachAnalysis({
    required String adviceMessage,
    required List<ApproachFootprintHistory> footprintHistories,
    required List<ApproachLikeHistory> likeHistories,
  }) = _ApproachAnalysis;

  factory ApproachAnalysis.fromProto(proto.GetApproachAnalysisResponse p) =>
      ApproachAnalysis(
        adviceMessage: p.adviceMessage,
        footprintHistories: p.footprintHistories
            .map(ApproachFootprintHistory.fromProto)
            .toList(),
        likeHistories:
            p.likeHistories.map(ApproachLikeHistory.fromProto).toList(),
      );
}
