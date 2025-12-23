// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counseling.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CounselingSession {
  String get chatRoomId;
  CounselingStatus get status;
  ChatMessageEntity? get lastAiMessage;
  DateTime? get startedAt;
  DateTime? get finishedAt;

  /// Create a copy of CounselingSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CounselingSessionCopyWith<CounselingSession> get copyWith =>
      _$CounselingSessionCopyWithImpl<CounselingSession>(
          this as CounselingSession, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CounselingSession &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastAiMessage, lastAiMessage) ||
                other.lastAiMessage == lastAiMessage) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, chatRoomId, status, lastAiMessage, startedAt, finishedAt);

  @override
  String toString() {
    return 'CounselingSession(chatRoomId: $chatRoomId, status: $status, lastAiMessage: $lastAiMessage, startedAt: $startedAt, finishedAt: $finishedAt)';
  }
}

/// @nodoc
abstract mixin class $CounselingSessionCopyWith<$Res> {
  factory $CounselingSessionCopyWith(
          CounselingSession value, $Res Function(CounselingSession) _then) =
      _$CounselingSessionCopyWithImpl;
  @useResult
  $Res call(
      {String chatRoomId,
      CounselingStatus status,
      ChatMessageEntity? lastAiMessage,
      DateTime? startedAt,
      DateTime? finishedAt});

  $ChatMessageEntityCopyWith<$Res>? get lastAiMessage;
}

/// @nodoc
class _$CounselingSessionCopyWithImpl<$Res>
    implements $CounselingSessionCopyWith<$Res> {
  _$CounselingSessionCopyWithImpl(this._self, this._then);

  final CounselingSession _self;
  final $Res Function(CounselingSession) _then;

  /// Create a copy of CounselingSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = null,
    Object? status = null,
    Object? lastAiMessage = freezed,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
  }) {
    return _then(_self.copyWith(
      chatRoomId: null == chatRoomId
          ? _self.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CounselingStatus,
      lastAiMessage: freezed == lastAiMessage
          ? _self.lastAiMessage
          : lastAiMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessageEntity?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _self.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of CounselingSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageEntityCopyWith<$Res>? get lastAiMessage {
    if (_self.lastAiMessage == null) {
      return null;
    }

    return $ChatMessageEntityCopyWith<$Res>(_self.lastAiMessage!, (value) {
      return _then(_self.copyWith(lastAiMessage: value));
    });
  }
}

/// @nodoc

class _CounselingSession extends CounselingSession {
  const _CounselingSession(
      {required this.chatRoomId,
      required this.status,
      this.lastAiMessage,
      this.startedAt,
      this.finishedAt})
      : super._();

  @override
  final String chatRoomId;
  @override
  final CounselingStatus status;
  @override
  final ChatMessageEntity? lastAiMessage;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? finishedAt;

  /// Create a copy of CounselingSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CounselingSessionCopyWith<_CounselingSession> get copyWith =>
      __$CounselingSessionCopyWithImpl<_CounselingSession>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CounselingSession &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastAiMessage, lastAiMessage) ||
                other.lastAiMessage == lastAiMessage) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, chatRoomId, status, lastAiMessage, startedAt, finishedAt);

  @override
  String toString() {
    return 'CounselingSession(chatRoomId: $chatRoomId, status: $status, lastAiMessage: $lastAiMessage, startedAt: $startedAt, finishedAt: $finishedAt)';
  }
}

/// @nodoc
abstract mixin class _$CounselingSessionCopyWith<$Res>
    implements $CounselingSessionCopyWith<$Res> {
  factory _$CounselingSessionCopyWith(
          _CounselingSession value, $Res Function(_CounselingSession) _then) =
      __$CounselingSessionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String chatRoomId,
      CounselingStatus status,
      ChatMessageEntity? lastAiMessage,
      DateTime? startedAt,
      DateTime? finishedAt});

  @override
  $ChatMessageEntityCopyWith<$Res>? get lastAiMessage;
}

/// @nodoc
class __$CounselingSessionCopyWithImpl<$Res>
    implements _$CounselingSessionCopyWith<$Res> {
  __$CounselingSessionCopyWithImpl(this._self, this._then);

  final _CounselingSession _self;
  final $Res Function(_CounselingSession) _then;

  /// Create a copy of CounselingSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chatRoomId = null,
    Object? status = null,
    Object? lastAiMessage = freezed,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
  }) {
    return _then(_CounselingSession(
      chatRoomId: null == chatRoomId
          ? _self.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CounselingStatus,
      lastAiMessage: freezed == lastAiMessage
          ? _self.lastAiMessage
          : lastAiMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessageEntity?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _self.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of CounselingSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageEntityCopyWith<$Res>? get lastAiMessage {
    if (_self.lastAiMessage == null) {
      return null;
    }

    return $ChatMessageEntityCopyWith<$Res>(_self.lastAiMessage!, (value) {
      return _then(_self.copyWith(lastAiMessage: value));
    });
  }
}

// dart format on
