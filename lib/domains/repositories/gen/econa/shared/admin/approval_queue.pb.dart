//
//  Generated code. Do not modify.
//  source: econa/shared/admin/approval_queue.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/timestamp.pb.dart' as $109;
import '../../enums/admin_review_status.pbenum.dart' as $195;
import '../../enums/profile_approval_type.pbenum.dart' as $194;

/// 承認キュー項目
class AdminApprovalQueue extends $pb.GeneratedMessage {
  factory AdminApprovalQueue({
    $core.String? profileApprovalQueueId,
    $core.String? userId,
    $core.String? currentNickname,
    $194.ProfileApprovalType? profileApprovalType,
    $core.String? currentValue,
    $core.String? newValue,
    $core.String? currentPhotoUrl,
    $core.String? newPhotoUrl,
    $core.int? currentPhotoPriority,
    $core.int? newPhotoPriority,
    $195.AdminReviewStatus? adminReviewStatus,
    $core.int? priority,
    $109.Timestamp? submittedAt,
    $core.String? rejectionReasonCode,
    $core.String? profileApprovalMemo,
    $core.String? reviewedBy,
    $109.Timestamp? reviewedAt,
    $core.Iterable<$core.String>? ngWords,
    $core.bool? isBestPhoto,
  }) {
    final $result = create();
    if (profileApprovalQueueId != null) {
      $result.profileApprovalQueueId = profileApprovalQueueId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (currentNickname != null) {
      $result.currentNickname = currentNickname;
    }
    if (profileApprovalType != null) {
      $result.profileApprovalType = profileApprovalType;
    }
    if (currentValue != null) {
      $result.currentValue = currentValue;
    }
    if (newValue != null) {
      $result.newValue = newValue;
    }
    if (currentPhotoUrl != null) {
      $result.currentPhotoUrl = currentPhotoUrl;
    }
    if (newPhotoUrl != null) {
      $result.newPhotoUrl = newPhotoUrl;
    }
    if (currentPhotoPriority != null) {
      $result.currentPhotoPriority = currentPhotoPriority;
    }
    if (newPhotoPriority != null) {
      $result.newPhotoPriority = newPhotoPriority;
    }
    if (adminReviewStatus != null) {
      $result.adminReviewStatus = adminReviewStatus;
    }
    if (priority != null) {
      $result.priority = priority;
    }
    if (submittedAt != null) {
      $result.submittedAt = submittedAt;
    }
    if (rejectionReasonCode != null) {
      $result.rejectionReasonCode = rejectionReasonCode;
    }
    if (profileApprovalMemo != null) {
      $result.profileApprovalMemo = profileApprovalMemo;
    }
    if (reviewedBy != null) {
      $result.reviewedBy = reviewedBy;
    }
    if (reviewedAt != null) {
      $result.reviewedAt = reviewedAt;
    }
    if (ngWords != null) {
      $result.ngWords.addAll(ngWords);
    }
    if (isBestPhoto != null) {
      $result.isBestPhoto = isBestPhoto;
    }
    return $result;
  }
  AdminApprovalQueue._() : super();
  factory AdminApprovalQueue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminApprovalQueue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminApprovalQueue', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared.admin'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'profileApprovalQueueId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'currentNickname')
    ..e<$194.ProfileApprovalType>(4, _omitFieldNames ? '' : 'profileApprovalType', $pb.PbFieldType.OE, defaultOrMaker: $194.ProfileApprovalType.PROFILE_APPROVAL_TYPE_UNSPECIFIED, valueOf: $194.ProfileApprovalType.valueOf, enumValues: $194.ProfileApprovalType.values)
    ..aOS(5, _omitFieldNames ? '' : 'currentValue')
    ..aOS(6, _omitFieldNames ? '' : 'newValue')
    ..aOS(7, _omitFieldNames ? '' : 'currentPhotoUrl')
    ..aOS(8, _omitFieldNames ? '' : 'newPhotoUrl')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'currentPhotoPriority', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'newPhotoPriority', $pb.PbFieldType.O3)
    ..e<$195.AdminReviewStatus>(11, _omitFieldNames ? '' : 'adminReviewStatus', $pb.PbFieldType.OE, defaultOrMaker: $195.AdminReviewStatus.ADMIN_REVIEW_STATUS_UNSPECIFIED, valueOf: $195.AdminReviewStatus.valueOf, enumValues: $195.AdminReviewStatus.values)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'priority', $pb.PbFieldType.O3)
    ..aOM<$109.Timestamp>(13, _omitFieldNames ? '' : 'submittedAt', subBuilder: $109.Timestamp.create)
    ..aOS(14, _omitFieldNames ? '' : 'rejectionReasonCode')
    ..aOS(15, _omitFieldNames ? '' : 'profileApprovalMemo')
    ..aOS(16, _omitFieldNames ? '' : 'reviewedBy')
    ..aOM<$109.Timestamp>(17, _omitFieldNames ? '' : 'reviewedAt', subBuilder: $109.Timestamp.create)
    ..pPS(18, _omitFieldNames ? '' : 'ngWords')
    ..aOB(19, _omitFieldNames ? '' : 'isBestPhoto')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminApprovalQueue clone() => AdminApprovalQueue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminApprovalQueue copyWith(void Function(AdminApprovalQueue) updates) => super.copyWith((message) => updates(message as AdminApprovalQueue)) as AdminApprovalQueue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminApprovalQueue create() => AdminApprovalQueue._();
  AdminApprovalQueue createEmptyInstance() => create();
  static $pb.PbList<AdminApprovalQueue> createRepeated() => $pb.PbList<AdminApprovalQueue>();
  @$core.pragma('dart2js:noInline')
  static AdminApprovalQueue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminApprovalQueue>(create);
  static AdminApprovalQueue? _defaultInstance;

  /// キュー情報
  @$pb.TagNumber(1)
  $core.String get profileApprovalQueueId => $_getSZ(0);
  @$pb.TagNumber(1)
  set profileApprovalQueueId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProfileApprovalQueueId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfileApprovalQueueId() => clearField(1);

  /// ユーザーID
  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  /// 現在のニックネーム
  @$pb.TagNumber(3)
  $core.String get currentNickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set currentNickname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentNickname() => clearField(3);

  /// 承認タイプ（ニックネーム、自己紹介、写真）
  @$pb.TagNumber(4)
  $194.ProfileApprovalType get profileApprovalType => $_getN(3);
  @$pb.TagNumber(4)
  set profileApprovalType($194.ProfileApprovalType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasProfileApprovalType() => $_has(3);
  @$pb.TagNumber(4)
  void clearProfileApprovalType() => clearField(4);

  /// 現在の値
  @$pb.TagNumber(5)
  $core.String get currentValue => $_getSZ(4);
  @$pb.TagNumber(5)
  set currentValue($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCurrentValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentValue() => clearField(5);

  /// 新しい値
  @$pb.TagNumber(6)
  $core.String get newValue => $_getSZ(5);
  @$pb.TagNumber(6)
  set newValue($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNewValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearNewValue() => clearField(6);

  /// 現在の写真URL（写真承認の場合のみ）
  @$pb.TagNumber(7)
  $core.String get currentPhotoUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set currentPhotoUrl($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCurrentPhotoUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrentPhotoUrl() => clearField(7);

  /// 新しい写真URL（写真承認の場合のみ）
  @$pb.TagNumber(8)
  $core.String get newPhotoUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set newPhotoUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNewPhotoUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearNewPhotoUrl() => clearField(8);

  /// 現在の写真の優先度
  @$pb.TagNumber(9)
  $core.int get currentPhotoPriority => $_getIZ(8);
  @$pb.TagNumber(9)
  set currentPhotoPriority($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCurrentPhotoPriority() => $_has(8);
  @$pb.TagNumber(9)
  void clearCurrentPhotoPriority() => clearField(9);

  /// 新しい写真の優先度
  @$pb.TagNumber(10)
  $core.int get newPhotoPriority => $_getIZ(9);
  @$pb.TagNumber(10)
  set newPhotoPriority($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNewPhotoPriority() => $_has(9);
  @$pb.TagNumber(10)
  void clearNewPhotoPriority() => clearField(10);

  /// 承認ステータス
  @$pb.TagNumber(11)
  $195.AdminReviewStatus get adminReviewStatus => $_getN(10);
  @$pb.TagNumber(11)
  set adminReviewStatus($195.AdminReviewStatus v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasAdminReviewStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearAdminReviewStatus() => clearField(11);

  /// 承認キューの優先度
  @$pb.TagNumber(12)
  $core.int get priority => $_getIZ(11);
  @$pb.TagNumber(12)
  set priority($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPriority() => $_has(11);
  @$pb.TagNumber(12)
  void clearPriority() => clearField(12);

  /// タイムスタンプ
  @$pb.TagNumber(13)
  $109.Timestamp get submittedAt => $_getN(12);
  @$pb.TagNumber(13)
  set submittedAt($109.Timestamp v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasSubmittedAt() => $_has(12);
  @$pb.TagNumber(13)
  void clearSubmittedAt() => clearField(13);
  @$pb.TagNumber(13)
  $109.Timestamp ensureSubmittedAt() => $_ensure(12);

  /// 却下理由コード（却下の場合）
  @$pb.TagNumber(14)
  $core.String get rejectionReasonCode => $_getSZ(13);
  @$pb.TagNumber(14)
  set rejectionReasonCode($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasRejectionReasonCode() => $_has(13);
  @$pb.TagNumber(14)
  void clearRejectionReasonCode() => clearField(14);

  /// スタッフ向けメモ（却下の場合）
  @$pb.TagNumber(15)
  $core.String get profileApprovalMemo => $_getSZ(14);
  @$pb.TagNumber(15)
  set profileApprovalMemo($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasProfileApprovalMemo() => $_has(14);
  @$pb.TagNumber(15)
  void clearProfileApprovalMemo() => clearField(15);

  /// 審査情報（審査済みの場合）
  @$pb.TagNumber(16)
  $core.String get reviewedBy => $_getSZ(15);
  @$pb.TagNumber(16)
  set reviewedBy($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasReviewedBy() => $_has(15);
  @$pb.TagNumber(16)
  void clearReviewedBy() => clearField(16);

  /// 審査日時（審査済みの場合）
  @$pb.TagNumber(17)
  $109.Timestamp get reviewedAt => $_getN(16);
  @$pb.TagNumber(17)
  set reviewedAt($109.Timestamp v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasReviewedAt() => $_has(16);
  @$pb.TagNumber(17)
  void clearReviewedAt() => clearField(17);
  @$pb.TagNumber(17)
  $109.Timestamp ensureReviewedAt() => $_ensure(16);

  /// 検出されたNGワード
  @$pb.TagNumber(18)
  $core.List<$core.String> get ngWords => $_getList(17);

  /// ベスト写真かどうか
  @$pb.TagNumber(19)
  $core.bool get isBestPhoto => $_getBF(18);
  @$pb.TagNumber(19)
  set isBestPhoto($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasIsBestPhoto() => $_has(18);
  @$pb.TagNumber(19)
  void clearIsBestPhoto() => clearField(19);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
