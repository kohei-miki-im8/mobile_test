//
//  Generated code. Do not modify.
//  source: econa/services/site/matching/v1/create_like.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// いいね作成リクエスト
class CreateLikeRequest extends $pb.GeneratedMessage {
  factory CreateLikeRequest({
    $core.String? toUserId,
    $core.String? superLikeMessage,
  }) {
    final $result = create();
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (superLikeMessage != null) {
      $result.superLikeMessage = superLikeMessage;
    }
    return $result;
  }
  CreateLikeRequest._() : super();
  factory CreateLikeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLikeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLikeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.matching.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toUserId')
    ..aOS(2, _omitFieldNames ? '' : 'superLikeMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLikeRequest clone() => CreateLikeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLikeRequest copyWith(void Function(CreateLikeRequest) updates) => super.copyWith((message) => updates(message as CreateLikeRequest)) as CreateLikeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLikeRequest create() => CreateLikeRequest._();
  CreateLikeRequest createEmptyInstance() => create();
  static $pb.PbList<CreateLikeRequest> createRepeated() => $pb.PbList<CreateLikeRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateLikeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLikeRequest>(create);
  static CreateLikeRequest? _defaultInstance;

  /// お相手のユーザーID
  @$pb.TagNumber(1)
  $core.String get toUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUserId() => clearField(1);

  /// スーパーライクメッセージ
  @$pb.TagNumber(2)
  $core.String get superLikeMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set superLikeMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuperLikeMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuperLikeMessage() => clearField(2);
}

/// いいね作成レスポンス
class CreateLikeResponse extends $pb.GeneratedMessage {
  factory CreateLikeResponse({
    $core.String? chatRoomId,
    $core.String? userLikeId,
    $core.String? toUserLikeId,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (userLikeId != null) {
      $result.userLikeId = userLikeId;
    }
    if (toUserLikeId != null) {
      $result.toUserLikeId = toUserLikeId;
    }
    return $result;
  }
  CreateLikeResponse._() : super();
  factory CreateLikeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLikeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLikeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.matching.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..aOS(2, _omitFieldNames ? '' : 'userLikeId')
    ..aOS(3, _omitFieldNames ? '' : 'toUserLikeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLikeResponse clone() => CreateLikeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLikeResponse copyWith(void Function(CreateLikeResponse) updates) => super.copyWith((message) => updates(message as CreateLikeResponse)) as CreateLikeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLikeResponse create() => CreateLikeResponse._();
  CreateLikeResponse createEmptyInstance() => create();
  static $pb.PbList<CreateLikeResponse> createRepeated() => $pb.PbList<CreateLikeResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateLikeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLikeResponse>(create);
  static CreateLikeResponse? _defaultInstance;

  /// チャットルームID
  @$pb.TagNumber(1)
  $core.String get chatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoomId() => clearField(1);

  /// いいねID
  @$pb.TagNumber(2)
  $core.String get userLikeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userLikeId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserLikeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserLikeId() => clearField(2);

  /// お相手のいいねID
  @$pb.TagNumber(3)
  $core.String get toUserLikeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set toUserLikeId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToUserLikeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearToUserLikeId() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
