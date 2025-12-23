//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/create_affinity_recommendation.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// らしさマッチング非同期リクエスト
/// SC-001: Must respond within 100ms (no AI processing, immediate response)
class CreateAffinityRecommendationRequest extends $pb.GeneratedMessage {
  factory CreateAffinityRecommendationRequest({
    $core.bool? regenerate,
    $core.int? limit,
    $core.String? requestId,
  }) {
    final $result = create();
    if (regenerate != null) {
      $result.regenerate = regenerate;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (requestId != null) {
      $result.requestId = requestId;
    }
    return $result;
  }
  CreateAffinityRecommendationRequest._() : super();
  factory CreateAffinityRecommendationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAffinityRecommendationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAffinityRecommendationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.search.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'regenerate')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'requestId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAffinityRecommendationRequest clone() => CreateAffinityRecommendationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAffinityRecommendationRequest copyWith(void Function(CreateAffinityRecommendationRequest) updates) => super.copyWith((message) => updates(message as CreateAffinityRecommendationRequest)) as CreateAffinityRecommendationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAffinityRecommendationRequest create() => CreateAffinityRecommendationRequest._();
  CreateAffinityRecommendationRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAffinityRecommendationRequest> createRepeated() => $pb.PbList<CreateAffinityRecommendationRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAffinityRecommendationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAffinityRecommendationRequest>(create);
  static CreateAffinityRecommendationRequest? _defaultInstance;

  /// 再生成フラグ（true:キャッシュを無視して再生成、false:キャッシュ優先）
  @$pb.TagNumber(1)
  $core.bool get regenerate => $_getBF(0);
  @$pb.TagNumber(1)
  set regenerate($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRegenerate() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegenerate() => clearField(1);

  /// 取得件数（1-5件）
  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  /// リクエストID（冪等性保証用、最大64文字）
  @$pb.TagNumber(3)
  $core.String get requestId => $_getSZ(2);
  @$pb.TagNumber(3)
  set requestId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRequestId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequestId() => clearField(3);
}

/// らしさマッチング非同期レスポンス
/// Empty response - user must subscribe to SubscribeSearchSession for completion notification
class CreateAffinityRecommendationResponse extends $pb.GeneratedMessage {
  factory CreateAffinityRecommendationResponse() => create();
  CreateAffinityRecommendationResponse._() : super();
  factory CreateAffinityRecommendationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAffinityRecommendationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAffinityRecommendationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.search.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAffinityRecommendationResponse clone() => CreateAffinityRecommendationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAffinityRecommendationResponse copyWith(void Function(CreateAffinityRecommendationResponse) updates) => super.copyWith((message) => updates(message as CreateAffinityRecommendationResponse)) as CreateAffinityRecommendationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAffinityRecommendationResponse create() => CreateAffinityRecommendationResponse._();
  CreateAffinityRecommendationResponse createEmptyInstance() => create();
  static $pb.PbList<CreateAffinityRecommendationResponse> createRepeated() => $pb.PbList<CreateAffinityRecommendationResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateAffinityRecommendationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAffinityRecommendationResponse>(create);
  static CreateAffinityRecommendationResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
