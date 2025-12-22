//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/leave_counseling_chat_room.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// カウンセリングチャットルーム退出リクエスト
class LeaveCounselingChatRoomRequest extends $pb.GeneratedMessage {
  factory LeaveCounselingChatRoomRequest({
    $core.String? chatRoomId,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    return $result;
  }
  LeaveCounselingChatRoomRequest._() : super();
  factory LeaveCounselingChatRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaveCounselingChatRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LeaveCounselingChatRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaveCounselingChatRoomRequest clone() => LeaveCounselingChatRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaveCounselingChatRoomRequest copyWith(void Function(LeaveCounselingChatRoomRequest) updates) => super.copyWith((message) => updates(message as LeaveCounselingChatRoomRequest)) as LeaveCounselingChatRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveCounselingChatRoomRequest create() => LeaveCounselingChatRoomRequest._();
  LeaveCounselingChatRoomRequest createEmptyInstance() => create();
  static $pb.PbList<LeaveCounselingChatRoomRequest> createRepeated() => $pb.PbList<LeaveCounselingChatRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static LeaveCounselingChatRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaveCounselingChatRoomRequest>(create);
  static LeaveCounselingChatRoomRequest? _defaultInstance;

  /// チャットルームID
  @$pb.TagNumber(1)
  $core.String get chatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoomId() => clearField(1);
}

/// カウンセリングチャットルーム退出レスポンス
class LeaveCounselingChatRoomResponse extends $pb.GeneratedMessage {
  factory LeaveCounselingChatRoomResponse() => create();
  LeaveCounselingChatRoomResponse._() : super();
  factory LeaveCounselingChatRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaveCounselingChatRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LeaveCounselingChatRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaveCounselingChatRoomResponse clone() => LeaveCounselingChatRoomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaveCounselingChatRoomResponse copyWith(void Function(LeaveCounselingChatRoomResponse) updates) => super.copyWith((message) => updates(message as LeaveCounselingChatRoomResponse)) as LeaveCounselingChatRoomResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveCounselingChatRoomResponse create() => LeaveCounselingChatRoomResponse._();
  LeaveCounselingChatRoomResponse createEmptyInstance() => create();
  static $pb.PbList<LeaveCounselingChatRoomResponse> createRepeated() => $pb.PbList<LeaveCounselingChatRoomResponse>();
  @$core.pragma('dart2js:noInline')
  static LeaveCounselingChatRoomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaveCounselingChatRoomResponse>(create);
  static LeaveCounselingChatRoomResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
