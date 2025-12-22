//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/update_visible_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 表示ステータス更新リクエスト
class UpdateVisibleStatusRequest extends $pb.GeneratedMessage {
  factory UpdateVisibleStatusRequest({
    $core.String? chatRoomId,
    $core.bool? isVisible,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (isVisible != null) {
      $result.isVisible = isVisible;
    }
    return $result;
  }
  UpdateVisibleStatusRequest._() : super();
  factory UpdateVisibleStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVisibleStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateVisibleStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..aOB(2, _omitFieldNames ? '' : 'isVisible')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateVisibleStatusRequest clone() => UpdateVisibleStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateVisibleStatusRequest copyWith(void Function(UpdateVisibleStatusRequest) updates) => super.copyWith((message) => updates(message as UpdateVisibleStatusRequest)) as UpdateVisibleStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateVisibleStatusRequest create() => UpdateVisibleStatusRequest._();
  UpdateVisibleStatusRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateVisibleStatusRequest> createRepeated() => $pb.PbList<UpdateVisibleStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateVisibleStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVisibleStatusRequest>(create);
  static UpdateVisibleStatusRequest? _defaultInstance;

  /// チャットルームID
  @$pb.TagNumber(1)
  $core.String get chatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoomId() => clearField(1);

  /// 表示ステータス
  @$pb.TagNumber(2)
  $core.bool get isVisible => $_getBF(1);
  @$pb.TagNumber(2)
  set isVisible($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsVisible() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsVisible() => clearField(2);
}

/// 表示ステータス更新レスポンス
class UpdateVisibleStatusResponse extends $pb.GeneratedMessage {
  factory UpdateVisibleStatusResponse() => create();
  UpdateVisibleStatusResponse._() : super();
  factory UpdateVisibleStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVisibleStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateVisibleStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateVisibleStatusResponse clone() => UpdateVisibleStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateVisibleStatusResponse copyWith(void Function(UpdateVisibleStatusResponse) updates) => super.copyWith((message) => updates(message as UpdateVisibleStatusResponse)) as UpdateVisibleStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateVisibleStatusResponse create() => UpdateVisibleStatusResponse._();
  UpdateVisibleStatusResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateVisibleStatusResponse> createRepeated() => $pb.PbList<UpdateVisibleStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateVisibleStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVisibleStatusResponse>(create);
  static UpdateVisibleStatusResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
