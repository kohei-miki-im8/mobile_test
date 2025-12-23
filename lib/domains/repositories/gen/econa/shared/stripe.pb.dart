//
//  Generated code. Do not modify.
//  source: econa/shared/stripe.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../enums/gender_code.pbenum.dart' as $115;

/// Stripe商品カタログ
class StripeProductCatalog extends $pb.GeneratedMessage {
  factory StripeProductCatalog({
    $core.String? productId,
    $core.String? productType,
    $115.GenderCode? genderCode,
    $core.int? intervalCount,
    $core.String? interval,
    $core.int? trialPeriodDays,
    StripePrice? defaultPrice,
    StripePrice? activeCampaignPrice,
    $core.int? matchingPoints,
    $core.int? lavigationPoints,
    $core.bool? livemode,
  }) {
    final $result = create();
    if (productId != null) {
      $result.productId = productId;
    }
    if (productType != null) {
      $result.productType = productType;
    }
    if (genderCode != null) {
      $result.genderCode = genderCode;
    }
    if (intervalCount != null) {
      $result.intervalCount = intervalCount;
    }
    if (interval != null) {
      $result.interval = interval;
    }
    if (trialPeriodDays != null) {
      $result.trialPeriodDays = trialPeriodDays;
    }
    if (defaultPrice != null) {
      $result.defaultPrice = defaultPrice;
    }
    if (activeCampaignPrice != null) {
      $result.activeCampaignPrice = activeCampaignPrice;
    }
    if (matchingPoints != null) {
      $result.matchingPoints = matchingPoints;
    }
    if (lavigationPoints != null) {
      $result.lavigationPoints = lavigationPoints;
    }
    if (livemode != null) {
      $result.livemode = livemode;
    }
    return $result;
  }
  StripeProductCatalog._() : super();
  factory StripeProductCatalog.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StripeProductCatalog.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StripeProductCatalog', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..aOS(2, _omitFieldNames ? '' : 'productType')
    ..e<$115.GenderCode>(3, _omitFieldNames ? '' : 'genderCode', $pb.PbFieldType.OE, defaultOrMaker: $115.GenderCode.GENDER_CODE_UNSPECIFIED, valueOf: $115.GenderCode.valueOf, enumValues: $115.GenderCode.values)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'intervalCount', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'interval')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'trialPeriodDays', $pb.PbFieldType.O3)
    ..aOM<StripePrice>(7, _omitFieldNames ? '' : 'defaultPrice', subBuilder: StripePrice.create)
    ..aOM<StripePrice>(8, _omitFieldNames ? '' : 'activeCampaignPrice', subBuilder: StripePrice.create)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'matchingPoints', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'lavigationPoints', $pb.PbFieldType.O3)
    ..aOB(15, _omitFieldNames ? '' : 'livemode')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StripeProductCatalog clone() => StripeProductCatalog()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StripeProductCatalog copyWith(void Function(StripeProductCatalog) updates) => super.copyWith((message) => updates(message as StripeProductCatalog)) as StripeProductCatalog;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StripeProductCatalog create() => StripeProductCatalog._();
  StripeProductCatalog createEmptyInstance() => create();
  static $pb.PbList<StripeProductCatalog> createRepeated() => $pb.PbList<StripeProductCatalog>();
  @$core.pragma('dart2js:noInline')
  static StripeProductCatalog getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StripeProductCatalog>(create);
  static StripeProductCatalog? _defaultInstance;

  /// 商品ID
  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => clearField(1);

  /// 商品種別
  @$pb.TagNumber(2)
  $core.String get productType => $_getSZ(1);
  @$pb.TagNumber(2)
  set productType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProductType() => $_has(1);
  @$pb.TagNumber(2)
  void clearProductType() => clearField(2);

  /// 性別
  @$pb.TagNumber(3)
  $115.GenderCode get genderCode => $_getN(2);
  @$pb.TagNumber(3)
  set genderCode($115.GenderCode v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasGenderCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearGenderCode() => clearField(3);

  /// サブスクリプション期間
  @$pb.TagNumber(4)
  $core.int get intervalCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set intervalCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIntervalCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearIntervalCount() => clearField(4);

  /// サブスクリプション期間単位
  @$pb.TagNumber(5)
  $core.String get interval => $_getSZ(4);
  @$pb.TagNumber(5)
  set interval($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInterval() => $_has(4);
  @$pb.TagNumber(5)
  void clearInterval() => clearField(5);

  /// トライアル期間
  @$pb.TagNumber(6)
  $core.int get trialPeriodDays => $_getIZ(5);
  @$pb.TagNumber(6)
  set trialPeriodDays($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTrialPeriodDays() => $_has(5);
  @$pb.TagNumber(6)
  void clearTrialPeriodDays() => clearField(6);

  /// 価格情報
  @$pb.TagNumber(7)
  StripePrice get defaultPrice => $_getN(6);
  @$pb.TagNumber(7)
  set defaultPrice(StripePrice v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDefaultPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearDefaultPrice() => clearField(7);
  @$pb.TagNumber(7)
  StripePrice ensureDefaultPrice() => $_ensure(6);

  /// 有効なキャンペーン適用価格
  @$pb.TagNumber(8)
  StripePrice get activeCampaignPrice => $_getN(7);
  @$pb.TagNumber(8)
  set activeCampaignPrice(StripePrice v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasActiveCampaignPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearActiveCampaignPrice() => clearField(8);
  @$pb.TagNumber(8)
  StripePrice ensureActiveCampaignPrice() => $_ensure(7);

  /// マッチングポイント
  @$pb.TagNumber(9)
  $core.int get matchingPoints => $_getIZ(8);
  @$pb.TagNumber(9)
  set matchingPoints($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMatchingPoints() => $_has(8);
  @$pb.TagNumber(9)
  void clearMatchingPoints() => clearField(9);

  /// ラヴィゲーションポイント
  @$pb.TagNumber(10)
  $core.int get lavigationPoints => $_getIZ(9);
  @$pb.TagNumber(10)
  set lavigationPoints($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLavigationPoints() => $_has(9);
  @$pb.TagNumber(10)
  void clearLavigationPoints() => clearField(10);

  /// 本番環境区分
  @$pb.TagNumber(15)
  $core.bool get livemode => $_getBF(10);
  @$pb.TagNumber(15)
  set livemode($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(15)
  $core.bool hasLivemode() => $_has(10);
  @$pb.TagNumber(15)
  void clearLivemode() => clearField(15);
}

/// Stripeサブスクリプション
class StripeSubscription extends $pb.GeneratedMessage {
  factory StripeSubscription({
    $core.String? subscriptionId,
    StripePrice? price,
    $core.bool? livemode,
  }) {
    final $result = create();
    if (subscriptionId != null) {
      $result.subscriptionId = subscriptionId;
    }
    if (price != null) {
      $result.price = price;
    }
    if (livemode != null) {
      $result.livemode = livemode;
    }
    return $result;
  }
  StripeSubscription._() : super();
  factory StripeSubscription.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StripeSubscription.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StripeSubscription', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'subscriptionId')
    ..aOM<StripePrice>(2, _omitFieldNames ? '' : 'price', subBuilder: StripePrice.create)
    ..aOB(15, _omitFieldNames ? '' : 'livemode')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StripeSubscription clone() => StripeSubscription()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StripeSubscription copyWith(void Function(StripeSubscription) updates) => super.copyWith((message) => updates(message as StripeSubscription)) as StripeSubscription;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StripeSubscription create() => StripeSubscription._();
  StripeSubscription createEmptyInstance() => create();
  static $pb.PbList<StripeSubscription> createRepeated() => $pb.PbList<StripeSubscription>();
  @$core.pragma('dart2js:noInline')
  static StripeSubscription getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StripeSubscription>(create);
  static StripeSubscription? _defaultInstance;

  /// サブスクリプションID
  @$pb.TagNumber(1)
  $core.String get subscriptionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set subscriptionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubscriptionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscriptionId() => clearField(1);

  /// 価格情報
  @$pb.TagNumber(2)
  StripePrice get price => $_getN(1);
  @$pb.TagNumber(2)
  set price(StripePrice v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);
  @$pb.TagNumber(2)
  StripePrice ensurePrice() => $_ensure(1);

  /// 本番環境区分
  @$pb.TagNumber(15)
  $core.bool get livemode => $_getBF(2);
  @$pb.TagNumber(15)
  set livemode($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(15)
  $core.bool hasLivemode() => $_has(2);
  @$pb.TagNumber(15)
  void clearLivemode() => clearField(15);
}

/// Stripe価格
class StripePrice extends $pb.GeneratedMessage {
  factory StripePrice({
    $core.String? priceId,
    $core.String? nickname,
    $core.int? amount,
    $core.String? currency,
    $core.int? sortOrder,
    $core.bool? isDefault,
  }) {
    final $result = create();
    if (priceId != null) {
      $result.priceId = priceId;
    }
    if (nickname != null) {
      $result.nickname = nickname;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (currency != null) {
      $result.currency = currency;
    }
    if (sortOrder != null) {
      $result.sortOrder = sortOrder;
    }
    if (isDefault != null) {
      $result.isDefault = isDefault;
    }
    return $result;
  }
  StripePrice._() : super();
  factory StripePrice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StripePrice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StripePrice', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'priceId')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'currency')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'sortOrder', $pb.PbFieldType.O3)
    ..aOB(6, _omitFieldNames ? '' : 'isDefault')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StripePrice clone() => StripePrice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StripePrice copyWith(void Function(StripePrice) updates) => super.copyWith((message) => updates(message as StripePrice)) as StripePrice;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StripePrice create() => StripePrice._();
  StripePrice createEmptyInstance() => create();
  static $pb.PbList<StripePrice> createRepeated() => $pb.PbList<StripePrice>();
  @$core.pragma('dart2js:noInline')
  static StripePrice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StripePrice>(create);
  static StripePrice? _defaultInstance;

  /// 価格ID
  @$pb.TagNumber(1)
  $core.String get priceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set priceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPriceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPriceId() => clearField(1);

  /// ニックネーム
  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => clearField(2);

  /// 金額（セント単位）
  @$pb.TagNumber(3)
  $core.int get amount => $_getIZ(2);
  @$pb.TagNumber(3)
  set amount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  /// 通貨
  @$pb.TagNumber(4)
  $core.String get currency => $_getSZ(3);
  @$pb.TagNumber(4)
  set currency($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurrency() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrency() => clearField(4);

  /// ソート順
  @$pb.TagNumber(5)
  $core.int get sortOrder => $_getIZ(4);
  @$pb.TagNumber(5)
  set sortOrder($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSortOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearSortOrder() => clearField(5);

  /// デフォルト区分
  @$pb.TagNumber(6)
  $core.bool get isDefault => $_getBF(5);
  @$pb.TagNumber(6)
  set isDefault($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsDefault() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsDefault() => clearField(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
