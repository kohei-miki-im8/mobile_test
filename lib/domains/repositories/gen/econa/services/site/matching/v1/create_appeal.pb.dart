//
//  Generated code. Do not modify.
//  source: econa/services/site/matching/v1/create_appeal.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// アピール作成リクエスト
class CreateAppealRequest extends $pb.GeneratedMessage {
  factory CreateAppealRequest({
    $core.String? userLikeId,
  }) {
    final $result = create();
    if (userLikeId != null) {
      $result.userLikeId = userLikeId;
    }
    return $result;
  }
  CreateAppealRequest._() : super();
  factory CreateAppealRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAppealRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAppealRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.matching.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userLikeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAppealRequest clone() => CreateAppealRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAppealRequest copyWith(void Function(CreateAppealRequest) updates) => super.copyWith((message) => updates(message as CreateAppealRequest)) as CreateAppealRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAppealRequest create() => CreateAppealRequest._();
  CreateAppealRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAppealRequest> createRepeated() => $pb.PbList<CreateAppealRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAppealRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAppealRequest>(create);
  static CreateAppealRequest? _defaultInstance;

  /// いいねID
  @$pb.TagNumber(1)
  $core.String get userLikeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userLikeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserLikeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserLikeId() => clearField(1);
}

/// アピール作成レスポンス
class CreateAppealResponse extends $pb.GeneratedMessage {
  factory CreateAppealResponse() => create();
  CreateAppealResponse._() : super();
  factory CreateAppealResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAppealResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAppealResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.matching.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAppealResponse clone() => CreateAppealResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAppealResponse copyWith(void Function(CreateAppealResponse) updates) => super.copyWith((message) => updates(message as CreateAppealResponse)) as CreateAppealResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAppealResponse create() => CreateAppealResponse._();
  CreateAppealResponse createEmptyInstance() => create();
  static $pb.PbList<CreateAppealResponse> createRepeated() => $pb.PbList<CreateAppealResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateAppealResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAppealResponse>(create);
  static CreateAppealResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
