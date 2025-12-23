//
//  Generated code. Do not modify.
//  source: econa/shared/pager_cursor.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// ページネーションリクエストカーソル
class PagerRequestCursor extends $pb.GeneratedMessage {
  factory PagerRequestCursor({
    $core.String? cursorId,
    $core.int? limit,
  }) {
    final $result = create();
    if (cursorId != null) {
      $result.cursorId = cursorId;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    return $result;
  }
  PagerRequestCursor._() : super();
  factory PagerRequestCursor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PagerRequestCursor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PagerRequestCursor', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cursorId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PagerRequestCursor clone() => PagerRequestCursor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PagerRequestCursor copyWith(void Function(PagerRequestCursor) updates) => super.copyWith((message) => updates(message as PagerRequestCursor)) as PagerRequestCursor;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PagerRequestCursor create() => PagerRequestCursor._();
  PagerRequestCursor createEmptyInstance() => create();
  static $pb.PbList<PagerRequestCursor> createRepeated() => $pb.PbList<PagerRequestCursor>();
  @$core.pragma('dart2js:noInline')
  static PagerRequestCursor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PagerRequestCursor>(create);
  static PagerRequestCursor? _defaultInstance;

  /// カーソルID（初めのレコードから取得する場合はnull指定）
  @$pb.TagNumber(1)
  $core.String get cursorId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cursorId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCursorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCursorId() => clearField(1);

  /// 取得件数（1~100件）
  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

/// ページネーションレスポンスカーソル
class PagerResponseCursor extends $pb.GeneratedMessage {
  factory PagerResponseCursor({
    $core.String? nextCursorId,
    $core.int? totalCount,
  }) {
    final $result = create();
    if (nextCursorId != null) {
      $result.nextCursorId = nextCursorId;
    }
    if (totalCount != null) {
      $result.totalCount = totalCount;
    }
    return $result;
  }
  PagerResponseCursor._() : super();
  factory PagerResponseCursor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PagerResponseCursor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PagerResponseCursor', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nextCursorId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PagerResponseCursor clone() => PagerResponseCursor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PagerResponseCursor copyWith(void Function(PagerResponseCursor) updates) => super.copyWith((message) => updates(message as PagerResponseCursor)) as PagerResponseCursor;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PagerResponseCursor create() => PagerResponseCursor._();
  PagerResponseCursor createEmptyInstance() => create();
  static $pb.PbList<PagerResponseCursor> createRepeated() => $pb.PbList<PagerResponseCursor>();
  @$core.pragma('dart2js:noInline')
  static PagerResponseCursor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PagerResponseCursor>(create);
  static PagerResponseCursor? _defaultInstance;

  /// 次のカーソルID（最終レコードまで到達した場合はnull、つまり返却されません）
  @$pb.TagNumber(1)
  $core.String get nextCursorId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nextCursorId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNextCursorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNextCursorId() => clearField(1);

  /// 全件数（管理画面等でページ番号表示が必要な場合に使用）
  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
