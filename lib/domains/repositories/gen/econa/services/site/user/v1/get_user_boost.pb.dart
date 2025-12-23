//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_boost.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;

/// ユーザーブーストを取得リクエスト
class GetUserBoostRequest extends $pb.GeneratedMessage {
  factory GetUserBoostRequest() => create();
  GetUserBoostRequest._() : super();
  factory GetUserBoostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserBoostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserBoostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserBoostRequest clone() => GetUserBoostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserBoostRequest copyWith(void Function(GetUserBoostRequest) updates) => super.copyWith((message) => updates(message as GetUserBoostRequest)) as GetUserBoostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserBoostRequest create() => GetUserBoostRequest._();
  GetUserBoostRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserBoostRequest> createRepeated() => $pb.PbList<GetUserBoostRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserBoostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserBoostRequest>(create);
  static GetUserBoostRequest? _defaultInstance;
}

/// ユーザーブーストを取得レスポンス
class GetUserBoostResponse extends $pb.GeneratedMessage {
  factory GetUserBoostResponse({
    $109.Timestamp? expiresAt,
  }) {
    final $result = create();
    if (expiresAt != null) {
      $result.expiresAt = expiresAt;
    }
    return $result;
  }
  GetUserBoostResponse._() : super();
  factory GetUserBoostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserBoostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserBoostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOM<$109.Timestamp>(1, _omitFieldNames ? '' : 'expiresAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserBoostResponse clone() => GetUserBoostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserBoostResponse copyWith(void Function(GetUserBoostResponse) updates) => super.copyWith((message) => updates(message as GetUserBoostResponse)) as GetUserBoostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserBoostResponse create() => GetUserBoostResponse._();
  GetUserBoostResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserBoostResponse> createRepeated() => $pb.PbList<GetUserBoostResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserBoostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserBoostResponse>(create);
  static GetUserBoostResponse? _defaultInstance;

  /// 有効期限
  @$pb.TagNumber(1)
  $109.Timestamp get expiresAt => $_getN(0);
  @$pb.TagNumber(1)
  set expiresAt($109.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasExpiresAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearExpiresAt() => clearField(1);
  @$pb.TagNumber(1)
  $109.Timestamp ensureExpiresAt() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
