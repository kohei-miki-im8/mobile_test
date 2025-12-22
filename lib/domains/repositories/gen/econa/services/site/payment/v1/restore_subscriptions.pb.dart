//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/restore_subscriptions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;

/// RestoreSubscriptionsRequest: サブスクリプション復元リクエスト
class RestoreSubscriptionsRequest extends $pb.GeneratedMessage {
  factory RestoreSubscriptionsRequest() => create();
  RestoreSubscriptionsRequest._() : super();
  factory RestoreSubscriptionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestoreSubscriptionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RestoreSubscriptionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RestoreSubscriptionsRequest clone() => RestoreSubscriptionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RestoreSubscriptionsRequest copyWith(void Function(RestoreSubscriptionsRequest) updates) => super.copyWith((message) => updates(message as RestoreSubscriptionsRequest)) as RestoreSubscriptionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestoreSubscriptionsRequest create() => RestoreSubscriptionsRequest._();
  RestoreSubscriptionsRequest createEmptyInstance() => create();
  static $pb.PbList<RestoreSubscriptionsRequest> createRepeated() => $pb.PbList<RestoreSubscriptionsRequest>();
  @$core.pragma('dart2js:noInline')
  static RestoreSubscriptionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestoreSubscriptionsRequest>(create);
  static RestoreSubscriptionsRequest? _defaultInstance;
}

/// RestoreSubscriptionsResponse: サブスクリプション復元レスポンス
class RestoreSubscriptionsResponse extends $pb.GeneratedMessage {
  factory RestoreSubscriptionsResponse({
    $core.Iterable<RestoredSubscription>? restoredSubscriptions,
  }) {
    final $result = create();
    if (restoredSubscriptions != null) {
      $result.restoredSubscriptions.addAll(restoredSubscriptions);
    }
    return $result;
  }
  RestoreSubscriptionsResponse._() : super();
  factory RestoreSubscriptionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestoreSubscriptionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RestoreSubscriptionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..pc<RestoredSubscription>(1, _omitFieldNames ? '' : 'restoredSubscriptions', $pb.PbFieldType.PM, subBuilder: RestoredSubscription.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RestoreSubscriptionsResponse clone() => RestoreSubscriptionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RestoreSubscriptionsResponse copyWith(void Function(RestoreSubscriptionsResponse) updates) => super.copyWith((message) => updates(message as RestoreSubscriptionsResponse)) as RestoreSubscriptionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestoreSubscriptionsResponse create() => RestoreSubscriptionsResponse._();
  RestoreSubscriptionsResponse createEmptyInstance() => create();
  static $pb.PbList<RestoreSubscriptionsResponse> createRepeated() => $pb.PbList<RestoreSubscriptionsResponse>();
  @$core.pragma('dart2js:noInline')
  static RestoreSubscriptionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestoreSubscriptionsResponse>(create);
  static RestoreSubscriptionsResponse? _defaultInstance;

  /// 復元されたアクティブなサブスクリプション一覧
  @$pb.TagNumber(1)
  $core.List<RestoredSubscription> get restoredSubscriptions => $_getList(0);
}

/// RestoredSubscription: 復元されたサブスクリプションの最小限の情報
class RestoredSubscription extends $pb.GeneratedMessage {
  factory RestoredSubscription({
    $core.String? productIdentifier,
    $109.Timestamp? expiresDate,
    $core.String? entitlementId,
  }) {
    final $result = create();
    if (productIdentifier != null) {
      $result.productIdentifier = productIdentifier;
    }
    if (expiresDate != null) {
      $result.expiresDate = expiresDate;
    }
    if (entitlementId != null) {
      $result.entitlementId = entitlementId;
    }
    return $result;
  }
  RestoredSubscription._() : super();
  factory RestoredSubscription.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestoredSubscription.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RestoredSubscription', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productIdentifier')
    ..aOM<$109.Timestamp>(2, _omitFieldNames ? '' : 'expiresDate', subBuilder: $109.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'entitlementId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RestoredSubscription clone() => RestoredSubscription()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RestoredSubscription copyWith(void Function(RestoredSubscription) updates) => super.copyWith((message) => updates(message as RestoredSubscription)) as RestoredSubscription;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestoredSubscription create() => RestoredSubscription._();
  RestoredSubscription createEmptyInstance() => create();
  static $pb.PbList<RestoredSubscription> createRepeated() => $pb.PbList<RestoredSubscription>();
  @$core.pragma('dart2js:noInline')
  static RestoredSubscription getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestoredSubscription>(create);
  static RestoredSubscription? _defaultInstance;

  /// 製品識別子（RevenueCatのproduct_identifier）
  @$pb.TagNumber(1)
  $core.String get productIdentifier => $_getSZ(0);
  @$pb.TagNumber(1)
  set productIdentifier($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProductIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductIdentifier() => clearField(1);

  /// 有効期限（サブスクリプションの場合。生涯プランの場合はnull）
  @$pb.TagNumber(2)
  $109.Timestamp get expiresDate => $_getN(1);
  @$pb.TagNumber(2)
  set expiresDate($109.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpiresDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiresDate() => clearField(2);
  @$pb.TagNumber(2)
  $109.Timestamp ensureExpiresDate() => $_ensure(1);

  /// エンタイトルメントID（該当する場合）
  @$pb.TagNumber(3)
  $core.String get entitlementId => $_getSZ(2);
  @$pb.TagNumber(3)
  set entitlementId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEntitlementId() => $_has(2);
  @$pb.TagNumber(3)
  void clearEntitlementId() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
