import 'package:econa_mobile_app/domains/entities/ekyc_level.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/subscription_tier.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_points.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page.freezed.dart';

@freezed
abstract class MyPageData with _$MyPageData {
  const factory MyPageData({
    required Profile profile,
    required SubscriptionTier subscriptionTier,
    required CertificateLevel certificateLevel,
    required int matchingPoint,
    required int lavigationPoint,
    int? hasLikePoint,
  }) = _MyPageData;

  const MyPageData._();

  factory MyPageData.fromResponses({
    required GetProfileResponse userProfileResponse,
    required GetUserStatusResponse userStatusResponse,
    required GetUserPointsResponse userPointsResponse,
    required SubscriptionTier subscriptionTier,
  }) {
    final userStatus = userStatusResponse.userStatus;
    final profile = userProfileResponse.profile;

    return MyPageData(
      profile: profile,
      subscriptionTier: subscriptionTier,
      certificateLevel: CertificateLevel.fromCertificateLevelCode(userStatus.certificateLevelCode),
      matchingPoint: userPointsResponse.freeMatchingPoint + userPointsResponse.matchingPoint,
      lavigationPoint: userPointsResponse.freeLavigationPoint + userPointsResponse.lavigationPoint,
      hasLikePoint: userPointsResponse.freeLikePoint + userPointsResponse.likePoint,
    );
  }

  String get planDisplayName {
    switch (subscriptionTier) {
      case SubscriptionTier.SUBSCRIPTION_TIER_UNSPECIFIED:
      case SubscriptionTier.SUBSCRIPTION_TIER_FREE:
        return 'フリープラン';
      case SubscriptionTier.SUBSCRIPTION_TIER_BASIC:
        return 'ベーシックプラン';
      case SubscriptionTier.SUBSCRIPTION_TIER_PREMIUM:
        return 'プレミアムプラン';
    }
    return 'フリープラン';
  }

  bool get isIdentityVerified =>
      certificateLevel.isVerified;

  bool get isSingleVerified => certificateLevel.isSingleVerified;
}



