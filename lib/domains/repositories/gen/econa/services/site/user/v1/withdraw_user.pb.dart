//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/withdraw_user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;
import '../../../../enums/withdrawal_reason_code.pbenum.dart' as $190;

/// WithdrawUserRequest: ユーザー退会リクエスト
class WithdrawUserRequest extends $pb.GeneratedMessage {
  factory WithdrawUserRequest({
    $190.WithdrawalReasonCode? reasonCode,
    $core.String? reasonDetail,
    $core.bool? confirmedSubscriptionStopped,
  }) {
    final $result = create();
    if (reasonCode != null) {
      $result.reasonCode = reasonCode;
    }
    if (reasonDetail != null) {
      $result.reasonDetail = reasonDetail;
    }
    if (confirmedSubscriptionStopped != null) {
      $result.confirmedSubscriptionStopped = confirmedSubscriptionStopped;
    }
    return $result;
  }
  WithdrawUserRequest._() : super();
  factory WithdrawUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WithdrawUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WithdrawUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..e<$190.WithdrawalReasonCode>(1, _omitFieldNames ? '' : 'reasonCode', $pb.PbFieldType.OE, defaultOrMaker: $190.WithdrawalReasonCode.WITHDRAWAL_REASON_CODE_UNSPECIFIED, valueOf: $190.WithdrawalReasonCode.valueOf, enumValues: $190.WithdrawalReasonCode.values)
    ..aOS(2, _omitFieldNames ? '' : 'reasonDetail')
    ..aOB(3, _omitFieldNames ? '' : 'confirmedSubscriptionStopped')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WithdrawUserRequest clone() => WithdrawUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WithdrawUserRequest copyWith(void Function(WithdrawUserRequest) updates) => super.copyWith((message) => updates(message as WithdrawUserRequest)) as WithdrawUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WithdrawUserRequest create() => WithdrawUserRequest._();
  WithdrawUserRequest createEmptyInstance() => create();
  static $pb.PbList<WithdrawUserRequest> createRepeated() => $pb.PbList<WithdrawUserRequest>();
  @$core.pragma('dart2js:noInline')
  static WithdrawUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WithdrawUserRequest>(create);
  static WithdrawUserRequest? _defaultInstance;

  /// 退会理由コード（必須）
  @$pb.TagNumber(1)
  $190.WithdrawalReasonCode get reasonCode => $_getN(0);
  @$pb.TagNumber(1)
  set reasonCode($190.WithdrawalReasonCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasReasonCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearReasonCode() => clearField(1);

  /// 退会理由詳細（reason_code が OTHER の場合は必須）
  @$pb.TagNumber(2)
  $core.String get reasonDetail => $_getSZ(1);
  @$pb.TagNumber(2)
  set reasonDetail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReasonDetail() => $_has(1);
  @$pb.TagNumber(2)
  void clearReasonDetail() => clearField(2);

  /// 有料プランの自動更新停止確認（必須）
  @$pb.TagNumber(3)
  $core.bool get confirmedSubscriptionStopped => $_getBF(2);
  @$pb.TagNumber(3)
  set confirmedSubscriptionStopped($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasConfirmedSubscriptionStopped() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfirmedSubscriptionStopped() => clearField(3);
}

/// WithdrawUserResponse: ユーザー退会レスポンス
class WithdrawUserResponse extends $pb.GeneratedMessage {
  factory WithdrawUserResponse({
    $109.Timestamp? withdrawnAt,
    $109.Timestamp? rejoinAvailableAt,
  }) {
    final $result = create();
    if (withdrawnAt != null) {
      $result.withdrawnAt = withdrawnAt;
    }
    if (rejoinAvailableAt != null) {
      $result.rejoinAvailableAt = rejoinAvailableAt;
    }
    return $result;
  }
  WithdrawUserResponse._() : super();
  factory WithdrawUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WithdrawUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WithdrawUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOM<$109.Timestamp>(1, _omitFieldNames ? '' : 'withdrawnAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(2, _omitFieldNames ? '' : 'rejoinAvailableAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WithdrawUserResponse clone() => WithdrawUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WithdrawUserResponse copyWith(void Function(WithdrawUserResponse) updates) => super.copyWith((message) => updates(message as WithdrawUserResponse)) as WithdrawUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WithdrawUserResponse create() => WithdrawUserResponse._();
  WithdrawUserResponse createEmptyInstance() => create();
  static $pb.PbList<WithdrawUserResponse> createRepeated() => $pb.PbList<WithdrawUserResponse>();
  @$core.pragma('dart2js:noInline')
  static WithdrawUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WithdrawUserResponse>(create);
  static WithdrawUserResponse? _defaultInstance;

  /// 退会日時（即時確定）
  @$pb.TagNumber(1)
  $109.Timestamp get withdrawnAt => $_getN(0);
  @$pb.TagNumber(1)
  set withdrawnAt($109.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasWithdrawnAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearWithdrawnAt() => clearField(1);
  @$pb.TagNumber(1)
  $109.Timestamp ensureWithdrawnAt() => $_ensure(0);

  /// 再登録可能日時（退会日時 + 14日）
  @$pb.TagNumber(2)
  $109.Timestamp get rejoinAvailableAt => $_getN(1);
  @$pb.TagNumber(2)
  set rejoinAvailableAt($109.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRejoinAvailableAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearRejoinAvailableAt() => clearField(2);
  @$pb.TagNumber(2)
  $109.Timestamp ensureRejoinAvailableAt() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
