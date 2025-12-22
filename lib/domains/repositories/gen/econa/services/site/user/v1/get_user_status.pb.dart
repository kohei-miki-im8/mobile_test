//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/user.pb.dart' as $142;

/// ユーザー情報取得リクエスト
class GetUserStatusRequest extends $pb.GeneratedMessage {
  factory GetUserStatusRequest() => create();
  GetUserStatusRequest._() : super();
  factory GetUserStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserStatusRequest clone() => GetUserStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserStatusRequest copyWith(void Function(GetUserStatusRequest) updates) => super.copyWith((message) => updates(message as GetUserStatusRequest)) as GetUserStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserStatusRequest create() => GetUserStatusRequest._();
  GetUserStatusRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserStatusRequest> createRepeated() => $pb.PbList<GetUserStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserStatusRequest>(create);
  static GetUserStatusRequest? _defaultInstance;
}

/// ユーザー情報取得レスポンス
class GetUserStatusResponse extends $pb.GeneratedMessage {
  factory GetUserStatusResponse({
    $142.UserStatus? userStatus,
  }) {
    final $result = create();
    if (userStatus != null) {
      $result.userStatus = userStatus;
    }
    return $result;
  }
  GetUserStatusResponse._() : super();
  factory GetUserStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOM<$142.UserStatus>(1, _omitFieldNames ? '' : 'userStatus', subBuilder: $142.UserStatus.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserStatusResponse clone() => GetUserStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserStatusResponse copyWith(void Function(GetUserStatusResponse) updates) => super.copyWith((message) => updates(message as GetUserStatusResponse)) as GetUserStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserStatusResponse create() => GetUserStatusResponse._();
  GetUserStatusResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserStatusResponse> createRepeated() => $pb.PbList<GetUserStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserStatusResponse>(create);
  static GetUserStatusResponse? _defaultInstance;

  /// ユーザーステータス
  @$pb.TagNumber(1)
  $142.UserStatus get userStatus => $_getN(0);
  @$pb.TagNumber(1)
  set userStatus($142.UserStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserStatus() => clearField(1);
  @$pb.TagNumber(1)
  $142.UserStatus ensureUserStatus() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
