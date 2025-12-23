//
//  Generated code. Do not modify.
//  source: econa/enums/access_protocol.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// アクセスプロトコル
class AccessProtocol extends $pb.ProtobufEnum {
  static const AccessProtocol ACCESS_PROTOCOL_UNSPECIFIED = AccessProtocol._(0, _omitEnumNames ? '' : 'ACCESS_PROTOCOL_UNSPECIFIED');
  static const AccessProtocol ACCESS_PROTOCOL_GRPC = AccessProtocol._(1, _omitEnumNames ? '' : 'ACCESS_PROTOCOL_GRPC');
  static const AccessProtocol ACCESS_PROTOCOL_CONNECT = AccessProtocol._(2, _omitEnumNames ? '' : 'ACCESS_PROTOCOL_CONNECT');
  static const AccessProtocol ACCESS_PROTOCOL_REST = AccessProtocol._(3, _omitEnumNames ? '' : 'ACCESS_PROTOCOL_REST');
  static const AccessProtocol ACCESS_PROTOCOL_WEBSOCKET = AccessProtocol._(4, _omitEnumNames ? '' : 'ACCESS_PROTOCOL_WEBSOCKET');

  static const $core.List<AccessProtocol> values = <AccessProtocol> [
    ACCESS_PROTOCOL_UNSPECIFIED,
    ACCESS_PROTOCOL_GRPC,
    ACCESS_PROTOCOL_CONNECT,
    ACCESS_PROTOCOL_REST,
    ACCESS_PROTOCOL_WEBSOCKET,
  ];

  static final $core.Map<$core.int, AccessProtocol> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AccessProtocol? valueOf($core.int value) => _byValue[value];

  const AccessProtocol._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
