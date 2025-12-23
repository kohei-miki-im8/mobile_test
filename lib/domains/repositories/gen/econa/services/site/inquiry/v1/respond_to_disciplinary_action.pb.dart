//
//  Generated code. Do not modify.
//  source: econa/services/site/inquiry/v1/respond_to_disciplinary_action.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;

/// 懲戒処分への応答リクエスト
class RespondToDisciplinaryActionRequest extends $pb.GeneratedMessage {
  factory RespondToDisciplinaryActionRequest({
    $core.String? userDisciplinaryLogId,
    $core.bool? isAgreed,
  }) {
    final $result = create();
    if (userDisciplinaryLogId != null) {
      $result.userDisciplinaryLogId = userDisciplinaryLogId;
    }
    if (isAgreed != null) {
      $result.isAgreed = isAgreed;
    }
    return $result;
  }
  RespondToDisciplinaryActionRequest._() : super();
  factory RespondToDisciplinaryActionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespondToDisciplinaryActionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespondToDisciplinaryActionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.inquiry.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userDisciplinaryLogId')
    ..aOB(2, _omitFieldNames ? '' : 'isAgreed')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespondToDisciplinaryActionRequest clone() => RespondToDisciplinaryActionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespondToDisciplinaryActionRequest copyWith(void Function(RespondToDisciplinaryActionRequest) updates) => super.copyWith((message) => updates(message as RespondToDisciplinaryActionRequest)) as RespondToDisciplinaryActionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespondToDisciplinaryActionRequest create() => RespondToDisciplinaryActionRequest._();
  RespondToDisciplinaryActionRequest createEmptyInstance() => create();
  static $pb.PbList<RespondToDisciplinaryActionRequest> createRepeated() => $pb.PbList<RespondToDisciplinaryActionRequest>();
  @$core.pragma('dart2js:noInline')
  static RespondToDisciplinaryActionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespondToDisciplinaryActionRequest>(create);
  static RespondToDisciplinaryActionRequest? _defaultInstance;

  /// 懲戒処分ログID
  @$pb.TagNumber(1)
  $core.String get userDisciplinaryLogId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userDisciplinaryLogId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserDisciplinaryLogId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserDisciplinaryLogId() => clearField(1);

  /// 同意するかどうか
  @$pb.TagNumber(2)
  $core.bool get isAgreed => $_getBF(1);
  @$pb.TagNumber(2)
  set isAgreed($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAgreed() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAgreed() => clearField(2);
}

/// 懲戒処分への応答レスポンス
class RespondToDisciplinaryActionResponse extends $pb.GeneratedMessage {
  factory RespondToDisciplinaryActionResponse({
    $109.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  RespondToDisciplinaryActionResponse._() : super();
  factory RespondToDisciplinaryActionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespondToDisciplinaryActionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RespondToDisciplinaryActionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.inquiry.v1'), createEmptyInstance: create)
    ..aOM<$109.Timestamp>(1, _omitFieldNames ? '' : 'updatedAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespondToDisciplinaryActionResponse clone() => RespondToDisciplinaryActionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespondToDisciplinaryActionResponse copyWith(void Function(RespondToDisciplinaryActionResponse) updates) => super.copyWith((message) => updates(message as RespondToDisciplinaryActionResponse)) as RespondToDisciplinaryActionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespondToDisciplinaryActionResponse create() => RespondToDisciplinaryActionResponse._();
  RespondToDisciplinaryActionResponse createEmptyInstance() => create();
  static $pb.PbList<RespondToDisciplinaryActionResponse> createRepeated() => $pb.PbList<RespondToDisciplinaryActionResponse>();
  @$core.pragma('dart2js:noInline')
  static RespondToDisciplinaryActionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespondToDisciplinaryActionResponse>(create);
  static RespondToDisciplinaryActionResponse? _defaultInstance;

  /// 更新日時
  @$pb.TagNumber(1)
  $109.Timestamp get updatedAt => $_getN(0);
  @$pb.TagNumber(1)
  set updatedAt($109.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdatedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdatedAt() => clearField(1);
  @$pb.TagNumber(1)
  $109.Timestamp ensureUpdatedAt() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
