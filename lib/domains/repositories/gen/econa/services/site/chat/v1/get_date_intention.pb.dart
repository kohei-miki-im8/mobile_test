//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/get_date_intention.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/date_intention.pb.dart' as $155;

/// デート意向取得リクエスト
class GetDateIntentionRequest extends $pb.GeneratedMessage {
  factory GetDateIntentionRequest({
    $core.String? chatRoomId,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    return $result;
  }
  GetDateIntentionRequest._() : super();
  factory GetDateIntentionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDateIntentionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetDateIntentionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDateIntentionRequest clone() => GetDateIntentionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDateIntentionRequest copyWith(void Function(GetDateIntentionRequest) updates) => super.copyWith((message) => updates(message as GetDateIntentionRequest)) as GetDateIntentionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDateIntentionRequest create() => GetDateIntentionRequest._();
  GetDateIntentionRequest createEmptyInstance() => create();
  static $pb.PbList<GetDateIntentionRequest> createRepeated() => $pb.PbList<GetDateIntentionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetDateIntentionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDateIntentionRequest>(create);
  static GetDateIntentionRequest? _defaultInstance;

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

/// デート意向取得レスポンス
class GetDateIntentionResponse extends $pb.GeneratedMessage {
  factory GetDateIntentionResponse({
    $155.DateIntention? dateIntention,
    $155.DateIntention? toUserDateIntention,
  }) {
    final $result = create();
    if (dateIntention != null) {
      $result.dateIntention = dateIntention;
    }
    if (toUserDateIntention != null) {
      $result.toUserDateIntention = toUserDateIntention;
    }
    return $result;
  }
  GetDateIntentionResponse._() : super();
  factory GetDateIntentionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDateIntentionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetDateIntentionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOM<$155.DateIntention>(1, _omitFieldNames ? '' : 'dateIntention', subBuilder: $155.DateIntention.create)
    ..aOM<$155.DateIntention>(2, _omitFieldNames ? '' : 'toUserDateIntention', subBuilder: $155.DateIntention.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDateIntentionResponse clone() => GetDateIntentionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDateIntentionResponse copyWith(void Function(GetDateIntentionResponse) updates) => super.copyWith((message) => updates(message as GetDateIntentionResponse)) as GetDateIntentionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDateIntentionResponse create() => GetDateIntentionResponse._();
  GetDateIntentionResponse createEmptyInstance() => create();
  static $pb.PbList<GetDateIntentionResponse> createRepeated() => $pb.PbList<GetDateIntentionResponse>();
  @$core.pragma('dart2js:noInline')
  static GetDateIntentionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDateIntentionResponse>(create);
  static GetDateIntentionResponse? _defaultInstance;

  /// ユーザーのデート意向
  @$pb.TagNumber(1)
  $155.DateIntention get dateIntention => $_getN(0);
  @$pb.TagNumber(1)
  set dateIntention($155.DateIntention v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDateIntention() => $_has(0);
  @$pb.TagNumber(1)
  void clearDateIntention() => clearField(1);
  @$pb.TagNumber(1)
  $155.DateIntention ensureDateIntention() => $_ensure(0);

  /// お相手のデート意向
  @$pb.TagNumber(2)
  $155.DateIntention get toUserDateIntention => $_getN(1);
  @$pb.TagNumber(2)
  set toUserDateIntention($155.DateIntention v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasToUserDateIntention() => $_has(1);
  @$pb.TagNumber(2)
  void clearToUserDateIntention() => clearField(2);
  @$pb.TagNumber(2)
  $155.DateIntention ensureToUserDateIntention() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
