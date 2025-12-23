//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_agreement_log.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/user_agreement_type.pbenum.dart' as $184;

/// 利用規約同意ログ取得リクエスト
class GetUserAgreementLogRequest extends $pb.GeneratedMessage {
  factory GetUserAgreementLogRequest({
    $184.UserAgreementType? agreementType,
  }) {
    final $result = create();
    if (agreementType != null) {
      $result.agreementType = agreementType;
    }
    return $result;
  }
  GetUserAgreementLogRequest._() : super();
  factory GetUserAgreementLogRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserAgreementLogRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserAgreementLogRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..e<$184.UserAgreementType>(1, _omitFieldNames ? '' : 'agreementType', $pb.PbFieldType.OE, defaultOrMaker: $184.UserAgreementType.USER_AGREEMENT_TYPE_UNSPECIFIED, valueOf: $184.UserAgreementType.valueOf, enumValues: $184.UserAgreementType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserAgreementLogRequest clone() => GetUserAgreementLogRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserAgreementLogRequest copyWith(void Function(GetUserAgreementLogRequest) updates) => super.copyWith((message) => updates(message as GetUserAgreementLogRequest)) as GetUserAgreementLogRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserAgreementLogRequest create() => GetUserAgreementLogRequest._();
  GetUserAgreementLogRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserAgreementLogRequest> createRepeated() => $pb.PbList<GetUserAgreementLogRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserAgreementLogRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserAgreementLogRequest>(create);
  static GetUserAgreementLogRequest? _defaultInstance;

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

/// 利用規約同意ログ取得レスポンス
class GetUserAgreementLogResponse extends $pb.GeneratedMessage {
  factory GetUserAgreementLogResponse({
    $core.bool? hasAgreed,
  }) {
    final $result = create();
    if (hasAgreed != null) {
      $result.hasAgreed = hasAgreed;
    }
    return $result;
  }
  GetUserAgreementLogResponse._() : super();
  factory GetUserAgreementLogResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserAgreementLogResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserAgreementLogResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasAgreed')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserAgreementLogResponse clone() => GetUserAgreementLogResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserAgreementLogResponse copyWith(void Function(GetUserAgreementLogResponse) updates) => super.copyWith((message) => updates(message as GetUserAgreementLogResponse)) as GetUserAgreementLogResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserAgreementLogResponse create() => GetUserAgreementLogResponse._();
  GetUserAgreementLogResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserAgreementLogResponse> createRepeated() => $pb.PbList<GetUserAgreementLogResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserAgreementLogResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserAgreementLogResponse>(create);
  static GetUserAgreementLogResponse? _defaultInstance;

  /// 利用規約同意区分
  @$pb.TagNumber(1)
  $core.bool get hasAgreed => $_getBF(0);
  @$pb.TagNumber(1)
  set hasAgreed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHasAgreed() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasAgreed() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
