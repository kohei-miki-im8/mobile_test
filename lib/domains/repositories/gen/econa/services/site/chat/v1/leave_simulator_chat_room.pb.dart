//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/leave_simulator_chat_room.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// シミュレーターチャットルーム退出リクエスト
class LeaveSimulatorChatRoomRequest extends $pb.GeneratedMessage {
  factory LeaveSimulatorChatRoomRequest({
    $core.String? chatRoomId,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    return $result;
  }
  LeaveSimulatorChatRoomRequest._() : super();
  factory LeaveSimulatorChatRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaveSimulatorChatRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LeaveSimulatorChatRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaveSimulatorChatRoomRequest clone() => LeaveSimulatorChatRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaveSimulatorChatRoomRequest copyWith(void Function(LeaveSimulatorChatRoomRequest) updates) => super.copyWith((message) => updates(message as LeaveSimulatorChatRoomRequest)) as LeaveSimulatorChatRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveSimulatorChatRoomRequest create() => LeaveSimulatorChatRoomRequest._();
  LeaveSimulatorChatRoomRequest createEmptyInstance() => create();
  static $pb.PbList<LeaveSimulatorChatRoomRequest> createRepeated() => $pb.PbList<LeaveSimulatorChatRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static LeaveSimulatorChatRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaveSimulatorChatRoomRequest>(create);
  static LeaveSimulatorChatRoomRequest? _defaultInstance;

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

/// シミュレーターチャットルーム退出レスポンス
class LeaveSimulatorChatRoomResponse extends $pb.GeneratedMessage {
  factory LeaveSimulatorChatRoomResponse() => create();
  LeaveSimulatorChatRoomResponse._() : super();
  factory LeaveSimulatorChatRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaveSimulatorChatRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LeaveSimulatorChatRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaveSimulatorChatRoomResponse clone() => LeaveSimulatorChatRoomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaveSimulatorChatRoomResponse copyWith(void Function(LeaveSimulatorChatRoomResponse) updates) => super.copyWith((message) => updates(message as LeaveSimulatorChatRoomResponse)) as LeaveSimulatorChatRoomResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveSimulatorChatRoomResponse create() => LeaveSimulatorChatRoomResponse._();
  LeaveSimulatorChatRoomResponse createEmptyInstance() => create();
  static $pb.PbList<LeaveSimulatorChatRoomResponse> createRepeated() => $pb.PbList<LeaveSimulatorChatRoomResponse>();
  @$core.pragma('dart2js:noInline')
  static LeaveSimulatorChatRoomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaveSimulatorChatRoomResponse>(create);
  static LeaveSimulatorChatRoomResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
