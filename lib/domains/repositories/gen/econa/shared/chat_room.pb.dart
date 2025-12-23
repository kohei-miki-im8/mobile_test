//
//  Generated code. Do not modify.
//  source: econa/shared/chat_room.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;
import '../enums/messenger_status_badge.pbenum.dart' as $152;
import 'chat_message.pb.dart' as $151;
import 'signed_url.pb.dart' as $114;
import 'thumbnail_user.pb.dart' as $147;

/// チャットルーム
class ChatRoom extends $pb.GeneratedMessage {
  factory ChatRoom({
    $core.String? chatRoomId,
    $147.ThumbnailUser? thumbnailUser,
    $151.ChatMessage? latestChatMessage,
    $152.MessengerStatusBadge? messengerStatusBadge,
    $core.bool? isVisible,
    $109.Timestamp? createdAt,
    $109.Timestamp? updatedAt,
    $core.bool? isForceReadPurchased,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (thumbnailUser != null) {
      $result.thumbnailUser = thumbnailUser;
    }
    if (latestChatMessage != null) {
      $result.latestChatMessage = latestChatMessage;
    }
    if (messengerStatusBadge != null) {
      $result.messengerStatusBadge = messengerStatusBadge;
    }
    if (isVisible != null) {
      $result.isVisible = isVisible;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (isForceReadPurchased != null) {
      $result.isForceReadPurchased = isForceReadPurchased;
    }
    return $result;
  }
  ChatRoom._() : super();
  factory ChatRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..aOM<$147.ThumbnailUser>(2, _omitFieldNames ? '' : 'thumbnailUser', subBuilder: $147.ThumbnailUser.create)
    ..aOM<$151.ChatMessage>(3, _omitFieldNames ? '' : 'latestChatMessage', subBuilder: $151.ChatMessage.create)
    ..e<$152.MessengerStatusBadge>(4, _omitFieldNames ? '' : 'messengerStatusBadge', $pb.PbFieldType.OE, defaultOrMaker: $152.MessengerStatusBadge.MESSENGER_STATUS_BADGE_UNSPECIFIED, valueOf: $152.MessengerStatusBadge.valueOf, enumValues: $152.MessengerStatusBadge.values)
    ..aOB(5, _omitFieldNames ? '' : 'isVisible')
    ..aOM<$109.Timestamp>(6, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(7, _omitFieldNames ? '' : 'updatedAt', subBuilder: $109.Timestamp.create)
    ..aOB(8, _omitFieldNames ? '' : 'isForceReadPurchased')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatRoom clone() => ChatRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatRoom copyWith(void Function(ChatRoom) updates) => super.copyWith((message) => updates(message as ChatRoom)) as ChatRoom;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoom create() => ChatRoom._();
  ChatRoom createEmptyInstance() => create();
  static $pb.PbList<ChatRoom> createRepeated() => $pb.PbList<ChatRoom>();
  @$core.pragma('dart2js:noInline')
  static ChatRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatRoom>(create);
  static ChatRoom? _defaultInstance;

  /// チャットルームID
  @$pb.TagNumber(1)
  $core.String get chatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoomId() => clearField(1);

  /// サムネイルユーザー
  @$pb.TagNumber(2)
  $147.ThumbnailUser get thumbnailUser => $_getN(1);
  @$pb.TagNumber(2)
  set thumbnailUser($147.ThumbnailUser v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasThumbnailUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearThumbnailUser() => clearField(2);
  @$pb.TagNumber(2)
  $147.ThumbnailUser ensureThumbnailUser() => $_ensure(1);

  /// 最新メッセージ
  @$pb.TagNumber(3)
  $151.ChatMessage get latestChatMessage => $_getN(2);
  @$pb.TagNumber(3)
  set latestChatMessage($151.ChatMessage v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLatestChatMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatestChatMessage() => clearField(3);
  @$pb.TagNumber(3)
  $151.ChatMessage ensureLatestChatMessage() => $_ensure(2);

  /// メッセンジャーステータスバッジ
  @$pb.TagNumber(4)
  $152.MessengerStatusBadge get messengerStatusBadge => $_getN(3);
  @$pb.TagNumber(4)
  set messengerStatusBadge($152.MessengerStatusBadge v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessengerStatusBadge() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessengerStatusBadge() => clearField(4);

  /// 表示区分
  @$pb.TagNumber(5)
  $core.bool get isVisible => $_getBF(4);
  @$pb.TagNumber(5)
  set isVisible($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsVisible() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsVisible() => clearField(5);

  /// 作成日時
  @$pb.TagNumber(6)
  $109.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($109.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $109.Timestamp ensureCreatedAt() => $_ensure(5);

  /// 更新日時
  @$pb.TagNumber(7)
  $109.Timestamp get updatedAt => $_getN(6);
  @$pb.TagNumber(7)
  set updatedAt($109.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $109.Timestamp ensureUpdatedAt() => $_ensure(6);

  /// 既読開放購入済みかどうか
  @$pb.TagNumber(8)
  $core.bool get isForceReadPurchased => $_getBF(7);
  @$pb.TagNumber(8)
  set isForceReadPurchased($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsForceReadPurchased() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsForceReadPurchased() => clearField(8);
}

/// スケジュールチャットルーム
class ScheduledChatRoom extends $pb.GeneratedMessage {
  factory ScheduledChatRoom({
    $core.String? scheduledChatRoomId,
    $147.ThumbnailUser? thumbnailUser,
    $109.Timestamp? createdAt,
  }) {
    final $result = create();
    if (scheduledChatRoomId != null) {
      $result.scheduledChatRoomId = scheduledChatRoomId;
    }
    if (thumbnailUser != null) {
      $result.thumbnailUser = thumbnailUser;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  ScheduledChatRoom._() : super();
  factory ScheduledChatRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScheduledChatRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ScheduledChatRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'scheduledChatRoomId')
    ..aOM<$147.ThumbnailUser>(2, _omitFieldNames ? '' : 'thumbnailUser', subBuilder: $147.ThumbnailUser.create)
    ..aOM<$109.Timestamp>(3, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScheduledChatRoom clone() => ScheduledChatRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScheduledChatRoom copyWith(void Function(ScheduledChatRoom) updates) => super.copyWith((message) => updates(message as ScheduledChatRoom)) as ScheduledChatRoom;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduledChatRoom create() => ScheduledChatRoom._();
  ScheduledChatRoom createEmptyInstance() => create();
  static $pb.PbList<ScheduledChatRoom> createRepeated() => $pb.PbList<ScheduledChatRoom>();
  @$core.pragma('dart2js:noInline')
  static ScheduledChatRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScheduledChatRoom>(create);
  static ScheduledChatRoom? _defaultInstance;

  /// チャットルームID
  /// マッチング後1日が経過するか、どちらかがチャットを送るまではスケジュールされたチャットルーム扱いとなるが、IDは変わらない
  @$pb.TagNumber(1)
  $core.String get scheduledChatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set scheduledChatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasScheduledChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearScheduledChatRoomId() => clearField(1);

  /// サムネイルユーザー
  @$pb.TagNumber(2)
  $147.ThumbnailUser get thumbnailUser => $_getN(1);
  @$pb.TagNumber(2)
  set thumbnailUser($147.ThumbnailUser v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasThumbnailUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearThumbnailUser() => clearField(2);
  @$pb.TagNumber(2)
  $147.ThumbnailUser ensureThumbnailUser() => $_ensure(1);

  /// 作成日時
  @$pb.TagNumber(3)
  $109.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($109.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $109.Timestamp ensureCreatedAt() => $_ensure(2);
}

/// シミュレーターチャットルーム
class SimulatorChatRoom extends $pb.GeneratedMessage {
  factory SimulatorChatRoom({
    $core.String? chatRoomId,
    $core.String? toUserId,
    $core.String? anonymizeDummyNickname,
    $109.Timestamp? birthday,
    $core.String? simplifiedPersonalitySummary,
    $core.bool? isSkeleton,
    $core.String? dummyPhotoId,
    $114.SignedImageUrls? dummyProfilePhotoUrls,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (anonymizeDummyNickname != null) {
      $result.anonymizeDummyNickname = anonymizeDummyNickname;
    }
    if (birthday != null) {
      $result.birthday = birthday;
    }
    if (simplifiedPersonalitySummary != null) {
      $result.simplifiedPersonalitySummary = simplifiedPersonalitySummary;
    }
    if (isSkeleton != null) {
      $result.isSkeleton = isSkeleton;
    }
    if (dummyPhotoId != null) {
      $result.dummyPhotoId = dummyPhotoId;
    }
    if (dummyProfilePhotoUrls != null) {
      $result.dummyProfilePhotoUrls = dummyProfilePhotoUrls;
    }
    return $result;
  }
  SimulatorChatRoom._() : super();
  factory SimulatorChatRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SimulatorChatRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SimulatorChatRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..aOS(2, _omitFieldNames ? '' : 'toUserId')
    ..aOS(3, _omitFieldNames ? '' : 'anonymizeDummyNickname')
    ..aOM<$109.Timestamp>(4, _omitFieldNames ? '' : 'birthday', subBuilder: $109.Timestamp.create)
    ..aOS(5, _omitFieldNames ? '' : 'simplifiedPersonalitySummary')
    ..aOB(6, _omitFieldNames ? '' : 'isSkeleton')
    ..aOS(7, _omitFieldNames ? '' : 'dummyPhotoId')
    ..aOM<$114.SignedImageUrls>(8, _omitFieldNames ? '' : 'dummyProfilePhotoUrls', subBuilder: $114.SignedImageUrls.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SimulatorChatRoom clone() => SimulatorChatRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SimulatorChatRoom copyWith(void Function(SimulatorChatRoom) updates) => super.copyWith((message) => updates(message as SimulatorChatRoom)) as SimulatorChatRoom;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimulatorChatRoom create() => SimulatorChatRoom._();
  SimulatorChatRoom createEmptyInstance() => create();
  static $pb.PbList<SimulatorChatRoom> createRepeated() => $pb.PbList<SimulatorChatRoom>();
  @$core.pragma('dart2js:noInline')
  static SimulatorChatRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SimulatorChatRoom>(create);
  static SimulatorChatRoom? _defaultInstance;

  /// チャットルームID
  @$pb.TagNumber(1)
  $core.String get chatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoomId() => clearField(1);

  /// ユーザーID
  @$pb.TagNumber(2)
  $core.String get toUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set toUserId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearToUserId() => clearField(2);

  /// 匿名化されたニックネーム
  @$pb.TagNumber(3)
  $core.String get anonymizeDummyNickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set anonymizeDummyNickname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAnonymizeDummyNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnonymizeDummyNickname() => clearField(3);

  /// 誕生日
  @$pb.TagNumber(4)
  $109.Timestamp get birthday => $_getN(3);
  @$pb.TagNumber(4)
  set birthday($109.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBirthday() => $_has(3);
  @$pb.TagNumber(4)
  void clearBirthday() => clearField(4);
  @$pb.TagNumber(4)
  $109.Timestamp ensureBirthday() => $_ensure(3);

  /// 簡略化された性格サマリー
  @$pb.TagNumber(5)
  $core.String get simplifiedPersonalitySummary => $_getSZ(4);
  @$pb.TagNumber(5)
  set simplifiedPersonalitySummary($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSimplifiedPersonalitySummary() => $_has(4);
  @$pb.TagNumber(5)
  void clearSimplifiedPersonalitySummary() => clearField(5);

  /// スケルトンチャットルーム（まだ存在しないチャットルーム）かどうか
  @$pb.TagNumber(6)
  $core.bool get isSkeleton => $_getBF(5);
  @$pb.TagNumber(6)
  set isSkeleton($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsSkeleton() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsSkeleton() => clearField(6);

  /// ダミー写真ID（Create時に指定された値、skeleton/既存ルームの両方で返却）
  @$pb.TagNumber(7)
  $core.String get dummyPhotoId => $_getSZ(6);
  @$pb.TagNumber(7)
  set dummyPhotoId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDummyPhotoId() => $_has(6);
  @$pb.TagNumber(7)
  void clearDummyPhotoId() => clearField(7);

  /// ダミープロフィール画像のURL情報
  @$pb.TagNumber(8)
  $114.SignedImageUrls get dummyProfilePhotoUrls => $_getN(7);
  @$pb.TagNumber(8)
  set dummyProfilePhotoUrls($114.SignedImageUrls v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDummyProfilePhotoUrls() => $_has(7);
  @$pb.TagNumber(8)
  void clearDummyProfilePhotoUrls() => clearField(8);
  @$pb.TagNumber(8)
  $114.SignedImageUrls ensureDummyProfilePhotoUrls() => $_ensure(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
