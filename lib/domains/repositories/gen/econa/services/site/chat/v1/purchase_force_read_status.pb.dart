//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/purchase_force_read_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/point.pb.dart' as $156;

/// 既読表示機能購入リクエスト
class PurchaseForceReadStatusRequest extends $pb.GeneratedMessage {
  factory PurchaseForceReadStatusRequest({
    $core.String? chatRoomId,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    return $result;
  }
  PurchaseForceReadStatusRequest._() : super();
  factory PurchaseForceReadStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PurchaseForceReadStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PurchaseForceReadStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PurchaseForceReadStatusRequest clone() => PurchaseForceReadStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PurchaseForceReadStatusRequest copyWith(void Function(PurchaseForceReadStatusRequest) updates) => super.copyWith((message) => updates(message as PurchaseForceReadStatusRequest)) as PurchaseForceReadStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PurchaseForceReadStatusRequest create() => PurchaseForceReadStatusRequest._();
  PurchaseForceReadStatusRequest createEmptyInstance() => create();
  static $pb.PbList<PurchaseForceReadStatusRequest> createRepeated() => $pb.PbList<PurchaseForceReadStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static PurchaseForceReadStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PurchaseForceReadStatusRequest>(create);
  static PurchaseForceReadStatusRequest? _defaultInstance;

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

/// 既読表示機能購入レスポンス
class PurchaseForceReadStatusResponse extends $pb.GeneratedMessage {
  factory PurchaseForceReadStatusResponse({
    $156.PointBalance? afterPointBalance,
  }) {
    final $result = create();
    if (afterPointBalance != null) {
      $result.afterPointBalance = afterPointBalance;
    }
    return $result;
  }
  PurchaseForceReadStatusResponse._() : super();
  factory PurchaseForceReadStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PurchaseForceReadStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PurchaseForceReadStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOM<$156.PointBalance>(1, _omitFieldNames ? '' : 'afterPointBalance', subBuilder: $156.PointBalance.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PurchaseForceReadStatusResponse clone() => PurchaseForceReadStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PurchaseForceReadStatusResponse copyWith(void Function(PurchaseForceReadStatusResponse) updates) => super.copyWith((message) => updates(message as PurchaseForceReadStatusResponse)) as PurchaseForceReadStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PurchaseForceReadStatusResponse create() => PurchaseForceReadStatusResponse._();
  PurchaseForceReadStatusResponse createEmptyInstance() => create();
  static $pb.PbList<PurchaseForceReadStatusResponse> createRepeated() => $pb.PbList<PurchaseForceReadStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static PurchaseForceReadStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PurchaseForceReadStatusResponse>(create);
  static PurchaseForceReadStatusResponse? _defaultInstance;

  /// 購入後のポイント残高
  @$pb.TagNumber(1)
  $156.PointBalance get afterPointBalance => $_getN(0);
  @$pb.TagNumber(1)
  set afterPointBalance($156.PointBalance v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAfterPointBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearAfterPointBalance() => clearField(1);
  @$pb.TagNumber(1)
  $156.PointBalance ensureAfterPointBalance() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
