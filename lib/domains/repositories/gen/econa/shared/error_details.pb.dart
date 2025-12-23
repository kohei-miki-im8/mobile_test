//
//  Generated code. Do not modify.
//  source: econa/shared/error_details.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../enums/error_code.pbenum.dart' as $200;

/// ErrorDetails provides structured error information for API responses
class ErrorDetails extends $pb.GeneratedMessage {
  factory ErrorDetails({
    $200.ErrorCode? errorCode,
    $core.String? userAction,
    $core.Map<$core.String, $core.String>? details,
    $core.String? message,
  }) {
    final $result = create();
    if (errorCode != null) {
      $result.errorCode = errorCode;
    }
    if (userAction != null) {
      $result.userAction = userAction;
    }
    if (details != null) {
      $result.details.addAll(details);
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  ErrorDetails._() : super();
  factory ErrorDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ErrorDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ErrorDetails', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..e<$200.ErrorCode>(1, _omitFieldNames ? '' : 'errorCode', $pb.PbFieldType.OE, defaultOrMaker: $200.ErrorCode.ERROR_CODE_UNSPECIFIED, valueOf: $200.ErrorCode.valueOf, enumValues: $200.ErrorCode.values)
    ..aOS(2, _omitFieldNames ? '' : 'userAction')
    ..m<$core.String, $core.String>(3, _omitFieldNames ? '' : 'details', entryClassName: 'ErrorDetails.DetailsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('econa.shared'))
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ErrorDetails clone() => ErrorDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ErrorDetails copyWith(void Function(ErrorDetails) updates) => super.copyWith((message) => updates(message as ErrorDetails)) as ErrorDetails;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ErrorDetails create() => ErrorDetails._();
  ErrorDetails createEmptyInstance() => create();
  static $pb.PbList<ErrorDetails> createRepeated() => $pb.PbList<ErrorDetails>();
  @$core.pragma('dart2js:noInline')
  static ErrorDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ErrorDetails>(create);
  static ErrorDetails? _defaultInstance;

  /// Business error code for client-side handling (type-safe enum)
  @$pb.TagNumber(1)
  $200.ErrorCode get errorCode => $_getN(0);
  @$pb.TagNumber(1)
  set errorCode($200.ErrorCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorCode() => clearField(1);

  /// Recommended action for the user
  @$pb.TagNumber(2)
  $core.String get userAction => $_getSZ(1);
  @$pb.TagNumber(2)
  set userAction($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserAction() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserAction() => clearField(2);

  /// Additional structured details about the error
  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.String> get details => $_getMap(2);

  /// Human-readable error message (already in main error)
  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
