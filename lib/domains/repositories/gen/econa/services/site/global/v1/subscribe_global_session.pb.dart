//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/subscribe_global_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;
import 'subscribe_global_session.pbenum.dart';

export 'subscribe_global_session.pbenum.dart';

/// グローバルセッション購読リクエスト
class SubscribeGlobalSessionRequest extends $pb.GeneratedMessage {
  factory SubscribeGlobalSessionRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  SubscribeGlobalSessionRequest._() : super();
  factory SubscribeGlobalSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeGlobalSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeGlobalSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeGlobalSessionRequest clone() => SubscribeGlobalSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeGlobalSessionRequest copyWith(void Function(SubscribeGlobalSessionRequest) updates) => super.copyWith((message) => updates(message as SubscribeGlobalSessionRequest)) as SubscribeGlobalSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeGlobalSessionRequest create() => SubscribeGlobalSessionRequest._();
  SubscribeGlobalSessionRequest createEmptyInstance() => create();
  static $pb.PbList<SubscribeGlobalSessionRequest> createRepeated() => $pb.PbList<SubscribeGlobalSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static SubscribeGlobalSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeGlobalSessionRequest>(create);
  static SubscribeGlobalSessionRequest? _defaultInstance;

  /// ユーザーID
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

enum SubscribeGlobalSessionResponse_EventData {
  ekycVerificationCompleted, 
  personalVerificationCompleted, 
  notSet
}

/// グローバルセッション購読レスポンス
class SubscribeGlobalSessionResponse extends $pb.GeneratedMessage {
  factory SubscribeGlobalSessionResponse({
    $core.String? publishedUserId,
    SessionEventType? eventType,
    EKYCVerificationCompleted? ekycVerificationCompleted,
    PersonalVerificationCompleted? personalVerificationCompleted,
    $109.Timestamp? timestamp,
    $core.bool? isSuccessful,
  }) {
    final $result = create();
    if (publishedUserId != null) {
      $result.publishedUserId = publishedUserId;
    }
    if (eventType != null) {
      $result.eventType = eventType;
    }
    if (ekycVerificationCompleted != null) {
      $result.ekycVerificationCompleted = ekycVerificationCompleted;
    }
    if (personalVerificationCompleted != null) {
      $result.personalVerificationCompleted = personalVerificationCompleted;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (isSuccessful != null) {
      $result.isSuccessful = isSuccessful;
    }
    return $result;
  }
  SubscribeGlobalSessionResponse._() : super();
  factory SubscribeGlobalSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeGlobalSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SubscribeGlobalSessionResponse_EventData> _SubscribeGlobalSessionResponse_EventDataByTag = {
    3 : SubscribeGlobalSessionResponse_EventData.ekycVerificationCompleted,
    4 : SubscribeGlobalSessionResponse_EventData.personalVerificationCompleted,
    0 : SubscribeGlobalSessionResponse_EventData.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeGlobalSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'publishedUserId')
    ..e<SessionEventType>(2, _omitFieldNames ? '' : 'eventType', $pb.PbFieldType.OE, defaultOrMaker: SessionEventType.SESSION_EVENT_TYPE_UNSPECIFIED, valueOf: SessionEventType.valueOf, enumValues: SessionEventType.values)
    ..aOM<EKYCVerificationCompleted>(3, _omitFieldNames ? '' : 'ekycVerificationCompleted', subBuilder: EKYCVerificationCompleted.create)
    ..aOM<PersonalVerificationCompleted>(4, _omitFieldNames ? '' : 'personalVerificationCompleted', subBuilder: PersonalVerificationCompleted.create)
    ..aOM<$109.Timestamp>(14, _omitFieldNames ? '' : 'timestamp', subBuilder: $109.Timestamp.create)
    ..aOB(15, _omitFieldNames ? '' : 'isSuccessful')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeGlobalSessionResponse clone() => SubscribeGlobalSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeGlobalSessionResponse copyWith(void Function(SubscribeGlobalSessionResponse) updates) => super.copyWith((message) => updates(message as SubscribeGlobalSessionResponse)) as SubscribeGlobalSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeGlobalSessionResponse create() => SubscribeGlobalSessionResponse._();
  SubscribeGlobalSessionResponse createEmptyInstance() => create();
  static $pb.PbList<SubscribeGlobalSessionResponse> createRepeated() => $pb.PbList<SubscribeGlobalSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static SubscribeGlobalSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeGlobalSessionResponse>(create);
  static SubscribeGlobalSessionResponse? _defaultInstance;

  SubscribeGlobalSessionResponse_EventData whichEventData() => _SubscribeGlobalSessionResponse_EventDataByTag[$_whichOneof(0)]!;
  void clearEventData() => clearField($_whichOneof(0));

  /// 発行ユーザーID
  @$pb.TagNumber(1)
  $core.String get publishedUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set publishedUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublishedUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublishedUserId() => clearField(1);

  /// セッションイベントタイプ
  @$pb.TagNumber(2)
  SessionEventType get eventType => $_getN(1);
  @$pb.TagNumber(2)
  set eventType(SessionEventType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEventType() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventType() => clearField(2);

  /// eKYC認証完了イベント
  @$pb.TagNumber(3)
  EKYCVerificationCompleted get ekycVerificationCompleted => $_getN(2);
  @$pb.TagNumber(3)
  set ekycVerificationCompleted(EKYCVerificationCompleted v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEkycVerificationCompleted() => $_has(2);
  @$pb.TagNumber(3)
  void clearEkycVerificationCompleted() => clearField(3);
  @$pb.TagNumber(3)
  EKYCVerificationCompleted ensureEkycVerificationCompleted() => $_ensure(2);

  /// 個人情報突合完了イベント
  @$pb.TagNumber(4)
  PersonalVerificationCompleted get personalVerificationCompleted => $_getN(3);
  @$pb.TagNumber(4)
  set personalVerificationCompleted(PersonalVerificationCompleted v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPersonalVerificationCompleted() => $_has(3);
  @$pb.TagNumber(4)
  void clearPersonalVerificationCompleted() => clearField(4);
  @$pb.TagNumber(4)
  PersonalVerificationCompleted ensurePersonalVerificationCompleted() => $_ensure(3);

  /// タイムスタンプ
  @$pb.TagNumber(14)
  $109.Timestamp get timestamp => $_getN(4);
  @$pb.TagNumber(14)
  set timestamp($109.Timestamp v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(14)
  void clearTimestamp() => clearField(14);
  @$pb.TagNumber(14)
  $109.Timestamp ensureTimestamp() => $_ensure(4);

  /// 成功フラグ
  @$pb.TagNumber(15)
  $core.bool get isSuccessful => $_getBF(5);
  @$pb.TagNumber(15)
  set isSuccessful($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(15)
  $core.bool hasIsSuccessful() => $_has(5);
  @$pb.TagNumber(15)
  void clearIsSuccessful() => clearField(15);
}

/// eKYC認証完了イベント
class EKYCVerificationCompleted extends $pb.GeneratedMessage {
  factory EKYCVerificationCompleted({
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
  EKYCVerificationCompleted._() : super();
  factory EKYCVerificationCompleted.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EKYCVerificationCompleted.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EKYCVerificationCompleted', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
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
  EKYCVerificationCompleted clone() => EKYCVerificationCompleted()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EKYCVerificationCompleted copyWith(void Function(EKYCVerificationCompleted) updates) => super.copyWith((message) => updates(message as EKYCVerificationCompleted)) as EKYCVerificationCompleted;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EKYCVerificationCompleted create() => EKYCVerificationCompleted._();
  EKYCVerificationCompleted createEmptyInstance() => create();
  static $pb.PbList<EKYCVerificationCompleted> createRepeated() => $pb.PbList<EKYCVerificationCompleted>();
  @$core.pragma('dart2js:noInline')
  static EKYCVerificationCompleted getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EKYCVerificationCompleted>(create);
  static EKYCVerificationCompleted? _defaultInstance;

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

/// 個人情報突合完了イベント
class PersonalVerificationCompleted extends $pb.GeneratedMessage {
  factory PersonalVerificationCompleted({
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
  PersonalVerificationCompleted._() : super();
  factory PersonalVerificationCompleted.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PersonalVerificationCompleted.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PersonalVerificationCompleted', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
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
  PersonalVerificationCompleted clone() => PersonalVerificationCompleted()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PersonalVerificationCompleted copyWith(void Function(PersonalVerificationCompleted) updates) => super.copyWith((message) => updates(message as PersonalVerificationCompleted)) as PersonalVerificationCompleted;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersonalVerificationCompleted create() => PersonalVerificationCompleted._();
  PersonalVerificationCompleted createEmptyInstance() => create();
  static $pb.PbList<PersonalVerificationCompleted> createRepeated() => $pb.PbList<PersonalVerificationCompleted>();
  @$core.pragma('dart2js:noInline')
  static PersonalVerificationCompleted getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PersonalVerificationCompleted>(create);
  static PersonalVerificationCompleted? _defaultInstance;

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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
