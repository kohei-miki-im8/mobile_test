import 'package:econa_mobile_app/domains/entities/subscription_status.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/certificate_level_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/subscription_tier.pbenum.dart'
    as proto;
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_status.freezed.dart';

/// ユーザーステータスを表すエンティティ
@freezed
abstract class UserStatus with _$UserStatus {
  const factory UserStatus({
    required String userId,
    required CertificateLevelCode certificateLevelCode,
    required proto.SubscriptionTier subscriptionTier,
  }) = _UserStatus;

  /// protobufのUserStatusからエンティティを作成する
  factory UserStatus.fromUserStatusResponse(GetUserStatusResponse response) {
    final userStatus = response.userStatus;
    return UserStatus(
      userId: userStatus.userId,
      certificateLevelCode: userStatus.certificateLevelCode,
      subscriptionTier: userStatus.subscriptionTier,
    );
  }
}

/// UserStatusの拡張メソッド
extension UserStatusExtension on UserStatus {
  /// 本人確認済みかどうかを取得
  bool get isIdentityVerified =>
      certificateLevelCode ==
          CertificateLevelCode.CERTIFICATE_LEVEL_CODE_VERIFIED ||
      certificateLevelCode ==
          CertificateLevelCode.CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED;

  /// サブスクリプション済みかどうかを取得
  bool get isSubscribed =>
      SubscriptionPlan.fromSubscriptionTier(subscriptionTier).isSubscribed;
}
