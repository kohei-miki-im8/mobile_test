//
//  Generated code. Do not modify.
//  source: econa/shared/admin/single_certificate_submission.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use singleCertificateSubmissionDescriptor instead')
const SingleCertificateSubmission$json = {
  '1': 'SingleCertificateSubmission',
  '2': [
    {'1': 'submission_id', '3': 1, '4': 1, '5': 9, '10': 'submissionId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'certificate_type', '3': 3, '4': 1, '5': 14, '6': '.econa.enums.SingleCertificateType', '10': 'certificateType'},
    {'1': 'verification_status', '3': 4, '4': 1, '5': 14, '6': '.econa.enums.VerificationStatusCode', '10': 'verificationStatus'},
    {'1': 'image_count', '3': 5, '4': 1, '5': 5, '10': 'imageCount'},
    {'1': 'submitted_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'submittedAt'},
    {'1': 'verified_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'verifiedAt'},
    {'1': 'expires_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiresAt'},
    {'1': 'auto_delete_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'autoDeleteAt'},
    {'1': 'rejection_reason_code', '3': 10, '4': 1, '5': 14, '6': '.econa.enums.RejectionReasonCode', '10': 'rejectionReasonCode'},
    {'1': 'rejection_reason_detail', '3': 11, '4': 1, '5': 9, '10': 'rejectionReasonDetail'},
    {'1': 'verification_memo', '3': 12, '4': 1, '5': 9, '10': 'verificationMemo'},
    {'1': 'verified_by', '3': 13, '4': 1, '5': 9, '10': 'verifiedBy'},
    {'1': 'photos', '3': 14, '4': 3, '5': 11, '6': '.econa.shared.admin.SingleCertificate', '10': 'photos'},
  ],
};

/// Descriptor for `SingleCertificateSubmission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List singleCertificateSubmissionDescriptor = $convert.base64Decode(
    'ChtTaW5nbGVDZXJ0aWZpY2F0ZVN1Ym1pc3Npb24SIwoNc3VibWlzc2lvbl9pZBgBIAEoCVIMc3'
    'VibWlzc2lvbklkEhcKB3VzZXJfaWQYAiABKAlSBnVzZXJJZBJNChBjZXJ0aWZpY2F0ZV90eXBl'
    'GAMgASgOMiIuZWNvbmEuZW51bXMuU2luZ2xlQ2VydGlmaWNhdGVUeXBlUg9jZXJ0aWZpY2F0ZV'
    'R5cGUSVAoTdmVyaWZpY2F0aW9uX3N0YXR1cxgEIAEoDjIjLmVjb25hLmVudW1zLlZlcmlmaWNh'
    'dGlvblN0YXR1c0NvZGVSEnZlcmlmaWNhdGlvblN0YXR1cxIfCgtpbWFnZV9jb3VudBgFIAEoBV'
    'IKaW1hZ2VDb3VudBI9CgxzdWJtaXR0ZWRfYXQYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGlt'
    'ZXN0YW1wUgtzdWJtaXR0ZWRBdBI7Cgt2ZXJpZmllZF9hdBgHIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBSCnZlcmlmaWVkQXQSOQoKZXhwaXJlc19hdBgIIAEoCzIaLmdvb2dsZS5w'
    'cm90b2J1Zi5UaW1lc3RhbXBSCWV4cGlyZXNBdBJACg5hdXRvX2RlbGV0ZV9hdBgJIAEoCzIaLm'
    'dvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDGF1dG9EZWxldGVBdBJUChVyZWplY3Rpb25fcmVh'
    'c29uX2NvZGUYCiABKA4yIC5lY29uYS5lbnVtcy5SZWplY3Rpb25SZWFzb25Db2RlUhNyZWplY3'
    'Rpb25SZWFzb25Db2RlEjYKF3JlamVjdGlvbl9yZWFzb25fZGV0YWlsGAsgASgJUhVyZWplY3Rp'
    'b25SZWFzb25EZXRhaWwSKwoRdmVyaWZpY2F0aW9uX21lbW8YDCABKAlSEHZlcmlmaWNhdGlvbk'
    '1lbW8SHwoLdmVyaWZpZWRfYnkYDSABKAlSCnZlcmlmaWVkQnkSPQoGcGhvdG9zGA4gAygLMiUu'
    'ZWNvbmEuc2hhcmVkLmFkbWluLlNpbmdsZUNlcnRpZmljYXRlUgZwaG90b3M=');

