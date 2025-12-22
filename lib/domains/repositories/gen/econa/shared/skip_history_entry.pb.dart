//
//  Generated code. Do not modify.
//  source: econa/shared/skip_history_entry.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;

/// SkipHistoryEntry - スキップ履歴エントリー
class SkipHistoryEntry extends $pb.GeneratedMessage {
  factory SkipHistoryEntry({
    $core.String? profilePhotoId,
    $core.String? targetUserId,
    $109.Timestamp? skippedAt,
    $core.String? skipReason,
  }) {
    final $result = create();
    if (profilePhotoId != null) {
      $result.profilePhotoId = profilePhotoId;
    }
    if (targetUserId != null) {
      $result.targetUserId = targetUserId;
    }
    if (skippedAt != null) {
      $result.skippedAt = skippedAt;
    }
    if (skipReason != null) {
      $result.skipReason = skipReason;
    }
    return $result;
  }
  SkipHistoryEntry._() : super();
  factory SkipHistoryEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SkipHistoryEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SkipHistoryEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'profilePhotoId')
    ..aOS(2, _omitFieldNames ? '' : 'targetUserId')
    ..aOM<$109.Timestamp>(3, _omitFieldNames ? '' : 'skippedAt', subBuilder: $109.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'skipReason')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SkipHistoryEntry clone() => SkipHistoryEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SkipHistoryEntry copyWith(void Function(SkipHistoryEntry) updates) => super.copyWith((message) => updates(message as SkipHistoryEntry)) as SkipHistoryEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SkipHistoryEntry create() => SkipHistoryEntry._();
  SkipHistoryEntry createEmptyInstance() => create();
  static $pb.PbList<SkipHistoryEntry> createRepeated() => $pb.PbList<SkipHistoryEntry>();
  @$core.pragma('dart2js:noInline')
  static SkipHistoryEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SkipHistoryEntry>(create);
  static SkipHistoryEntry? _defaultInstance;

  /// profile_photo_id - スキップされた写真ID
  @$pb.TagNumber(1)
  $core.String get profilePhotoId => $_getSZ(0);
  @$pb.TagNumber(1)
  set profilePhotoId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProfilePhotoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfilePhotoId() => clearField(1);

  /// target_user_id - スキップされたユーザーID
  @$pb.TagNumber(2)
  $core.String get targetUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetUserId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetUserId() => clearField(2);

  /// skipped_at - スキップ実行時刻
  @$pb.TagNumber(3)
  $109.Timestamp get skippedAt => $_getN(2);
  @$pb.TagNumber(3)
  set skippedAt($109.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSkippedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearSkippedAt() => clearField(3);
  @$pb.TagNumber(3)
  $109.Timestamp ensureSkippedAt() => $_ensure(2);

  /// skip_reason - スキップ理由 (optional)
  @$pb.TagNumber(4)
  $core.String get skipReason => $_getSZ(3);
  @$pb.TagNumber(4)
  set skipReason($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSkipReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearSkipReason() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
