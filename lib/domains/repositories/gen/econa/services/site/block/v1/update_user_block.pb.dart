//
//  Generated code. Do not modify.
//  source: econa/services/site/block/v1/update_user_block.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// ブロック状態更新リクエスト
class UpdateUserBlockRequest extends $pb.GeneratedMessage {
  factory UpdateUserBlockRequest({
    $core.String? toUserId,
    $core.bool? block,
  }) {
    final $result = create();
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (block != null) {
      $result.block = block;
    }
    return $result;
  }
  UpdateUserBlockRequest._() : super();
  factory UpdateUserBlockRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserBlockRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserBlockRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.block.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toUserId')
    ..aOB(2, _omitFieldNames ? '' : 'block')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserBlockRequest clone() => UpdateUserBlockRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserBlockRequest copyWith(void Function(UpdateUserBlockRequest) updates) => super.copyWith((message) => updates(message as UpdateUserBlockRequest)) as UpdateUserBlockRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserBlockRequest create() => UpdateUserBlockRequest._();
  UpdateUserBlockRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateUserBlockRequest> createRepeated() => $pb.PbList<UpdateUserBlockRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserBlockRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserBlockRequest>(create);
  static UpdateUserBlockRequest? _defaultInstance;

  /// お相手のユーザーID
  @$pb.TagNumber(1)
  $core.String get toUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUserId() => clearField(1);

  /// ブロック状態
  @$pb.TagNumber(2)
  $core.bool get block => $_getBF(1);
  @$pb.TagNumber(2)
  set block($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlock() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlock() => clearField(2);
}

/// ブロック状態更新レスポンス
class UpdateUserBlockResponse extends $pb.GeneratedMessage {
  factory UpdateUserBlockResponse() => create();
  UpdateUserBlockResponse._() : super();
  factory UpdateUserBlockResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserBlockResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserBlockResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.block.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserBlockResponse clone() => UpdateUserBlockResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserBlockResponse copyWith(void Function(UpdateUserBlockResponse) updates) => super.copyWith((message) => updates(message as UpdateUserBlockResponse)) as UpdateUserBlockResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserBlockResponse create() => UpdateUserBlockResponse._();
  UpdateUserBlockResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateUserBlockResponse> createRepeated() => $pb.PbList<UpdateUserBlockResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserBlockResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserBlockResponse>(create);
  static UpdateUserBlockResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
