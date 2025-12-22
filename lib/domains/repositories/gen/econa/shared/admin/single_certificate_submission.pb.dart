//
//  Generated code. Do not modify.
//  source: econa/shared/admin/single_certificate_submission.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/timestamp.pb.dart' as $109;
import '../../enums/rejection_reason_code.pbenum.dart' as $198;
import '../../enums/single_certificate_type.pbenum.dart' as $196;
import '../../enums/verification_status.pbenum.dart' as $197;
import 'single_certificate.pb.dart' as $199;

/// SingleCertificateSubmission 独身証明書申請グループ
/// 複数枚の証明書画像を1つのグループとして管理する
class SingleCertificateSubmission extends $pb.GeneratedMessage {
  factory SingleCertificateSubmission({
    $core.String? submissionId,
    $core.String? userId,
    $196.SingleCertificateType? certificateType,
    $197.VerificationStatusCode? verificationStatus,
    $core.int? imageCount,
    $109.Timestamp? submittedAt,
    $109.Timestamp? verifiedAt,
    $109.Timestamp? expiresAt,
    $109.Timestamp? autoDeleteAt,
    $198.RejectionReasonCode? rejectionReasonCode,
    $core.String? rejectionReasonDetail,
    $core.String? verificationMemo,
    $core.String? verifiedBy,
    $core.Iterable<$199.SingleCertificate>? photos,
  }) {
    final $result = create();
    if (submissionId != null) {
      $result.submissionId = submissionId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (certificateType != null) {
      $result.certificateType = certificateType;
    }
    if (verificationStatus != null) {
      $result.verificationStatus = verificationStatus;
    }
    if (imageCount != null) {
      $result.imageCount = imageCount;
    }
    if (submittedAt != null) {
      $result.submittedAt = submittedAt;
    }
    if (verifiedAt != null) {
      $result.verifiedAt = verifiedAt;
    }
    if (expiresAt != null) {
      $result.expiresAt = expiresAt;
    }
    if (autoDeleteAt != null) {
      $result.autoDeleteAt = autoDeleteAt;
    }
    if (rejectionReasonCode != null) {
      $result.rejectionReasonCode = rejectionReasonCode;
    }
    if (rejectionReasonDetail != null) {
      $result.rejectionReasonDetail = rejectionReasonDetail;
    }
    if (verificationMemo != null) {
      $result.verificationMemo = verificationMemo;
    }
    if (verifiedBy != null) {
      $result.verifiedBy = verifiedBy;
    }
    if (photos != null) {
      $result.photos.addAll(photos);
    }
    return $result;
  }
  SingleCertificateSubmission._() : super();
  factory SingleCertificateSubmission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SingleCertificateSubmission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SingleCertificateSubmission', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared.admin'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'submissionId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..e<$196.SingleCertificateType>(3, _omitFieldNames ? '' : 'certificateType', $pb.PbFieldType.OE, defaultOrMaker: $196.SingleCertificateType.SINGLE_CERTIFICATE_TYPE_UNSPECIFIED, valueOf: $196.SingleCertificateType.valueOf, enumValues: $196.SingleCertificateType.values)
    ..e<$197.VerificationStatusCode>(4, _omitFieldNames ? '' : 'verificationStatus', $pb.PbFieldType.OE, defaultOrMaker: $197.VerificationStatusCode.VERIFICATION_STATUS_CODE_UNSPECIFIED, valueOf: $197.VerificationStatusCode.valueOf, enumValues: $197.VerificationStatusCode.values)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'imageCount', $pb.PbFieldType.O3)
    ..aOM<$109.Timestamp>(6, _omitFieldNames ? '' : 'submittedAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(7, _omitFieldNames ? '' : 'verifiedAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(8, _omitFieldNames ? '' : 'expiresAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(9, _omitFieldNames ? '' : 'autoDeleteAt', subBuilder: $109.Timestamp.create)
    ..e<$198.RejectionReasonCode>(10, _omitFieldNames ? '' : 'rejectionReasonCode', $pb.PbFieldType.OE, defaultOrMaker: $198.RejectionReasonCode.REJECTION_REASON_CODE_UNSPECIFIED, valueOf: $198.RejectionReasonCode.valueOf, enumValues: $198.RejectionReasonCode.values)
    ..aOS(11, _omitFieldNames ? '' : 'rejectionReasonDetail')
    ..aOS(12, _omitFieldNames ? '' : 'verificationMemo')
    ..aOS(13, _omitFieldNames ? '' : 'verifiedBy')
    ..pc<$199.SingleCertificate>(14, _omitFieldNames ? '' : 'photos', $pb.PbFieldType.PM, subBuilder: $199.SingleCertificate.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SingleCertificateSubmission clone() => SingleCertificateSubmission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SingleCertificateSubmission copyWith(void Function(SingleCertificateSubmission) updates) => super.copyWith((message) => updates(message as SingleCertificateSubmission)) as SingleCertificateSubmission;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SingleCertificateSubmission create() => SingleCertificateSubmission._();
  SingleCertificateSubmission createEmptyInstance() => create();
  static $pb.PbList<SingleCertificateSubmission> createRepeated() => $pb.PbList<SingleCertificateSubmission>();
  @$core.pragma('dart2js:noInline')
  static SingleCertificateSubmission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SingleCertificateSubmission>(create);
  static SingleCertificateSubmission? _defaultInstance;

  /// 申請グループID
  @$pb.TagNumber(1)
  $core.String get submissionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set submissionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubmissionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubmissionId() => clearField(1);

  /// ユーザーID
  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  /// 証明書種別
  @$pb.TagNumber(3)
  $196.SingleCertificateType get certificateType => $_getN(2);
  @$pb.TagNumber(3)
  set certificateType($196.SingleCertificateType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCertificateType() => $_has(2);
  @$pb.TagNumber(3)
  void clearCertificateType() => clearField(3);

  /// 審査ステータス（グループ全体の状態）
  @$pb.TagNumber(4)
  $197.VerificationStatusCode get verificationStatus => $_getN(3);
  @$pb.TagNumber(4)
  set verificationStatus($197.VerificationStatusCode v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasVerificationStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearVerificationStatus() => clearField(4);

  /// グループ内の画像数
  @$pb.TagNumber(5)
  $core.int get imageCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set imageCount($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImageCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearImageCount() => clearField(5);

  /// 申請日時
  @$pb.TagNumber(6)
  $109.Timestamp get submittedAt => $_getN(5);
  @$pb.TagNumber(6)
  set submittedAt($109.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSubmittedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearSubmittedAt() => clearField(6);
  @$pb.TagNumber(6)
  $109.Timestamp ensureSubmittedAt() => $_ensure(5);

  /// 審査完了日時
  @$pb.TagNumber(7)
  $109.Timestamp get verifiedAt => $_getN(6);
  @$pb.TagNumber(7)
  set verifiedAt($109.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasVerifiedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearVerifiedAt() => clearField(7);
  @$pb.TagNumber(7)
  $109.Timestamp ensureVerifiedAt() => $_ensure(6);

  /// 有効期限
  @$pb.TagNumber(8)
  $109.Timestamp get expiresAt => $_getN(7);
  @$pb.TagNumber(8)
  set expiresAt($109.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasExpiresAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearExpiresAt() => clearField(8);
  @$pb.TagNumber(8)
  $109.Timestamp ensureExpiresAt() => $_ensure(7);

  /// 自動削除日時
  @$pb.TagNumber(9)
  $109.Timestamp get autoDeleteAt => $_getN(8);
  @$pb.TagNumber(9)
  set autoDeleteAt($109.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasAutoDeleteAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearAutoDeleteAt() => clearField(9);
  @$pb.TagNumber(9)
  $109.Timestamp ensureAutoDeleteAt() => $_ensure(8);

  /// 否認理由コード
  @$pb.TagNumber(10)
  $198.RejectionReasonCode get rejectionReasonCode => $_getN(9);
  @$pb.TagNumber(10)
  set rejectionReasonCode($198.RejectionReasonCode v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasRejectionReasonCode() => $_has(9);
  @$pb.TagNumber(10)
  void clearRejectionReasonCode() => clearField(10);

  /// 否認理由詳細
  @$pb.TagNumber(11)
  $core.String get rejectionReasonDetail => $_getSZ(10);
  @$pb.TagNumber(11)
  set rejectionReasonDetail($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasRejectionReasonDetail() => $_has(10);
  @$pb.TagNumber(11)
  void clearRejectionReasonDetail() => clearField(11);

  /// 審査メモ
  @$pb.TagNumber(12)
  $core.String get verificationMemo => $_getSZ(11);
  @$pb.TagNumber(12)
  set verificationMemo($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasVerificationMemo() => $_has(11);
  @$pb.TagNumber(12)
  void clearVerificationMemo() => clearField(12);

  /// 審査者メールアドレス
  @$pb.TagNumber(13)
  $core.String get verifiedBy => $_getSZ(12);
  @$pb.TagNumber(13)
  set verifiedBy($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasVerifiedBy() => $_has(12);
  @$pb.TagNumber(13)
  void clearVerifiedBy() => clearField(13);

  /// グループ内の証明書画像一覧
  @$pb.TagNumber(14)
  $core.List<$199.SingleCertificate> get photos => $_getList(13);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
