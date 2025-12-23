//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/create_user_boost.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;

/// ユーザーブーストを有効化リクエスト
class CreateUserBoostRequest extends $pb.GeneratedMessage {
  factory CreateUserBoostRequest() => create();
  CreateUserBoostRequest._() : super();
  factory CreateUserBoostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserBoostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateUserBoostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserBoostRequest clone() => CreateUserBoostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserBoostRequest copyWith(void Function(CreateUserBoostRequest) updates) => super.copyWith((message) => updates(message as CreateUserBoostRequest)) as CreateUserBoostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserBoostRequest create() => CreateUserBoostRequest._();
  CreateUserBoostRequest createEmptyInstance() => create();
  static $pb.PbList<CreateUserBoostRequest> createRepeated() => $pb.PbList<CreateUserBoostRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateUserBoostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserBoostRequest>(create);
  static CreateUserBoostRequest? _defaultInstance;
}

/// ユーザーブーストを有効化レスポンス
class CreateUserBoostResponse extends $pb.GeneratedMessage {
  factory CreateUserBoostResponse({
    $109.Timestamp? expiresAt,
  }) {
    final $result = create();
    if (expiresAt != null) {
      $result.expiresAt = expiresAt;
    }
    return $result;
  }
  CreateUserBoostResponse._() : super();
  factory CreateUserBoostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserBoostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateUserBoostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOM<$109.Timestamp>(1, _omitFieldNames ? '' : 'expiresAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserBoostResponse clone() => CreateUserBoostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserBoostResponse copyWith(void Function(CreateUserBoostResponse) updates) => super.copyWith((message) => updates(message as CreateUserBoostResponse)) as CreateUserBoostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserBoostResponse create() => CreateUserBoostResponse._();
  CreateUserBoostResponse createEmptyInstance() => create();
  static $pb.PbList<CreateUserBoostResponse> createRepeated() => $pb.PbList<CreateUserBoostResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateUserBoostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserBoostResponse>(create);
  static CreateUserBoostResponse? _defaultInstance;

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
