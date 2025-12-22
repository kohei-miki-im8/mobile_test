//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/publish_notification.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;
import '../../../../enums/notification_type.pbenum.dart' as $161;

enum PublishNotificationRequest_DetailData {
  ekycVerificationData, 
  personalVerificationData, 
  profileApprovalData, 
  notSet
}

/// PublishNotification:通知送信リクエスト（内部API用）
class PublishNotificationRequest extends $pb.GeneratedMessage {
  factory PublishNotificationRequest({
    $core.String? userId,
    $161.NotificationType? notificationType,
    $core.String? title,
    $core.String? message,
    $core.String? relatedUserId,
    $core.String? relatedEntityId,
    $core.bool? sendPush,
    EKYCVerificationData? ekycVerificationData,
    PersonalVerificationData? personalVerificationData,
    ProfileApprovalData? profileApprovalData,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
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
    if (sendPush != null) {
      $result.sendPush = sendPush;
    }
    if (ekycVerificationData != null) {
      $result.ekycVerificationData = ekycVerificationData;
    }
    if (personalVerificationData != null) {
      $result.personalVerificationData = personalVerificationData;
    }
    if (profileApprovalData != null) {
      $result.profileApprovalData = profileApprovalData;
    }
    return $result;
  }
  PublishNotificationRequest._() : super();
  factory PublishNotificationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishNotificationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, PublishNotificationRequest_DetailData> _PublishNotificationRequest_DetailDataByTag = {
    8 : PublishNotificationRequest_DetailData.ekycVerificationData,
    9 : PublishNotificationRequest_DetailData.personalVerificationData,
    10 : PublishNotificationRequest_DetailData.profileApprovalData,
    0 : PublishNotificationRequest_DetailData.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PublishNotificationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..oo(0, [8, 9, 10])
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..e<$161.NotificationType>(2, _omitFieldNames ? '' : 'notificationType', $pb.PbFieldType.OE, defaultOrMaker: $161.NotificationType.NOTIFICATION_TYPE_UNSPECIFIED, valueOf: $161.NotificationType.valueOf, enumValues: $161.NotificationType.values)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..aOS(5, _omitFieldNames ? '' : 'relatedUserId')
    ..aOS(6, _omitFieldNames ? '' : 'relatedEntityId')
    ..aOB(7, _omitFieldNames ? '' : 'sendPush')
    ..aOM<EKYCVerificationData>(8, _omitFieldNames ? '' : 'ekycVerificationData', subBuilder: EKYCVerificationData.create)
    ..aOM<PersonalVerificationData>(9, _omitFieldNames ? '' : 'personalVerificationData', subBuilder: PersonalVerificationData.create)
    ..aOM<ProfileApprovalData>(10, _omitFieldNames ? '' : 'profileApprovalData', subBuilder: ProfileApprovalData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublishNotificationRequest clone() => PublishNotificationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublishNotificationRequest copyWith(void Function(PublishNotificationRequest) updates) => super.copyWith((message) => updates(message as PublishNotificationRequest)) as PublishNotificationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublishNotificationRequest create() => PublishNotificationRequest._();
  PublishNotificationRequest createEmptyInstance() => create();
  static $pb.PbList<PublishNotificationRequest> createRepeated() => $pb.PbList<PublishNotificationRequest>();
  @$core.pragma('dart2js:noInline')
  static PublishNotificationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublishNotificationRequest>(create);
  static PublishNotificationRequest? _defaultInstance;

  PublishNotificationRequest_DetailData whichDetailData() => _PublishNotificationRequest_DetailDataByTag[$_whichOneof(0)]!;
  void clearDetailData() => clearField($_whichOneof(0));

  /// 受信ユーザーID
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

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

  /// 関連ユーザーID（送信者）
  @$pb.TagNumber(5)
  $core.String get relatedUserId => $_getSZ(4);
  @$pb.TagNumber(5)
  set relatedUserId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRelatedUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRelatedUserId() => clearField(5);

  /// 関連エンティティID
  @$pb.TagNumber(6)
  $core.String get relatedEntityId => $_getSZ(5);
  @$pb.TagNumber(6)
  set relatedEntityId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRelatedEntityId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRelatedEntityId() => clearField(6);

  /// プッシュ通知を送信するか
  @$pb.TagNumber(7)
  $core.bool get sendPush => $_getBF(6);
  @$pb.TagNumber(7)
  set sendPush($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSendPush() => $_has(6);
  @$pb.TagNumber(7)
  void clearSendPush() => clearField(7);

  /// eKYC認証完了データ
  @$pb.TagNumber(8)
  EKYCVerificationData get ekycVerificationData => $_getN(7);
  @$pb.TagNumber(8)
  set ekycVerificationData(EKYCVerificationData v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasEkycVerificationData() => $_has(7);
  @$pb.TagNumber(8)
  void clearEkycVerificationData() => clearField(8);
  @$pb.TagNumber(8)
  EKYCVerificationData ensureEkycVerificationData() => $_ensure(7);

  /// 個人情報突合完了データ
  @$pb.TagNumber(9)
  PersonalVerificationData get personalVerificationData => $_getN(8);
  @$pb.TagNumber(9)
  set personalVerificationData(PersonalVerificationData v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasPersonalVerificationData() => $_has(8);
  @$pb.TagNumber(9)
  void clearPersonalVerificationData() => clearField(9);
  @$pb.TagNumber(9)
  PersonalVerificationData ensurePersonalVerificationData() => $_ensure(8);

  /// プロフィール承認データ
  @$pb.TagNumber(10)
  ProfileApprovalData get profileApprovalData => $_getN(9);
  @$pb.TagNumber(10)
  set profileApprovalData(ProfileApprovalData v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasProfileApprovalData() => $_has(9);
  @$pb.TagNumber(10)
  void clearProfileApprovalData() => clearField(10);
  @$pb.TagNumber(10)
  ProfileApprovalData ensureProfileApprovalData() => $_ensure(9);
}

/// PublishNotification:通知送信レスポンス
class PublishNotificationResponse extends $pb.GeneratedMessage {
  factory PublishNotificationResponse({
    $core.String? notificationId,
    $core.bool? pushSent,
  }) {
    final $result = create();
    if (notificationId != null) {
      $result.notificationId = notificationId;
    }
    if (pushSent != null) {
      $result.pushSent = pushSent;
    }
    return $result;
  }
  PublishNotificationResponse._() : super();
  factory PublishNotificationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishNotificationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PublishNotificationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'notificationId')
    ..aOB(2, _omitFieldNames ? '' : 'pushSent')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublishNotificationResponse clone() => PublishNotificationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublishNotificationResponse copyWith(void Function(PublishNotificationResponse) updates) => super.copyWith((message) => updates(message as PublishNotificationResponse)) as PublishNotificationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublishNotificationResponse create() => PublishNotificationResponse._();
  PublishNotificationResponse createEmptyInstance() => create();
  static $pb.PbList<PublishNotificationResponse> createRepeated() => $pb.PbList<PublishNotificationResponse>();
  @$core.pragma('dart2js:noInline')
  static PublishNotificationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublishNotificationResponse>(create);
  static PublishNotificationResponse? _defaultInstance;

  /// 作成された通知ID
  @$pb.TagNumber(1)
  $core.String get notificationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set notificationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationId() => clearField(1);

  /// プッシュ通知送信成功フラグ
  @$pb.TagNumber(2)
  $core.bool get pushSent => $_getBF(1);
  @$pb.TagNumber(2)
  set pushSent($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPushSent() => $_has(1);
  @$pb.TagNumber(2)
  void clearPushSent() => clearField(2);
}

/// eKYC認証完了データ
class EKYCVerificationData extends $pb.GeneratedMessage {
  factory EKYCVerificationData({
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
  EKYCVerificationData._() : super();
  factory EKYCVerificationData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EKYCVerificationData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EKYCVerificationData', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
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
  EKYCVerificationData clone() => EKYCVerificationData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EKYCVerificationData copyWith(void Function(EKYCVerificationData) updates) => super.copyWith((message) => updates(message as EKYCVerificationData)) as EKYCVerificationData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EKYCVerificationData create() => EKYCVerificationData._();
  EKYCVerificationData createEmptyInstance() => create();
  static $pb.PbList<EKYCVerificationData> createRepeated() => $pb.PbList<EKYCVerificationData>();
  @$core.pragma('dart2js:noInline')
  static EKYCVerificationData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EKYCVerificationData>(create);
  static EKYCVerificationData? _defaultInstance;

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

/// 個人情報突合完了データ
class PersonalVerificationData extends $pb.GeneratedMessage {
  factory PersonalVerificationData({
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
  PersonalVerificationData._() : super();
  factory PersonalVerificationData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PersonalVerificationData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PersonalVerificationData', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
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
  PersonalVerificationData clone() => PersonalVerificationData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PersonalVerificationData copyWith(void Function(PersonalVerificationData) updates) => super.copyWith((message) => updates(message as PersonalVerificationData)) as PersonalVerificationData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersonalVerificationData create() => PersonalVerificationData._();
  PersonalVerificationData createEmptyInstance() => create();
  static $pb.PbList<PersonalVerificationData> createRepeated() => $pb.PbList<PersonalVerificationData>();
  @$core.pragma('dart2js:noInline')
  static PersonalVerificationData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PersonalVerificationData>(create);
  static PersonalVerificationData? _defaultInstance;

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

/// プロフィール承認完了データ
class ProfileApprovalData extends $pb.GeneratedMessage {
  factory ProfileApprovalData({
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
  ProfileApprovalData._() : super();
  factory ProfileApprovalData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProfileApprovalData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProfileApprovalData', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
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
  ProfileApprovalData clone() => ProfileApprovalData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProfileApprovalData copyWith(void Function(ProfileApprovalData) updates) => super.copyWith((message) => updates(message as ProfileApprovalData)) as ProfileApprovalData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProfileApprovalData create() => ProfileApprovalData._();
  ProfileApprovalData createEmptyInstance() => create();
  static $pb.PbList<ProfileApprovalData> createRepeated() => $pb.PbList<ProfileApprovalData>();
  @$core.pragma('dart2js:noInline')
  static ProfileApprovalData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProfileApprovalData>(create);
  static ProfileApprovalData? _defaultInstance;

  /// 承認結果
  @$pb.TagNumber(1)
  $core.bool get isApproved => $_getBF(0);
  @$pb.TagNumber(1)
  set isApproved($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsApproved() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsApproved() => clearField(1);

  /// 承認対象タイプ（nickname/introductory/photo）
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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
