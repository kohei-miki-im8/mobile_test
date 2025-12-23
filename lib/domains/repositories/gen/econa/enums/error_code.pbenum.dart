//
//  Generated code. Do not modify.
//  source: econa/enums/error_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// ErrorCode represents business-level error codes for API responses
/// API 応答向けのビジネスレベルエラーコード（日本語コメント付き）
/// Domain の ErrorCode と1:1で対応し、型安全なハンドリングを可能にする
class ErrorCode extends $pb.ProtobufEnum {
  static const ErrorCode ERROR_CODE_UNSPECIFIED = ErrorCode._(0, _omitEnumNames ? '' : 'ERROR_CODE_UNSPECIFIED');
  static const ErrorCode ERROR_CODE_VALIDATION_REQUIRED_FIELD = ErrorCode._(1001, _omitEnumNames ? '' : 'ERROR_CODE_VALIDATION_REQUIRED_FIELD');
  static const ErrorCode ERROR_CODE_VALIDATION_INVALID_FORMAT = ErrorCode._(1002, _omitEnumNames ? '' : 'ERROR_CODE_VALIDATION_INVALID_FORMAT');
  static const ErrorCode ERROR_CODE_VALIDATION_OUT_OF_RANGE = ErrorCode._(1003, _omitEnumNames ? '' : 'ERROR_CODE_VALIDATION_OUT_OF_RANGE');
  static const ErrorCode ERROR_CODE_VALIDATION_DUPLICATE_ENTRY = ErrorCode._(1004, _omitEnumNames ? '' : 'ERROR_CODE_VALIDATION_DUPLICATE_ENTRY');
  static const ErrorCode ERROR_CODE_VALIDATION_INVALID_STATE = ErrorCode._(1005, _omitEnumNames ? '' : 'ERROR_CODE_VALIDATION_INVALID_STATE');
  static const ErrorCode ERROR_CODE_USER_NOT_FOUND = ErrorCode._(2001, _omitEnumNames ? '' : 'ERROR_CODE_USER_NOT_FOUND');
  static const ErrorCode ERROR_CODE_USER_NOT_AUTHENTICATED = ErrorCode._(2002, _omitEnumNames ? '' : 'ERROR_CODE_USER_NOT_AUTHENTICATED');
  static const ErrorCode ERROR_CODE_USER_PREMIUM_REQUIRED = ErrorCode._(2003, _omitEnumNames ? '' : 'ERROR_CODE_USER_PREMIUM_REQUIRED');
  static const ErrorCode ERROR_CODE_USER_ACCOUNT_LIMITED = ErrorCode._(2004, _omitEnumNames ? '' : 'ERROR_CODE_USER_ACCOUNT_LIMITED');
  static const ErrorCode ERROR_CODE_USER_ALREADY_EXISTS = ErrorCode._(2005, _omitEnumNames ? '' : 'ERROR_CODE_USER_ALREADY_EXISTS');
  static const ErrorCode ERROR_CODE_USER_INVALID_CREDENTIALS = ErrorCode._(2006, _omitEnumNames ? '' : 'ERROR_CODE_USER_INVALID_CREDENTIALS');
  static const ErrorCode ERROR_CODE_USER_ACCOUNT_SUSPENDED = ErrorCode._(2007, _omitEnumNames ? '' : 'ERROR_CODE_USER_ACCOUNT_SUSPENDED');
  static const ErrorCode ERROR_CODE_USER_ACCOUNT_DELETED = ErrorCode._(2008, _omitEnumNames ? '' : 'ERROR_CODE_USER_ACCOUNT_DELETED');
  static const ErrorCode ERROR_CODE_USER_EMAIL_NOT_VERIFIED = ErrorCode._(2009, _omitEnumNames ? '' : 'ERROR_CODE_USER_EMAIL_NOT_VERIFIED');
  static const ErrorCode ERROR_CODE_USER_PHONE_NOT_VERIFIED = ErrorCode._(2010, _omitEnumNames ? '' : 'ERROR_CODE_USER_PHONE_NOT_VERIFIED');
  static const ErrorCode ERROR_CODE_POINT_INSUFFICIENT = ErrorCode._(3001, _omitEnumNames ? '' : 'ERROR_CODE_POINT_INSUFFICIENT');
  static const ErrorCode ERROR_CODE_POINT_LIMIT_EXCEEDED = ErrorCode._(3002, _omitEnumNames ? '' : 'ERROR_CODE_POINT_LIMIT_EXCEEDED');
  static const ErrorCode ERROR_CODE_POINT_INVALID_AMOUNT = ErrorCode._(3003, _omitEnumNames ? '' : 'ERROR_CODE_POINT_INVALID_AMOUNT');
  static const ErrorCode ERROR_CODE_POINT_TRANSACTION_FAILED = ErrorCode._(3004, _omitEnumNames ? '' : 'ERROR_CODE_POINT_TRANSACTION_FAILED');
  static const ErrorCode ERROR_CODE_POINT_EXPIRED = ErrorCode._(3005, _omitEnumNames ? '' : 'ERROR_CODE_POINT_EXPIRED');
  static const ErrorCode ERROR_CODE_BOOST_ALREADY_ACTIVE = ErrorCode._(4001, _omitEnumNames ? '' : 'ERROR_CODE_BOOST_ALREADY_ACTIVE');
  static const ErrorCode ERROR_CODE_BOOST_NOT_FOUND = ErrorCode._(4002, _omitEnumNames ? '' : 'ERROR_CODE_BOOST_NOT_FOUND');
  static const ErrorCode ERROR_CODE_BOOST_LIMIT_EXCEEDED = ErrorCode._(4003, _omitEnumNames ? '' : 'ERROR_CODE_BOOST_LIMIT_EXCEEDED');
  static const ErrorCode ERROR_CODE_BOOST_INVALID_DURATION = ErrorCode._(4004, _omitEnumNames ? '' : 'ERROR_CODE_BOOST_INVALID_DURATION');
  static const ErrorCode ERROR_CODE_BOOST_ALREADY_CANCELED = ErrorCode._(4005, _omitEnumNames ? '' : 'ERROR_CODE_BOOST_ALREADY_CANCELED');
  static const ErrorCode ERROR_CODE_EKYC_DUPLICATE_SUBMISSION = ErrorCode._(5001, _omitEnumNames ? '' : 'ERROR_CODE_EKYC_DUPLICATE_SUBMISSION');
  static const ErrorCode ERROR_CODE_EKYC_VERIFICATION_FAILED = ErrorCode._(5002, _omitEnumNames ? '' : 'ERROR_CODE_EKYC_VERIFICATION_FAILED');
  static const ErrorCode ERROR_CODE_EKYC_ALREADY_VERIFIED = ErrorCode._(5003, _omitEnumNames ? '' : 'ERROR_CODE_EKYC_ALREADY_VERIFIED');
  static const ErrorCode ERROR_CODE_EKYC_DOCUMENT_INVALID = ErrorCode._(5004, _omitEnumNames ? '' : 'ERROR_CODE_EKYC_DOCUMENT_INVALID');
  static const ErrorCode ERROR_CODE_EKYC_FACE_MISMATCH = ErrorCode._(5005, _omitEnumNames ? '' : 'ERROR_CODE_EKYC_FACE_MISMATCH');
  static const ErrorCode ERROR_CODE_EKYC_AGE_REQUIREMENT = ErrorCode._(5006, _omitEnumNames ? '' : 'ERROR_CODE_EKYC_AGE_REQUIREMENT');
  static const ErrorCode ERROR_CODE_CHAT_ROOM_NOT_FOUND = ErrorCode._(6001, _omitEnumNames ? '' : 'ERROR_CODE_CHAT_ROOM_NOT_FOUND');
  static const ErrorCode ERROR_CODE_CHAT_MESSAGE_TOO_LONG = ErrorCode._(6002, _omitEnumNames ? '' : 'ERROR_CODE_CHAT_MESSAGE_TOO_LONG');
  static const ErrorCode ERROR_CODE_CHAT_BLOCKED_USER = ErrorCode._(6003, _omitEnumNames ? '' : 'ERROR_CODE_CHAT_BLOCKED_USER');
  static const ErrorCode ERROR_CODE_CHAT_RATE_LIMIT = ErrorCode._(6004, _omitEnumNames ? '' : 'ERROR_CODE_CHAT_RATE_LIMIT');
  static const ErrorCode ERROR_CODE_PAYMENT_FAILED = ErrorCode._(7001, _omitEnumNames ? '' : 'ERROR_CODE_PAYMENT_FAILED');
  static const ErrorCode ERROR_CODE_PAYMENT_CARD_DECLINED = ErrorCode._(7002, _omitEnumNames ? '' : 'ERROR_CODE_PAYMENT_CARD_DECLINED');
  static const ErrorCode ERROR_CODE_PAYMENT_INSUFFICIENT_FUNDS = ErrorCode._(7003, _omitEnumNames ? '' : 'ERROR_CODE_PAYMENT_INSUFFICIENT_FUNDS');
  static const ErrorCode ERROR_CODE_PAYMENT_EXPIRED_CARD = ErrorCode._(7004, _omitEnumNames ? '' : 'ERROR_CODE_PAYMENT_EXPIRED_CARD');
  static const ErrorCode ERROR_CODE_PAYMENT_INVALID_CARD = ErrorCode._(7005, _omitEnumNames ? '' : 'ERROR_CODE_PAYMENT_INVALID_CARD');
  static const ErrorCode ERROR_CODE_EXTERNAL_SERVICE_UNAVAILABLE = ErrorCode._(8001, _omitEnumNames ? '' : 'ERROR_CODE_EXTERNAL_SERVICE_UNAVAILABLE');
  static const ErrorCode ERROR_CODE_EXTERNAL_SERVICE_TIMEOUT = ErrorCode._(8002, _omitEnumNames ? '' : 'ERROR_CODE_EXTERNAL_SERVICE_TIMEOUT');
  static const ErrorCode ERROR_CODE_EXTERNAL_AUTH_FAILED = ErrorCode._(8003, _omitEnumNames ? '' : 'ERROR_CODE_EXTERNAL_AUTH_FAILED');
  static const ErrorCode ERROR_CODE_EXTERNAL_RATE_LIMIT = ErrorCode._(8004, _omitEnumNames ? '' : 'ERROR_CODE_EXTERNAL_RATE_LIMIT');
  static const ErrorCode ERROR_CODE_CACHE_MISS = ErrorCode._(8501, _omitEnumNames ? '' : 'ERROR_CODE_CACHE_MISS');
  static const ErrorCode ERROR_CODE_CACHE_UNAVAILABLE = ErrorCode._(8502, _omitEnumNames ? '' : 'ERROR_CODE_CACHE_UNAVAILABLE');
  static const ErrorCode ERROR_CODE_CACHE_TIMEOUT = ErrorCode._(8503, _omitEnumNames ? '' : 'ERROR_CODE_CACHE_TIMEOUT');
  static const ErrorCode ERROR_CODE_CACHE_INVALID_DATA = ErrorCode._(8504, _omitEnumNames ? '' : 'ERROR_CODE_CACHE_INVALID_DATA');
  static const ErrorCode ERROR_CODE_SYSTEM_INTERNAL = ErrorCode._(9001, _omitEnumNames ? '' : 'ERROR_CODE_SYSTEM_INTERNAL');
  static const ErrorCode ERROR_CODE_SYSTEM_UNAVAILABLE = ErrorCode._(9002, _omitEnumNames ? '' : 'ERROR_CODE_SYSTEM_UNAVAILABLE');
  static const ErrorCode ERROR_CODE_SYSTEM_TIMEOUT = ErrorCode._(9003, _omitEnumNames ? '' : 'ERROR_CODE_SYSTEM_TIMEOUT');
  static const ErrorCode ERROR_CODE_SYSTEM_DATABASE = ErrorCode._(9004, _omitEnumNames ? '' : 'ERROR_CODE_SYSTEM_DATABASE');
  static const ErrorCode ERROR_CODE_SYSTEM_NETWORK = ErrorCode._(9005, _omitEnumNames ? '' : 'ERROR_CODE_SYSTEM_NETWORK');
  static const ErrorCode ERROR_CODE_SYSTEM_OPTIMISTIC_LOCK_CONFLICT = ErrorCode._(9100, _omitEnumNames ? '' : 'ERROR_CODE_SYSTEM_OPTIMISTIC_LOCK_CONFLICT');

  static const $core.List<ErrorCode> values = <ErrorCode> [
    ERROR_CODE_UNSPECIFIED,
    ERROR_CODE_VALIDATION_REQUIRED_FIELD,
    ERROR_CODE_VALIDATION_INVALID_FORMAT,
    ERROR_CODE_VALIDATION_OUT_OF_RANGE,
    ERROR_CODE_VALIDATION_DUPLICATE_ENTRY,
    ERROR_CODE_VALIDATION_INVALID_STATE,
    ERROR_CODE_USER_NOT_FOUND,
    ERROR_CODE_USER_NOT_AUTHENTICATED,
    ERROR_CODE_USER_PREMIUM_REQUIRED,
    ERROR_CODE_USER_ACCOUNT_LIMITED,
    ERROR_CODE_USER_ALREADY_EXISTS,
    ERROR_CODE_USER_INVALID_CREDENTIALS,
    ERROR_CODE_USER_ACCOUNT_SUSPENDED,
    ERROR_CODE_USER_ACCOUNT_DELETED,
    ERROR_CODE_USER_EMAIL_NOT_VERIFIED,
    ERROR_CODE_USER_PHONE_NOT_VERIFIED,
    ERROR_CODE_POINT_INSUFFICIENT,
    ERROR_CODE_POINT_LIMIT_EXCEEDED,
    ERROR_CODE_POINT_INVALID_AMOUNT,
    ERROR_CODE_POINT_TRANSACTION_FAILED,
    ERROR_CODE_POINT_EXPIRED,
    ERROR_CODE_BOOST_ALREADY_ACTIVE,
    ERROR_CODE_BOOST_NOT_FOUND,
    ERROR_CODE_BOOST_LIMIT_EXCEEDED,
    ERROR_CODE_BOOST_INVALID_DURATION,
    ERROR_CODE_BOOST_ALREADY_CANCELED,
    ERROR_CODE_EKYC_DUPLICATE_SUBMISSION,
    ERROR_CODE_EKYC_VERIFICATION_FAILED,
    ERROR_CODE_EKYC_ALREADY_VERIFIED,
    ERROR_CODE_EKYC_DOCUMENT_INVALID,
    ERROR_CODE_EKYC_FACE_MISMATCH,
    ERROR_CODE_EKYC_AGE_REQUIREMENT,
    ERROR_CODE_CHAT_ROOM_NOT_FOUND,
    ERROR_CODE_CHAT_MESSAGE_TOO_LONG,
    ERROR_CODE_CHAT_BLOCKED_USER,
    ERROR_CODE_CHAT_RATE_LIMIT,
    ERROR_CODE_PAYMENT_FAILED,
    ERROR_CODE_PAYMENT_CARD_DECLINED,
    ERROR_CODE_PAYMENT_INSUFFICIENT_FUNDS,
    ERROR_CODE_PAYMENT_EXPIRED_CARD,
    ERROR_CODE_PAYMENT_INVALID_CARD,
    ERROR_CODE_EXTERNAL_SERVICE_UNAVAILABLE,
    ERROR_CODE_EXTERNAL_SERVICE_TIMEOUT,
    ERROR_CODE_EXTERNAL_AUTH_FAILED,
    ERROR_CODE_EXTERNAL_RATE_LIMIT,
    ERROR_CODE_CACHE_MISS,
    ERROR_CODE_CACHE_UNAVAILABLE,
    ERROR_CODE_CACHE_TIMEOUT,
    ERROR_CODE_CACHE_INVALID_DATA,
    ERROR_CODE_SYSTEM_INTERNAL,
    ERROR_CODE_SYSTEM_UNAVAILABLE,
    ERROR_CODE_SYSTEM_TIMEOUT,
    ERROR_CODE_SYSTEM_DATABASE,
    ERROR_CODE_SYSTEM_NETWORK,
    ERROR_CODE_SYSTEM_OPTIMISTIC_LOCK_CONFLICT,
  ];

  static final $core.Map<$core.int, ErrorCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ErrorCode? valueOf($core.int value) => _byValue[value];

  const ErrorCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
