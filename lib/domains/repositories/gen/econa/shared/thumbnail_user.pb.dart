//
//  Generated code. Do not modify.
//  source: econa/shared/thumbnail_user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;
import '../enums/newbie_tag.pbenum.dart' as $144;
import '../enums/user_activity_tag.pbenum.dart' as $145;
import 'like.pb.dart' as $141;
import 'profile.pb.dart' as $140;
import 'recommendation.pb.dart' as $143;
import 'user.pb.dart' as $142;

/// サムネイルユーザー
class ThumbnailUser extends $pb.GeneratedMessage {
  factory ThumbnailUser({
    $core.String? userId,
    $140.Profile? profile,
    $141.Like? like,
    $141.Like? receivedLike,
    $142.UserStatus? userStatus,
    $core.bool? isFavorite,
    $109.Timestamp? lastActivityAt,
    $143.RecommendationScore? recommendationScore,
    $144.NewbieTag? newbieTag,
    $145.UserActivityTag? userActivityTag,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (profile != null) {
      $result.profile = profile;
    }
    if (like != null) {
      $result.like = like;
    }
    if (receivedLike != null) {
      $result.receivedLike = receivedLike;
    }
    if (userStatus != null) {
      $result.userStatus = userStatus;
    }
    if (isFavorite != null) {
      $result.isFavorite = isFavorite;
    }
    if (lastActivityAt != null) {
      $result.lastActivityAt = lastActivityAt;
    }
    if (recommendationScore != null) {
      $result.recommendationScore = recommendationScore;
    }
    if (newbieTag != null) {
      $result.newbieTag = newbieTag;
    }
    if (userActivityTag != null) {
      $result.userActivityTag = userActivityTag;
    }
    return $result;
  }
  ThumbnailUser._() : super();
  factory ThumbnailUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ThumbnailUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ThumbnailUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOM<$140.Profile>(2, _omitFieldNames ? '' : 'profile', subBuilder: $140.Profile.create)
    ..aOM<$141.Like>(3, _omitFieldNames ? '' : 'like', subBuilder: $141.Like.create)
    ..aOM<$141.Like>(4, _omitFieldNames ? '' : 'receivedLike', subBuilder: $141.Like.create)
    ..aOM<$142.UserStatus>(5, _omitFieldNames ? '' : 'userStatus', subBuilder: $142.UserStatus.create)
    ..aOB(6, _omitFieldNames ? '' : 'isFavorite')
    ..aOM<$109.Timestamp>(7, _omitFieldNames ? '' : 'lastActivityAt', subBuilder: $109.Timestamp.create)
    ..aOM<$143.RecommendationScore>(8, _omitFieldNames ? '' : 'recommendationScore', subBuilder: $143.RecommendationScore.create)
    ..e<$144.NewbieTag>(9, _omitFieldNames ? '' : 'newbieTag', $pb.PbFieldType.OE, defaultOrMaker: $144.NewbieTag.NEWBIE_TAG_UNSPECIFIED, valueOf: $144.NewbieTag.valueOf, enumValues: $144.NewbieTag.values)
    ..e<$145.UserActivityTag>(10, _omitFieldNames ? '' : 'userActivityTag', $pb.PbFieldType.OE, defaultOrMaker: $145.UserActivityTag.USER_ACTIVITY_TAG_UNSPECIFIED, valueOf: $145.UserActivityTag.valueOf, enumValues: $145.UserActivityTag.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ThumbnailUser clone() => ThumbnailUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ThumbnailUser copyWith(void Function(ThumbnailUser) updates) => super.copyWith((message) => updates(message as ThumbnailUser)) as ThumbnailUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ThumbnailUser create() => ThumbnailUser._();
  ThumbnailUser createEmptyInstance() => create();
  static $pb.PbList<ThumbnailUser> createRepeated() => $pb.PbList<ThumbnailUser>();
  @$core.pragma('dart2js:noInline')
  static ThumbnailUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ThumbnailUser>(create);
  static ThumbnailUser? _defaultInstance;

  /// ユーザーID
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// プロフィール
  @$pb.TagNumber(2)
  $140.Profile get profile => $_getN(1);
  @$pb.TagNumber(2)
  set profile($140.Profile v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProfile() => $_has(1);
  @$pb.TagNumber(2)
  void clearProfile() => clearField(2);
  @$pb.TagNumber(2)
  $140.Profile ensureProfile() => $_ensure(1);

  /// お相手へのいいね
  @$pb.TagNumber(3)
  $141.Like get like => $_getN(2);
  @$pb.TagNumber(3)
  set like($141.Like v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLike() => $_has(2);
  @$pb.TagNumber(3)
  void clearLike() => clearField(3);
  @$pb.TagNumber(3)
  $141.Like ensureLike() => $_ensure(2);

  /// お相手からのいいね
  @$pb.TagNumber(4)
  $141.Like get receivedLike => $_getN(3);
  @$pb.TagNumber(4)
  set receivedLike($141.Like v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasReceivedLike() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceivedLike() => clearField(4);
  @$pb.TagNumber(4)
  $141.Like ensureReceivedLike() => $_ensure(3);

  /// ユーザーステータス
  @$pb.TagNumber(5)
  $142.UserStatus get userStatus => $_getN(4);
  @$pb.TagNumber(5)
  set userStatus($142.UserStatus v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserStatus() => clearField(5);
  @$pb.TagNumber(5)
  $142.UserStatus ensureUserStatus() => $_ensure(4);

  /// お気に入り
  @$pb.TagNumber(6)
  $core.bool get isFavorite => $_getBF(5);
  @$pb.TagNumber(6)
  set isFavorite($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsFavorite() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsFavorite() => clearField(6);

  /// 最終アクティブ時刻（ソート用）
  @$pb.TagNumber(7)
  $109.Timestamp get lastActivityAt => $_getN(6);
  @$pb.TagNumber(7)
  set lastActivityAt($109.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastActivityAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastActivityAt() => clearField(7);
  @$pb.TagNumber(7)
  $109.Timestamp ensureLastActivityAt() => $_ensure(6);

  /// レコメンデーションスコア情報（まだレコードが存在しない場合もある）
  @$pb.TagNumber(8)
  $143.RecommendationScore get recommendationScore => $_getN(7);
  @$pb.TagNumber(8)
  set recommendationScore($143.RecommendationScore v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasRecommendationScore() => $_has(7);
  @$pb.TagNumber(8)
  void clearRecommendationScore() => clearField(8);
  @$pb.TagNumber(8)
  $143.RecommendationScore ensureRecommendationScore() => $_ensure(7);

  /// 新人タグ
  @$pb.TagNumber(9)
  $144.NewbieTag get newbieTag => $_getN(8);
  @$pb.TagNumber(9)
  set newbieTag($144.NewbieTag v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasNewbieTag() => $_has(8);
  @$pb.TagNumber(9)
  void clearNewbieTag() => clearField(9);

  /// 活動タグ
  @$pb.TagNumber(10)
  $145.UserActivityTag get userActivityTag => $_getN(9);
  @$pb.TagNumber(10)
  set userActivityTag($145.UserActivityTag v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUserActivityTag() => $_has(9);
  @$pb.TagNumber(10)
  void clearUserActivityTag() => clearField(10);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
