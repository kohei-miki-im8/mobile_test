//
//  Generated code. Do not modify.
//  source: econa/enums/service_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// プライベートモード期間
class ServiceCode extends $pb.ProtobufEnum {
  static const ServiceCode SERVICE_CODE_UNSPECIFIED = ServiceCode._(0, _omitEnumNames ? '' : 'SERVICE_CODE_UNSPECIFIED');
  static const ServiceCode SERVICE_CODE_LIKE = ServiceCode._(1, _omitEnumNames ? '' : 'SERVICE_CODE_LIKE');
  static const ServiceCode SERVICE_CODE_MATCHING_CONSUME = ServiceCode._(100, _omitEnumNames ? '' : 'SERVICE_CODE_MATCHING_CONSUME');
  static const ServiceCode SERVICE_CODE_MP_SUPER_LIKE = ServiceCode._(101, _omitEnumNames ? '' : 'SERVICE_CODE_MP_SUPER_LIKE');
  static const ServiceCode SERVICE_CODE_MP_BOOST = ServiceCode._(102, _omitEnumNames ? '' : 'SERVICE_CODE_MP_BOOST');
  static const ServiceCode SERVICE_CODE_MP_READ_CHECK = ServiceCode._(103, _omitEnumNames ? '' : 'SERVICE_CODE_MP_READ_CHECK');
  static const ServiceCode SERVICE_CODE_MP_APPEAL = ServiceCode._(104, _omitEnumNames ? '' : 'SERVICE_CODE_MP_APPEAL');
  static const ServiceCode SERVICE_CODE_MP_PRIVATE_MODE_1_MONTH = ServiceCode._(105, _omitEnumNames ? '' : 'SERVICE_CODE_MP_PRIVATE_MODE_1_MONTH');
  static const ServiceCode SERVICE_CODE_MP_PRIVATE_MODE_3_MONTH = ServiceCode._(106, _omitEnumNames ? '' : 'SERVICE_CODE_MP_PRIVATE_MODE_3_MONTH');
  static const ServiceCode SERVICE_CODE_MP_PRIVATE_MODE_6_MONTH = ServiceCode._(107, _omitEnumNames ? '' : 'SERVICE_CODE_MP_PRIVATE_MODE_6_MONTH');
  static const ServiceCode SERVICE_CODE_LP_QUESTION = ServiceCode._(201, _omitEnumNames ? '' : 'SERVICE_CODE_LP_QUESTION');
  static const ServiceCode SERVICE_CODE_LP_QUESTION_VIEW = ServiceCode._(202, _omitEnumNames ? '' : 'SERVICE_CODE_LP_QUESTION_VIEW');
  static const ServiceCode SERVICE_CODE_LP_COUNSELOR = ServiceCode._(203, _omitEnumNames ? '' : 'SERVICE_CODE_LP_COUNSELOR');
  static const ServiceCode SERVICE_CODE_LP_CHAT_SIMULATOR = ServiceCode._(204, _omitEnumNames ? '' : 'SERVICE_CODE_LP_CHAT_SIMULATOR');
  static const ServiceCode SERVICE_CODE_LP_SUPER_RECOMMEND = ServiceCode._(205, _omitEnumNames ? '' : 'SERVICE_CODE_LP_SUPER_RECOMMEND');
  static const ServiceCode SERVICE_CODE_LP_CHAT_TOPIC = ServiceCode._(206, _omitEnumNames ? '' : 'SERVICE_CODE_LP_CHAT_TOPIC');
  static const ServiceCode SERVICE_CODE_LP_PERSONA_GREETING = ServiceCode._(207, _omitEnumNames ? '' : 'SERVICE_CODE_LP_PERSONA_GREETING');
  static const ServiceCode SERVICE_CODE_LP_PERSONA_REPLY = ServiceCode._(208, _omitEnumNames ? '' : 'SERVICE_CODE_LP_PERSONA_REPLY');
  static const ServiceCode SERVICE_CODE_REGISTRATION_BONUS_PROFILE_PHOTO = ServiceCode._(301, _omitEnumNames ? '' : 'SERVICE_CODE_REGISTRATION_BONUS_PROFILE_PHOTO');
  static const ServiceCode SERVICE_CODE_REGISTRATION_BONUS_PROFILE_INTRODUCTORY = ServiceCode._(302, _omitEnumNames ? '' : 'SERVICE_CODE_REGISTRATION_BONUS_PROFILE_INTRODUCTORY');

  static const $core.List<ServiceCode> values = <ServiceCode> [
    SERVICE_CODE_UNSPECIFIED,
    SERVICE_CODE_LIKE,
    SERVICE_CODE_MATCHING_CONSUME,
    SERVICE_CODE_MP_SUPER_LIKE,
    SERVICE_CODE_MP_BOOST,
    SERVICE_CODE_MP_READ_CHECK,
    SERVICE_CODE_MP_APPEAL,
    SERVICE_CODE_MP_PRIVATE_MODE_1_MONTH,
    SERVICE_CODE_MP_PRIVATE_MODE_3_MONTH,
    SERVICE_CODE_MP_PRIVATE_MODE_6_MONTH,
    SERVICE_CODE_LP_QUESTION,
    SERVICE_CODE_LP_QUESTION_VIEW,
    SERVICE_CODE_LP_COUNSELOR,
    SERVICE_CODE_LP_CHAT_SIMULATOR,
    SERVICE_CODE_LP_SUPER_RECOMMEND,
    SERVICE_CODE_LP_CHAT_TOPIC,
    SERVICE_CODE_LP_PERSONA_GREETING,
    SERVICE_CODE_LP_PERSONA_REPLY,
    SERVICE_CODE_REGISTRATION_BONUS_PROFILE_PHOTO,
    SERVICE_CODE_REGISTRATION_BONUS_PROFILE_INTRODUCTORY,
  ];

  static final $core.Map<$core.int, ServiceCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ServiceCode? valueOf($core.int value) => _byValue[value];

  const ServiceCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
