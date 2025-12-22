//
//  Generated code. Do not modify.
//  source: econa/shared/skip_history_entry.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use skipHistoryEntryDescriptor instead')
const SkipHistoryEntry$json = {
  '1': 'SkipHistoryEntry',
  '2': [
    {'1': 'profile_photo_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'profilePhotoId'},
    {'1': 'target_user_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'targetUserId'},
    {'1': 'skipped_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'skippedAt'},
    {'1': 'skip_reason', '3': 4, '4': 1, '5': 9, '10': 'skipReason'},
  ],
};

/// Descriptor for `SkipHistoryEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List skipHistoryEntryDescriptor = $convert.base64Decode(
    'ChBTa2lwSGlzdG9yeUVudHJ5EjIKEHByb2ZpbGVfcGhvdG9faWQYASABKAlCCLpIBXIDsAEBUg'
    '5wcm9maWxlUGhvdG9JZBIuCg50YXJnZXRfdXNlcl9pZBgCIAEoCUIIukgFcgOwAQFSDHRhcmdl'
    'dFVzZXJJZBI5Cgpza2lwcGVkX2F0GAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcF'
    'IJc2tpcHBlZEF0Eh8KC3NraXBfcmVhc29uGAQgASgJUgpza2lwUmVhc29u');

