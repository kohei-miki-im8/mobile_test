//
//  Generated code. Do not modify.
//  source: econa/services/site/master/v1/get_regions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/language_code.pbenum.dart' as $127;
import '../../../../master/regions.pb.dart' as $113;

/// リージョン一覧取得リクエスト
class GetRegionsRequest extends $pb.GeneratedMessage {
  factory GetRegionsRequest({
    $127.LanguageCode? languageCode,
  }) {
    final $result = create();
    if (languageCode != null) {
      $result.languageCode = languageCode;
    }
    return $result;
  }
  GetRegionsRequest._() : super();
  factory GetRegionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRegionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRegionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.master.v1'), createEmptyInstance: create)
    ..e<$127.LanguageCode>(1, _omitFieldNames ? '' : 'languageCode', $pb.PbFieldType.OE, defaultOrMaker: $127.LanguageCode.LANGUAGE_CODE_UNSPECIFIED, valueOf: $127.LanguageCode.valueOf, enumValues: $127.LanguageCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRegionsRequest clone() => GetRegionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRegionsRequest copyWith(void Function(GetRegionsRequest) updates) => super.copyWith((message) => updates(message as GetRegionsRequest)) as GetRegionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRegionsRequest create() => GetRegionsRequest._();
  GetRegionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetRegionsRequest> createRepeated() => $pb.PbList<GetRegionsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRegionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRegionsRequest>(create);
  static GetRegionsRequest? _defaultInstance;

  /// 言語コード（valueを返却するエンドポイントなので要指定）
  @$pb.TagNumber(1)
  $127.LanguageCode get languageCode => $_getN(0);
  @$pb.TagNumber(1)
  set languageCode($127.LanguageCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLanguageCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearLanguageCode() => clearField(1);
}

/// リージョン一覧取得レスポンス
class GetRegionsResponse extends $pb.GeneratedMessage {
  factory GetRegionsResponse({
    $core.Iterable<$113.Region>? regions,
  }) {
    final $result = create();
    if (regions != null) {
      $result.regions.addAll(regions);
    }
    return $result;
  }
  GetRegionsResponse._() : super();
  factory GetRegionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRegionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRegionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.master.v1'), createEmptyInstance: create)
    ..pc<$113.Region>(1, _omitFieldNames ? '' : 'regions', $pb.PbFieldType.PM, subBuilder: $113.Region.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRegionsResponse clone() => GetRegionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRegionsResponse copyWith(void Function(GetRegionsResponse) updates) => super.copyWith((message) => updates(message as GetRegionsResponse)) as GetRegionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRegionsResponse create() => GetRegionsResponse._();
  GetRegionsResponse createEmptyInstance() => create();
  static $pb.PbList<GetRegionsResponse> createRepeated() => $pb.PbList<GetRegionsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRegionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRegionsResponse>(create);
  static GetRegionsResponse? _defaultInstance;

  /// リージョン一覧
  @$pb.TagNumber(1)
  $core.List<$113.Region> get regions => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
