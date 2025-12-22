//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/get_latest_user_search_conditions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/user_search_conditions.pb.dart' as $177;

/// ユーザー検索設定取得リクエスト
class GetLatestUserSearchConditionsRequest extends $pb.GeneratedMessage {
  factory GetLatestUserSearchConditionsRequest() => create();
  GetLatestUserSearchConditionsRequest._() : super();
  factory GetLatestUserSearchConditionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLatestUserSearchConditionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLatestUserSearchConditionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.search.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLatestUserSearchConditionsRequest clone() => GetLatestUserSearchConditionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLatestUserSearchConditionsRequest copyWith(void Function(GetLatestUserSearchConditionsRequest) updates) => super.copyWith((message) => updates(message as GetLatestUserSearchConditionsRequest)) as GetLatestUserSearchConditionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLatestUserSearchConditionsRequest create() => GetLatestUserSearchConditionsRequest._();
  GetLatestUserSearchConditionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetLatestUserSearchConditionsRequest> createRepeated() => $pb.PbList<GetLatestUserSearchConditionsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLatestUserSearchConditionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLatestUserSearchConditionsRequest>(create);
  static GetLatestUserSearchConditionsRequest? _defaultInstance;
}

/// ユーザー検索設定取得レスポンス
class GetLatestUserSearchConditionsResponse extends $pb.GeneratedMessage {
  factory GetLatestUserSearchConditionsResponse({
    $177.UserSearchConditions? userSearchConditions,
  }) {
    final $result = create();
    if (userSearchConditions != null) {
      $result.userSearchConditions = userSearchConditions;
    }
    return $result;
  }
  GetLatestUserSearchConditionsResponse._() : super();
  factory GetLatestUserSearchConditionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLatestUserSearchConditionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLatestUserSearchConditionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.search.v1'), createEmptyInstance: create)
    ..aOM<$177.UserSearchConditions>(1, _omitFieldNames ? '' : 'userSearchConditions', subBuilder: $177.UserSearchConditions.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLatestUserSearchConditionsResponse clone() => GetLatestUserSearchConditionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLatestUserSearchConditionsResponse copyWith(void Function(GetLatestUserSearchConditionsResponse) updates) => super.copyWith((message) => updates(message as GetLatestUserSearchConditionsResponse)) as GetLatestUserSearchConditionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLatestUserSearchConditionsResponse create() => GetLatestUserSearchConditionsResponse._();
  GetLatestUserSearchConditionsResponse createEmptyInstance() => create();
  static $pb.PbList<GetLatestUserSearchConditionsResponse> createRepeated() => $pb.PbList<GetLatestUserSearchConditionsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLatestUserSearchConditionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLatestUserSearchConditionsResponse>(create);
  static GetLatestUserSearchConditionsResponse? _defaultInstance;

  /// ユーザー検索設定
  @$pb.TagNumber(1)
  $177.UserSearchConditions get userSearchConditions => $_getN(0);
  @$pb.TagNumber(1)
  set userSearchConditions($177.UserSearchConditions v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserSearchConditions() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserSearchConditions() => clearField(1);
  @$pb.TagNumber(1)
  $177.UserSearchConditions ensureUserSearchConditions() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
