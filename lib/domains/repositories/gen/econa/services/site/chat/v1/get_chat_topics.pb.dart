//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/get_chat_topics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/chat_topic.pb.dart' as $154;

/// チャット話題取得リクエスト
class GetChatTopicsRequest extends $pb.GeneratedMessage {
  factory GetChatTopicsRequest({
    $core.String? chatRoomId,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    return $result;
  }
  GetChatTopicsRequest._() : super();
  factory GetChatTopicsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatTopicsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChatTopicsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatTopicsRequest clone() => GetChatTopicsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatTopicsRequest copyWith(void Function(GetChatTopicsRequest) updates) => super.copyWith((message) => updates(message as GetChatTopicsRequest)) as GetChatTopicsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatTopicsRequest create() => GetChatTopicsRequest._();
  GetChatTopicsRequest createEmptyInstance() => create();
  static $pb.PbList<GetChatTopicsRequest> createRepeated() => $pb.PbList<GetChatTopicsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChatTopicsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatTopicsRequest>(create);
  static GetChatTopicsRequest? _defaultInstance;

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

/// チャット話題取得レスポンス
class GetChatTopicsResponse extends $pb.GeneratedMessage {
  factory GetChatTopicsResponse({
    $core.Iterable<$154.ChatTopic>? chatTopics,
  }) {
    final $result = create();
    if (chatTopics != null) {
      $result.chatTopics.addAll(chatTopics);
    }
    return $result;
  }
  GetChatTopicsResponse._() : super();
  factory GetChatTopicsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatTopicsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChatTopicsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..pc<$154.ChatTopic>(1, _omitFieldNames ? '' : 'chatTopics', $pb.PbFieldType.PM, subBuilder: $154.ChatTopic.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatTopicsResponse clone() => GetChatTopicsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatTopicsResponse copyWith(void Function(GetChatTopicsResponse) updates) => super.copyWith((message) => updates(message as GetChatTopicsResponse)) as GetChatTopicsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatTopicsResponse create() => GetChatTopicsResponse._();
  GetChatTopicsResponse createEmptyInstance() => create();
  static $pb.PbList<GetChatTopicsResponse> createRepeated() => $pb.PbList<GetChatTopicsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChatTopicsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatTopicsResponse>(create);
  static GetChatTopicsResponse? _defaultInstance;

  /// チャット話題
  @$pb.TagNumber(1)
  $core.List<$154.ChatTopic> get chatTopics => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
