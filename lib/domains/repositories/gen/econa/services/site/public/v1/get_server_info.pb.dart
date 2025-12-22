//
//  Generated code. Do not modify.
//  source: econa/services/site/public/v1/get_server_info.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/environment.pbenum.dart' as $170;

/// サーバー情報リクエスト
class GetServerInfoRequest extends $pb.GeneratedMessage {
  factory GetServerInfoRequest() => create();
  GetServerInfoRequest._() : super();
  factory GetServerInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetServerInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetServerInfoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.public.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetServerInfoRequest clone() => GetServerInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetServerInfoRequest copyWith(void Function(GetServerInfoRequest) updates) => super.copyWith((message) => updates(message as GetServerInfoRequest)) as GetServerInfoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetServerInfoRequest create() => GetServerInfoRequest._();
  GetServerInfoRequest createEmptyInstance() => create();
  static $pb.PbList<GetServerInfoRequest> createRepeated() => $pb.PbList<GetServerInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static GetServerInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetServerInfoRequest>(create);
  static GetServerInfoRequest? _defaultInstance;
}

/// サーバー情報レスポンス
class GetServerInfoResponse extends $pb.GeneratedMessage {
  factory GetServerInfoResponse({
    $170.Environment? environment,
    ServerVersion? version,
  }) {
    final $result = create();
    if (environment != null) {
      $result.environment = environment;
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  GetServerInfoResponse._() : super();
  factory GetServerInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetServerInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetServerInfoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.public.v1'), createEmptyInstance: create)
    ..e<$170.Environment>(1, _omitFieldNames ? '' : 'environment', $pb.PbFieldType.OE, defaultOrMaker: $170.Environment.ENVIRONMENT_UNSPECIFIED, valueOf: $170.Environment.valueOf, enumValues: $170.Environment.values)
    ..aOM<ServerVersion>(2, _omitFieldNames ? '' : 'version', subBuilder: ServerVersion.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetServerInfoResponse clone() => GetServerInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetServerInfoResponse copyWith(void Function(GetServerInfoResponse) updates) => super.copyWith((message) => updates(message as GetServerInfoResponse)) as GetServerInfoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetServerInfoResponse create() => GetServerInfoResponse._();
  GetServerInfoResponse createEmptyInstance() => create();
  static $pb.PbList<GetServerInfoResponse> createRepeated() => $pb.PbList<GetServerInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static GetServerInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetServerInfoResponse>(create);
  static GetServerInfoResponse? _defaultInstance;

  /// 本番/開発/テスト環境の識別
  @$pb.TagNumber(1)
  $170.Environment get environment => $_getN(0);
  @$pb.TagNumber(1)
  set environment($170.Environment v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnvironment() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnvironment() => clearField(1);

  /// サーバーバージョン情報（API共通 + プラットフォーム別）
  @$pb.TagNumber(2)
  ServerVersion get version => $_getN(1);
  @$pb.TagNumber(2)
  set version(ServerVersion v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);
  @$pb.TagNumber(2)
  ServerVersion ensureVersion() => $_ensure(1);
}

/// サーバーバージョン情報
/// API共通情報とプラットフォーム別情報を含む
class ServerVersion extends $pb.GeneratedMessage {
  factory ServerVersion({
    $core.String? apiVersion,
    $core.String? minSupportedApiBasePath,
    PlatformVersion? android,
    PlatformVersion? ios,
  }) {
    final $result = create();
    if (apiVersion != null) {
      $result.apiVersion = apiVersion;
    }
    if (minSupportedApiBasePath != null) {
      $result.minSupportedApiBasePath = minSupportedApiBasePath;
    }
    if (android != null) {
      $result.android = android;
    }
    if (ios != null) {
      $result.ios = ios;
    }
    return $result;
  }
  ServerVersion._() : super();
  factory ServerVersion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerVersion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServerVersion', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.public.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'apiVersion')
    ..aOS(2, _omitFieldNames ? '' : 'minSupportedApiBasePath')
    ..aOM<PlatformVersion>(3, _omitFieldNames ? '' : 'android', subBuilder: PlatformVersion.create)
    ..aOM<PlatformVersion>(4, _omitFieldNames ? '' : 'ios', subBuilder: PlatformVersion.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerVersion clone() => ServerVersion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerVersion copyWith(void Function(ServerVersion) updates) => super.copyWith((message) => updates(message as ServerVersion)) as ServerVersion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerVersion create() => ServerVersion._();
  ServerVersion createEmptyInstance() => create();
  static $pb.PbList<ServerVersion> createRepeated() => $pb.PbList<ServerVersion>();
  @$core.pragma('dart2js:noInline')
  static ServerVersion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerVersion>(create);
  static ServerVersion? _defaultInstance;

  /// APIバージョン（例: "v1"）
  /// 全プラットフォーム共通
  @$pb.TagNumber(1)
  $core.String get apiVersion => $_getSZ(0);
  @$pb.TagNumber(1)
  set apiVersion($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasApiVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearApiVersion() => clearField(1);

  /// サポートされる最小APIパス（例: "/v1"）
  /// 全プラットフォーム共通
  @$pb.TagNumber(2)
  $core.String get minSupportedApiBasePath => $_getSZ(1);
  @$pb.TagNumber(2)
  set minSupportedApiBasePath($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinSupportedApiBasePath() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinSupportedApiBasePath() => clearField(2);

  /// Androidプラットフォーム固有のバージョン情報
  /// データ未設定の場合はnull
  @$pb.TagNumber(3)
  PlatformVersion get android => $_getN(2);
  @$pb.TagNumber(3)
  set android(PlatformVersion v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAndroid() => $_has(2);
  @$pb.TagNumber(3)
  void clearAndroid() => clearField(3);
  @$pb.TagNumber(3)
  PlatformVersion ensureAndroid() => $_ensure(2);

  /// iOSプラットフォーム固有のバージョン情報
  /// データ未設定の場合はnull
  @$pb.TagNumber(4)
  PlatformVersion get ios => $_getN(3);
  @$pb.TagNumber(4)
  set ios(PlatformVersion v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasIos() => $_has(3);
  @$pb.TagNumber(4)
  void clearIos() => clearField(4);
  @$pb.TagNumber(4)
  PlatformVersion ensureIos() => $_ensure(3);
}

/// プラットフォーム固有のバージョン情報
class PlatformVersion extends $pb.GeneratedMessage {
  factory PlatformVersion({
    $core.String? minSupportedClientVersion,
    $core.String? latestClientVersion,
    $core.bool? forceUpdate,
    $core.String? updateWebviewUrl,
    $core.String? updateTitle,
    $core.String? updateMessage,
    $core.String? releaseNotes,
  }) {
    final $result = create();
    if (minSupportedClientVersion != null) {
      $result.minSupportedClientVersion = minSupportedClientVersion;
    }
    if (latestClientVersion != null) {
      $result.latestClientVersion = latestClientVersion;
    }
    if (forceUpdate != null) {
      $result.forceUpdate = forceUpdate;
    }
    if (updateWebviewUrl != null) {
      $result.updateWebviewUrl = updateWebviewUrl;
    }
    if (updateTitle != null) {
      $result.updateTitle = updateTitle;
    }
    if (updateMessage != null) {
      $result.updateMessage = updateMessage;
    }
    if (releaseNotes != null) {
      $result.releaseNotes = releaseNotes;
    }
    return $result;
  }
  PlatformVersion._() : super();
  factory PlatformVersion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlatformVersion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlatformVersion', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.public.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'minSupportedClientVersion')
    ..aOS(2, _omitFieldNames ? '' : 'latestClientVersion')
    ..aOB(3, _omitFieldNames ? '' : 'forceUpdate')
    ..aOS(4, _omitFieldNames ? '' : 'updateWebviewUrl')
    ..aOS(5, _omitFieldNames ? '' : 'updateTitle')
    ..aOS(6, _omitFieldNames ? '' : 'updateMessage')
    ..aOS(7, _omitFieldNames ? '' : 'releaseNotes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlatformVersion clone() => PlatformVersion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlatformVersion copyWith(void Function(PlatformVersion) updates) => super.copyWith((message) => updates(message as PlatformVersion)) as PlatformVersion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlatformVersion create() => PlatformVersion._();
  PlatformVersion createEmptyInstance() => create();
  static $pb.PbList<PlatformVersion> createRepeated() => $pb.PbList<PlatformVersion>();
  @$core.pragma('dart2js:noInline')
  static PlatformVersion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlatformVersion>(create);
  static PlatformVersion? _defaultInstance;

  /// サポートされる最小クライアントバージョン（例: "1.0.0"）
  @$pb.TagNumber(1)
  $core.String get minSupportedClientVersion => $_getSZ(0);
  @$pb.TagNumber(1)
  set minSupportedClientVersion($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMinSupportedClientVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinSupportedClientVersion() => clearField(1);

  /// 最新のクライアントバージョン（例: "2.0.0"）
  @$pb.TagNumber(2)
  $core.String get latestClientVersion => $_getSZ(1);
  @$pb.TagNumber(2)
  set latestClientVersion($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLatestClientVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatestClientVersion() => clearField(2);

  /// 強制アップデートが必要かどうか
  /// true: アプリ起動時に必ずアップデートを要求
  @$pb.TagNumber(3)
  $core.bool get forceUpdate => $_getBF(2);
  @$pb.TagNumber(3)
  set forceUpdate($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasForceUpdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearForceUpdate() => clearField(3);

  /// アップデート情報を表示するWebViewのURL
  /// Google Play Store / App Store のURL等
  @$pb.TagNumber(4)
  $core.String get updateWebviewUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set updateWebviewUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpdateWebviewUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdateWebviewUrl() => clearField(4);

  /// アップデート画面のタイトル
  @$pb.TagNumber(5)
  $core.String get updateTitle => $_getSZ(4);
  @$pb.TagNumber(5)
  set updateTitle($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdateTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdateTitle() => clearField(5);

  /// アップデート画面に表示するメッセージ
  @$pb.TagNumber(6)
  $core.String get updateMessage => $_getSZ(5);
  @$pb.TagNumber(6)
  set updateMessage($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdateMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdateMessage() => clearField(6);

  /// リリースノート（HTML形式）
  @$pb.TagNumber(7)
  $core.String get releaseNotes => $_getSZ(6);
  @$pb.TagNumber(7)
  set releaseNotes($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasReleaseNotes() => $_has(6);
  @$pb.TagNumber(7)
  void clearReleaseNotes() => clearField(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
