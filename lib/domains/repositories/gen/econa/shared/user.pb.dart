//
//  Generated code. Do not modify.
//  source: econa/shared/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;
import '../enums/account_status_code.pbenum.dart' as $136;
import '../enums/certificate_level_code.pbenum.dart' as $138;
import '../enums/service_review_status.pbenum.dart' as $139;
import '../enums/subscription_tier.pbenum.dart' as $137;

/// ユーザーステータス
class UserStatus extends $pb.GeneratedMessage {
  factory UserStatus({
    $core.String? userId,
    $136.AccountStatusCode? accountStatusCode,
    $137.SubscriptionTier? subscriptionTier,
    $109.Timestamp? paidSubscriptionExpiresAt,
    $138.CertificateLevelCode? certificateLevelCode,
    $core.bool? hasPersonalitySummary,
    $core.bool? hasToneSummary,
    $139.ServiceReviewStatus? firstMessageServiceReviewStatus,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (accountStatusCode != null) {
      $result.accountStatusCode = accountStatusCode;
    }
    if (subscriptionTier != null) {
      $result.subscriptionTier = subscriptionTier;
    }
    if (paidSubscriptionExpiresAt != null) {
      $result.paidSubscriptionExpiresAt = paidSubscriptionExpiresAt;
    }
    if (certificateLevelCode != null) {
      $result.certificateLevelCode = certificateLevelCode;
    }
    if (hasPersonalitySummary != null) {
      $result.hasPersonalitySummary = hasPersonalitySummary;
    }
    if (hasToneSummary != null) {
      $result.hasToneSummary = hasToneSummary;
    }
    if (firstMessageServiceReviewStatus != null) {
      $result.firstMessageServiceReviewStatus = firstMessageServiceReviewStatus;
    }
    return $result;
  }
  UserStatus._() : super();
  factory UserStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..e<$136.AccountStatusCode>(2, _omitFieldNames ? '' : 'accountStatusCode', $pb.PbFieldType.OE, defaultOrMaker: $136.AccountStatusCode.ACCOUNT_STATUS_CODE_UNSPECIFIED, valueOf: $136.AccountStatusCode.valueOf, enumValues: $136.AccountStatusCode.values)
    ..e<$137.SubscriptionTier>(3, _omitFieldNames ? '' : 'subscriptionTier', $pb.PbFieldType.OE, defaultOrMaker: $137.SubscriptionTier.SUBSCRIPTION_TIER_UNSPECIFIED, valueOf: $137.SubscriptionTier.valueOf, enumValues: $137.SubscriptionTier.values)
    ..aOM<$109.Timestamp>(4, _omitFieldNames ? '' : 'paidSubscriptionExpiresAt', subBuilder: $109.Timestamp.create)
    ..e<$138.CertificateLevelCode>(5, _omitFieldNames ? '' : 'certificateLevelCode', $pb.PbFieldType.OE, defaultOrMaker: $138.CertificateLevelCode.CERTIFICATE_LEVEL_CODE_UNSPECIFIED, valueOf: $138.CertificateLevelCode.valueOf, enumValues: $138.CertificateLevelCode.values)
    ..aOB(6, _omitFieldNames ? '' : 'hasPersonalitySummary')
    ..aOB(7, _omitFieldNames ? '' : 'hasToneSummary')
    ..e<$139.ServiceReviewStatus>(8, _omitFieldNames ? '' : 'firstMessageServiceReviewStatus', $pb.PbFieldType.OE, defaultOrMaker: $139.ServiceReviewStatus.SERVICE_REVIEW_STATUS_UNSPECIFIED, valueOf: $139.ServiceReviewStatus.valueOf, enumValues: $139.ServiceReviewStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserStatus clone() => UserStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserStatus copyWith(void Function(UserStatus) updates) => super.copyWith((message) => updates(message as UserStatus)) as UserStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserStatus create() => UserStatus._();
  UserStatus createEmptyInstance() => create();
  static $pb.PbList<UserStatus> createRepeated() => $pb.PbList<UserStatus>();
  @$core.pragma('dart2js:noInline')
  static UserStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserStatus>(create);
  static UserStatus? _defaultInstance;

  /// ユーザーID
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// アカウントステータス
  @$pb.TagNumber(2)
  $136.AccountStatusCode get accountStatusCode => $_getN(1);
  @$pb.TagNumber(2)
  set accountStatusCode($136.AccountStatusCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountStatusCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountStatusCode() => clearField(2);

  /// サブスクリプションティア
  @$pb.TagNumber(3)
  $137.SubscriptionTier get subscriptionTier => $_getN(2);
  @$pb.TagNumber(3)
  set subscriptionTier($137.SubscriptionTier v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSubscriptionTier() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubscriptionTier() => clearField(3);

  /// 有料サブスクリプションの有効期限
  @$pb.TagNumber(4)
  $109.Timestamp get paidSubscriptionExpiresAt => $_getN(3);
  @$pb.TagNumber(4)
  set paidSubscriptionExpiresAt($109.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPaidSubscriptionExpiresAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearPaidSubscriptionExpiresAt() => clearField(4);
  @$pb.TagNumber(4)
  $109.Timestamp ensurePaidSubscriptionExpiresAt() => $_ensure(3);

  /// 本人確認レベル
  @$pb.TagNumber(5)
  $138.CertificateLevelCode get certificateLevelCode => $_getN(4);
  @$pb.TagNumber(5)
  set certificateLevelCode($138.CertificateLevelCode v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCertificateLevelCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearCertificateLevelCode() => clearField(5);

  /// 人格サマリの有無
  @$pb.TagNumber(6)
  $core.bool get hasPersonalitySummary => $_getBF(5);
  @$pb.TagNumber(6)
  set hasPersonalitySummary($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHasPersonalitySummary() => $_has(5);
  @$pb.TagNumber(6)
  void clearHasPersonalitySummary() => clearField(6);

  /// 口調サマリの有無
  @$pb.TagNumber(7)
  $core.bool get hasToneSummary => $_getBF(6);
  @$pb.TagNumber(7)
  set hasToneSummary($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasHasToneSummary() => $_has(6);
  @$pb.TagNumber(7)
  void clearHasToneSummary() => clearField(7);

  /// 初回メッセージ審査ステータス
  @$pb.TagNumber(8)
  $139.ServiceReviewStatus get firstMessageServiceReviewStatus => $_getN(7);
  @$pb.TagNumber(8)
  set firstMessageServiceReviewStatus($139.ServiceReviewStatus v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasFirstMessageServiceReviewStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearFirstMessageServiceReviewStatus() => clearField(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
