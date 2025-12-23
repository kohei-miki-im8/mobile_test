//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/exchange_matching_to_like.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/point.pb.dart' as $156;

/// マッチングポイントをいいねポイントに交換するリクエスト
class ExchangeMatchingToLikeRequest extends $pb.GeneratedMessage {
  factory ExchangeMatchingToLikeRequest({
    $fixnum.Int64? amount,
  }) {
    final $result = create();
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  ExchangeMatchingToLikeRequest._() : super();
  factory ExchangeMatchingToLikeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExchangeMatchingToLikeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExchangeMatchingToLikeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExchangeMatchingToLikeRequest clone() => ExchangeMatchingToLikeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExchangeMatchingToLikeRequest copyWith(void Function(ExchangeMatchingToLikeRequest) updates) => super.copyWith((message) => updates(message as ExchangeMatchingToLikeRequest)) as ExchangeMatchingToLikeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExchangeMatchingToLikeRequest create() => ExchangeMatchingToLikeRequest._();
  ExchangeMatchingToLikeRequest createEmptyInstance() => create();
  static $pb.PbList<ExchangeMatchingToLikeRequest> createRepeated() => $pb.PbList<ExchangeMatchingToLikeRequest>();
  @$core.pragma('dart2js:noInline')
  static ExchangeMatchingToLikeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeMatchingToLikeRequest>(create);
  static ExchangeMatchingToLikeRequest? _defaultInstance;

  /// 交換量（ポイント数）：必須・必ず > 0
  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);
}

/// マッチングポイントをいいねポイントに交換するレスポンス
class ExchangeMatchingToLikeResponse extends $pb.GeneratedMessage {
  factory ExchangeMatchingToLikeResponse({
    $156.PointBalance? pointBalance,
  }) {
    final $result = create();
    if (pointBalance != null) {
      $result.pointBalance = pointBalance;
    }
    return $result;
  }
  ExchangeMatchingToLikeResponse._() : super();
  factory ExchangeMatchingToLikeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExchangeMatchingToLikeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExchangeMatchingToLikeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOM<$156.PointBalance>(1, _omitFieldNames ? '' : 'pointBalance', subBuilder: $156.PointBalance.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExchangeMatchingToLikeResponse clone() => ExchangeMatchingToLikeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExchangeMatchingToLikeResponse copyWith(void Function(ExchangeMatchingToLikeResponse) updates) => super.copyWith((message) => updates(message as ExchangeMatchingToLikeResponse)) as ExchangeMatchingToLikeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExchangeMatchingToLikeResponse create() => ExchangeMatchingToLikeResponse._();
  ExchangeMatchingToLikeResponse createEmptyInstance() => create();
  static $pb.PbList<ExchangeMatchingToLikeResponse> createRepeated() => $pb.PbList<ExchangeMatchingToLikeResponse>();
  @$core.pragma('dart2js:noInline')
  static ExchangeMatchingToLikeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeMatchingToLikeResponse>(create);
  static ExchangeMatchingToLikeResponse? _defaultInstance;

  /// 交換後のポイント残高
  @$pb.TagNumber(1)
  $156.PointBalance get pointBalance => $_getN(0);
  @$pb.TagNumber(1)
  set pointBalance($156.PointBalance v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPointBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearPointBalance() => clearField(1);
  @$pb.TagNumber(1)
  $156.PointBalance ensurePointBalance() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
