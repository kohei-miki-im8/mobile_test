//
//  Generated code. Do not modify.
//  source: econa/shared/admin/profile_photo.proto
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
import '../../enums/media_category.pbenum.dart' as $166;

/// 管理画面用プロフィール写真情報
class AdminProfilePhoto extends $pb.GeneratedMessage {
  factory AdminProfilePhoto({
    $core.String? profilePhotoId,
    $core.String? originSignedUrl,
    $core.Iterable<$core.String>? thumbnailSignedUrls,
    $core.String? avatarSignedUrl,
    $core.int? priority,
    $core.bool? isBestPhoto,
    $166.MediaCategory? mediaCategory,
    $195.AdminReviewStatus? adminReviewStatus,
    $core.String? approvalQueueId,
    $109.Timestamp? uploadedAt,
    $109.Timestamp? approvedAt,
  }) {
    final $result = create();
    if (profilePhotoId != null) {
      $result.profilePhotoId = profilePhotoId;
    }
    if (originSignedUrl != null) {
      $result.originSignedUrl = originSignedUrl;
    }
    if (thumbnailSignedUrls != null) {
      $result.thumbnailSignedUrls.addAll(thumbnailSignedUrls);
    }
    if (avatarSignedUrl != null) {
      $result.avatarSignedUrl = avatarSignedUrl;
    }
    if (priority != null) {
      $result.priority = priority;
    }
    if (isBestPhoto != null) {
      $result.isBestPhoto = isBestPhoto;
    }
    if (mediaCategory != null) {
      $result.mediaCategory = mediaCategory;
    }
    if (adminReviewStatus != null) {
      $result.adminReviewStatus = adminReviewStatus;
    }
    if (approvalQueueId != null) {
      $result.approvalQueueId = approvalQueueId;
    }
    if (uploadedAt != null) {
      $result.uploadedAt = uploadedAt;
    }
    if (approvedAt != null) {
      $result.approvedAt = approvedAt;
    }
    return $result;
  }
  AdminProfilePhoto._() : super();
  factory AdminProfilePhoto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdminProfilePhoto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdminProfilePhoto', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared.admin'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'profilePhotoId')
    ..aOS(2, _omitFieldNames ? '' : 'originSignedUrl')
    ..pPS(3, _omitFieldNames ? '' : 'thumbnailSignedUrls')
    ..aOS(4, _omitFieldNames ? '' : 'avatarSignedUrl')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'priority', $pb.PbFieldType.O3)
    ..aOB(6, _omitFieldNames ? '' : 'isBestPhoto')
    ..e<$166.MediaCategory>(7, _omitFieldNames ? '' : 'mediaCategory', $pb.PbFieldType.OE, defaultOrMaker: $166.MediaCategory.MEDIA_CATEGORY_UNSPECIFIED, valueOf: $166.MediaCategory.valueOf, enumValues: $166.MediaCategory.values)
    ..e<$195.AdminReviewStatus>(8, _omitFieldNames ? '' : 'adminReviewStatus', $pb.PbFieldType.OE, defaultOrMaker: $195.AdminReviewStatus.ADMIN_REVIEW_STATUS_UNSPECIFIED, valueOf: $195.AdminReviewStatus.valueOf, enumValues: $195.AdminReviewStatus.values)
    ..aOS(9, _omitFieldNames ? '' : 'approvalQueueId')
    ..aOM<$109.Timestamp>(10, _omitFieldNames ? '' : 'uploadedAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(11, _omitFieldNames ? '' : 'approvedAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdminProfilePhoto clone() => AdminProfilePhoto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdminProfilePhoto copyWith(void Function(AdminProfilePhoto) updates) => super.copyWith((message) => updates(message as AdminProfilePhoto)) as AdminProfilePhoto;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminProfilePhoto create() => AdminProfilePhoto._();
  AdminProfilePhoto createEmptyInstance() => create();
  static $pb.PbList<AdminProfilePhoto> createRepeated() => $pb.PbList<AdminProfilePhoto>();
  @$core.pragma('dart2js:noInline')
  static AdminProfilePhoto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminProfilePhoto>(create);
  static AdminProfilePhoto? _defaultInstance;

  /// プロフィール写真ID
  @$pb.TagNumber(1)
  $core.String get profilePhotoId => $_getSZ(0);
  @$pb.TagNumber(1)
  set profilePhotoId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProfilePhotoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfilePhotoId() => clearField(1);

  /// オリジナル写真のサインURL
  @$pb.TagNumber(2)
  $core.String get originSignedUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set originSignedUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOriginSignedUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearOriginSignedUrl() => clearField(2);

  /// サムネイル写真のサインURL
  @$pb.TagNumber(3)
  $core.List<$core.String> get thumbnailSignedUrls => $_getList(2);

  /// アバター写真のサインURL
  @$pb.TagNumber(4)
  $core.String get avatarSignedUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatarSignedUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAvatarSignedUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatarSignedUrl() => clearField(4);

  /// 表示優先度（1~9）
  @$pb.TagNumber(5)
  $core.int get priority => $_getIZ(4);
  @$pb.TagNumber(5)
  set priority($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPriority() => $_has(4);
  @$pb.TagNumber(5)
  void clearPriority() => clearField(5);

  /// ベスト写真フラグ
  @$pb.TagNumber(6)
  $core.bool get isBestPhoto => $_getBF(5);
  @$pb.TagNumber(6)
  set isBestPhoto($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsBestPhoto() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsBestPhoto() => clearField(6);

  /// メディアカテゴリ
  @$pb.TagNumber(7)
  $166.MediaCategory get mediaCategory => $_getN(6);
  @$pb.TagNumber(7)
  set mediaCategory($166.MediaCategory v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasMediaCategory() => $_has(6);
  @$pb.TagNumber(7)
  void clearMediaCategory() => clearField(7);

  /// 写真承認ステータス
  @$pb.TagNumber(8)
  $195.AdminReviewStatus get adminReviewStatus => $_getN(7);
  @$pb.TagNumber(8)
  set adminReviewStatus($195.AdminReviewStatus v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAdminReviewStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearAdminReviewStatus() => clearField(8);

  /// 写真承認キューID
  @$pb.TagNumber(9)
  $core.String get approvalQueueId => $_getSZ(8);
  @$pb.TagNumber(9)
  set approvalQueueId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasApprovalQueueId() => $_has(8);
  @$pb.TagNumber(9)
  void clearApprovalQueueId() => clearField(9);

  /// 写真アップロード日時
  @$pb.TagNumber(10)
  $109.Timestamp get uploadedAt => $_getN(9);
  @$pb.TagNumber(10)
  set uploadedAt($109.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUploadedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearUploadedAt() => clearField(10);
  @$pb.TagNumber(10)
  $109.Timestamp ensureUploadedAt() => $_ensure(9);

  /// 写真承認日時
  @$pb.TagNumber(11)
  $109.Timestamp get approvedAt => $_getN(10);
  @$pb.TagNumber(11)
  set approvedAt($109.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasApprovedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearApprovedAt() => clearField(11);
  @$pb.TagNumber(11)
  $109.Timestamp ensureApprovedAt() => $_ensure(10);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
