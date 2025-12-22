//
//  Generated code. Do not modify.
//  source: econa/services/site/matching/v1/delete_skip.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// スキップ削除リクエスト
class DeleteSkipRequest extends $pb.GeneratedMessage {
  factory DeleteSkipRequest({
    $core.String? toUserId,
  }) {
    final $result = create();
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    return $result;
  }
  DeleteSkipRequest._() : super();
  factory DeleteSkipRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSkipRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteSkipRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.matching.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toUserId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteSkipRequest clone() => DeleteSkipRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteSkipRequest copyWith(void Function(DeleteSkipRequest) updates) => super.copyWith((message) => updates(message as DeleteSkipRequest)) as DeleteSkipRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSkipRequest create() => DeleteSkipRequest._();
  DeleteSkipRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteSkipRequest> createRepeated() => $pb.PbList<DeleteSkipRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteSkipRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSkipRequest>(create);
  static DeleteSkipRequest? _defaultInstance;

  /// お相手のユーザーID
  @$pb.TagNumber(1)
  $core.String get toUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUserId() => clearField(1);
}

/// スキップ削除レスポンス
class DeleteSkipResponse extends $pb.GeneratedMessage {
  factory DeleteSkipResponse() => create();
  DeleteSkipResponse._() : super();
  factory DeleteSkipResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSkipResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteSkipResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.matching.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteSkipResponse clone() => DeleteSkipResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteSkipResponse copyWith(void Function(DeleteSkipResponse) updates) => super.copyWith((message) => updates(message as DeleteSkipResponse)) as DeleteSkipResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSkipResponse create() => DeleteSkipResponse._();
  DeleteSkipResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteSkipResponse> createRepeated() => $pb.PbList<DeleteSkipResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteSkipResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSkipResponse>(create);
  static DeleteSkipResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
