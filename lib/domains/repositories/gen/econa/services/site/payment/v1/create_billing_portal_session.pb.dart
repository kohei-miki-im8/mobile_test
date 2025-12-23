//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/create_billing_portal_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;

/// CreateBillingPortalSessionRequest: Stripe Customer Portal セッション作成リクエスト
class CreateBillingPortalSessionRequest extends $pb.GeneratedMessage {
  factory CreateBillingPortalSessionRequest({
    $core.String? returnUrl,
  }) {
    final $result = create();
    if (returnUrl != null) {
      $result.returnUrl = returnUrl;
    }
    return $result;
  }
  CreateBillingPortalSessionRequest._() : super();
  factory CreateBillingPortalSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBillingPortalSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBillingPortalSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'returnUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBillingPortalSessionRequest clone() => CreateBillingPortalSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBillingPortalSessionRequest copyWith(void Function(CreateBillingPortalSessionRequest) updates) => super.copyWith((message) => updates(message as CreateBillingPortalSessionRequest)) as CreateBillingPortalSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBillingPortalSessionRequest create() => CreateBillingPortalSessionRequest._();
  CreateBillingPortalSessionRequest createEmptyInstance() => create();
  static $pb.PbList<CreateBillingPortalSessionRequest> createRepeated() => $pb.PbList<CreateBillingPortalSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateBillingPortalSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBillingPortalSessionRequest>(create);
  static CreateBillingPortalSessionRequest? _defaultInstance;

  /// 戻り先URL（ポータル終了後のリダイレクト先）
  @$pb.TagNumber(1)
  $core.String get returnUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set returnUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReturnUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearReturnUrl() => clearField(1);
}

/// CreateBillingPortalSessionResponse: Portalセッション作成レスポンス
class CreateBillingPortalSessionResponse extends $pb.GeneratedMessage {
  factory CreateBillingPortalSessionResponse({
    $core.String? portalUrl,
    $109.Timestamp? expiresAt,
    $core.String? stripeCustomerId,
  }) {
    final $result = create();
    if (portalUrl != null) {
      $result.portalUrl = portalUrl;
    }
    if (expiresAt != null) {
      $result.expiresAt = expiresAt;
    }
    if (stripeCustomerId != null) {
      $result.stripeCustomerId = stripeCustomerId;
    }
    return $result;
  }
  CreateBillingPortalSessionResponse._() : super();
  factory CreateBillingPortalSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBillingPortalSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBillingPortalSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'portalUrl')
    ..aOM<$109.Timestamp>(2, _omitFieldNames ? '' : 'expiresAt', subBuilder: $109.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'stripeCustomerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBillingPortalSessionResponse clone() => CreateBillingPortalSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBillingPortalSessionResponse copyWith(void Function(CreateBillingPortalSessionResponse) updates) => super.copyWith((message) => updates(message as CreateBillingPortalSessionResponse)) as CreateBillingPortalSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBillingPortalSessionResponse create() => CreateBillingPortalSessionResponse._();
  CreateBillingPortalSessionResponse createEmptyInstance() => create();
  static $pb.PbList<CreateBillingPortalSessionResponse> createRepeated() => $pb.PbList<CreateBillingPortalSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateBillingPortalSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBillingPortalSessionResponse>(create);
  static CreateBillingPortalSessionResponse? _defaultInstance;

  /// Portal セッション URL
  @$pb.TagNumber(1)
  $core.String get portalUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set portalUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPortalUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortalUrl() => clearField(1);

  /// 失効時刻
  @$pb.TagNumber(2)
  $109.Timestamp get expiresAt => $_getN(1);
  @$pb.TagNumber(2)
  set expiresAt($109.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpiresAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiresAt() => clearField(2);
  @$pb.TagNumber(2)
  $109.Timestamp ensureExpiresAt() => $_ensure(1);

  /// Stripe Customer ID
  @$pb.TagNumber(3)
  $core.String get stripeCustomerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set stripeCustomerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStripeCustomerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStripeCustomerId() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
