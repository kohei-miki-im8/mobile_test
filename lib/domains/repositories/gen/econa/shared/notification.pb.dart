//
//  Generated code. Do not modify.
//  source: econa/shared/notification.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;
import '../enums/notification_type.pbenum.dart' as $161;

/// 関連情報の詳細
class Notification_RelatedUserInfo extends $pb.GeneratedMessage {
  factory Notification_RelatedUserInfo({
    $core.String? userId,
    $core.String? nickname,
    $core.String? profileImageUrl,
    $core.bool? isDeleted,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (nickname != null) {
      $result.nickname = nickname;
    }
    if (profileImageUrl != null) {
      $result.profileImageUrl = profileImageUrl;
    }
    if (isDeleted != null) {
      $result.isDeleted = isDeleted;
    }
    return $result;
  }
  Notification_RelatedUserInfo._() : super();
  factory Notification_RelatedUserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notification_RelatedUserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Notification.RelatedUserInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'profileImageUrl')
    ..aOB(4, _omitFieldNames ? '' : 'isDeleted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notification_RelatedUserInfo clone() => Notification_RelatedUserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notification_RelatedUserInfo copyWith(void Function(Notification_RelatedUserInfo) updates) => super.copyWith((message) => updates(message as Notification_RelatedUserInfo)) as Notification_RelatedUserInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notification_RelatedUserInfo create() => Notification_RelatedUserInfo._();
  Notification_RelatedUserInfo createEmptyInstance() => create();
  static $pb.PbList<Notification_RelatedUserInfo> createRepeated() => $pb.PbList<Notification_RelatedUserInfo>();
  @$core.pragma('dart2js:noInline')
  static Notification_RelatedUserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notification_RelatedUserInfo>(create);
  static Notification_RelatedUserInfo? _defaultInstance;

  /// ユーザーID
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// ニックネーム
  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => clearField(2);

  /// プロフィール画像URL
  @$pb.TagNumber(3)
  $core.String get profileImageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set profileImageUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProfileImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfileImageUrl() => clearField(3);

  /// 退会済みフラグ
  @$pb.TagNumber(4)
  $core.bool get isDeleted => $_getBF(3);
  @$pb.TagNumber(4)
  set isDeleted($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsDeleted() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsDeleted() => clearField(4);
}

/// 関連チャットルーム情報
class Notification_RelatedChatRoomInfo extends $pb.GeneratedMessage {
  factory Notification_RelatedChatRoomInfo({
    $core.String? chatRoomId,
    $core.String? latestMessagePreview,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (latestMessagePreview != null) {
      $result.latestMessagePreview = latestMessagePreview;
    }
    return $result;
  }
  Notification_RelatedChatRoomInfo._() : super();
  factory Notification_RelatedChatRoomInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notification_RelatedChatRoomInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Notification.RelatedChatRoomInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..aOS(2, _omitFieldNames ? '' : 'latestMessagePreview')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notification_RelatedChatRoomInfo clone() => Notification_RelatedChatRoomInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notification_RelatedChatRoomInfo copyWith(void Function(Notification_RelatedChatRoomInfo) updates) => super.copyWith((message) => updates(message as Notification_RelatedChatRoomInfo)) as Notification_RelatedChatRoomInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notification_RelatedChatRoomInfo create() => Notification_RelatedChatRoomInfo._();
  Notification_RelatedChatRoomInfo createEmptyInstance() => create();
  static $pb.PbList<Notification_RelatedChatRoomInfo> createRepeated() => $pb.PbList<Notification_RelatedChatRoomInfo>();
  @$core.pragma('dart2js:noInline')
  static Notification_RelatedChatRoomInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notification_RelatedChatRoomInfo>(create);
  static Notification_RelatedChatRoomInfo? _defaultInstance;

  /// チャットルームID
  @$pb.TagNumber(1)
  $core.String get chatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoomId() => clearField(1);

  /// 最新メッセージの一部
  @$pb.TagNumber(2)
  $core.String get latestMessagePreview => $_getSZ(1);
  @$pb.TagNumber(2)
  set latestMessagePreview($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLatestMessagePreview() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatestMessagePreview() => clearField(2);
}

/// 関連お知らせ情報
class Notification_RelatedAnnouncementInfo extends $pb.GeneratedMessage {
  factory Notification_RelatedAnnouncementInfo({
    $core.String? announcementId,
    $core.String? imageUrl,
    $core.String? linkUrl,
  }) {
    final $result = create();
    if (announcementId != null) {
      $result.announcementId = announcementId;
    }
    if (imageUrl != null) {
      $result.imageUrl = imageUrl;
    }
    if (linkUrl != null) {
      $result.linkUrl = linkUrl;
    }
    return $result;
  }
  Notification_RelatedAnnouncementInfo._() : super();
  factory Notification_RelatedAnnouncementInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notification_RelatedAnnouncementInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Notification.RelatedAnnouncementInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'announcementId')
    ..aOS(2, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(3, _omitFieldNames ? '' : 'linkUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notification_RelatedAnnouncementInfo clone() => Notification_RelatedAnnouncementInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notification_RelatedAnnouncementInfo copyWith(void Function(Notification_RelatedAnnouncementInfo) updates) => super.copyWith((message) => updates(message as Notification_RelatedAnnouncementInfo)) as Notification_RelatedAnnouncementInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notification_RelatedAnnouncementInfo create() => Notification_RelatedAnnouncementInfo._();
  Notification_RelatedAnnouncementInfo createEmptyInstance() => create();
  static $pb.PbList<Notification_RelatedAnnouncementInfo> createRepeated() => $pb.PbList<Notification_RelatedAnnouncementInfo>();
  @$core.pragma('dart2js:noInline')
  static Notification_RelatedAnnouncementInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notification_RelatedAnnouncementInfo>(create);
  static Notification_RelatedAnnouncementInfo? _defaultInstance;

  /// お知らせID
  @$pb.TagNumber(1)
  $core.String get announcementId => $_getSZ(0);
  @$pb.TagNumber(1)
  set announcementId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAnnouncementId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAnnouncementId() => clearField(1);

  /// 画像URL
  @$pb.TagNumber(2)
  $core.String get imageUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set imageUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImageUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearImageUrl() => clearField(2);

  /// リンクURL
  @$pb.TagNumber(3)
  $core.String get linkUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set linkUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLinkUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearLinkUrl() => clearField(3);
}

enum Notification_RelatedEKYCInfo_EkycData {
  ekycVerification, 
  personalVerification, 
  notSet
}

/// eKYC関連情報
class Notification_RelatedEKYCInfo extends $pb.GeneratedMessage {
  factory Notification_RelatedEKYCInfo({
    Notification_EKYCVerificationResult? ekycVerification,
    Notification_PersonalVerificationResult? personalVerification,
  }) {
    final $result = create();
    if (ekycVerification != null) {
      $result.ekycVerification = ekycVerification;
    }
    if (personalVerification != null) {
      $result.personalVerification = personalVerification;
    }
    return $result;
  }
  Notification_RelatedEKYCInfo._() : super();
  factory Notification_RelatedEKYCInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notification_RelatedEKYCInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Notification_RelatedEKYCInfo_EkycData> _Notification_RelatedEKYCInfo_EkycDataByTag = {
    1 : Notification_RelatedEKYCInfo_EkycData.ekycVerification,
    2 : Notification_RelatedEKYCInfo_EkycData.personalVerification,
    0 : Notification_RelatedEKYCInfo_EkycData.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Notification.RelatedEKYCInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Notification_EKYCVerificationResult>(1, _omitFieldNames ? '' : 'ekycVerification', subBuilder: Notification_EKYCVerificationResult.create)
    ..aOM<Notification_PersonalVerificationResult>(2, _omitFieldNames ? '' : 'personalVerification', subBuilder: Notification_PersonalVerificationResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notification_RelatedEKYCInfo clone() => Notification_RelatedEKYCInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notification_RelatedEKYCInfo copyWith(void Function(Notification_RelatedEKYCInfo) updates) => super.copyWith((message) => updates(message as Notification_RelatedEKYCInfo)) as Notification_RelatedEKYCInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notification_RelatedEKYCInfo create() => Notification_RelatedEKYCInfo._();
  Notification_RelatedEKYCInfo createEmptyInstance() => create();
  static $pb.PbList<Notification_RelatedEKYCInfo> createRepeated() => $pb.PbList<Notification_RelatedEKYCInfo>();
  @$core.pragma('dart2js:noInline')
  static Notification_RelatedEKYCInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notification_RelatedEKYCInfo>(create);
  static Notification_RelatedEKYCInfo? _defaultInstance;

  Notification_RelatedEKYCInfo_EkycData whichEkycData() => _Notification_RelatedEKYCInfo_EkycDataByTag[$_whichOneof(0)]!;
  void clearEkycData() => clearField($_whichOneof(0));

  /// eKYC認証結果
  @$pb.TagNumber(1)
  Notification_EKYCVerificationResult get ekycVerification => $_getN(0);
  @$pb.TagNumber(1)
  set ekycVerification(Notification_EKYCVerificationResult v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEkycVerification() => $_has(0);
  @$pb.TagNumber(1)
  void clearEkycVerification() => clearField(1);
  @$pb.TagNumber(1)
  Notification_EKYCVerificationResult ensureEkycVerification() => $_ensure(0);

  /// 個人情報突合結果
  @$pb.TagNumber(2)
  Notification_PersonalVerificationResult get personalVerification => $_getN(1);
  @$pb.TagNumber(2)
  set personalVerification(Notification_PersonalVerificationResult v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPersonalVerification() => $_has(1);
  @$pb.TagNumber(2)
  void clearPersonalVerification() => clearField(2);
  @$pb.TagNumber(2)
  Notification_PersonalVerificationResult ensurePersonalVerification() => $_ensure(1);
}

/// eKYC認証結果
class Notification_EKYCVerificationResult extends $pb.GeneratedMessage {
  factory Notification_EKYCVerificationResult({
    $core.bool? isVerified,
    $core.String? ekycLevelCode,
    $core.String? rejectionReason,
    $109.Timestamp? completedAt,
  }) {
    final $result = create();
    if (isVerified != null) {
      $result.isVerified = isVerified;
    }
    if (ekycLevelCode != null) {
      $result.ekycLevelCode = ekycLevelCode;
    }
    if (rejectionReason != null) {
      $result.rejectionReason = rejectionReason;
    }
    if (completedAt != null) {
      $result.completedAt = completedAt;
    }
    return $result;
  }
  Notification_EKYCVerificationResult._() : super();
  factory Notification_EKYCVerificationResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notification_EKYCVerificationResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Notification.EKYCVerificationResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isVerified')
    ..aOS(2, _omitFieldNames ? '' : 'ekycLevelCode')
    ..aOS(3, _omitFieldNames ? '' : 'rejectionReason')
    ..aOM<$109.Timestamp>(4, _omitFieldNames ? '' : 'completedAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notification_EKYCVerificationResult clone() => Notification_EKYCVerificationResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notification_EKYCVerificationResult copyWith(void Function(Notification_EKYCVerificationResult) updates) => super.copyWith((message) => updates(message as Notification_EKYCVerificationResult)) as Notification_EKYCVerificationResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notification_EKYCVerificationResult create() => Notification_EKYCVerificationResult._();
  Notification_EKYCVerificationResult createEmptyInstance() => create();
  static $pb.PbList<Notification_EKYCVerificationResult> createRepeated() => $pb.PbList<Notification_EKYCVerificationResult>();
  @$core.pragma('dart2js:noInline')
  static Notification_EKYCVerificationResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notification_EKYCVerificationResult>(create);
  static Notification_EKYCVerificationResult? _defaultInstance;

  /// 認証結果
  @$pb.TagNumber(1)
  $core.bool get isVerified => $_getBF(0);
  @$pb.TagNumber(1)
  set isVerified($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsVerified() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsVerified() => clearField(1);

  /// eKYCレベル
  @$pb.TagNumber(2)
  $core.String get ekycLevelCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set ekycLevelCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEkycLevelCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearEkycLevelCode() => clearField(2);

  /// 否決理由（失敗時のみ）
  @$pb.TagNumber(3)
  $core.String get rejectionReason => $_getSZ(2);
  @$pb.TagNumber(3)
  set rejectionReason($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRejectionReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearRejectionReason() => clearField(3);

  /// 処理完了時刻
  @$pb.TagNumber(4)
  $109.Timestamp get completedAt => $_getN(3);
  @$pb.TagNumber(4)
  set completedAt($109.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCompletedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompletedAt() => clearField(4);
  @$pb.TagNumber(4)
  $109.Timestamp ensureCompletedAt() => $_ensure(3);
}

/// 個人情報突合結果
class Notification_PersonalVerificationResult extends $pb.GeneratedMessage {
  factory Notification_PersonalVerificationResult({
    $core.bool? isMatched,
    $core.bool? birthDateMatched,
    $core.bool? nameMatched,
    $core.String? mismatchReason,
    $109.Timestamp? completedAt,
  }) {
    final $result = create();
    if (isMatched != null) {
      $result.isMatched = isMatched;
    }
    if (birthDateMatched != null) {
      $result.birthDateMatched = birthDateMatched;
    }
    if (nameMatched != null) {
      $result.nameMatched = nameMatched;
    }
    if (mismatchReason != null) {
      $result.mismatchReason = mismatchReason;
    }
    if (completedAt != null) {
      $result.completedAt = completedAt;
    }
    return $result;
  }
  Notification_PersonalVerificationResult._() : super();
  factory Notification_PersonalVerificationResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notification_PersonalVerificationResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Notification.PersonalVerificationResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isMatched')
    ..aOB(2, _omitFieldNames ? '' : 'birthDateMatched')
    ..aOB(3, _omitFieldNames ? '' : 'nameMatched')
    ..aOS(4, _omitFieldNames ? '' : 'mismatchReason')
    ..aOM<$109.Timestamp>(5, _omitFieldNames ? '' : 'completedAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notification_PersonalVerificationResult clone() => Notification_PersonalVerificationResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notification_PersonalVerificationResult copyWith(void Function(Notification_PersonalVerificationResult) updates) => super.copyWith((message) => updates(message as Notification_PersonalVerificationResult)) as Notification_PersonalVerificationResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notification_PersonalVerificationResult create() => Notification_PersonalVerificationResult._();
  Notification_PersonalVerificationResult createEmptyInstance() => create();
  static $pb.PbList<Notification_PersonalVerificationResult> createRepeated() => $pb.PbList<Notification_PersonalVerificationResult>();
  @$core.pragma('dart2js:noInline')
  static Notification_PersonalVerificationResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notification_PersonalVerificationResult>(create);
  static Notification_PersonalVerificationResult? _defaultInstance;

  /// 突合結果
  @$pb.TagNumber(1)
  $core.bool get isMatched => $_getBF(0);
  @$pb.TagNumber(1)
  set isMatched($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsMatched() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsMatched() => clearField(1);

  /// 生年月日突合結果
  @$pb.TagNumber(2)
  $core.bool get birthDateMatched => $_getBF(1);
  @$pb.TagNumber(2)
  set birthDateMatched($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBirthDateMatched() => $_has(1);
  @$pb.TagNumber(2)
  void clearBirthDateMatched() => clearField(2);

  /// 氏名突合結果
  @$pb.TagNumber(3)
  $core.bool get nameMatched => $_getBF(2);
  @$pb.TagNumber(3)
  set nameMatched($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNameMatched() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameMatched() => clearField(3);

  /// 不一致理由（失敗時のみ）
  @$pb.TagNumber(4)
  $core.String get mismatchReason => $_getSZ(3);
  @$pb.TagNumber(4)
  set mismatchReason($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMismatchReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearMismatchReason() => clearField(4);

  /// 処理完了時刻
  @$pb.TagNumber(5)
  $109.Timestamp get completedAt => $_getN(4);
  @$pb.TagNumber(5)
  set completedAt($109.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCompletedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCompletedAt() => clearField(5);
  @$pb.TagNumber(5)
  $109.Timestamp ensureCompletedAt() => $_ensure(4);
}

/// プロフィール承認結果
class Notification_RelatedProfileApprovalInfo extends $pb.GeneratedMessage {
  factory Notification_RelatedProfileApprovalInfo({
    $core.bool? isApproved,
    $core.String? approvalType,
    $core.String? fieldName,
    $core.String? rejectionReason,
    $109.Timestamp? completedAt,
  }) {
    final $result = create();
    if (isApproved != null) {
      $result.isApproved = isApproved;
    }
    if (approvalType != null) {
      $result.approvalType = approvalType;
    }
    if (fieldName != null) {
      $result.fieldName = fieldName;
    }
    if (rejectionReason != null) {
      $result.rejectionReason = rejectionReason;
    }
    if (completedAt != null) {
      $result.completedAt = completedAt;
    }
    return $result;
  }
  Notification_RelatedProfileApprovalInfo._() : super();
  factory Notification_RelatedProfileApprovalInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notification_RelatedProfileApprovalInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Notification.RelatedProfileApprovalInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isApproved')
    ..aOS(2, _omitFieldNames ? '' : 'approvalType')
    ..aOS(3, _omitFieldNames ? '' : 'fieldName')
    ..aOS(4, _omitFieldNames ? '' : 'rejectionReason')
    ..aOM<$109.Timestamp>(5, _omitFieldNames ? '' : 'completedAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notification_RelatedProfileApprovalInfo clone() => Notification_RelatedProfileApprovalInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notification_RelatedProfileApprovalInfo copyWith(void Function(Notification_RelatedProfileApprovalInfo) updates) => super.copyWith((message) => updates(message as Notification_RelatedProfileApprovalInfo)) as Notification_RelatedProfileApprovalInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notification_RelatedProfileApprovalInfo create() => Notification_RelatedProfileApprovalInfo._();
  Notification_RelatedProfileApprovalInfo createEmptyInstance() => create();
  static $pb.PbList<Notification_RelatedProfileApprovalInfo> createRepeated() => $pb.PbList<Notification_RelatedProfileApprovalInfo>();
  @$core.pragma('dart2js:noInline')
  static Notification_RelatedProfileApprovalInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notification_RelatedProfileApprovalInfo>(create);
  static Notification_RelatedProfileApprovalInfo? _defaultInstance;

  /// 承認結果
  @$pb.TagNumber(1)
  $core.bool get isApproved => $_getBF(0);
  @$pb.TagNumber(1)
  set isApproved($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsApproved() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsApproved() => clearField(1);

  /// 承認対象タイプ
  @$pb.TagNumber(2)
  $core.String get approvalType => $_getSZ(1);
  @$pb.TagNumber(2)
  set approvalType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApprovalType() => $_has(1);
  @$pb.TagNumber(2)
  void clearApprovalType() => clearField(2);

  /// 承認対象フィールド名
  @$pb.TagNumber(3)
  $core.String get fieldName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fieldName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFieldName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFieldName() => clearField(3);

  /// 却下理由（却下時のみ）
  @$pb.TagNumber(4)
  $core.String get rejectionReason => $_getSZ(3);
  @$pb.TagNumber(4)
  set rejectionReason($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRejectionReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearRejectionReason() => clearField(4);

  /// 処理完了時刻
  @$pb.TagNumber(5)
  $109.Timestamp get completedAt => $_getN(4);
  @$pb.TagNumber(5)
  set completedAt($109.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCompletedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCompletedAt() => clearField(5);
  @$pb.TagNumber(5)
  $109.Timestamp ensureCompletedAt() => $_ensure(4);
}

enum Notification_RelatedInfo {
  relatedUserInfo, 
  relatedChatRoomInfo, 
  relatedAnnouncementInfo, 
  relatedEkycInfo, 
  relatedProfileApprovalInfo, 
  notSet
}

/// 通知
class Notification extends $pb.GeneratedMessage {
  factory Notification({
    $core.String? notificationId,
    $161.NotificationType? notificationType,
    $core.String? title,
    $core.String? message,
    $core.String? relatedUserId,
    $core.String? relatedEntityId,
    $core.bool? isRead,
    $109.Timestamp? createdAt,
    $109.Timestamp? readAt,
    Notification_RelatedUserInfo? relatedUserInfo,
    Notification_RelatedChatRoomInfo? relatedChatRoomInfo,
    Notification_RelatedAnnouncementInfo? relatedAnnouncementInfo,
    Notification_RelatedEKYCInfo? relatedEkycInfo,
    Notification_RelatedProfileApprovalInfo? relatedProfileApprovalInfo,
  }) {
    final $result = create();
    if (notificationId != null) {
      $result.notificationId = notificationId;
    }
    if (notificationType != null) {
      $result.notificationType = notificationType;
    }
    if (title != null) {
      $result.title = title;
    }
    if (message != null) {
      $result.message = message;
    }
    if (relatedUserId != null) {
      $result.relatedUserId = relatedUserId;
    }
    if (relatedEntityId != null) {
      $result.relatedEntityId = relatedEntityId;
    }
    if (isRead != null) {
      $result.isRead = isRead;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (readAt != null) {
      $result.readAt = readAt;
    }
    if (relatedUserInfo != null) {
      $result.relatedUserInfo = relatedUserInfo;
    }
    if (relatedChatRoomInfo != null) {
      $result.relatedChatRoomInfo = relatedChatRoomInfo;
    }
    if (relatedAnnouncementInfo != null) {
      $result.relatedAnnouncementInfo = relatedAnnouncementInfo;
    }
    if (relatedEkycInfo != null) {
      $result.relatedEkycInfo = relatedEkycInfo;
    }
    if (relatedProfileApprovalInfo != null) {
      $result.relatedProfileApprovalInfo = relatedProfileApprovalInfo;
    }
    return $result;
  }
  Notification._() : super();
  factory Notification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Notification_RelatedInfo> _Notification_RelatedInfoByTag = {
    10 : Notification_RelatedInfo.relatedUserInfo,
    11 : Notification_RelatedInfo.relatedChatRoomInfo,
    12 : Notification_RelatedInfo.relatedAnnouncementInfo,
    13 : Notification_RelatedInfo.relatedEkycInfo,
    14 : Notification_RelatedInfo.relatedProfileApprovalInfo,
    0 : Notification_RelatedInfo.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Notification', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14])
    ..aOS(1, _omitFieldNames ? '' : 'notificationId')
    ..e<$161.NotificationType>(2, _omitFieldNames ? '' : 'notificationType', $pb.PbFieldType.OE, defaultOrMaker: $161.NotificationType.NOTIFICATION_TYPE_UNSPECIFIED, valueOf: $161.NotificationType.valueOf, enumValues: $161.NotificationType.values)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..aOS(5, _omitFieldNames ? '' : 'relatedUserId')
    ..aOS(6, _omitFieldNames ? '' : 'relatedEntityId')
    ..aOB(7, _omitFieldNames ? '' : 'isRead')
    ..aOM<$109.Timestamp>(8, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(9, _omitFieldNames ? '' : 'readAt', subBuilder: $109.Timestamp.create)
    ..aOM<Notification_RelatedUserInfo>(10, _omitFieldNames ? '' : 'relatedUserInfo', subBuilder: Notification_RelatedUserInfo.create)
    ..aOM<Notification_RelatedChatRoomInfo>(11, _omitFieldNames ? '' : 'relatedChatRoomInfo', subBuilder: Notification_RelatedChatRoomInfo.create)
    ..aOM<Notification_RelatedAnnouncementInfo>(12, _omitFieldNames ? '' : 'relatedAnnouncementInfo', subBuilder: Notification_RelatedAnnouncementInfo.create)
    ..aOM<Notification_RelatedEKYCInfo>(13, _omitFieldNames ? '' : 'relatedEkycInfo', subBuilder: Notification_RelatedEKYCInfo.create)
    ..aOM<Notification_RelatedProfileApprovalInfo>(14, _omitFieldNames ? '' : 'relatedProfileApprovalInfo', subBuilder: Notification_RelatedProfileApprovalInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notification clone() => Notification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notification copyWith(void Function(Notification) updates) => super.copyWith((message) => updates(message as Notification)) as Notification;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notification create() => Notification._();
  Notification createEmptyInstance() => create();
  static $pb.PbList<Notification> createRepeated() => $pb.PbList<Notification>();
  @$core.pragma('dart2js:noInline')
  static Notification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notification>(create);
  static Notification? _defaultInstance;

  Notification_RelatedInfo whichRelatedInfo() => _Notification_RelatedInfoByTag[$_whichOneof(0)]!;
  void clearRelatedInfo() => clearField($_whichOneof(0));

  /// 通知ID
  @$pb.TagNumber(1)
  $core.String get notificationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set notificationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationId() => clearField(1);

  /// 通知タイプ
  @$pb.TagNumber(2)
  $161.NotificationType get notificationType => $_getN(1);
  @$pb.TagNumber(2)
  set notificationType($161.NotificationType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNotificationType() => $_has(1);
  @$pb.TagNumber(2)
  void clearNotificationType() => clearField(2);

  /// タイトル
  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  /// メッセージ
  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);

  /// 関連ユーザーID（いいね/マッチング/メッセージの送信者）
  @$pb.TagNumber(5)
  $core.String get relatedUserId => $_getSZ(4);
  @$pb.TagNumber(5)
  set relatedUserId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRelatedUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRelatedUserId() => clearField(5);

  /// 関連エンティティID（chat_room_id, announcement_id等）
  @$pb.TagNumber(6)
  $core.String get relatedEntityId => $_getSZ(5);
  @$pb.TagNumber(6)
  set relatedEntityId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRelatedEntityId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRelatedEntityId() => clearField(6);

  /// 既読フラグ
  @$pb.TagNumber(7)
  $core.bool get isRead => $_getBF(6);
  @$pb.TagNumber(7)
  set isRead($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsRead() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsRead() => clearField(7);

  /// 作成日時
  @$pb.TagNumber(8)
  $109.Timestamp get createdAt => $_getN(7);
  @$pb.TagNumber(8)
  set createdAt($109.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $109.Timestamp ensureCreatedAt() => $_ensure(7);

  /// 既読日時
  @$pb.TagNumber(9)
  $109.Timestamp get readAt => $_getN(8);
  @$pb.TagNumber(9)
  set readAt($109.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasReadAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearReadAt() => clearField(9);
  @$pb.TagNumber(9)
  $109.Timestamp ensureReadAt() => $_ensure(8);

  /// 送信者情報（いいね/マッチング/メッセージ）
  @$pb.TagNumber(10)
  Notification_RelatedUserInfo get relatedUserInfo => $_getN(9);
  @$pb.TagNumber(10)
  set relatedUserInfo(Notification_RelatedUserInfo v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasRelatedUserInfo() => $_has(9);
  @$pb.TagNumber(10)
  void clearRelatedUserInfo() => clearField(10);
  @$pb.TagNumber(10)
  Notification_RelatedUserInfo ensureRelatedUserInfo() => $_ensure(9);

  /// チャットルーム情報（メッセージ）
  @$pb.TagNumber(11)
  Notification_RelatedChatRoomInfo get relatedChatRoomInfo => $_getN(10);
  @$pb.TagNumber(11)
  set relatedChatRoomInfo(Notification_RelatedChatRoomInfo v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRelatedChatRoomInfo() => $_has(10);
  @$pb.TagNumber(11)
  void clearRelatedChatRoomInfo() => clearField(11);
  @$pb.TagNumber(11)
  Notification_RelatedChatRoomInfo ensureRelatedChatRoomInfo() => $_ensure(10);

  /// お知らせ情報（運営通知）
  @$pb.TagNumber(12)
  Notification_RelatedAnnouncementInfo get relatedAnnouncementInfo => $_getN(11);
  @$pb.TagNumber(12)
  set relatedAnnouncementInfo(Notification_RelatedAnnouncementInfo v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasRelatedAnnouncementInfo() => $_has(11);
  @$pb.TagNumber(12)
  void clearRelatedAnnouncementInfo() => clearField(12);
  @$pb.TagNumber(12)
  Notification_RelatedAnnouncementInfo ensureRelatedAnnouncementInfo() => $_ensure(11);

  /// eKYC関連情報
  @$pb.TagNumber(13)
  Notification_RelatedEKYCInfo get relatedEkycInfo => $_getN(12);
  @$pb.TagNumber(13)
  set relatedEkycInfo(Notification_RelatedEKYCInfo v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasRelatedEkycInfo() => $_has(12);
  @$pb.TagNumber(13)
  void clearRelatedEkycInfo() => clearField(13);
  @$pb.TagNumber(13)
  Notification_RelatedEKYCInfo ensureRelatedEkycInfo() => $_ensure(12);

  /// プロフィール承認結果
  @$pb.TagNumber(14)
  Notification_RelatedProfileApprovalInfo get relatedProfileApprovalInfo => $_getN(13);
  @$pb.TagNumber(14)
  set relatedProfileApprovalInfo(Notification_RelatedProfileApprovalInfo v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasRelatedProfileApprovalInfo() => $_has(13);
  @$pb.TagNumber(14)
  void clearRelatedProfileApprovalInfo() => clearField(14);
  @$pb.TagNumber(14)
  Notification_RelatedProfileApprovalInfo ensureRelatedProfileApprovalInfo() => $_ensure(13);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
