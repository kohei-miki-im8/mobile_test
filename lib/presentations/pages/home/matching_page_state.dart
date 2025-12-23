import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// マッチング相手の情報を表すクラス
@immutable
class Matching {
  const Matching({
    required this.chatRoomId,
    required this.myUserId,
    required this.toUserId,
    required this.toUserBestImageUrl,
    required this.isToUserMale,
  });

  final String chatRoomId;
  final String myUserId;
  final String toUserId;
  final String toUserBestImageUrl;
  final bool isToUserMale;
}

/// マッチングページの状態を表すクラス
@immutable
class MatchingPageState {
  const MatchingPageState({
    this.myBestImageUrl = const AsyncValue.data(''),
    this.isUserMale = const AsyncValue.data(false),
    this.commonTags = const AsyncValue.data([]),
    this.shouldShowChatInput = const AsyncValue.data(false),
    this.initialMessage = const AsyncValue.data(''),
  });

  /// 自分の画像URL
  final AsyncValue<String> myBestImageUrl;

  /// 自分の性別（true: 男性, false: 女性）
  final AsyncValue<bool> isUserMale;

  /// 共通タグ一覧
  final AsyncValue<List<String>> commonTags;

  /// チャット入力欄を表示するかどうか
  /// 女性: 本人確認済み
  /// 男性: 本人確認済み && サブスクリプション加入済み
  final AsyncValue<bool> shouldShowChatInput;

  /// 初回メッセージ
  final AsyncValue<String> initialMessage;

  MatchingPageState copyWith({
    AsyncValue<String>? myBestImageUrl,
    AsyncValue<bool>? isUserMale,
    AsyncValue<List<String>>? commonTags,
    AsyncValue<bool>? shouldShowChatInput,
    AsyncValue<String>? initialMessage,
  }) {
    return MatchingPageState(
      myBestImageUrl: myBestImageUrl ?? this.myBestImageUrl,
      isUserMale: isUserMale ?? this.isUserMale,
      commonTags: commonTags ?? this.commonTags,
      shouldShowChatInput: shouldShowChatInput ?? this.shouldShowChatInput,
      initialMessage: initialMessage ?? this.initialMessage,
    );
  }
}
