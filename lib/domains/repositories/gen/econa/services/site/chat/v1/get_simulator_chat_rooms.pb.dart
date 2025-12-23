//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/get_simulator_chat_rooms.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/chat_room.pb.dart' as $153;

/// シミュレーターチャットルーム一覧取得リクエスト
class GetSimulatorChatRoomsRequest extends $pb.GeneratedMessage {
  factory GetSimulatorChatRoomsRequest() => create();
  GetSimulatorChatRoomsRequest._() : super();
  factory GetSimulatorChatRoomsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSimulatorChatRoomsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSimulatorChatRoomsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSimulatorChatRoomsRequest clone() => GetSimulatorChatRoomsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSimulatorChatRoomsRequest copyWith(void Function(GetSimulatorChatRoomsRequest) updates) => super.copyWith((message) => updates(message as GetSimulatorChatRoomsRequest)) as GetSimulatorChatRoomsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSimulatorChatRoomsRequest create() => GetSimulatorChatRoomsRequest._();
  GetSimulatorChatRoomsRequest createEmptyInstance() => create();
  static $pb.PbList<GetSimulatorChatRoomsRequest> createRepeated() => $pb.PbList<GetSimulatorChatRoomsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSimulatorChatRoomsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSimulatorChatRoomsRequest>(create);
  static GetSimulatorChatRoomsRequest? _defaultInstance;
}

/// シミュレーターチャットルーム一覧取得レスポンス
class GetSimulatorChatRoomsResponse extends $pb.GeneratedMessage {
  factory GetSimulatorChatRoomsResponse({
    $core.Iterable<$153.SimulatorChatRoom>? simulatorChatRooms,
  }) {
    final $result = create();
    if (simulatorChatRooms != null) {
      $result.simulatorChatRooms.addAll(simulatorChatRooms);
    }
    return $result;
  }
  GetSimulatorChatRoomsResponse._() : super();
  factory GetSimulatorChatRoomsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSimulatorChatRoomsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSimulatorChatRoomsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..pc<$153.SimulatorChatRoom>(1, _omitFieldNames ? '' : 'simulatorChatRooms', $pb.PbFieldType.PM, subBuilder: $153.SimulatorChatRoom.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSimulatorChatRoomsResponse clone() => GetSimulatorChatRoomsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSimulatorChatRoomsResponse copyWith(void Function(GetSimulatorChatRoomsResponse) updates) => super.copyWith((message) => updates(message as GetSimulatorChatRoomsResponse)) as GetSimulatorChatRoomsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSimulatorChatRoomsResponse create() => GetSimulatorChatRoomsResponse._();
  GetSimulatorChatRoomsResponse createEmptyInstance() => create();
  static $pb.PbList<GetSimulatorChatRoomsResponse> createRepeated() => $pb.PbList<GetSimulatorChatRoomsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSimulatorChatRoomsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSimulatorChatRoomsResponse>(create);
  static GetSimulatorChatRoomsResponse? _defaultInstance;

  /// 未作成状態のシミュレーターチャットルーム一覧
  @$pb.TagNumber(1)
  $core.List<$153.SimulatorChatRoom> get simulatorChatRooms => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
