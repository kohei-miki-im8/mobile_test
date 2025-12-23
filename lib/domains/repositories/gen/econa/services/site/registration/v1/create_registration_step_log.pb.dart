//
//  Generated code. Do not modify.
//  source: econa/services/site/registration/v1/create_registration_step_log.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/registration_step.pbenum.dart' as $174;

/// 登録ステップログ作成リクエスト
class CreateRegistrationStepLogRequest extends $pb.GeneratedMessage {
  factory CreateRegistrationStepLogRequest({
    $174.RegistrationStep? registrationStep,
  }) {
    final $result = create();
    if (registrationStep != null) {
      $result.registrationStep = registrationStep;
    }
    return $result;
  }
  CreateRegistrationStepLogRequest._() : super();
  factory CreateRegistrationStepLogRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRegistrationStepLogRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRegistrationStepLogRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.registration.v1'), createEmptyInstance: create)
    ..e<$174.RegistrationStep>(1, _omitFieldNames ? '' : 'registrationStep', $pb.PbFieldType.OE, defaultOrMaker: $174.RegistrationStep.REGISTRATION_STEP_UNSPECIFIED, valueOf: $174.RegistrationStep.valueOf, enumValues: $174.RegistrationStep.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRegistrationStepLogRequest clone() => CreateRegistrationStepLogRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRegistrationStepLogRequest copyWith(void Function(CreateRegistrationStepLogRequest) updates) => super.copyWith((message) => updates(message as CreateRegistrationStepLogRequest)) as CreateRegistrationStepLogRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRegistrationStepLogRequest create() => CreateRegistrationStepLogRequest._();
  CreateRegistrationStepLogRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRegistrationStepLogRequest> createRepeated() => $pb.PbList<CreateRegistrationStepLogRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRegistrationStepLogRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRegistrationStepLogRequest>(create);
  static CreateRegistrationStepLogRequest? _defaultInstance;

  /// 登録ステップ
  @$pb.TagNumber(1)
  $174.RegistrationStep get registrationStep => $_getN(0);
  @$pb.TagNumber(1)
  set registrationStep($174.RegistrationStep v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRegistrationStep() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegistrationStep() => clearField(1);
}

/// 登録ステップログ作成レスポンス
class CreateRegistrationStepLogResponse extends $pb.GeneratedMessage {
  factory CreateRegistrationStepLogResponse() => create();
  CreateRegistrationStepLogResponse._() : super();
  factory CreateRegistrationStepLogResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRegistrationStepLogResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRegistrationStepLogResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.registration.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRegistrationStepLogResponse clone() => CreateRegistrationStepLogResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRegistrationStepLogResponse copyWith(void Function(CreateRegistrationStepLogResponse) updates) => super.copyWith((message) => updates(message as CreateRegistrationStepLogResponse)) as CreateRegistrationStepLogResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRegistrationStepLogResponse create() => CreateRegistrationStepLogResponse._();
  CreateRegistrationStepLogResponse createEmptyInstance() => create();
  static $pb.PbList<CreateRegistrationStepLogResponse> createRepeated() => $pb.PbList<CreateRegistrationStepLogResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateRegistrationStepLogResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRegistrationStepLogResponse>(create);
  static CreateRegistrationStepLogResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
