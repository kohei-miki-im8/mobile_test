//
//  Generated code. Do not modify.
//  source: econa/services/site/hide/v1/update_user_hide.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 非表示状態更新リクエスト
class UpdateUserHideRequest extends $pb.GeneratedMessage {
  factory UpdateUserHideRequest({
    $core.String? toUserId,
    $core.bool? hide,
  }) {
    final $result = create();
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (hide != null) {
      $result.hide = hide;
    }
    return $result;
  }
  UpdateUserHideRequest._() : super();
  factory UpdateUserHideRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserHideRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserHideRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.hide.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toUserId')
    ..aOB(2, _omitFieldNames ? '' : 'hide')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserHideRequest clone() => UpdateUserHideRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserHideRequest copyWith(void Function(UpdateUserHideRequest) updates) => super.copyWith((message) => updates(message as UpdateUserHideRequest)) as UpdateUserHideRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserHideRequest create() => UpdateUserHideRequest._();
  UpdateUserHideRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateUserHideRequest> createRepeated() => $pb.PbList<UpdateUserHideRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserHideRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserHideRequest>(create);
  static UpdateUserHideRequest? _defaultInstance;

  /// お相手のユーザーID
  @$pb.TagNumber(1)
  $core.String get toUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUserId() => clearField(1);

  /// 非表示状態
  @$pb.TagNumber(2)
  $core.bool get hide => $_getBF(1);
  @$pb.TagNumber(2)
  set hide($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHide() => $_has(1);
  @$pb.TagNumber(2)
  void clearHide() => clearField(2);
}

/// 非表示状態更新レスポンス
class UpdateUserHideResponse extends $pb.GeneratedMessage {
  factory UpdateUserHideResponse() => create();
  UpdateUserHideResponse._() : super();
  factory UpdateUserHideResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserHideResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserHideResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.hide.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserHideResponse clone() => UpdateUserHideResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserHideResponse copyWith(void Function(UpdateUserHideResponse) updates) => super.copyWith((message) => updates(message as UpdateUserHideResponse)) as UpdateUserHideResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserHideResponse create() => UpdateUserHideResponse._();
  UpdateUserHideResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateUserHideResponse> createRepeated() => $pb.PbList<UpdateUserHideResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserHideResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserHideResponse>(create);
  static UpdateUserHideResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
