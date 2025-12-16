import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/karte/v1/get_karte.pb.dart'
    as proto;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'karte.freezed.dart';

@freezed
abstract class UserAnalysis with _$UserAnalysis {
  const factory UserAnalysis({
    required String? philosophyOnLove,
    required String? potentialNeeds,
    required String? compatibilityFeatures,
    required String? comprehensiveAnalysis,
    required DateTime? createdAt,
  }) = _UserAnalysis;

  factory UserAnalysis.fromProto(proto.GetKarteResponse_UserAnalysis p) =>
      UserAnalysis(
        philosophyOnLove: p.hasPhilosophyOnLove() ? p.philosophyOnLove : null,
        potentialNeeds: p.hasPotentialNeeds() ? p.potentialNeeds : null,
        compatibilityFeatures:
            p.hasCompatibilityFeatures() ? p.compatibilityFeatures : null,
        comprehensiveAnalysis:
            p.hasComprehensiveAnalysis() ? p.comprehensiveAnalysis : null,
        createdAt: p.hasCreatedAt()
            ? DateTime.fromMillisecondsSinceEpoch(
                p.createdAt.seconds.toInt() * 1000,
              )
            : null,
      );
}

@freezed
abstract class Karte with _$Karte {
  const factory Karte({
    required List<UserAnalysis> userAnalyses,
    required String? nextCursor,
  }) = _Karte;

  factory Karte.fromProto(proto.GetKarteResponse p) => Karte(
        userAnalyses: p.userAnalyses.map(UserAnalysis.fromProto).toList(),
        nextCursor: p.hasCursor() ? p.cursor.nextCursorId : null,
      );
}
