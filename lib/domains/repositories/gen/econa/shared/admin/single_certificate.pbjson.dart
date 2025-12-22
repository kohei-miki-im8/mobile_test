//
//  Generated code. Do not modify.
//  source: econa/shared/admin/single_certificate.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use singleCertificateDescriptor instead')
const SingleCertificate$json = {
  '1': 'SingleCertificate',
  '2': [
    {'1': 'single_certificate_photo_id', '3': 1, '4': 1, '5': 9, '10': 'singleCertificatePhotoId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'certificate_type', '3': 3, '4': 1, '5': 14, '6': '.econa.enums.SingleCertificateType', '10': 'certificateType'},
    {'1': 'photo_url', '3': 4, '4': 1, '5': 9, '10': 'photoUrl'},
    {'1': 'verification_status', '3': 5, '4': 1, '5': 14, '6': '.econa.enums.VerificationStatusCode', '10': 'verificationStatus'},
    {'1': 'submitted_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'submittedAt'},
    {'1': 'verified_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'verifiedAt'},
    {'1': 'expires_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiresAt'},
    {'1': 'auto_delete_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'autoDeleteAt'},
    {'1': 'rejection_reason_code', '3': 10, '4': 1, '5': 14, '6': '.econa.enums.RejectionReasonCode', '10': 'rejectionReasonCode'},
    {'1': 'rejection_reason_detail', '3': 11, '4': 1, '5': 9, '10': 'rejectionReasonDetail'},
    {'1': 'verification_memo', '3': 12, '4': 1, '5': 9, '10': 'verificationMemo'},
    {'1': 'verified_by', '3': 13, '4': 1, '5': 9, '10': 'verifiedBy'},
  ],
};

/// Descriptor for `SingleCertificate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List singleCertificateDescriptor = $convert.base64Decode(
    'ChFTaW5nbGVDZXJ0aWZpY2F0ZRI9ChtzaW5nbGVfY2VydGlmaWNhdGVfcGhvdG9faWQYASABKA'
    'lSGHNpbmdsZUNlcnRpZmljYXRlUGhvdG9JZBIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSTQoQ'
    'Y2VydGlmaWNhdGVfdHlwZRgDIAEoDjIiLmVjb25hLmVudW1zLlNpbmdsZUNlcnRpZmljYXRlVH'
    'lwZVIPY2VydGlmaWNhdGVUeXBlEhsKCXBob3RvX3VybBgEIAEoCVIIcGhvdG9VcmwSVAoTdmVy'
    'aWZpY2F0aW9uX3N0YXR1cxgFIAEoDjIjLmVjb25hLmVudW1zLlZlcmlmaWNhdGlvblN0YXR1c0'
    'NvZGVSEnZlcmlmaWNhdGlvblN0YXR1cxI9CgxzdWJtaXR0ZWRfYXQYBiABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wUgtzdWJtaXR0ZWRBdBI7Cgt2ZXJpZmllZF9hdBgHIAEoCzIaLm'
    'dvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCnZlcmlmaWVkQXQSOQoKZXhwaXJlc19hdBgIIAEo'
    'CzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWV4cGlyZXNBdBJACg5hdXRvX2RlbGV0ZV'
    '9hdBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDGF1dG9EZWxldGVBdBJUChVy'
    'ZWplY3Rpb25fcmVhc29uX2NvZGUYCiABKA4yIC5lY29uYS5lbnVtcy5SZWplY3Rpb25SZWFzb2'
    '5Db2RlUhNyZWplY3Rpb25SZWFzb25Db2RlEjYKF3JlamVjdGlvbl9yZWFzb25fZGV0YWlsGAsg'
    'ASgJUhVyZWplY3Rpb25SZWFzb25EZXRhaWwSKwoRdmVyaWZpY2F0aW9uX21lbW8YDCABKAlSEH'
    'ZlcmlmaWNhdGlvbk1lbW8SHwoLdmVyaWZpZWRfYnkYDSABKAlSCnZlcmlmaWVkQnk=');

