//
//  Generated code. Do not modify.
//  source: econa/shared/voice.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;
import '../enums/service_review_status.pbenum.dart' as $139;
import 'voice_data_origin.pb.dart' as $192;

/// 音声
class Voice extends $pb.GeneratedMessage {
  factory Voice({
    $core.String? voiceId,
    $192.VoiceDataOrigin? voiceDataOrigin,
    $core.String? userId,
    $core.String? caption,
    $139.ServiceReviewStatus? serviceReviewStatus,
    $core.String? signedUrl,
    $109.Timestamp? createdAt,
  }) {
    final $result = create();
    if (voiceId != null) {
      $result.voiceId = voiceId;
    }
    if (voiceDataOrigin != null) {
      $result.voiceDataOrigin = voiceDataOrigin;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (caption != null) {
      $result.caption = caption;
    }
    if (serviceReviewStatus != null) {
      $result.serviceReviewStatus = serviceReviewStatus;
    }
    if (signedUrl != null) {
      $result.signedUrl = signedUrl;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  Voice._() : super();
  factory Voice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Voice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Voice', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'voiceId')
    ..aOM<$192.VoiceDataOrigin>(2, _omitFieldNames ? '' : 'voiceDataOrigin', subBuilder: $192.VoiceDataOrigin.create)
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'caption')
    ..e<$139.ServiceReviewStatus>(5, _omitFieldNames ? '' : 'serviceReviewStatus', $pb.PbFieldType.OE, defaultOrMaker: $139.ServiceReviewStatus.SERVICE_REVIEW_STATUS_UNSPECIFIED, valueOf: $139.ServiceReviewStatus.valueOf, enumValues: $139.ServiceReviewStatus.values)
    ..aOS(6, _omitFieldNames ? '' : 'signedUrl')
    ..aOM<$109.Timestamp>(7, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Voice clone() => Voice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Voice copyWith(void Function(Voice) updates) => super.copyWith((message) => updates(message as Voice)) as Voice;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Voice create() => Voice._();
  Voice createEmptyInstance() => create();
  static $pb.PbList<Voice> createRepeated() => $pb.PbList<Voice>();
  @$core.pragma('dart2js:noInline')
  static Voice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Voice>(create);
  static Voice? _defaultInstance;

  /// 音声ID
  @$pb.TagNumber(1)
  $core.String get voiceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set voiceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVoiceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoiceId() => clearField(1);

  /// オリジナル音声データ
  @$pb.TagNumber(2)
  $192.VoiceDataOrigin get voiceDataOrigin => $_getN(1);
  @$pb.TagNumber(2)
  set voiceDataOrigin($192.VoiceDataOrigin v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoiceDataOrigin() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoiceDataOrigin() => clearField(2);
  @$pb.TagNumber(2)
  $192.VoiceDataOrigin ensureVoiceDataOrigin() => $_ensure(1);

  /// ユーザーID
  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  /// キャプション
  @$pb.TagNumber(4)
  $core.String get caption => $_getSZ(3);
  @$pb.TagNumber(4)
  set caption($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCaption() => $_has(3);
  @$pb.TagNumber(4)
  void clearCaption() => clearField(4);

  /// 検査ステータス
  @$pb.TagNumber(5)
  $139.ServiceReviewStatus get serviceReviewStatus => $_getN(4);
  @$pb.TagNumber(5)
  set serviceReviewStatus($139.ServiceReviewStatus v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasServiceReviewStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearServiceReviewStatus() => clearField(5);

  /// 著名付き音声URL
  @$pb.TagNumber(6)
  $core.String get signedUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set signedUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSignedUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearSignedUrl() => clearField(6);

  /// 作成日時
  @$pb.TagNumber(7)
  $109.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($109.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $109.Timestamp ensureCreatedAt() => $_ensure(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
