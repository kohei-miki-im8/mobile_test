//
//  Generated code. Do not modify.
//  source: econa/enums/subscription_tier.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// サブスクリプションティア
class SubscriptionTier extends $pb.ProtobufEnum {
  static const SubscriptionTier SUBSCRIPTION_TIER_UNSPECIFIED = SubscriptionTier._(0, _omitEnumNames ? '' : 'SUBSCRIPTION_TIER_UNSPECIFIED');
  static const SubscriptionTier SUBSCRIPTION_TIER_FREE = SubscriptionTier._(1, _omitEnumNames ? '' : 'SUBSCRIPTION_TIER_FREE');
  static const SubscriptionTier SUBSCRIPTION_TIER_BASIC = SubscriptionTier._(2, _omitEnumNames ? '' : 'SUBSCRIPTION_TIER_BASIC');
  static const SubscriptionTier SUBSCRIPTION_TIER_PREMIUM = SubscriptionTier._(3, _omitEnumNames ? '' : 'SUBSCRIPTION_TIER_PREMIUM');

  static const $core.List<SubscriptionTier> values = <SubscriptionTier> [
    SUBSCRIPTION_TIER_UNSPECIFIED,
    SUBSCRIPTION_TIER_FREE,
    SUBSCRIPTION_TIER_BASIC,
    SUBSCRIPTION_TIER_PREMIUM,
  ];

  static final $core.Map<$core.int, SubscriptionTier> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SubscriptionTier? valueOf($core.int value) => _byValue[value];

  const SubscriptionTier._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
