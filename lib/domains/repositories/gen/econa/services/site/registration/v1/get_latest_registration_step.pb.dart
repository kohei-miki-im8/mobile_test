//
//  Generated code. Do not modify.
//  source: econa/services/site/registration/v1/get_latest_registration_step.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/registration_step.pbenum.dart' as $174;

/// 最新の登録ステップ取得リクエスト
class GetLatestRegistrationStepRequest extends $pb.GeneratedMessage {
  factory GetLatestRegistrationStepRequest() => create();
  GetLatestRegistrationStepRequest._() : super();
  factory GetLatestRegistrationStepRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLatestRegistrationStepRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLatestRegistrationStepRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.registration.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLatestRegistrationStepRequest clone() => GetLatestRegistrationStepRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLatestRegistrationStepRequest copyWith(void Function(GetLatestRegistrationStepRequest) updates) => super.copyWith((message) => updates(message as GetLatestRegistrationStepRequest)) as GetLatestRegistrationStepRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLatestRegistrationStepRequest create() => GetLatestRegistrationStepRequest._();
  GetLatestRegistrationStepRequest createEmptyInstance() => create();
  static $pb.PbList<GetLatestRegistrationStepRequest> createRepeated() => $pb.PbList<GetLatestRegistrationStepRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLatestRegistrationStepRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLatestRegistrationStepRequest>(create);
  static GetLatestRegistrationStepRequest? _defaultInstance;
}

/// 最新の登録ステップ取得レスポンス
class GetLatestRegistrationStepResponse extends $pb.GeneratedMessage {
  factory GetLatestRegistrationStepResponse({
    $174.RegistrationStep? registrationStep,
  }) {
    final $result = create();
    if (registrationStep != null) {
      $result.registrationStep = registrationStep;
    }
    return $result;
  }
  GetLatestRegistrationStepResponse._() : super();
  factory GetLatestRegistrationStepResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLatestRegistrationStepResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLatestRegistrationStepResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.registration.v1'), createEmptyInstance: create)
    ..e<$174.RegistrationStep>(1, _omitFieldNames ? '' : 'registrationStep', $pb.PbFieldType.OE, defaultOrMaker: $174.RegistrationStep.REGISTRATION_STEP_UNSPECIFIED, valueOf: $174.RegistrationStep.valueOf, enumValues: $174.RegistrationStep.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLatestRegistrationStepResponse clone() => GetLatestRegistrationStepResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLatestRegistrationStepResponse copyWith(void Function(GetLatestRegistrationStepResponse) updates) => super.copyWith((message) => updates(message as GetLatestRegistrationStepResponse)) as GetLatestRegistrationStepResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLatestRegistrationStepResponse create() => GetLatestRegistrationStepResponse._();
  GetLatestRegistrationStepResponse createEmptyInstance() => create();
  static $pb.PbList<GetLatestRegistrationStepResponse> createRepeated() => $pb.PbList<GetLatestRegistrationStepResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLatestRegistrationStepResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLatestRegistrationStepResponse>(create);
  static GetLatestRegistrationStepResponse? _defaultInstance;

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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
