//
//  Generated code. Do not modify.
//  source: econa/services/site/public/v1/get_server_info.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getServerInfoRequestDescriptor instead')
const GetServerInfoRequest$json = {
  '1': 'GetServerInfoRequest',
};

/// Descriptor for `GetServerInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getServerInfoRequestDescriptor = $convert.base64Decode(
    'ChRHZXRTZXJ2ZXJJbmZvUmVxdWVzdA==');

@$core.Deprecated('Use getServerInfoResponseDescriptor instead')
const GetServerInfoResponse$json = {
  '1': 'GetServerInfoResponse',
  '2': [
    {'1': 'environment', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.Environment', '8': {}, '10': 'environment'},
    {'1': 'version', '3': 2, '4': 1, '5': 11, '6': '.econa.services.site.public.v1.ServerVersion', '10': 'version'},
  ],
};

/// Descriptor for `GetServerInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getServerInfoResponseDescriptor = $convert.base64Decode(
    'ChVHZXRTZXJ2ZXJJbmZvUmVzcG9uc2USRgoLZW52aXJvbm1lbnQYASABKA4yGC5lY29uYS5lbn'
    'Vtcy5FbnZpcm9ubWVudEIKukgHggEEEAEgAFILZW52aXJvbm1lbnQSRgoHdmVyc2lvbhgCIAEo'
    'CzIsLmVjb25hLnNlcnZpY2VzLnNpdGUucHVibGljLnYxLlNlcnZlclZlcnNpb25SB3ZlcnNpb2'
    '4=');

@$core.Deprecated('Use serverVersionDescriptor instead')
const ServerVersion$json = {
  '1': 'ServerVersion',
  '2': [
    {'1': 'api_version', '3': 1, '4': 1, '5': 9, '10': 'apiVersion'},
    {'1': 'min_supported_api_base_path', '3': 2, '4': 1, '5': 9, '10': 'minSupportedApiBasePath'},
    {'1': 'android', '3': 3, '4': 1, '5': 11, '6': '.econa.services.site.public.v1.PlatformVersion', '10': 'android'},
    {'1': 'ios', '3': 4, '4': 1, '5': 11, '6': '.econa.services.site.public.v1.PlatformVersion', '10': 'ios'},
  ],
};

/// Descriptor for `ServerVersion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverVersionDescriptor = $convert.base64Decode(
    'Cg1TZXJ2ZXJWZXJzaW9uEh8KC2FwaV92ZXJzaW9uGAEgASgJUgphcGlWZXJzaW9uEjwKG21pbl'
    '9zdXBwb3J0ZWRfYXBpX2Jhc2VfcGF0aBgCIAEoCVIXbWluU3VwcG9ydGVkQXBpQmFzZVBhdGgS'
    'SAoHYW5kcm9pZBgDIAEoCzIuLmVjb25hLnNlcnZpY2VzLnNpdGUucHVibGljLnYxLlBsYXRmb3'
    'JtVmVyc2lvblIHYW5kcm9pZBJACgNpb3MYBCABKAsyLi5lY29uYS5zZXJ2aWNlcy5zaXRlLnB1'
    'YmxpYy52MS5QbGF0Zm9ybVZlcnNpb25SA2lvcw==');

@$core.Deprecated('Use platformVersionDescriptor instead')
const PlatformVersion$json = {
  '1': 'PlatformVersion',
  '2': [
    {'1': 'min_supported_client_version', '3': 1, '4': 1, '5': 9, '10': 'minSupportedClientVersion'},
    {'1': 'latest_client_version', '3': 2, '4': 1, '5': 9, '10': 'latestClientVersion'},
    {'1': 'force_update', '3': 3, '4': 1, '5': 8, '10': 'forceUpdate'},
    {'1': 'update_webview_url', '3': 4, '4': 1, '5': 9, '10': 'updateWebviewUrl'},
    {'1': 'update_title', '3': 5, '4': 1, '5': 9, '10': 'updateTitle'},
    {'1': 'update_message', '3': 6, '4': 1, '5': 9, '10': 'updateMessage'},
    {'1': 'release_notes', '3': 7, '4': 1, '5': 9, '10': 'releaseNotes'},
  ],
};

/// Descriptor for `PlatformVersion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List platformVersionDescriptor = $convert.base64Decode(
    'Cg9QbGF0Zm9ybVZlcnNpb24SPwocbWluX3N1cHBvcnRlZF9jbGllbnRfdmVyc2lvbhgBIAEoCV'
    'IZbWluU3VwcG9ydGVkQ2xpZW50VmVyc2lvbhIyChVsYXRlc3RfY2xpZW50X3ZlcnNpb24YAiAB'
    'KAlSE2xhdGVzdENsaWVudFZlcnNpb24SIQoMZm9yY2VfdXBkYXRlGAMgASgIUgtmb3JjZVVwZG'
    'F0ZRIsChJ1cGRhdGVfd2Vidmlld191cmwYBCABKAlSEHVwZGF0ZVdlYnZpZXdVcmwSIQoMdXBk'
    'YXRlX3RpdGxlGAUgASgJUgt1cGRhdGVUaXRsZRIlCg51cGRhdGVfbWVzc2FnZRgGIAEoCVINdX'
    'BkYXRlTWVzc2FnZRIjCg1yZWxlYXNlX25vdGVzGAcgASgJUgxyZWxlYXNlTm90ZXM=');

