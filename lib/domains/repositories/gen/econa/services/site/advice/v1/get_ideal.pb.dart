//
//  Generated code. Do not modify.
//  source: econa/services/site/advice/v1/get_ideal.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/body_type_code.pbenum.dart' as $111;
import '../../../../enums/salary_range_code.pbenum.dart' as $112;

/// 理想について取得リクエスト
class GetIdealRequest extends $pb.GeneratedMessage {
  factory GetIdealRequest() => create();
  GetIdealRequest._() : super();
  factory GetIdealRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetIdealRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetIdealRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.advice.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetIdealRequest clone() => GetIdealRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetIdealRequest copyWith(void Function(GetIdealRequest) updates) => super.copyWith((message) => updates(message as GetIdealRequest)) as GetIdealRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetIdealRequest create() => GetIdealRequest._();
  GetIdealRequest createEmptyInstance() => create();
  static $pb.PbList<GetIdealRequest> createRepeated() => $pb.PbList<GetIdealRequest>();
  @$core.pragma('dart2js:noInline')
  static GetIdealRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetIdealRequest>(create);
  static GetIdealRequest? _defaultInstance;
}

/// ユーザー簡易特徴
class GetIdealResponse_UserSimplifiedPersonality extends $pb.GeneratedMessage {
  factory GetIdealResponse_UserSimplifiedPersonality({
    $core.int? medianAge,
    $core.int? medianHeight,
    $111.BodyTypeCode? bodyType,
    $112.SalaryRangeCode? salaryRange,
  }) {
    final $result = create();
    if (medianAge != null) {
      $result.medianAge = medianAge;
    }
    if (medianHeight != null) {
      $result.medianHeight = medianHeight;
    }
    if (bodyType != null) {
      $result.bodyType = bodyType;
    }
    if (salaryRange != null) {
      $result.salaryRange = salaryRange;
    }
    return $result;
  }
  GetIdealResponse_UserSimplifiedPersonality._() : super();
  factory GetIdealResponse_UserSimplifiedPersonality.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetIdealResponse_UserSimplifiedPersonality.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetIdealResponse.UserSimplifiedPersonality', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.advice.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'medianAge', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'medianHeight', $pb.PbFieldType.O3)
    ..e<$111.BodyTypeCode>(3, _omitFieldNames ? '' : 'bodyType', $pb.PbFieldType.OE, defaultOrMaker: $111.BodyTypeCode.BODY_TYPE_CODE_UNSPECIFIED, valueOf: $111.BodyTypeCode.valueOf, enumValues: $111.BodyTypeCode.values)
    ..e<$112.SalaryRangeCode>(4, _omitFieldNames ? '' : 'salaryRange', $pb.PbFieldType.OE, defaultOrMaker: $112.SalaryRangeCode.SALARY_RANGE_CODE_UNSPECIFIED, valueOf: $112.SalaryRangeCode.valueOf, enumValues: $112.SalaryRangeCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetIdealResponse_UserSimplifiedPersonality clone() => GetIdealResponse_UserSimplifiedPersonality()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetIdealResponse_UserSimplifiedPersonality copyWith(void Function(GetIdealResponse_UserSimplifiedPersonality) updates) => super.copyWith((message) => updates(message as GetIdealResponse_UserSimplifiedPersonality)) as GetIdealResponse_UserSimplifiedPersonality;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetIdealResponse_UserSimplifiedPersonality create() => GetIdealResponse_UserSimplifiedPersonality._();
  GetIdealResponse_UserSimplifiedPersonality createEmptyInstance() => create();
  static $pb.PbList<GetIdealResponse_UserSimplifiedPersonality> createRepeated() => $pb.PbList<GetIdealResponse_UserSimplifiedPersonality>();
  @$core.pragma('dart2js:noInline')
  static GetIdealResponse_UserSimplifiedPersonality getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetIdealResponse_UserSimplifiedPersonality>(create);
  static GetIdealResponse_UserSimplifiedPersonality? _defaultInstance;

  /// 中央値年齢（中央値±2歳表示想定）
  @$pb.TagNumber(1)
  $core.int get medianAge => $_getIZ(0);
  @$pb.TagNumber(1)
  set medianAge($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMedianAge() => $_has(0);
  @$pb.TagNumber(1)
  void clearMedianAge() => clearField(1);

  /// 中央値身長（中央値±5cm表示想定）
  @$pb.TagNumber(2)
  $core.int get medianHeight => $_getIZ(1);
  @$pb.TagNumber(2)
  set medianHeight($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMedianHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearMedianHeight() => clearField(2);

  /// 体型
  @$pb.TagNumber(3)
  $111.BodyTypeCode get bodyType => $_getN(2);
  @$pb.TagNumber(3)
  set bodyType($111.BodyTypeCode v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBodyType() => $_has(2);
  @$pb.TagNumber(3)
  void clearBodyType() => clearField(3);

  /// 年収範囲
  @$pb.TagNumber(4)
  $112.SalaryRangeCode get salaryRange => $_getN(3);
  @$pb.TagNumber(4)
  set salaryRange($112.SalaryRangeCode v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSalaryRange() => $_has(3);
  @$pb.TagNumber(4)
  void clearSalaryRange() => clearField(4);
}

/// 理想について取得レスポンス
class GetIdealResponse extends $pb.GeneratedMessage {
  factory GetIdealResponse({
    $core.String? adviceMessage,
    GetIdealResponse_UserSimplifiedPersonality? userSimplifiedPersonality,
    GetIdealResponse_UserSimplifiedPersonality? toUserSimplifiedPersonality,
    GetIdealResponse_UserSimplifiedPersonality? sameGenderSameGenerationIdealPersonality,
  }) {
    final $result = create();
    if (adviceMessage != null) {
      $result.adviceMessage = adviceMessage;
    }
    if (userSimplifiedPersonality != null) {
      $result.userSimplifiedPersonality = userSimplifiedPersonality;
    }
    if (toUserSimplifiedPersonality != null) {
      $result.toUserSimplifiedPersonality = toUserSimplifiedPersonality;
    }
    if (sameGenderSameGenerationIdealPersonality != null) {
      $result.sameGenderSameGenerationIdealPersonality = sameGenderSameGenerationIdealPersonality;
    }
    return $result;
  }
  GetIdealResponse._() : super();
  factory GetIdealResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetIdealResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetIdealResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.advice.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'adviceMessage')
    ..aOM<GetIdealResponse_UserSimplifiedPersonality>(2, _omitFieldNames ? '' : 'userSimplifiedPersonality', subBuilder: GetIdealResponse_UserSimplifiedPersonality.create)
    ..aOM<GetIdealResponse_UserSimplifiedPersonality>(3, _omitFieldNames ? '' : 'toUserSimplifiedPersonality', subBuilder: GetIdealResponse_UserSimplifiedPersonality.create)
    ..aOM<GetIdealResponse_UserSimplifiedPersonality>(4, _omitFieldNames ? '' : 'sameGenderSameGenerationIdealPersonality', subBuilder: GetIdealResponse_UserSimplifiedPersonality.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetIdealResponse clone() => GetIdealResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetIdealResponse copyWith(void Function(GetIdealResponse) updates) => super.copyWith((message) => updates(message as GetIdealResponse)) as GetIdealResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetIdealResponse create() => GetIdealResponse._();
  GetIdealResponse createEmptyInstance() => create();
  static $pb.PbList<GetIdealResponse> createRepeated() => $pb.PbList<GetIdealResponse>();
  @$core.pragma('dart2js:noInline')
  static GetIdealResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetIdealResponse>(create);
  static GetIdealResponse? _defaultInstance;

  /// アドバイスメッセージ
  @$pb.TagNumber(1)
  $core.String get adviceMessage => $_getSZ(0);
  @$pb.TagNumber(1)
  set adviceMessage($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdviceMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdviceMessage() => clearField(1);

  /// あなたが興味を持ったお相手ユーザーの特徴
  @$pb.TagNumber(2)
  GetIdealResponse_UserSimplifiedPersonality get userSimplifiedPersonality => $_getN(1);
  @$pb.TagNumber(2)
  set userSimplifiedPersonality(GetIdealResponse_UserSimplifiedPersonality v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserSimplifiedPersonality() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserSimplifiedPersonality() => clearField(2);
  @$pb.TagNumber(2)
  GetIdealResponse_UserSimplifiedPersonality ensureUserSimplifiedPersonality() => $_ensure(1);

  /// あなたに興味を持ったお相手ユーザーの特徴
  @$pb.TagNumber(3)
  GetIdealResponse_UserSimplifiedPersonality get toUserSimplifiedPersonality => $_getN(2);
  @$pb.TagNumber(3)
  set toUserSimplifiedPersonality(GetIdealResponse_UserSimplifiedPersonality v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasToUserSimplifiedPersonality() => $_has(2);
  @$pb.TagNumber(3)
  void clearToUserSimplifiedPersonality() => clearField(3);
  @$pb.TagNumber(3)
  GetIdealResponse_UserSimplifiedPersonality ensureToUserSimplifiedPersonality() => $_ensure(2);

  /// あなたと同性/同世代の理想のお相手ユーザーの特徴
  @$pb.TagNumber(4)
  GetIdealResponse_UserSimplifiedPersonality get sameGenderSameGenerationIdealPersonality => $_getN(3);
  @$pb.TagNumber(4)
  set sameGenderSameGenerationIdealPersonality(GetIdealResponse_UserSimplifiedPersonality v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSameGenderSameGenerationIdealPersonality() => $_has(3);
  @$pb.TagNumber(4)
  void clearSameGenderSameGenerationIdealPersonality() => clearField(4);
  @$pb.TagNumber(4)
  GetIdealResponse_UserSimplifiedPersonality ensureSameGenderSameGenerationIdealPersonality() => $_ensure(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
