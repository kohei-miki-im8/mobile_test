// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_input_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatInputConfig {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChatInputConfig);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChatInputConfig()';
  }
}

/// @nodoc
class $ChatInputConfigCopyWith<$Res> {
  $ChatInputConfigCopyWith(
      ChatInputConfig _, $Res Function(ChatInputConfig) __);
}

/// @nodoc

class ChatInputConfigChat implements ChatInputConfig {
  const ChatInputConfigChat(
      {required this.userId,
      required this.chatRoomId,
      this.hintText,
      final List<Widget> chatActions = const <Widget>[],
      this.onSend})
      : _chatActions = chatActions;

  final String userId;
  final String chatRoomId;
  final String? hintText;
  final List<Widget> _chatActions;
  @JsonKey()
  List<Widget> get chatActions {
    if (_chatActions is EqualUnmodifiableListView) return _chatActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatActions);
  }

  final Future<void> Function()? onSend;

  /// Create a copy of ChatInputConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatInputConfigChatCopyWith<ChatInputConfigChat> get copyWith =>
      _$ChatInputConfigChatCopyWithImpl<ChatInputConfigChat>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatInputConfigChat &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId) &&
            (identical(other.hintText, hintText) ||
                other.hintText == hintText) &&
            const DeepCollectionEquality()
                .equals(other._chatActions, _chatActions) &&
            (identical(other.onSend, onSend) || other.onSend == onSend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, chatRoomId, hintText,
      const DeepCollectionEquality().hash(_chatActions), onSend);

  @override
  String toString() {
    return 'ChatInputConfig.chat(userId: $userId, chatRoomId: $chatRoomId, hintText: $hintText, chatActions: $chatActions, onSend: $onSend)';
  }
}

/// @nodoc
abstract mixin class $ChatInputConfigChatCopyWith<$Res>
    implements $ChatInputConfigCopyWith<$Res> {
  factory $ChatInputConfigChatCopyWith(
          ChatInputConfigChat value, $Res Function(ChatInputConfigChat) _then) =
      _$ChatInputConfigChatCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String chatRoomId,
      String? hintText,
      List<Widget> chatActions,
      Future<void> Function()? onSend});
}

/// @nodoc
class _$ChatInputConfigChatCopyWithImpl<$Res>
    implements $ChatInputConfigChatCopyWith<$Res> {
  _$ChatInputConfigChatCopyWithImpl(this._self, this._then);

  final ChatInputConfigChat _self;
  final $Res Function(ChatInputConfigChat) _then;

  /// Create a copy of ChatInputConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? chatRoomId = null,
    Object? hintText = freezed,
    Object? chatActions = null,
    Object? onSend = freezed,
  }) {
    return _then(ChatInputConfigChat(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      chatRoomId: null == chatRoomId
          ? _self.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      hintText: freezed == hintText
          ? _self.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String?,
      chatActions: null == chatActions
          ? _self._chatActions
          : chatActions // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
      onSend: freezed == onSend
          ? _self.onSend
          : onSend // ignore: cast_nullable_to_non_nullable
              as Future<void> Function()?,
    ));
  }
}

/// @nodoc

class ChatInputConfigQuestion implements ChatInputConfig {
  const ChatInputConfigQuestion(
      {this.toUserId, this.userQuestionId, this.questionId, this.initialPhase});

  final String? toUserId;
  final String? userQuestionId;
  final String? questionId;
  final QuestionPhase? initialPhase;

  /// Create a copy of ChatInputConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatInputConfigQuestionCopyWith<ChatInputConfigQuestion> get copyWith =>
      _$ChatInputConfigQuestionCopyWithImpl<ChatInputConfigQuestion>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatInputConfigQuestion &&
            (identical(other.toUserId, toUserId) ||
                other.toUserId == toUserId) &&
            (identical(other.userQuestionId, userQuestionId) ||
                other.userQuestionId == userQuestionId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.initialPhase, initialPhase) ||
                other.initialPhase == initialPhase));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, toUserId, userQuestionId, questionId, initialPhase);

  @override
  String toString() {
    return 'ChatInputConfig.question(toUserId: $toUserId, userQuestionId: $userQuestionId, questionId: $questionId, initialPhase: $initialPhase)';
  }
}

/// @nodoc
abstract mixin class $ChatInputConfigQuestionCopyWith<$Res>
    implements $ChatInputConfigCopyWith<$Res> {
  factory $ChatInputConfigQuestionCopyWith(ChatInputConfigQuestion value,
          $Res Function(ChatInputConfigQuestion) _then) =
      _$ChatInputConfigQuestionCopyWithImpl;
  @useResult
  $Res call(
      {String? toUserId,
      String? userQuestionId,
      String? questionId,
      QuestionPhase? initialPhase});
}

/// @nodoc
class _$ChatInputConfigQuestionCopyWithImpl<$Res>
    implements $ChatInputConfigQuestionCopyWith<$Res> {
  _$ChatInputConfigQuestionCopyWithImpl(this._self, this._then);

  final ChatInputConfigQuestion _self;
  final $Res Function(ChatInputConfigQuestion) _then;

  /// Create a copy of ChatInputConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? toUserId = freezed,
    Object? userQuestionId = freezed,
    Object? questionId = freezed,
    Object? initialPhase = freezed,
  }) {
    return _then(ChatInputConfigQuestion(
      toUserId: freezed == toUserId
          ? _self.toUserId
          : toUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      userQuestionId: freezed == userQuestionId
          ? _self.userQuestionId
          : userQuestionId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: freezed == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      initialPhase: freezed == initialPhase
          ? _self.initialPhase
          : initialPhase // ignore: cast_nullable_to_non_nullable
              as QuestionPhase?,
    ));
  }
}

/// @nodoc

class ChatInputConfigSimple implements ChatInputConfig {
  const ChatInputConfigSimple(
      {required this.userId,
      required this.chatRoomId,
      required this.aiAgentCode,
      this.hintText,
      this.initialMessage,
      this.onSend,
      this.onSendSuccess});

  final String userId;
  final String chatRoomId;
  final AiAgentCode aiAgentCode;
  final String? hintText;
  final String? initialMessage;
  final Future<void> Function(String text, {XFile? photo})? onSend;
  final VoidCallback? onSendSuccess;

  /// Create a copy of ChatInputConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatInputConfigSimpleCopyWith<ChatInputConfigSimple> get copyWith =>
      _$ChatInputConfigSimpleCopyWithImpl<ChatInputConfigSimple>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatInputConfigSimple &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId) &&
            (identical(other.aiAgentCode, aiAgentCode) ||
                other.aiAgentCode == aiAgentCode) &&
            (identical(other.hintText, hintText) ||
                other.hintText == hintText) &&
            (identical(other.initialMessage, initialMessage) ||
                other.initialMessage == initialMessage) &&
            (identical(other.onSend, onSend) || other.onSend == onSend) &&
            (identical(other.onSendSuccess, onSendSuccess) ||
                other.onSendSuccess == onSendSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, chatRoomId, aiAgentCode,
      hintText, initialMessage, onSend, onSendSuccess);

  @override
  String toString() {
    return 'ChatInputConfig.simple(userId: $userId, chatRoomId: $chatRoomId, aiAgentCode: $aiAgentCode, hintText: $hintText, initialMessage: $initialMessage, onSend: $onSend, onSendSuccess: $onSendSuccess)';
  }
}

/// @nodoc
abstract mixin class $ChatInputConfigSimpleCopyWith<$Res>
    implements $ChatInputConfigCopyWith<$Res> {
  factory $ChatInputConfigSimpleCopyWith(ChatInputConfigSimple value,
          $Res Function(ChatInputConfigSimple) _then) =
      _$ChatInputConfigSimpleCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String chatRoomId,
      AiAgentCode aiAgentCode,
      String? hintText,
      String? initialMessage,
      Future<void> Function(String text, {XFile? photo})? onSend,
      VoidCallback? onSendSuccess});
}

/// @nodoc
class _$ChatInputConfigSimpleCopyWithImpl<$Res>
    implements $ChatInputConfigSimpleCopyWith<$Res> {
  _$ChatInputConfigSimpleCopyWithImpl(this._self, this._then);

  final ChatInputConfigSimple _self;
  final $Res Function(ChatInputConfigSimple) _then;

  /// Create a copy of ChatInputConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? chatRoomId = null,
    Object? aiAgentCode = null,
    Object? hintText = freezed,
    Object? initialMessage = freezed,
    Object? onSend = freezed,
    Object? onSendSuccess = freezed,
  }) {
    return _then(ChatInputConfigSimple(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      chatRoomId: null == chatRoomId
          ? _self.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      aiAgentCode: null == aiAgentCode
          ? _self.aiAgentCode
          : aiAgentCode // ignore: cast_nullable_to_non_nullable
              as AiAgentCode,
      hintText: freezed == hintText
          ? _self.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String?,
      initialMessage: freezed == initialMessage
          ? _self.initialMessage
          : initialMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      onSend: freezed == onSend
          ? _self.onSend
          : onSend // ignore: cast_nullable_to_non_nullable
              as Future<void> Function(String text, {XFile? photo})?,
      onSendSuccess: freezed == onSendSuccess
          ? _self.onSendSuccess
          : onSendSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

// dart format on
