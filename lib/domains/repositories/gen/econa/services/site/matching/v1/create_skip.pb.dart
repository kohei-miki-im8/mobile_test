//
//  Generated code. Do not modify.
//  source: econa/services/site/matching/v1/create_skip.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/skip_source_code.pbenum.dart' as $163;

/// スキップ作成リクエスト
class CreateSkipRequest extends $pb.GeneratedMessage {
  factory CreateSkipRequest({
    $core.String? toUserId,
    $core.String? displayedPhotoId,
    $163.SkipSourceCode? skipSource,
  }) {
    final $result = create();
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (displayedPhotoId != null) {
      $result.displayedPhotoId = displayedPhotoId;
    }
    if (skipSource != null) {
      $result.skipSource = skipSource;
    }
    return $result;
  }
  CreateSkipRequest._() : super();
  factory CreateSkipRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSkipRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSkipRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.matching.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toUserId')
    ..aOS(2, _omitFieldNames ? '' : 'displayedPhotoId')
    ..e<$163.SkipSourceCode>(3, _omitFieldNames ? '' : 'skipSource', $pb.PbFieldType.OE, defaultOrMaker: $163.SkipSourceCode.SKIP_SOURCE_CODE_UNSPECIFIED, valueOf: $163.SkipSourceCode.valueOf, enumValues: $163.SkipSourceCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSkipRequest clone() => CreateSkipRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSkipRequest copyWith(void Function(CreateSkipRequest) updates) => super.copyWith((message) => updates(message as CreateSkipRequest)) as CreateSkipRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSkipRequest create() => CreateSkipRequest._();
  CreateSkipRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSkipRequest> createRepeated() => $pb.PbList<CreateSkipRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSkipRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSkipRequest>(create);
  static CreateSkipRequest? _defaultInstance;

  /// お相手のユーザーID
  @$pb.TagNumber(1)
  $core.String get toUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUserId() => clearField(1);

  /// スキップ時に表示されていたプロフィール画像ID（オプション）
  @$pb.TagNumber(2)
  $core.String get displayedPhotoId => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayedPhotoId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisplayedPhotoId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayedPhotoId() => clearField(2);

  /// スキップソース（ホームまたは「お相手から」タブ）
  /// デフォルト: SKIP_SOURCE_CODE_HOME
  @$pb.TagNumber(3)
  $163.SkipSourceCode get skipSource => $_getN(2);
  @$pb.TagNumber(3)
  set skipSource($163.SkipSourceCode v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSkipSource() => $_has(2);
  @$pb.TagNumber(3)
  void clearSkipSource() => clearField(3);
}

/// スキップ作成レスポンス
class CreateSkipResponse extends $pb.GeneratedMessage {
  factory CreateSkipResponse() => create();
  CreateSkipResponse._() : super();
  factory CreateSkipResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSkipResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSkipResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.matching.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSkipResponse clone() => CreateSkipResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSkipResponse copyWith(void Function(CreateSkipResponse) updates) => super.copyWith((message) => updates(message as CreateSkipResponse)) as CreateSkipResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSkipResponse create() => CreateSkipResponse._();
  CreateSkipResponse createEmptyInstance() => create();
  static $pb.PbList<CreateSkipResponse> createRepeated() => $pb.PbList<CreateSkipResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateSkipResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSkipResponse>(create);
  static CreateSkipResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
