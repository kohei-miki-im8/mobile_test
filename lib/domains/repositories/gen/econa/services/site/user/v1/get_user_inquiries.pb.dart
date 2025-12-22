//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_inquiries.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;
import '../../../../enums/disciplinary_type.pbenum.dart' as $186;
import '../../../../enums/inquiry_status.pbenum.dart' as $185;
import '../../../../shared/pager_cursor.pb.dart' as $146;
import 'get_user_inquiries.pbenum.dart';

export 'get_user_inquiries.pbenum.dart';

/// ユーザー関連通報・懲戒処分取得リクエスト
class GetUserInquiriesRequest extends $pb.GeneratedMessage {
  factory GetUserInquiriesRequest({
    InquiryType? inquiryType,
    $146.PagerRequestCursor? cursor,
  }) {
    final $result = create();
    if (inquiryType != null) {
      $result.inquiryType = inquiryType;
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetUserInquiriesRequest._() : super();
  factory GetUserInquiriesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserInquiriesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserInquiriesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..e<InquiryType>(1, _omitFieldNames ? '' : 'inquiryType', $pb.PbFieldType.OE, defaultOrMaker: InquiryType.INQUIRY_TYPE_UNSPECIFIED, valueOf: InquiryType.valueOf, enumValues: InquiryType.values)
    ..aOM<$146.PagerRequestCursor>(2, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerRequestCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserInquiriesRequest clone() => GetUserInquiriesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserInquiriesRequest copyWith(void Function(GetUserInquiriesRequest) updates) => super.copyWith((message) => updates(message as GetUserInquiriesRequest)) as GetUserInquiriesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserInquiriesRequest create() => GetUserInquiriesRequest._();
  GetUserInquiriesRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserInquiriesRequest> createRepeated() => $pb.PbList<GetUserInquiriesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserInquiriesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserInquiriesRequest>(create);
  static GetUserInquiriesRequest? _defaultInstance;

  /// 取得タイプ
  @$pb.TagNumber(1)
  InquiryType get inquiryType => $_getN(0);
  @$pb.TagNumber(1)
  set inquiryType(InquiryType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInquiryType() => $_has(0);
  @$pb.TagNumber(1)
  void clearInquiryType() => clearField(1);

  /// ページネーション
  @$pb.TagNumber(2)
  $146.PagerRequestCursor get cursor => $_getN(1);
  @$pb.TagNumber(2)
  set cursor($146.PagerRequestCursor v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCursor() => $_has(1);
  @$pb.TagNumber(2)
  void clearCursor() => clearField(2);
  @$pb.TagNumber(2)
  $146.PagerRequestCursor ensureCursor() => $_ensure(1);
}

/// ユーザー関連通報・懲戒処分取得レスポンス
class GetUserInquiriesResponse extends $pb.GeneratedMessage {
  factory GetUserInquiriesResponse({
    $core.Iterable<UserInquiryItem>? items,
    $146.PagerResponseCursor? cursor,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetUserInquiriesResponse._() : super();
  factory GetUserInquiriesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserInquiriesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserInquiriesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..pc<UserInquiryItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: UserInquiryItem.create)
    ..aOM<$146.PagerResponseCursor>(2, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerResponseCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserInquiriesResponse clone() => GetUserInquiriesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserInquiriesResponse copyWith(void Function(GetUserInquiriesResponse) updates) => super.copyWith((message) => updates(message as GetUserInquiriesResponse)) as GetUserInquiriesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserInquiriesResponse create() => GetUserInquiriesResponse._();
  GetUserInquiriesResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserInquiriesResponse> createRepeated() => $pb.PbList<GetUserInquiriesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserInquiriesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserInquiriesResponse>(create);
  static GetUserInquiriesResponse? _defaultInstance;

  /// 通報・懲戒処分リスト
  @$pb.TagNumber(1)
  $core.List<UserInquiryItem> get items => $_getList(0);

  /// ページネーション
  @$pb.TagNumber(2)
  $146.PagerResponseCursor get cursor => $_getN(1);
  @$pb.TagNumber(2)
  set cursor($146.PagerResponseCursor v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCursor() => $_has(1);
  @$pb.TagNumber(2)
  void clearCursor() => clearField(2);
  @$pb.TagNumber(2)
  $146.PagerResponseCursor ensureCursor() => $_ensure(1);
}

enum UserInquiryItem_Item {
  inquiry, 
  disciplinaryAction, 
  notSet
}

/// 通報・懲戒処分アイテム
class UserInquiryItem extends $pb.GeneratedMessage {
  factory UserInquiryItem({
    UserInquiry? inquiry,
    DisciplinaryAction? disciplinaryAction,
  }) {
    final $result = create();
    if (inquiry != null) {
      $result.inquiry = inquiry;
    }
    if (disciplinaryAction != null) {
      $result.disciplinaryAction = disciplinaryAction;
    }
    return $result;
  }
  UserInquiryItem._() : super();
  factory UserInquiryItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInquiryItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UserInquiryItem_Item> _UserInquiryItem_ItemByTag = {
    1 : UserInquiryItem_Item.inquiry,
    2 : UserInquiryItem_Item.disciplinaryAction,
    0 : UserInquiryItem_Item.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserInquiryItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<UserInquiry>(1, _omitFieldNames ? '' : 'inquiry', subBuilder: UserInquiry.create)
    ..aOM<DisciplinaryAction>(2, _omitFieldNames ? '' : 'disciplinaryAction', subBuilder: DisciplinaryAction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInquiryItem clone() => UserInquiryItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInquiryItem copyWith(void Function(UserInquiryItem) updates) => super.copyWith((message) => updates(message as UserInquiryItem)) as UserInquiryItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInquiryItem create() => UserInquiryItem._();
  UserInquiryItem createEmptyInstance() => create();
  static $pb.PbList<UserInquiryItem> createRepeated() => $pb.PbList<UserInquiryItem>();
  @$core.pragma('dart2js:noInline')
  static UserInquiryItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInquiryItem>(create);
  static UserInquiryItem? _defaultInstance;

  UserInquiryItem_Item whichItem() => _UserInquiryItem_ItemByTag[$_whichOneof(0)]!;
  void clearItem() => clearField($_whichOneof(0));

  /// 通報情報
  @$pb.TagNumber(1)
  UserInquiry get inquiry => $_getN(0);
  @$pb.TagNumber(1)
  set inquiry(UserInquiry v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInquiry() => $_has(0);
  @$pb.TagNumber(1)
  void clearInquiry() => clearField(1);
  @$pb.TagNumber(1)
  UserInquiry ensureInquiry() => $_ensure(0);

  /// 懲戒処分情報
  @$pb.TagNumber(2)
  DisciplinaryAction get disciplinaryAction => $_getN(1);
  @$pb.TagNumber(2)
  set disciplinaryAction(DisciplinaryAction v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisciplinaryAction() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisciplinaryAction() => clearField(2);
  @$pb.TagNumber(2)
  DisciplinaryAction ensureDisciplinaryAction() => $_ensure(1);
}

/// 通報情報
class UserInquiry extends $pb.GeneratedMessage {
  factory UserInquiry({
    $core.String? userInquiryId,
    $core.String? reporterUserId,
    $core.String? reportedUserId,
    $core.String? chatRoomId,
    $core.String? categoryName,
    $core.String? inquiryDetails,
    $185.InquiryStatus? inquiryStatus,
    $109.Timestamp? createdAt,
    $core.bool? isReporter,
  }) {
    final $result = create();
    if (userInquiryId != null) {
      $result.userInquiryId = userInquiryId;
    }
    if (reporterUserId != null) {
      $result.reporterUserId = reporterUserId;
    }
    if (reportedUserId != null) {
      $result.reportedUserId = reportedUserId;
    }
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (categoryName != null) {
      $result.categoryName = categoryName;
    }
    if (inquiryDetails != null) {
      $result.inquiryDetails = inquiryDetails;
    }
    if (inquiryStatus != null) {
      $result.inquiryStatus = inquiryStatus;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (isReporter != null) {
      $result.isReporter = isReporter;
    }
    return $result;
  }
  UserInquiry._() : super();
  factory UserInquiry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInquiry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserInquiry', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userInquiryId')
    ..aOS(2, _omitFieldNames ? '' : 'reporterUserId')
    ..aOS(3, _omitFieldNames ? '' : 'reportedUserId')
    ..aOS(4, _omitFieldNames ? '' : 'chatRoomId')
    ..aOS(5, _omitFieldNames ? '' : 'categoryName')
    ..aOS(6, _omitFieldNames ? '' : 'inquiryDetails')
    ..e<$185.InquiryStatus>(7, _omitFieldNames ? '' : 'inquiryStatus', $pb.PbFieldType.OE, defaultOrMaker: $185.InquiryStatus.INQUIRY_STATUS_UNSPECIFIED, valueOf: $185.InquiryStatus.valueOf, enumValues: $185.InquiryStatus.values)
    ..aOM<$109.Timestamp>(8, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..aOB(9, _omitFieldNames ? '' : 'isReporter')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInquiry clone() => UserInquiry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInquiry copyWith(void Function(UserInquiry) updates) => super.copyWith((message) => updates(message as UserInquiry)) as UserInquiry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInquiry create() => UserInquiry._();
  UserInquiry createEmptyInstance() => create();
  static $pb.PbList<UserInquiry> createRepeated() => $pb.PbList<UserInquiry>();
  @$core.pragma('dart2js:noInline')
  static UserInquiry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInquiry>(create);
  static UserInquiry? _defaultInstance;

  /// 通報ID
  @$pb.TagNumber(1)
  $core.String get userInquiryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userInquiryId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserInquiryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInquiryId() => clearField(1);

  /// 通報者ユーザーID（自分が通報された場合は非表示）
  @$pb.TagNumber(2)
  $core.String get reporterUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set reporterUserId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReporterUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReporterUserId() => clearField(2);

  /// 被通報者ユーザーID
  @$pb.TagNumber(3)
  $core.String get reportedUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set reportedUserId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReportedUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearReportedUserId() => clearField(3);

  /// チャットルームID
  @$pb.TagNumber(4)
  $core.String get chatRoomId => $_getSZ(3);
  @$pb.TagNumber(4)
  set chatRoomId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChatRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearChatRoomId() => clearField(4);

  /// カテゴリ名
  @$pb.TagNumber(5)
  $core.String get categoryName => $_getSZ(4);
  @$pb.TagNumber(5)
  set categoryName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCategoryName() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategoryName() => clearField(5);

  /// 詳細内容（自分が通報された場合は非表示）
  @$pb.TagNumber(6)
  $core.String get inquiryDetails => $_getSZ(5);
  @$pb.TagNumber(6)
  set inquiryDetails($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasInquiryDetails() => $_has(5);
  @$pb.TagNumber(6)
  void clearInquiryDetails() => clearField(6);

  /// 対応ステータス
  @$pb.TagNumber(7)
  $185.InquiryStatus get inquiryStatus => $_getN(6);
  @$pb.TagNumber(7)
  set inquiryStatus($185.InquiryStatus v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasInquiryStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearInquiryStatus() => clearField(7);

  /// 作成日時
  @$pb.TagNumber(8)
  $109.Timestamp get createdAt => $_getN(7);
  @$pb.TagNumber(8)
  set createdAt($109.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $109.Timestamp ensureCreatedAt() => $_ensure(7);

  /// 自分が通報者かどうか
  @$pb.TagNumber(9)
  $core.bool get isReporter => $_getBF(8);
  @$pb.TagNumber(9)
  set isReporter($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsReporter() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsReporter() => clearField(9);
}

/// 懲戒処分情報
class DisciplinaryAction extends $pb.GeneratedMessage {
  factory DisciplinaryAction({
    $core.String? userDisciplinaryLogId,
    $186.DisciplinaryType? disciplinaryType,
    $core.String? title,
    $core.String? body,
    $109.Timestamp? sentAt,
    $core.bool? isAgreed,
    $109.Timestamp? agreedAt,
  }) {
    final $result = create();
    if (userDisciplinaryLogId != null) {
      $result.userDisciplinaryLogId = userDisciplinaryLogId;
    }
    if (disciplinaryType != null) {
      $result.disciplinaryType = disciplinaryType;
    }
    if (title != null) {
      $result.title = title;
    }
    if (body != null) {
      $result.body = body;
    }
    if (sentAt != null) {
      $result.sentAt = sentAt;
    }
    if (isAgreed != null) {
      $result.isAgreed = isAgreed;
    }
    if (agreedAt != null) {
      $result.agreedAt = agreedAt;
    }
    return $result;
  }
  DisciplinaryAction._() : super();
  factory DisciplinaryAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisciplinaryAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DisciplinaryAction', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userDisciplinaryLogId')
    ..e<$186.DisciplinaryType>(2, _omitFieldNames ? '' : 'disciplinaryType', $pb.PbFieldType.OE, defaultOrMaker: $186.DisciplinaryType.DISCIPLINARY_TYPE_UNSPECIFIED, valueOf: $186.DisciplinaryType.valueOf, enumValues: $186.DisciplinaryType.values)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'body')
    ..aOM<$109.Timestamp>(5, _omitFieldNames ? '' : 'sentAt', subBuilder: $109.Timestamp.create)
    ..aOB(6, _omitFieldNames ? '' : 'isAgreed')
    ..aOM<$109.Timestamp>(7, _omitFieldNames ? '' : 'agreedAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisciplinaryAction clone() => DisciplinaryAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisciplinaryAction copyWith(void Function(DisciplinaryAction) updates) => super.copyWith((message) => updates(message as DisciplinaryAction)) as DisciplinaryAction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisciplinaryAction create() => DisciplinaryAction._();
  DisciplinaryAction createEmptyInstance() => create();
  static $pb.PbList<DisciplinaryAction> createRepeated() => $pb.PbList<DisciplinaryAction>();
  @$core.pragma('dart2js:noInline')
  static DisciplinaryAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisciplinaryAction>(create);
  static DisciplinaryAction? _defaultInstance;

  /// 懲戒処分ログID
  @$pb.TagNumber(1)
  $core.String get userDisciplinaryLogId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userDisciplinaryLogId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserDisciplinaryLogId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserDisciplinaryLogId() => clearField(1);

  /// 懲戒処分タイプ（warning or ban）
  @$pb.TagNumber(2)
  $186.DisciplinaryType get disciplinaryType => $_getN(1);
  @$pb.TagNumber(2)
  set disciplinaryType($186.DisciplinaryType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisciplinaryType() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisciplinaryType() => clearField(2);

  /// タイトル
  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  /// 本文
  @$pb.TagNumber(4)
  $core.String get body => $_getSZ(3);
  @$pb.TagNumber(4)
  set body($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBody() => $_has(3);
  @$pb.TagNumber(4)
  void clearBody() => clearField(4);

  /// 送信日時
  @$pb.TagNumber(5)
  $109.Timestamp get sentAt => $_getN(4);
  @$pb.TagNumber(5)
  set sentAt($109.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSentAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearSentAt() => clearField(5);
  @$pb.TagNumber(5)
  $109.Timestamp ensureSentAt() => $_ensure(4);

  /// 同意済みかどうか（警告の場合のみ）
  @$pb.TagNumber(6)
  $core.bool get isAgreed => $_getBF(5);
  @$pb.TagNumber(6)
  set isAgreed($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsAgreed() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsAgreed() => clearField(6);

  /// 同意日時（警告の場合のみ）
  @$pb.TagNumber(7)
  $109.Timestamp get agreedAt => $_getN(6);
  @$pb.TagNumber(7)
  set agreedAt($109.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAgreedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearAgreedAt() => clearField(7);
  @$pb.TagNumber(7)
  $109.Timestamp ensureAgreedAt() => $_ensure(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
