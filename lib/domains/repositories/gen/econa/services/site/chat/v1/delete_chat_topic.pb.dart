//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/delete_chat_topic.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// チャット話題削除リクエスト
class DeleteChatTopicRequest extends $pb.GeneratedMessage {
  factory DeleteChatTopicRequest({
    $core.String? chatTopicId,
  }) {
    final $result = create();
    if (chatTopicId != null) {
      $result.chatTopicId = chatTopicId;
    }
    return $result;
  }
  DeleteChatTopicRequest._() : super();
  factory DeleteChatTopicRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteChatTopicRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteChatTopicRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatTopicId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteChatTopicRequest clone() => DeleteChatTopicRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteChatTopicRequest copyWith(void Function(DeleteChatTopicRequest) updates) => super.copyWith((message) => updates(message as DeleteChatTopicRequest)) as DeleteChatTopicRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteChatTopicRequest create() => DeleteChatTopicRequest._();
  DeleteChatTopicRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteChatTopicRequest> createRepeated() => $pb.PbList<DeleteChatTopicRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteChatTopicRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteChatTopicRequest>(create);
  static DeleteChatTopicRequest? _defaultInstance;

  /// チャット話題ID
  @$pb.TagNumber(1)
  $core.String get chatTopicId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatTopicId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatTopicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatTopicId() => clearField(1);
}

/// チャット話題削除レスポンス
class DeleteChatTopicResponse extends $pb.GeneratedMessage {
  factory DeleteChatTopicResponse() => create();
  DeleteChatTopicResponse._() : super();
  factory DeleteChatTopicResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteChatTopicResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteChatTopicResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteChatTopicResponse clone() => DeleteChatTopicResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteChatTopicResponse copyWith(void Function(DeleteChatTopicResponse) updates) => super.copyWith((message) => updates(message as DeleteChatTopicResponse)) as DeleteChatTopicResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteChatTopicResponse create() => DeleteChatTopicResponse._();
  DeleteChatTopicResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteChatTopicResponse> createRepeated() => $pb.PbList<DeleteChatTopicResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteChatTopicResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteChatTopicResponse>(create);
  static DeleteChatTopicResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
