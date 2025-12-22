//
//  Generated code. Do not modify.
//  source: econa/shared/admin/user_statistics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/timestamp.pb.dart' as $109;

/// 管理画面用ユーザー統計情報
class AdminUserStatistics extends $pb.GeneratedMessage {
  factory AdminUserStatistics({
    $core.int? totalPhotos,
    $core.int? approvedPhotos,
    $core.int? pendingPhotos,
    $core.int? rejectedPhotos,
    $core.int? totalLikesGiven,
    $core.int? totalLikesReceived,
    $core.int? totalMatches,
    $core.int? totalMpConsumed,
    $core.int? totalLpConsumed,
    $core.int? violationCount,
    $109.Timestamp? lastViolationAt,
  }) {
    final $result = create();
    if (totalPhotos != null) {
      $result.totalPhotos = totalPhotos;
    }
    if (approvedPhotos != null) {
      $result.approvedPhotos = approvedPhotos;
    }
    if (pendingPhotos != null) {
      $result.pendingPhotos = pendingPhotos;
    }
    if (rejectedPhotos != null) {
      $result.rejectedPhotos = rejectedPhotos;
    }
    if (totalLikesGiven != null) {
      $result.totalLikesGiven = totalLikesGiven;
    }
    if (totalLikesReceived != null) {
      $result.totalLikesReceived = totalLikesReceived;
    }
    if (totalMatches != null) {
      $result.totalMatches = totalMatches;
    }
    if (totalMpConsumed != null) {
      $result.totalMpConsumed = totalMpConsumed;
    }
    if (totalLpConsumed != null) {
      $result.totalLpConsumed = totalLpConsumed;
    }
    if (violationCount != null) {
      $result.violationCount = violationCount;
    }
    if (lastViolationAt != null) {
      $result.lastViolationAt = lastViolationAt;
    }
    return $result;
  }
  AdminUserStatistics._() : super();
  factory AdminUserStatistics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminUserStatistics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminUserStatistics', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared.admin'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'totalPhotos', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'approvedPhotos', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pendingPhotos', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'rejectedPhotos', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'totalLikesGiven', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'totalLikesReceived', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'totalMatches', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'totalMpConsumed', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'totalLpConsumed', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'violationCount', $pb.PbFieldType.O3)
    ..aOM<$109.Timestamp>(11, _omitFieldNames ? '' : 'lastViolationAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminUserStatistics clone() => AdminUserStatistics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminUserStatistics copyWith(void Function(AdminUserStatistics) updates) => super.copyWith((message) => updates(message as AdminUserStatistics)) as AdminUserStatistics;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminUserStatistics create() => AdminUserStatistics._();
  AdminUserStatistics createEmptyInstance() => create();
  static $pb.PbList<AdminUserStatistics> createRepeated() => $pb.PbList<AdminUserStatistics>();
  @$core.pragma('dart2js:noInline')
  static AdminUserStatistics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminUserStatistics>(create);
  static AdminUserStatistics? _defaultInstance;

  /// 写真統計
  @$pb.TagNumber(1)
  $core.int get totalPhotos => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalPhotos($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalPhotos() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalPhotos() => clearField(1);

  /// 承認済み写真数
  @$pb.TagNumber(2)
  $core.int get approvedPhotos => $_getIZ(1);
  @$pb.TagNumber(2)
  set approvedPhotos($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApprovedPhotos() => $_has(1);
  @$pb.TagNumber(2)
  void clearApprovedPhotos() => clearField(2);

  /// 承認待ち写真数
  @$pb.TagNumber(3)
  $core.int get pendingPhotos => $_getIZ(2);
  @$pb.TagNumber(3)
  set pendingPhotos($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPendingPhotos() => $_has(2);
  @$pb.TagNumber(3)
  void clearPendingPhotos() => clearField(3);

  /// 却下写真数
  @$pb.TagNumber(4)
  $core.int get rejectedPhotos => $_getIZ(3);
  @$pb.TagNumber(4)
  set rejectedPhotos($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRejectedPhotos() => $_has(3);
  @$pb.TagNumber(4)
  void clearRejectedPhotos() => clearField(4);

  /// 自分がしたいいね数
  @$pb.TagNumber(5)
  $core.int get totalLikesGiven => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalLikesGiven($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalLikesGiven() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalLikesGiven() => clearField(5);

  /// 自分が受けたいいね数
  @$pb.TagNumber(6)
  $core.int get totalLikesReceived => $_getIZ(5);
  @$pb.TagNumber(6)
  set totalLikesReceived($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTotalLikesReceived() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalLikesReceived() => clearField(6);

  /// マッチ数
  @$pb.TagNumber(7)
  $core.int get totalMatches => $_getIZ(6);
  @$pb.TagNumber(7)
  set totalMatches($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalMatches() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalMatches() => clearField(7);

  /// 消費したMP数
  @$pb.TagNumber(8)
  $core.int get totalMpConsumed => $_getIZ(7);
  @$pb.TagNumber(8)
  set totalMpConsumed($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTotalMpConsumed() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalMpConsumed() => clearField(8);

  /// 消費したLP数
  @$pb.TagNumber(9)
  $core.int get totalLpConsumed => $_getIZ(8);
  @$pb.TagNumber(9)
  set totalLpConsumed($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTotalLpConsumed() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalLpConsumed() => clearField(9);

  /// 違反統計
  @$pb.TagNumber(10)
  $core.int get violationCount => $_getIZ(9);
  @$pb.TagNumber(10)
  set violationCount($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasViolationCount() => $_has(9);
  @$pb.TagNumber(10)
  void clearViolationCount() => clearField(10);

  /// 最後の違反日時
  @$pb.TagNumber(11)
  $109.Timestamp get lastViolationAt => $_getN(10);
  @$pb.TagNumber(11)
  set lastViolationAt($109.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasLastViolationAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearLastViolationAt() => clearField(11);
  @$pb.TagNumber(11)
  $109.Timestamp ensureLastViolationAt() => $_ensure(10);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
