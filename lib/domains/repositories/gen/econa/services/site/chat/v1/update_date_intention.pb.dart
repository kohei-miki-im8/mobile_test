//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/update_date_intention.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// デート意向更新リクエスト
class UpdateDateIntentionRequest extends $pb.GeneratedMessage {
  factory UpdateDateIntentionRequest({
    $core.String? chatMessageId,
    $core.bool? hasDateIntention,
  }) {
    final $result = create();
    if (chatMessageId != null) {
      $result.chatMessageId = chatMessageId;
    }
    if (hasDateIntention != null) {
      $result.hasDateIntention = hasDateIntention;
    }
    return $result;
  }
  UpdateDateIntentionRequest._() : super();
  factory UpdateDateIntentionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDateIntentionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateDateIntentionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatMessageId')
    ..aOB(2, _omitFieldNames ? '' : 'hasDateIntention')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDateIntentionRequest clone() => UpdateDateIntentionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDateIntentionRequest copyWith(void Function(UpdateDateIntentionRequest) updates) => super.copyWith((message) => updates(message as UpdateDateIntentionRequest)) as UpdateDateIntentionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateDateIntentionRequest create() => UpdateDateIntentionRequest._();
  UpdateDateIntentionRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateDateIntentionRequest> createRepeated() => $pb.PbList<UpdateDateIntentionRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateDateIntentionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDateIntentionRequest>(create);
  static UpdateDateIntentionRequest? _defaultInstance;

  /// チャットメッセージID
  @$pb.TagNumber(1)
  $core.String get chatMessageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatMessageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatMessageId() => clearField(1);

  /// デート意向有無（不可逆）
  @$pb.TagNumber(2)
  $core.bool get hasDateIntention => $_getBF(1);
  @$pb.TagNumber(2)
  set hasDateIntention($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHasDateIntention() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasDateIntention() => clearField(2);
}

/// デート意向更新レスポンス
class UpdateDateIntentionResponse extends $pb.GeneratedMessage {
  factory UpdateDateIntentionResponse() => create();
  UpdateDateIntentionResponse._() : super();
  factory UpdateDateIntentionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDateIntentionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateDateIntentionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDateIntentionResponse clone() => UpdateDateIntentionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDateIntentionResponse copyWith(void Function(UpdateDateIntentionResponse) updates) => super.copyWith((message) => updates(message as UpdateDateIntentionResponse)) as UpdateDateIntentionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateDateIntentionResponse create() => UpdateDateIntentionResponse._();
  UpdateDateIntentionResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateDateIntentionResponse> createRepeated() => $pb.PbList<UpdateDateIntentionResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateDateIntentionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDateIntentionResponse>(create);
  static UpdateDateIntentionResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
