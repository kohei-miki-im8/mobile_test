//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/create_checkout_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/duration.pb.dart' as $108;

/// CreateCheckoutSessionRequest: Stripe Checkoutセッション作成リクエスト
class CreateCheckoutSessionRequest extends $pb.GeneratedMessage {
  factory CreateCheckoutSessionRequest({
    $core.String? priceId,
    $core.String? campaignId,
    $core.String? successUrl,
    $core.String? cancelUrl,
    $core.Map<$core.String, $core.String>? metadata,
    $core.bool? allowTrial,
  }) {
    final $result = create();
    if (priceId != null) {
      $result.priceId = priceId;
    }
    if (campaignId != null) {
      $result.campaignId = campaignId;
    }
    if (successUrl != null) {
      $result.successUrl = successUrl;
    }
    if (cancelUrl != null) {
      $result.cancelUrl = cancelUrl;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    if (allowTrial != null) {
      $result.allowTrial = allowTrial;
    }
    return $result;
  }
  CreateCheckoutSessionRequest._() : super();
  factory CreateCheckoutSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCheckoutSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCheckoutSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'priceId')
    ..aOS(2, _omitFieldNames ? '' : 'campaignId')
    ..aOS(3, _omitFieldNames ? '' : 'successUrl')
    ..aOS(4, _omitFieldNames ? '' : 'cancelUrl')
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'metadata', entryClassName: 'CreateCheckoutSessionRequest.MetadataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('econa.services.site.payment.v1'))
    ..aOB(6, _omitFieldNames ? '' : 'allowTrial')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCheckoutSessionRequest clone() => CreateCheckoutSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCheckoutSessionRequest copyWith(void Function(CreateCheckoutSessionRequest) updates) => super.copyWith((message) => updates(message as CreateCheckoutSessionRequest)) as CreateCheckoutSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCheckoutSessionRequest create() => CreateCheckoutSessionRequest._();
  CreateCheckoutSessionRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCheckoutSessionRequest> createRepeated() => $pb.PbList<CreateCheckoutSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCheckoutSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCheckoutSessionRequest>(create);
  static CreateCheckoutSessionRequest? _defaultInstance;

  /// 商品価格ID (Stripe Price ID)
  @$pb.TagNumber(1)
  $core.String get priceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set priceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPriceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPriceId() => clearField(1);

  /// キャンペーンID (オプション)
  @$pb.TagNumber(2)
  $core.String get campaignId => $_getSZ(1);
  @$pb.TagNumber(2)
  set campaignId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCampaignId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCampaignId() => clearField(2);

  /// 成功時のリダイレクトURL
  @$pb.TagNumber(3)
  $core.String get successUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set successUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccessUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccessUrl() => clearField(3);

  /// キャンセル時のリダイレクトURL
  @$pb.TagNumber(4)
  $core.String get cancelUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set cancelUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCancelUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearCancelUrl() => clearField(4);

  /// メタデータ (オプション)
  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(4);

  /// トライアル期間を許可するか
  @$pb.TagNumber(6)
  $core.bool get allowTrial => $_getBF(5);
  @$pb.TagNumber(6)
  set allowTrial($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAllowTrial() => $_has(5);
  @$pb.TagNumber(6)
  void clearAllowTrial() => clearField(6);
}

/// CreateCheckoutSessionResponse: Stripe Checkoutセッション作成レスポンス
class CreateCheckoutSessionResponse extends $pb.GeneratedMessage {
  factory CreateCheckoutSessionResponse({
    $core.String? sessionId,
    $core.String? checkoutUrl,
    $108.Duration? expiresIn,
    $core.String? customerId,
    $core.String? stripeCustomerId,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (checkoutUrl != null) {
      $result.checkoutUrl = checkoutUrl;
    }
    if (expiresIn != null) {
      $result.expiresIn = expiresIn;
    }
    if (customerId != null) {
      $result.customerId = customerId;
    }
    if (stripeCustomerId != null) {
      $result.stripeCustomerId = stripeCustomerId;
    }
    return $result;
  }
  CreateCheckoutSessionResponse._() : super();
  factory CreateCheckoutSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCheckoutSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCheckoutSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOS(2, _omitFieldNames ? '' : 'checkoutUrl')
    ..aOM<$108.Duration>(3, _omitFieldNames ? '' : 'expiresIn', subBuilder: $108.Duration.create)
    ..aOS(4, _omitFieldNames ? '' : 'customerId')
    ..aOS(5, _omitFieldNames ? '' : 'stripeCustomerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCheckoutSessionResponse clone() => CreateCheckoutSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCheckoutSessionResponse copyWith(void Function(CreateCheckoutSessionResponse) updates) => super.copyWith((message) => updates(message as CreateCheckoutSessionResponse)) as CreateCheckoutSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCheckoutSessionResponse create() => CreateCheckoutSessionResponse._();
  CreateCheckoutSessionResponse createEmptyInstance() => create();
  static $pb.PbList<CreateCheckoutSessionResponse> createRepeated() => $pb.PbList<CreateCheckoutSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateCheckoutSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCheckoutSessionResponse>(create);
  static CreateCheckoutSessionResponse? _defaultInstance;

  /// Checkoutセッション ID
  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  /// CheckoutセッションURL
  @$pb.TagNumber(2)
  $core.String get checkoutUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set checkoutUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCheckoutUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearCheckoutUrl() => clearField(2);

  /// セッションの有効期限
  @$pb.TagNumber(3)
  $108.Duration get expiresIn => $_getN(2);
  @$pb.TagNumber(3)
  set expiresIn($108.Duration v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasExpiresIn() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiresIn() => clearField(3);
  @$pb.TagNumber(3)
  $108.Duration ensureExpiresIn() => $_ensure(2);

  /// 顧客ID (RevenueCat App User ID)
  @$pb.TagNumber(4)
  $core.String get customerId => $_getSZ(3);
  @$pb.TagNumber(4)
  set customerId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCustomerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCustomerId() => clearField(4);

  /// Stripe Customer ID（将来の互換性のために追加。customer_id との混同を避けるため明示）
  @$pb.TagNumber(5)
  $core.String get stripeCustomerId => $_getSZ(4);
  @$pb.TagNumber(5)
  set stripeCustomerId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStripeCustomerId() => $_has(4);
  @$pb.TagNumber(5)
  void clearStripeCustomerId() => clearField(5);
}

/// CompleteCheckoutRequest: Checkoutセッション完了確認リクエスト
class CompleteCheckoutRequest extends $pb.GeneratedMessage {
  factory CompleteCheckoutRequest({
    $core.String? sessionId,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    return $result;
  }
  CompleteCheckoutRequest._() : super();
  factory CompleteCheckoutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompleteCheckoutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompleteCheckoutRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompleteCheckoutRequest clone() => CompleteCheckoutRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompleteCheckoutRequest copyWith(void Function(CompleteCheckoutRequest) updates) => super.copyWith((message) => updates(message as CompleteCheckoutRequest)) as CompleteCheckoutRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompleteCheckoutRequest create() => CompleteCheckoutRequest._();
  CompleteCheckoutRequest createEmptyInstance() => create();
  static $pb.PbList<CompleteCheckoutRequest> createRepeated() => $pb.PbList<CompleteCheckoutRequest>();
  @$core.pragma('dart2js:noInline')
  static CompleteCheckoutRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompleteCheckoutRequest>(create);
  static CompleteCheckoutRequest? _defaultInstance;

  /// CheckoutセッションID
  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);
}

/// CompleteCheckoutResponse: Checkoutセッション完了確認レスポンス
class CompleteCheckoutResponse extends $pb.GeneratedMessage {
  factory CompleteCheckoutResponse({
    $core.bool? success,
    $core.String? subscriptionId,
    $core.String? customerId,
    $core.String? errorMessage,
    $core.String? stripeCustomerId,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (subscriptionId != null) {
      $result.subscriptionId = subscriptionId;
    }
    if (customerId != null) {
      $result.customerId = customerId;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    if (stripeCustomerId != null) {
      $result.stripeCustomerId = stripeCustomerId;
    }
    return $result;
  }
  CompleteCheckoutResponse._() : super();
  factory CompleteCheckoutResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompleteCheckoutResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompleteCheckoutResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'subscriptionId')
    ..aOS(3, _omitFieldNames ? '' : 'customerId')
    ..aOS(4, _omitFieldNames ? '' : 'errorMessage')
    ..aOS(5, _omitFieldNames ? '' : 'stripeCustomerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompleteCheckoutResponse clone() => CompleteCheckoutResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompleteCheckoutResponse copyWith(void Function(CompleteCheckoutResponse) updates) => super.copyWith((message) => updates(message as CompleteCheckoutResponse)) as CompleteCheckoutResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompleteCheckoutResponse create() => CompleteCheckoutResponse._();
  CompleteCheckoutResponse createEmptyInstance() => create();
  static $pb.PbList<CompleteCheckoutResponse> createRepeated() => $pb.PbList<CompleteCheckoutResponse>();
  @$core.pragma('dart2js:noInline')
  static CompleteCheckoutResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompleteCheckoutResponse>(create);
  static CompleteCheckoutResponse? _defaultInstance;

  /// 完了ステータス
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  /// サブスクリプションID
  @$pb.TagNumber(2)
  $core.String get subscriptionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set subscriptionId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubscriptionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscriptionId() => clearField(2);

  /// 顧客ID（互換フィールド。Stripe Customer ID を返す）
  @$pb.TagNumber(3)
  $core.String get customerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set customerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCustomerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomerId() => clearField(3);

  /// エラーメッセージ (失敗時)
  @$pb.TagNumber(4)
  $core.String get errorMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorMessage($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasErrorMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMessage() => clearField(4);

  /// Stripe Customer ID（明示フィールド。上記 customer_id と同値を返す予定）
  @$pb.TagNumber(5)
  $core.String get stripeCustomerId => $_getSZ(4);
  @$pb.TagNumber(5)
  set stripeCustomerId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStripeCustomerId() => $_has(4);
  @$pb.TagNumber(5)
  void clearStripeCustomerId() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
