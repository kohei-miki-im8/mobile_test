//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_point_history.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;
import '../../../../enums/point_type.pbenum.dart' as $187;
import '../../../../shared/pager_cursor.pb.dart' as $146;

/// ユーザーポイント履歴取得リクエスト
class GetUserPointHistoryRequest extends $pb.GeneratedMessage {
  factory GetUserPointHistoryRequest({
    $146.PagerRequestCursor? cursor,
  }) {
    final $result = create();
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetUserPointHistoryRequest._() : super();
  factory GetUserPointHistoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserPointHistoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserPointHistoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOM<$146.PagerRequestCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerRequestCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserPointHistoryRequest clone() => GetUserPointHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserPointHistoryRequest copyWith(void Function(GetUserPointHistoryRequest) updates) => super.copyWith((message) => updates(message as GetUserPointHistoryRequest)) as GetUserPointHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserPointHistoryRequest create() => GetUserPointHistoryRequest._();
  GetUserPointHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserPointHistoryRequest> createRepeated() => $pb.PbList<GetUserPointHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserPointHistoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserPointHistoryRequest>(create);
  static GetUserPointHistoryRequest? _defaultInstance;

  /// ページネーション
  @$pb.TagNumber(15)
  $146.PagerRequestCursor get cursor => $_getN(0);
  @$pb.TagNumber(15)
  set cursor($146.PagerRequestCursor v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCursor() => $_has(0);
  @$pb.TagNumber(15)
  void clearCursor() => clearField(15);
  @$pb.TagNumber(15)
  $146.PagerRequestCursor ensureCursor() => $_ensure(0);
}

/// ユーザーポイント履歴取得レスポンス
class GetUserPointHistoryResponse extends $pb.GeneratedMessage {
  factory GetUserPointHistoryResponse({
    $core.Iterable<PointHistoryItem>? items,
    $146.PagerResponseCursor? cursor,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetUserPointHistoryResponse._() : super();
  factory GetUserPointHistoryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserPointHistoryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserPointHistoryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..pc<PointHistoryItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: PointHistoryItem.create)
    ..aOM<$146.PagerResponseCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerResponseCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserPointHistoryResponse clone() => GetUserPointHistoryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserPointHistoryResponse copyWith(void Function(GetUserPointHistoryResponse) updates) => super.copyWith((message) => updates(message as GetUserPointHistoryResponse)) as GetUserPointHistoryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserPointHistoryResponse create() => GetUserPointHistoryResponse._();
  GetUserPointHistoryResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserPointHistoryResponse> createRepeated() => $pb.PbList<GetUserPointHistoryResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserPointHistoryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserPointHistoryResponse>(create);
  static GetUserPointHistoryResponse? _defaultInstance;

  /// ポイント履歴アイテム
  @$pb.TagNumber(1)
  $core.List<PointHistoryItem> get items => $_getList(0);

  /// ページネーション
  @$pb.TagNumber(15)
  $146.PagerResponseCursor get cursor => $_getN(1);
  @$pb.TagNumber(15)
  set cursor($146.PagerResponseCursor v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCursor() => $_has(1);
  @$pb.TagNumber(15)
  void clearCursor() => clearField(15);
  @$pb.TagNumber(15)
  $146.PagerResponseCursor ensureCursor() => $_ensure(1);
}

/// ポイント履歴アイテム
class PointHistoryItem extends $pb.GeneratedMessage {
  factory PointHistoryItem({
    $core.String? userPointLogId,
    $187.PointType? pointType,
    $core.bool? isFree,
    $core.int? amount,
    $core.String? transactionReason,
    $109.Timestamp? createdAt,
    $109.Timestamp? expiresAt,
    $core.String? originalLogId,
  }) {
    final $result = create();
    if (userPointLogId != null) {
      $result.userPointLogId = userPointLogId;
    }
    if (pointType != null) {
      $result.pointType = pointType;
    }
    if (isFree != null) {
      $result.isFree = isFree;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (transactionReason != null) {
      $result.transactionReason = transactionReason;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (expiresAt != null) {
      $result.expiresAt = expiresAt;
    }
    if (originalLogId != null) {
      $result.originalLogId = originalLogId;
    }
    return $result;
  }
  PointHistoryItem._() : super();
  factory PointHistoryItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PointHistoryItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PointHistoryItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userPointLogId')
    ..e<$187.PointType>(2, _omitFieldNames ? '' : 'pointType', $pb.PbFieldType.OE, defaultOrMaker: $187.PointType.POINT_TYPE_UNSPECIFIED, valueOf: $187.PointType.valueOf, enumValues: $187.PointType.values)
    ..aOB(3, _omitFieldNames ? '' : 'isFree')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'transactionReason')
    ..aOM<$109.Timestamp>(6, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(7, _omitFieldNames ? '' : 'expiresAt', subBuilder: $109.Timestamp.create)
    ..aOS(8, _omitFieldNames ? '' : 'originalLogId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PointHistoryItem clone() => PointHistoryItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PointHistoryItem copyWith(void Function(PointHistoryItem) updates) => super.copyWith((message) => updates(message as PointHistoryItem)) as PointHistoryItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PointHistoryItem create() => PointHistoryItem._();
  PointHistoryItem createEmptyInstance() => create();
  static $pb.PbList<PointHistoryItem> createRepeated() => $pb.PbList<PointHistoryItem>();
  @$core.pragma('dart2js:noInline')
  static PointHistoryItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PointHistoryItem>(create);
  static PointHistoryItem? _defaultInstance;

  /// ポイントログID（付与・消費レコードのID）または失効レコードID
  @$pb.TagNumber(1)
  $core.String get userPointLogId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userPointLogId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserPointLogId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserPointLogId() => clearField(1);

  /// ポイント種別
  @$pb.TagNumber(2)
  $187.PointType get pointType => $_getN(1);
  @$pb.TagNumber(2)
  set pointType($187.PointType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPointType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPointType() => clearField(2);

  /// 無料ポイント/有料ポイントの区分
  @$pb.TagNumber(3)
  $core.bool get isFree => $_getBF(2);
  @$pb.TagNumber(3)
  set isFree($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsFree() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsFree() => clearField(3);

  /// ポイント増減量（正数: 増加（付与）、負数: 減少（消費・失効））
  @$pb.TagNumber(4)
  $core.int get amount => $_getIZ(3);
  @$pb.TagNumber(4)
  set amount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);

  /// 用途/理由（6文字以内推奨、最大10文字）
  /// 例: 「登録」「購入」「いいね」「失効」
  @$pb.TagNumber(5)
  $core.String get transactionReason => $_getSZ(4);
  @$pb.TagNumber(5)
  set transactionReason($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTransactionReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransactionReason() => clearField(5);

  /// イベント発生日時
  @$pb.TagNumber(6)
  $109.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($109.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $109.Timestamp ensureCreatedAt() => $_ensure(5);

  /// 有効期限（付与・消費レコード）または失効日時（失効レコード）
  /// amount > 0: 付与レコードの有効期限
  /// amount < 0 かつ失効: 実際の失効日時
  /// amount < 0 かつ消費: 元の付与レコードの有効期限
  @$pb.TagNumber(7)
  $109.Timestamp get expiresAt => $_getN(6);
  @$pb.TagNumber(7)
  set expiresAt($109.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasExpiresAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearExpiresAt() => clearField(7);
  @$pb.TagNumber(7)
  $109.Timestamp ensureExpiresAt() => $_ensure(6);

  /// 失効レコードの場合の元の付与レコードID（失効レコード以外はnull）
  @$pb.TagNumber(8)
  $core.String get originalLogId => $_getSZ(7);
  @$pb.TagNumber(8)
  set originalLogId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOriginalLogId() => $_has(7);
  @$pb.TagNumber(8)
  void clearOriginalLogId() => clearField(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
