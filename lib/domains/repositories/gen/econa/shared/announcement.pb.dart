//
//  Generated code. Do not modify.
//  source: econa/shared/announcement.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;
import '../enums/announcement_target_type.pbenum.dart' as $158;

/// お知らせ
class Announcement extends $pb.GeneratedMessage {
  factory Announcement({
    $core.String? announcementId,
    $core.String? title,
    $core.String? body,
    $core.String? imageUrl,
    $core.String? linkUrl,
    $158.AnnouncementTargetType? targetType,
    $core.int? priority,
    $109.Timestamp? startAt,
    $109.Timestamp? endAt,
    $109.Timestamp? createdAt,
  }) {
    final $result = create();
    if (announcementId != null) {
      $result.announcementId = announcementId;
    }
    if (title != null) {
      $result.title = title;
    }
    if (body != null) {
      $result.body = body;
    }
    if (imageUrl != null) {
      $result.imageUrl = imageUrl;
    }
    if (linkUrl != null) {
      $result.linkUrl = linkUrl;
    }
    if (targetType != null) {
      $result.targetType = targetType;
    }
    if (priority != null) {
      $result.priority = priority;
    }
    if (startAt != null) {
      $result.startAt = startAt;
    }
    if (endAt != null) {
      $result.endAt = endAt;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  Announcement._() : super();
  factory Announcement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Announcement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Announcement', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'announcementId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'body')
    ..aOS(4, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(5, _omitFieldNames ? '' : 'linkUrl')
    ..e<$158.AnnouncementTargetType>(6, _omitFieldNames ? '' : 'targetType', $pb.PbFieldType.OE, defaultOrMaker: $158.AnnouncementTargetType.ANNOUNCEMENT_TARGET_TYPE_UNSPECIFIED, valueOf: $158.AnnouncementTargetType.valueOf, enumValues: $158.AnnouncementTargetType.values)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'priority', $pb.PbFieldType.O3)
    ..aOM<$109.Timestamp>(8, _omitFieldNames ? '' : 'startAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(9, _omitFieldNames ? '' : 'endAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(10, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Announcement clone() => Announcement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Announcement copyWith(void Function(Announcement) updates) => super.copyWith((message) => updates(message as Announcement)) as Announcement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Announcement create() => Announcement._();
  Announcement createEmptyInstance() => create();
  static $pb.PbList<Announcement> createRepeated() => $pb.PbList<Announcement>();
  @$core.pragma('dart2js:noInline')
  static Announcement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Announcement>(create);
  static Announcement? _defaultInstance;

  /// お知らせID
  @$pb.TagNumber(1)
  $core.String get announcementId => $_getSZ(0);
  @$pb.TagNumber(1)
  set announcementId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAnnouncementId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAnnouncementId() => clearField(1);

  /// タイトル
  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  /// 本文
  @$pb.TagNumber(3)
  $core.String get body => $_getSZ(2);
  @$pb.TagNumber(3)
  set body($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(3)
  void clearBody() => clearField(3);

  /// 画像URL
  @$pb.TagNumber(4)
  $core.String get imageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set imageUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearImageUrl() => clearField(4);

  /// リンクURL
  @$pb.TagNumber(5)
  $core.String get linkUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set linkUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLinkUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearLinkUrl() => clearField(5);

  /// 対象ユーザータイプ
  @$pb.TagNumber(6)
  $158.AnnouncementTargetType get targetType => $_getN(5);
  @$pb.TagNumber(6)
  set targetType($158.AnnouncementTargetType v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTargetType() => $_has(5);
  @$pb.TagNumber(6)
  void clearTargetType() => clearField(6);

  /// 優先度
  @$pb.TagNumber(7)
  $core.int get priority => $_getIZ(6);
  @$pb.TagNumber(7)
  set priority($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPriority() => $_has(6);
  @$pb.TagNumber(7)
  void clearPriority() => clearField(7);

  /// 公開開始日時
  @$pb.TagNumber(8)
  $109.Timestamp get startAt => $_getN(7);
  @$pb.TagNumber(8)
  set startAt($109.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStartAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearStartAt() => clearField(8);
  @$pb.TagNumber(8)
  $109.Timestamp ensureStartAt() => $_ensure(7);

  /// 公開終了日時
  @$pb.TagNumber(9)
  $109.Timestamp get endAt => $_getN(8);
  @$pb.TagNumber(9)
  set endAt($109.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasEndAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearEndAt() => clearField(9);
  @$pb.TagNumber(9)
  $109.Timestamp ensureEndAt() => $_ensure(8);

  /// 作成日時
  @$pb.TagNumber(10)
  $109.Timestamp get createdAt => $_getN(9);
  @$pb.TagNumber(10)
  set createdAt($109.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedAt() => clearField(10);
  @$pb.TagNumber(10)
  $109.Timestamp ensureCreatedAt() => $_ensure(9);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
