//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/update_push_notice_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// プッシュ通知ステータス更新リクエスト
class UpdatePushNoticeStatusRequest extends $pb.GeneratedMessage {
  factory UpdatePushNoticeStatusRequest({
    $core.String? chatRoomId,
    $core.bool? enablePushNotice,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (enablePushNotice != null) {
      $result.enablePushNotice = enablePushNotice;
    }
    return $result;
  }
  UpdatePushNoticeStatusRequest._() : super();
  factory UpdatePushNoticeStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePushNoticeStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePushNoticeStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..aOB(2, _omitFieldNames ? '' : 'enablePushNotice')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePushNoticeStatusRequest clone() => UpdatePushNoticeStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePushNoticeStatusRequest copyWith(void Function(UpdatePushNoticeStatusRequest) updates) => super.copyWith((message) => updates(message as UpdatePushNoticeStatusRequest)) as UpdatePushNoticeStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePushNoticeStatusRequest create() => UpdatePushNoticeStatusRequest._();
  UpdatePushNoticeStatusRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePushNoticeStatusRequest> createRepeated() => $pb.PbList<UpdatePushNoticeStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePushNoticeStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePushNoticeStatusRequest>(create);
  static UpdatePushNoticeStatusRequest? _defaultInstance;

  /// チャットルームID
  @$pb.TagNumber(1)
  $core.String get chatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoomId() => clearField(1);

  /// プッシュ通知ステータス
  @$pb.TagNumber(2)
  $core.bool get enablePushNotice => $_getBF(1);
  @$pb.TagNumber(2)
  set enablePushNotice($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnablePushNotice() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnablePushNotice() => clearField(2);
}

/// プッシュ通知ステータス更新レスポンス
class UpdatePushNoticeStatusResponse extends $pb.GeneratedMessage {
  factory UpdatePushNoticeStatusResponse() => create();
  UpdatePushNoticeStatusResponse._() : super();
  factory UpdatePushNoticeStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePushNoticeStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePushNoticeStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePushNoticeStatusResponse clone() => UpdatePushNoticeStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePushNoticeStatusResponse copyWith(void Function(UpdatePushNoticeStatusResponse) updates) => super.copyWith((message) => updates(message as UpdatePushNoticeStatusResponse)) as UpdatePushNoticeStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePushNoticeStatusResponse create() => UpdatePushNoticeStatusResponse._();
  UpdatePushNoticeStatusResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePushNoticeStatusResponse> createRepeated() => $pb.PbList<UpdatePushNoticeStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePushNoticeStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePushNoticeStatusResponse>(create);
  static UpdatePushNoticeStatusResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
