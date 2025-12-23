import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/subscription_tier.pbenum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_status.freezed.dart';

/// サブスクリプションステータス（プランと残り日数）
@freezed
abstract class SubscriptionStatus with _$SubscriptionStatus {
  const factory SubscriptionStatus({
    required SubscriptionPlan plan,
    required int remainingDays,
    required GenderCode gender,
  }) = _SubscriptionStatus;

  const SubscriptionStatus._();

  /// SubscriptionTierを取得
  SubscriptionTier get tier => plan.tier;

  /// プラン名を取得
  String get planName => plan.text;

  /// サブスクリプション済みかどうか
  bool get isSubscribed => plan.isSubscribed;
}

/// アプリ側で扱う購読プラン
enum SubscriptionPlan {
  unspecified(
    text: '未指定',
    tier: SubscriptionTier.SUBSCRIPTION_TIER_UNSPECIFIED,
  ),
  free(
    text: 'フリープラン',
    tier: SubscriptionTier.SUBSCRIPTION_TIER_FREE,
  ),
  basic(
    text: 'ベーシックプラン',
    tier: SubscriptionTier.SUBSCRIPTION_TIER_BASIC,
  ),
  premium(
    text: 'プレミアムプラン',
    tier: SubscriptionTier.SUBSCRIPTION_TIER_PREMIUM,
  );

  const SubscriptionPlan({
    required this.text,
    required this.tier,
  });

  final String text;
  final SubscriptionTier tier;

  static SubscriptionPlan fromSubscriptionTier(SubscriptionTier tier) {
    return switch (tier) {
      SubscriptionTier.SUBSCRIPTION_TIER_FREE => SubscriptionPlan.free,
      SubscriptionTier.SUBSCRIPTION_TIER_BASIC => SubscriptionPlan.basic,
      SubscriptionTier.SUBSCRIPTION_TIER_PREMIUM => SubscriptionPlan.premium,
      SubscriptionTier.SUBSCRIPTION_TIER_UNSPECIFIED => SubscriptionPlan.unspecified,
      SubscriptionTier() => SubscriptionPlan.unspecified,
    };
  }

  bool get isFree => this == SubscriptionPlan.free || this == SubscriptionPlan.unspecified;
  bool get isSubscribed => !isFree;
}

