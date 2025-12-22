//
//  Generated code. Do not modify.
//  source: econa/shared/signed_url.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 著名付き画像URL
class SignedImageUrls extends $pb.GeneratedMessage {
  factory SignedImageUrls({
    $core.String? originUrl,
    $core.String? nonResizedWebpUrl,
    $core.String? largeThumbnailWebpUrl,
    $core.String? mediumThumbnailWebpUrl,
    $core.String? smallThumbnailWebpUrl,
    $core.String? avatarIconWebpUrl,
  }) {
    final $result = create();
    if (originUrl != null) {
      $result.originUrl = originUrl;
    }
    if (nonResizedWebpUrl != null) {
      $result.nonResizedWebpUrl = nonResizedWebpUrl;
    }
    if (largeThumbnailWebpUrl != null) {
      $result.largeThumbnailWebpUrl = largeThumbnailWebpUrl;
    }
    if (mediumThumbnailWebpUrl != null) {
      $result.mediumThumbnailWebpUrl = mediumThumbnailWebpUrl;
    }
    if (smallThumbnailWebpUrl != null) {
      $result.smallThumbnailWebpUrl = smallThumbnailWebpUrl;
    }
    if (avatarIconWebpUrl != null) {
      $result.avatarIconWebpUrl = avatarIconWebpUrl;
    }
    return $result;
  }
  SignedImageUrls._() : super();
  factory SignedImageUrls.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignedImageUrls.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignedImageUrls', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'originUrl')
    ..aOS(2, _omitFieldNames ? '' : 'nonResizedWebpUrl')
    ..aOS(3, _omitFieldNames ? '' : 'largeThumbnailWebpUrl')
    ..aOS(4, _omitFieldNames ? '' : 'mediumThumbnailWebpUrl')
    ..aOS(5, _omitFieldNames ? '' : 'smallThumbnailWebpUrl')
    ..aOS(6, _omitFieldNames ? '' : 'avatarIconWebpUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignedImageUrls clone() => SignedImageUrls()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignedImageUrls copyWith(void Function(SignedImageUrls) updates) => super.copyWith((message) => updates(message as SignedImageUrls)) as SignedImageUrls;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignedImageUrls create() => SignedImageUrls._();
  SignedImageUrls createEmptyInstance() => create();
  static $pb.PbList<SignedImageUrls> createRepeated() => $pb.PbList<SignedImageUrls>();
  @$core.pragma('dart2js:noInline')
  static SignedImageUrls getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignedImageUrls>(create);
  static SignedImageUrls? _defaultInstance;

  /// オリジナル写真URL
  @$pb.TagNumber(1)
  $core.String get originUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set originUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOriginUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearOriginUrl() => clearField(1);

  /// 非リサイズ写真URL
  @$pb.TagNumber(2)
  $core.String get nonResizedWebpUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set nonResizedWebpUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNonResizedWebpUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonResizedWebpUrl() => clearField(2);

  /// サムネイル写真(大)URL
  @$pb.TagNumber(3)
  $core.String get largeThumbnailWebpUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set largeThumbnailWebpUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLargeThumbnailWebpUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearLargeThumbnailWebpUrl() => clearField(3);

  /// サムネイル写真(中)URL
  @$pb.TagNumber(4)
  $core.String get mediumThumbnailWebpUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set mediumThumbnailWebpUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMediumThumbnailWebpUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearMediumThumbnailWebpUrl() => clearField(4);

  /// サムネイル写真(小)URL
  @$pb.TagNumber(5)
  $core.String get smallThumbnailWebpUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set smallThumbnailWebpUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSmallThumbnailWebpUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearSmallThumbnailWebpUrl() => clearField(5);

  /// アバターアイコン写真URL
  @$pb.TagNumber(6)
  $core.String get avatarIconWebpUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatarIconWebpUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAvatarIconWebpUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatarIconWebpUrl() => clearField(6);
}

/// 著名付き音声URL
class SignedVoiceUrls extends $pb.GeneratedMessage {
  factory SignedVoiceUrls({
    $core.String? originUrl,
  }) {
    final $result = create();
    if (originUrl != null) {
      $result.originUrl = originUrl;
    }
    return $result;
  }
  SignedVoiceUrls._() : super();
  factory SignedVoiceUrls.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignedVoiceUrls.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignedVoiceUrls', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'originUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignedVoiceUrls clone() => SignedVoiceUrls()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignedVoiceUrls copyWith(void Function(SignedVoiceUrls) updates) => super.copyWith((message) => updates(message as SignedVoiceUrls)) as SignedVoiceUrls;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignedVoiceUrls create() => SignedVoiceUrls._();
  SignedVoiceUrls createEmptyInstance() => create();
  static $pb.PbList<SignedVoiceUrls> createRepeated() => $pb.PbList<SignedVoiceUrls>();
  @$core.pragma('dart2js:noInline')
  static SignedVoiceUrls getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignedVoiceUrls>(create);
  static SignedVoiceUrls? _defaultInstance;

  /// オリジナル音声URL
  @$pb.TagNumber(1)
  $core.String get originUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set originUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOriginUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearOriginUrl() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
