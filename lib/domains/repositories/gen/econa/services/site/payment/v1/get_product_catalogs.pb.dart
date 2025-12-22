//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/get_product_catalogs.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/stripe.pb.dart' as $168;

/// 商品カタログ取得リクエスト
class GetProductCatalogsRequest extends $pb.GeneratedMessage {
  factory GetProductCatalogsRequest() => create();
  GetProductCatalogsRequest._() : super();
  factory GetProductCatalogsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProductCatalogsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProductCatalogsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProductCatalogsRequest clone() => GetProductCatalogsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProductCatalogsRequest copyWith(void Function(GetProductCatalogsRequest) updates) => super.copyWith((message) => updates(message as GetProductCatalogsRequest)) as GetProductCatalogsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProductCatalogsRequest create() => GetProductCatalogsRequest._();
  GetProductCatalogsRequest createEmptyInstance() => create();
  static $pb.PbList<GetProductCatalogsRequest> createRepeated() => $pb.PbList<GetProductCatalogsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProductCatalogsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProductCatalogsRequest>(create);
  static GetProductCatalogsRequest? _defaultInstance;
}

/// 商品カタログ取得レスポンス
class GetProductCatalogsResponse extends $pb.GeneratedMessage {
  factory GetProductCatalogsResponse({
    $core.Iterable<$168.StripeProductCatalog>? catalogs,
  }) {
    final $result = create();
    if (catalogs != null) {
      $result.catalogs.addAll(catalogs);
    }
    return $result;
  }
  GetProductCatalogsResponse._() : super();
  factory GetProductCatalogsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProductCatalogsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProductCatalogsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..pc<$168.StripeProductCatalog>(1, _omitFieldNames ? '' : 'catalogs', $pb.PbFieldType.PM, subBuilder: $168.StripeProductCatalog.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProductCatalogsResponse clone() => GetProductCatalogsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProductCatalogsResponse copyWith(void Function(GetProductCatalogsResponse) updates) => super.copyWith((message) => updates(message as GetProductCatalogsResponse)) as GetProductCatalogsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProductCatalogsResponse create() => GetProductCatalogsResponse._();
  GetProductCatalogsResponse createEmptyInstance() => create();
  static $pb.PbList<GetProductCatalogsResponse> createRepeated() => $pb.PbList<GetProductCatalogsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProductCatalogsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProductCatalogsResponse>(create);
  static GetProductCatalogsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$168.StripeProductCatalog> get catalogs => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
