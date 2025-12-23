//
//  Generated code. Do not modify.
//  source: econa/shared/date_intention.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// デート意向
class DateIntention extends $pb.GeneratedMessage {
  factory DateIntention({
    $core.String? userId,
    $core.String? chatMessageId,
    $core.bool? hasDateIntention,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (chatMessageId != null) {
      $result.chatMessageId = chatMessageId;
    }
    if (hasDateIntention != null) {
      $result.hasDateIntention = hasDateIntention;
    }
    return $result;
  }
  DateIntention._() : super();
  factory DateIntention.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DateIntention.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DateIntention', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'chatMessageId')
    ..aOB(3, _omitFieldNames ? '' : 'hasDateIntention')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DateIntention clone() => DateIntention()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DateIntention copyWith(void Function(DateIntention) updates) => super.copyWith((message) => updates(message as DateIntention)) as DateIntention;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DateIntention create() => DateIntention._();
  DateIntention createEmptyInstance() => create();
  static $pb.PbList<DateIntention> createRepeated() => $pb.PbList<DateIntention>();
  @$core.pragma('dart2js:noInline')
  static DateIntention getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DateIntention>(create);
  static DateIntention? _defaultInstance;

  /// ユーザーID
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// チャットメッセージID
  @$pb.TagNumber(2)
  $core.String get chatMessageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chatMessageId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChatMessageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChatMessageId() => clearField(2);

  /// デート意向
  @$pb.TagNumber(3)
  $core.bool get hasDateIntention => $_getBF(2);
  @$pb.TagNumber(3)
  set hasDateIntention($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHasDateIntention() => $_has(2);
  @$pb.TagNumber(3)
  void clearHasDateIntention() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
