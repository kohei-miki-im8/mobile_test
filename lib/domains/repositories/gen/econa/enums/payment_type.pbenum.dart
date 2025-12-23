//
//  Generated code. Do not modify.
//  source: econa/enums/payment_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 決済タイプ
class PaymentType extends $pb.ProtobufEnum {
  static const PaymentType PAYMENT_TYPE_UNSPECIFIED = PaymentType._(0, _omitEnumNames ? '' : 'PAYMENT_TYPE_UNSPECIFIED');
  static const PaymentType PAYMENT_TYPE_ONE_TIME = PaymentType._(1, _omitEnumNames ? '' : 'PAYMENT_TYPE_ONE_TIME');
  static const PaymentType PAYMENT_TYPE_RECURRING = PaymentType._(2, _omitEnumNames ? '' : 'PAYMENT_TYPE_RECURRING');

  static const $core.List<PaymentType> values = <PaymentType> [
    PAYMENT_TYPE_UNSPECIFIED,
    PAYMENT_TYPE_ONE_TIME,
    PAYMENT_TYPE_RECURRING,
  ];

  static final $core.Map<$core.int, PaymentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PaymentType? valueOf($core.int value) => _byValue[value];

  const PaymentType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
