//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/get_counseling_chat_room.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/chat_room.pb.dart' as $153;

/// カウンセリングチャットルーム取得リクエスト
class GetCounselingChatRoomRequest extends $pb.GeneratedMessage {
  factory GetCounselingChatRoomRequest() => create();
  GetCounselingChatRoomRequest._() : super();
  factory GetCounselingChatRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCounselingChatRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCounselingChatRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCounselingChatRoomRequest clone() => GetCounselingChatRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCounselingChatRoomRequest copyWith(void Function(GetCounselingChatRoomRequest) updates) => super.copyWith((message) => updates(message as GetCounselingChatRoomRequest)) as GetCounselingChatRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCounselingChatRoomRequest create() => GetCounselingChatRoomRequest._();
  GetCounselingChatRoomRequest createEmptyInstance() => create();
  static $pb.PbList<GetCounselingChatRoomRequest> createRepeated() => $pb.PbList<GetCounselingChatRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCounselingChatRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCounselingChatRoomRequest>(create);
  static GetCounselingChatRoomRequest? _defaultInstance;
}

/// カウンセリングチャットルーム取得レスポンス
class GetCounselingChatRoomResponse extends $pb.GeneratedMessage {
  factory GetCounselingChatRoomResponse({
    $153.ChatRoom? chatRoom,
  }) {
    final $result = create();
    if (chatRoom != null) {
      $result.chatRoom = chatRoom;
    }
    return $result;
  }
  GetCounselingChatRoomResponse._() : super();
  factory GetCounselingChatRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCounselingChatRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCounselingChatRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOM<$153.ChatRoom>(1, _omitFieldNames ? '' : 'chatRoom', subBuilder: $153.ChatRoom.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCounselingChatRoomResponse clone() => GetCounselingChatRoomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCounselingChatRoomResponse copyWith(void Function(GetCounselingChatRoomResponse) updates) => super.copyWith((message) => updates(message as GetCounselingChatRoomResponse)) as GetCounselingChatRoomResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCounselingChatRoomResponse create() => GetCounselingChatRoomResponse._();
  GetCounselingChatRoomResponse createEmptyInstance() => create();
  static $pb.PbList<GetCounselingChatRoomResponse> createRepeated() => $pb.PbList<GetCounselingChatRoomResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCounselingChatRoomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCounselingChatRoomResponse>(create);
  static GetCounselingChatRoomResponse? _defaultInstance;

  /// カウンセリングチャットルーム（存在しない場合は null）
  @$pb.TagNumber(1)
  $153.ChatRoom get chatRoom => $_getN(0);
  @$pb.TagNumber(1)
  set chatRoom($153.ChatRoom v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoom() => clearField(1);
  @$pb.TagNumber(1)
  $153.ChatRoom ensureChatRoom() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
