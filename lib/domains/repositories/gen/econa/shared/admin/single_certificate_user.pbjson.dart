//
//  Generated code. Do not modify.
//  source: econa/shared/admin/single_certificate_user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use singleCertificateUserDescriptor instead')
const SingleCertificateUser$json = {
  '1': 'SingleCertificateUser',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'age', '3': 4, '4': 1, '5': 5, '10': 'age'},
    {'1': 'gender', '3': 5, '4': 1, '5': 9, '10': 'gender'},
    {'1': 'region', '3': 6, '4': 1, '5': 9, '10': 'region'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `SingleCertificateUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List singleCertificateUserDescriptor = $convert.base64Decode(
    'ChVTaW5nbGVDZXJ0aWZpY2F0ZVVzZXISFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhoKCG5pY2'
    'tuYW1lGAIgASgJUghuaWNrbmFtZRIUCgVlbWFpbBgDIAEoCVIFZW1haWwSEAoDYWdlGAQgASgF'
    'UgNhZ2USFgoGZ2VuZGVyGAUgASgJUgZnZW5kZXISFgoGcmVnaW9uGAYgASgJUgZyZWdpb24SOQ'
    'oKY3JlYXRlZF9hdBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRB'
    'dA==');

