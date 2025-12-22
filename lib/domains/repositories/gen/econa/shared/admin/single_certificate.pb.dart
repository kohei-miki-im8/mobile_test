//
//  Generated code. Do not modify.
//  source: econa/shared/admin/single_certificate.proto
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

/// SingleCertificate 独身証明書
class SingleCertificate extends $pb.GeneratedMessage {
  factory SingleCertificate({
    $core.String? singleCertificatePhotoId,
    $core.String? userId,
    $196.SingleCertificateType? certificateType,
    $core.String? photoUrl,
    $197.VerificationStatusCode? verificationStatus,
    $109.Timestamp? submittedAt,
    $109.Timestamp? verifiedAt,
    $109.Timestamp? expiresAt,
    $109.Timestamp? autoDeleteAt,
    $198.RejectionReasonCode? rejectionReasonCode,
    $core.String? rejectionReasonDetail,
    $core.String? verificationMemo,
    $core.String? verifiedBy,
  }) {
    final $result = create();
    if (singleCertificatePhotoId != null) {
      $result.singleCertificatePhotoId = singleCertificatePhotoId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (certificateType != null) {
      $result.certificateType = certificateType;
    }
    if (photoUrl != null) {
      $result.photoUrl = photoUrl;
    }
    if (verificationStatus != null) {
      $result.verificationStatus = verificationStatus;
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
    return $result;
  }
  SingleCertificate._() : super();
  factory SingleCertificate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SingleCertificate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SingleCertificate', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared.admin'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'singleCertificatePhotoId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..e<$196.SingleCertificateType>(3, _omitFieldNames ? '' : 'certificateType', $pb.PbFieldType.OE, defaultOrMaker: $196.SingleCertificateType.SINGLE_CERTIFICATE_TYPE_UNSPECIFIED, valueOf: $196.SingleCertificateType.valueOf, enumValues: $196.SingleCertificateType.values)
    ..aOS(4, _omitFieldNames ? '' : 'photoUrl')
    ..e<$197.VerificationStatusCode>(5, _omitFieldNames ? '' : 'verificationStatus', $pb.PbFieldType.OE, defaultOrMaker: $197.VerificationStatusCode.VERIFICATION_STATUS_CODE_UNSPECIFIED, valueOf: $197.VerificationStatusCode.valueOf, enumValues: $197.VerificationStatusCode.values)
    ..aOM<$109.Timestamp>(6, _omitFieldNames ? '' : 'submittedAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(7, _omitFieldNames ? '' : 'verifiedAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(8, _omitFieldNames ? '' : 'expiresAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(9, _omitFieldNames ? '' : 'autoDeleteAt', subBuilder: $109.Timestamp.create)
    ..e<$198.RejectionReasonCode>(10, _omitFieldNames ? '' : 'rejectionReasonCode', $pb.PbFieldType.OE, defaultOrMaker: $198.RejectionReasonCode.REJECTION_REASON_CODE_UNSPECIFIED, valueOf: $198.RejectionReasonCode.valueOf, enumValues: $198.RejectionReasonCode.values)
    ..aOS(11, _omitFieldNames ? '' : 'rejectionReasonDetail')
    ..aOS(12, _omitFieldNames ? '' : 'verificationMemo')
    ..aOS(13, _omitFieldNames ? '' : 'verifiedBy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SingleCertificate clone() => SingleCertificate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SingleCertificate copyWith(void Function(SingleCertificate) updates) => super.copyWith((message) => updates(message as SingleCertificate)) as SingleCertificate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SingleCertificate create() => SingleCertificate._();
  SingleCertificate createEmptyInstance() => create();
  static $pb.PbList<SingleCertificate> createRepeated() => $pb.PbList<SingleCertificate>();
  @$core.pragma('dart2js:noInline')
  static SingleCertificate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SingleCertificate>(create);
  static SingleCertificate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get singleCertificatePhotoId => $_getSZ(0);
  @$pb.TagNumber(1)
  set singleCertificatePhotoId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSingleCertificatePhotoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSingleCertificatePhotoId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $196.SingleCertificateType get certificateType => $_getN(2);
  @$pb.TagNumber(3)
  set certificateType($196.SingleCertificateType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCertificateType() => $_has(2);
  @$pb.TagNumber(3)
  void clearCertificateType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get photoUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set photoUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhotoUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhotoUrl() => clearField(4);

  @$pb.TagNumber(5)
  $197.VerificationStatusCode get verificationStatus => $_getN(4);
  @$pb.TagNumber(5)
  set verificationStatus($197.VerificationStatusCode v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasVerificationStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearVerificationStatus() => clearField(5);

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

  @$pb.TagNumber(10)
  $198.RejectionReasonCode get rejectionReasonCode => $_getN(9);
  @$pb.TagNumber(10)
  set rejectionReasonCode($198.RejectionReasonCode v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasRejectionReasonCode() => $_has(9);
  @$pb.TagNumber(10)
  void clearRejectionReasonCode() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get rejectionReasonDetail => $_getSZ(10);
  @$pb.TagNumber(11)
  set rejectionReasonDetail($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasRejectionReasonDetail() => $_has(10);
  @$pb.TagNumber(11)
  void clearRejectionReasonDetail() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get verificationMemo => $_getSZ(11);
  @$pb.TagNumber(12)
  set verificationMemo($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasVerificationMemo() => $_has(11);
  @$pb.TagNumber(12)
  void clearVerificationMemo() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get verifiedBy => $_getSZ(12);
  @$pb.TagNumber(13)
  set verifiedBy($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasVerifiedBy() => $_has(12);
  @$pb.TagNumber(13)
  void clearVerifiedBy() => clearField(13);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
