//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/create_user_agreement_log.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/user_agreement_type.pbenum.dart' as $184;

/// 利用規約同意ログ作成リクエスト
class CreateUserAgreementLogRequest extends $pb.GeneratedMessage {
  factory CreateUserAgreementLogRequest({
    $184.UserAgreementType? agreementType,
  }) {
    final $result = create();
    if (agreementType != null) {
      $result.agreementType = agreementType;
    }
    return $result;
  }
  CreateUserAgreementLogRequest._() : super();
  factory CreateUserAgreementLogRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserAgreementLogRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateUserAgreementLogRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..e<$184.UserAgreementType>(1, _omitFieldNames ? '' : 'agreementType', $pb.PbFieldType.OE, defaultOrMaker: $184.UserAgreementType.USER_AGREEMENT_TYPE_UNSPECIFIED, valueOf: $184.UserAgreementType.valueOf, enumValues: $184.UserAgreementType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserAgreementLogRequest clone() => CreateUserAgreementLogRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserAgreementLogRequest copyWith(void Function(CreateUserAgreementLogRequest) updates) => super.copyWith((message) => updates(message as CreateUserAgreementLogRequest)) as CreateUserAgreementLogRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserAgreementLogRequest create() => CreateUserAgreementLogRequest._();
  CreateUserAgreementLogRequest createEmptyInstance() => create();
  static $pb.PbList<CreateUserAgreementLogRequest> createRepeated() => $pb.PbList<CreateUserAgreementLogRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateUserAgreementLogRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserAgreementLogRequest>(create);
  static CreateUserAgreementLogRequest? _defaultInstance;

  /// 利用規約同意タイプ
  @$pb.TagNumber(1)
  $184.UserAgreementType get agreementType => $_getN(0);
  @$pb.TagNumber(1)
  set agreementType($184.UserAgreementType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgreementType() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgreementType() => clearField(1);
}

/// 利用規約同意ログ作成レスポンス
class CreateUserAgreementLogResponse extends $pb.GeneratedMessage {
  factory CreateUserAgreementLogResponse({
    $core.String? userAgreementLogId,
  }) {
    final $result = create();
    if (userAgreementLogId != null) {
      $result.userAgreementLogId = userAgreementLogId;
    }
    return $result;
  }
  CreateUserAgreementLogResponse._() : super();
  factory CreateUserAgreementLogResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserAgreementLogResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateUserAgreementLogResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userAgreementLogId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserAgreementLogResponse clone() => CreateUserAgreementLogResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserAgreementLogResponse copyWith(void Function(CreateUserAgreementLogResponse) updates) => super.copyWith((message) => updates(message as CreateUserAgreementLogResponse)) as CreateUserAgreementLogResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserAgreementLogResponse create() => CreateUserAgreementLogResponse._();
  CreateUserAgreementLogResponse createEmptyInstance() => create();
  static $pb.PbList<CreateUserAgreementLogResponse> createRepeated() => $pb.PbList<CreateUserAgreementLogResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateUserAgreementLogResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserAgreementLogResponse>(create);
  static CreateUserAgreementLogResponse? _defaultInstance;

  /// 利用規約同意ログID
  @$pb.TagNumber(1)
  $core.String get userAgreementLogId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userAgreementLogId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserAgreementLogId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserAgreementLogId() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
