//
//  Generated code. Do not modify.
//  source: econa/shared/profile_photo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;
import '../enums/service_review_status.pbenum.dart' as $139;
import 'signed_url.pb.dart' as $114;

/// ProfilePhoto - プロフィール写真情報
class ProfilePhoto extends $pb.GeneratedMessage {
  factory ProfilePhoto({
    $core.String? profilePhotoId,
    $core.String? userId,
    $114.SignedImageUrls? signedImageUrls,
    $core.bool? isMain,
    $core.int? displayOrder,
    $139.ServiceReviewStatus? serviceReviewStatus,
    $109.Timestamp? createdAt,
    $109.Timestamp? updatedAt,
    $core.bool? alreadySkipped,
    $core.String? caption,
  }) {
    final $result = create();
    if (profilePhotoId != null) {
      $result.profilePhotoId = profilePhotoId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (signedImageUrls != null) {
      $result.signedImageUrls = signedImageUrls;
    }
    if (isMain != null) {
      $result.isMain = isMain;
    }
    if (displayOrder != null) {
      $result.displayOrder = displayOrder;
    }
    if (serviceReviewStatus != null) {
      $result.serviceReviewStatus = serviceReviewStatus;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (alreadySkipped != null) {
      $result.alreadySkipped = alreadySkipped;
    }
    if (caption != null) {
      $result.caption = caption;
    }
    return $result;
  }
  ProfilePhoto._() : super();
  factory ProfilePhoto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProfilePhoto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProfilePhoto', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'profilePhotoId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOM<$114.SignedImageUrls>(3, _omitFieldNames ? '' : 'signedImageUrls', subBuilder: $114.SignedImageUrls.create)
    ..aOB(4, _omitFieldNames ? '' : 'isMain')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'displayOrder', $pb.PbFieldType.O3)
    ..e<$139.ServiceReviewStatus>(6, _omitFieldNames ? '' : 'serviceReviewStatus', $pb.PbFieldType.OE, defaultOrMaker: $139.ServiceReviewStatus.SERVICE_REVIEW_STATUS_UNSPECIFIED, valueOf: $139.ServiceReviewStatus.valueOf, enumValues: $139.ServiceReviewStatus.values)
    ..aOM<$109.Timestamp>(7, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(8, _omitFieldNames ? '' : 'updatedAt', subBuilder: $109.Timestamp.create)
    ..aOB(9, _omitFieldNames ? '' : 'alreadySkipped')
    ..aOS(10, _omitFieldNames ? '' : 'caption')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProfilePhoto clone() => ProfilePhoto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProfilePhoto copyWith(void Function(ProfilePhoto) updates) => super.copyWith((message) => updates(message as ProfilePhoto)) as ProfilePhoto;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProfilePhoto create() => ProfilePhoto._();
  ProfilePhoto createEmptyInstance() => create();
  static $pb.PbList<ProfilePhoto> createRepeated() => $pb.PbList<ProfilePhoto>();
  @$core.pragma('dart2js:noInline')
  static ProfilePhoto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProfilePhoto>(create);
  static ProfilePhoto? _defaultInstance;

  /// プロフィール写真ID
  @$pb.TagNumber(1)
  $core.String get profilePhotoId => $_getSZ(0);
  @$pb.TagNumber(1)
  set profilePhotoId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProfilePhotoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfilePhotoId() => clearField(1);

  /// ユーザーID
  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  /// 署名付き画像URL
  @$pb.TagNumber(3)
  $114.SignedImageUrls get signedImageUrls => $_getN(2);
  @$pb.TagNumber(3)
  set signedImageUrls($114.SignedImageUrls v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSignedImageUrls() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignedImageUrls() => clearField(3);
  @$pb.TagNumber(3)
  $114.SignedImageUrls ensureSignedImageUrls() => $_ensure(2);

  /// メイン写真フラグ
  @$pb.TagNumber(4)
  $core.bool get isMain => $_getBF(3);
  @$pb.TagNumber(4)
  set isMain($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsMain() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsMain() => clearField(4);

  /// 表示優先度
  @$pb.TagNumber(5)
  $core.int get displayOrder => $_getIZ(4);
  @$pb.TagNumber(5)
  set displayOrder($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDisplayOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisplayOrder() => clearField(5);

  /// 承認ステータス
  @$pb.TagNumber(6)
  $139.ServiceReviewStatus get serviceReviewStatus => $_getN(5);
  @$pb.TagNumber(6)
  set serviceReviewStatus($139.ServiceReviewStatus v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasServiceReviewStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearServiceReviewStatus() => clearField(6);

  /// 作成日時
  @$pb.TagNumber(7)
  $109.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($109.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $109.Timestamp ensureCreatedAt() => $_ensure(6);

  /// 更新日時
  @$pb.TagNumber(8)
  $109.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(8)
  set updatedAt($109.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $109.Timestamp ensureUpdatedAt() => $_ensure(7);

  /// スキップ済みフラグ (UI向け状態情報)
  @$pb.TagNumber(9)
  $core.bool get alreadySkipped => $_getBF(8);
  @$pb.TagNumber(9)
  set alreadySkipped($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAlreadySkipped() => $_has(8);
  @$pb.TagNumber(9)
  void clearAlreadySkipped() => clearField(9);

  /// プロフィール画像のキャプション（最大200文字）
  /// null の場合: キャプション未設定
  /// 空文字列の場合: キャプション明示的削除
  /// 文字列の場合: キャプション設定済み
  @$pb.TagNumber(10)
  $core.String get caption => $_getSZ(9);
  @$pb.TagNumber(10)
  set caption($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCaption() => $_has(9);
  @$pb.TagNumber(10)
  void clearCaption() => clearField(10);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
