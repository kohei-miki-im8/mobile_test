// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessageEntity {
  String get chatMessageId;
  String get publishedUserId;
  DateTime get sentAt;
  ChatMessageContentEntity get content;
  AiAgentCode get aiAgentCode;

  /// Create a copy of ChatMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatMessageEntityCopyWith<ChatMessageEntity> get copyWith =>
      _$ChatMessageEntityCopyWithImpl<ChatMessageEntity>(
          this as ChatMessageEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatMessageEntity &&
            (identical(other.chatMessageId, chatMessageId) ||
                other.chatMessageId == chatMessageId) &&
            (identical(other.publishedUserId, publishedUserId) ||
                other.publishedUserId == publishedUserId) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.aiAgentCode, aiAgentCode) ||
                other.aiAgentCode == aiAgentCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatMessageId, publishedUserId,
      sentAt, content, aiAgentCode);

  @override
  String toString() {
    return 'ChatMessageEntity(chatMessageId: $chatMessageId, publishedUserId: $publishedUserId, sentAt: $sentAt, content: $content, aiAgentCode: $aiAgentCode)';
  }
}

/// @nodoc
abstract mixin class $ChatMessageEntityCopyWith<$Res> {
  factory $ChatMessageEntityCopyWith(
          ChatMessageEntity value, $Res Function(ChatMessageEntity) _then) =
      _$ChatMessageEntityCopyWithImpl;
  @useResult
  $Res call(
      {String chatMessageId,
      String publishedUserId,
      DateTime sentAt,
      ChatMessageContentEntity content,
      AiAgentCode aiAgentCode});

  $ChatMessageContentEntityCopyWith<$Res> get content;
}

/// @nodoc
class _$ChatMessageEntityCopyWithImpl<$Res>
    implements $ChatMessageEntityCopyWith<$Res> {
  _$ChatMessageEntityCopyWithImpl(this._self, this._then);

  final ChatMessageEntity _self;
  final $Res Function(ChatMessageEntity) _then;

  /// Create a copy of ChatMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatMessageId = null,
    Object? publishedUserId = null,
    Object? sentAt = null,
    Object? content = null,
    Object? aiAgentCode = null,
  }) {
    return _then(_self.copyWith(
      chatMessageId: null == chatMessageId
          ? _self.chatMessageId
          : chatMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      publishedUserId: null == publishedUserId
          ? _self.publishedUserId
          : publishedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as ChatMessageContentEntity,
      aiAgentCode: null == aiAgentCode
          ? _self.aiAgentCode
          : aiAgentCode // ignore: cast_nullable_to_non_nullable
              as AiAgentCode,
    ));
  }

  /// Create a copy of ChatMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageContentEntityCopyWith<$Res> get content {
    return $ChatMessageContentEntityCopyWith<$Res>(_self.content, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc

class _ChatMessageEntity implements ChatMessageEntity {
  const _ChatMessageEntity(
      {required this.chatMessageId,
      required this.publishedUserId,
      required this.sentAt,
      required this.content,
      required this.aiAgentCode});

  @override
  final String chatMessageId;
  @override
  final String publishedUserId;
  @override
  final DateTime sentAt;
  @override
  final ChatMessageContentEntity content;
  @override
  final AiAgentCode aiAgentCode;

  /// Create a copy of ChatMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatMessageEntityCopyWith<_ChatMessageEntity> get copyWith =>
      __$ChatMessageEntityCopyWithImpl<_ChatMessageEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessageEntity &&
            (identical(other.chatMessageId, chatMessageId) ||
                other.chatMessageId == chatMessageId) &&
            (identical(other.publishedUserId, publishedUserId) ||
                other.publishedUserId == publishedUserId) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.aiAgentCode, aiAgentCode) ||
                other.aiAgentCode == aiAgentCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatMessageId, publishedUserId,
      sentAt, content, aiAgentCode);

  @override
  String toString() {
    return 'ChatMessageEntity(chatMessageId: $chatMessageId, publishedUserId: $publishedUserId, sentAt: $sentAt, content: $content, aiAgentCode: $aiAgentCode)';
  }
}

/// @nodoc
abstract mixin class _$ChatMessageEntityCopyWith<$Res>
    implements $ChatMessageEntityCopyWith<$Res> {
  factory _$ChatMessageEntityCopyWith(
          _ChatMessageEntity value, $Res Function(_ChatMessageEntity) _then) =
      __$ChatMessageEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String chatMessageId,
      String publishedUserId,
      DateTime sentAt,
      ChatMessageContentEntity content,
      AiAgentCode aiAgentCode});

  @override
  $ChatMessageContentEntityCopyWith<$Res> get content;
}

/// @nodoc
class __$ChatMessageEntityCopyWithImpl<$Res>
    implements _$ChatMessageEntityCopyWith<$Res> {
  __$ChatMessageEntityCopyWithImpl(this._self, this._then);

  final _ChatMessageEntity _self;
  final $Res Function(_ChatMessageEntity) _then;

  /// Create a copy of ChatMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chatMessageId = null,
    Object? publishedUserId = null,
    Object? sentAt = null,
    Object? content = null,
    Object? aiAgentCode = null,
  }) {
    return _then(_ChatMessageEntity(
      chatMessageId: null == chatMessageId
          ? _self.chatMessageId
          : chatMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      publishedUserId: null == publishedUserId
          ? _self.publishedUserId
          : publishedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as ChatMessageContentEntity,
      aiAgentCode: null == aiAgentCode
          ? _self.aiAgentCode
          : aiAgentCode // ignore: cast_nullable_to_non_nullable
              as AiAgentCode,
    ));
  }

  /// Create a copy of ChatMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageContentEntityCopyWith<$Res> get content {
    return $ChatMessageContentEntityCopyWith<$Res>(_self.content, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc
mixin _$ChatMessageContentEntity {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChatMessageContentEntity);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChatMessageContentEntity()';
  }
}

/// @nodoc
class $ChatMessageContentEntityCopyWith<$Res> {
  $ChatMessageContentEntityCopyWith(
      ChatMessageContentEntity _, $Res Function(ChatMessageContentEntity) __);
}

/// @nodoc

class _TextContent implements ChatMessageContentEntity {
  const _TextContent({required this.text});

  final String text;

  /// Create a copy of ChatMessageContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TextContentCopyWith<_TextContent> get copyWith =>
      __$TextContentCopyWithImpl<_TextContent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TextContent &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @override
  String toString() {
    return 'ChatMessageContentEntity.text(text: $text)';
  }
}

/// @nodoc
abstract mixin class _$TextContentCopyWith<$Res>
    implements $ChatMessageContentEntityCopyWith<$Res> {
  factory _$TextContentCopyWith(
          _TextContent value, $Res Function(_TextContent) _then) =
      __$TextContentCopyWithImpl;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$TextContentCopyWithImpl<$Res> implements _$TextContentCopyWith<$Res> {
  __$TextContentCopyWithImpl(this._self, this._then);

  final _TextContent _self;
  final $Res Function(_TextContent) _then;

  /// Create a copy of ChatMessageContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
  }) {
    return _then(_TextContent(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _PhotoContent implements ChatMessageContentEntity {
  const _PhotoContent({required this.photoUrl});

  final String photoUrl;

  /// Create a copy of ChatMessageContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PhotoContentCopyWith<_PhotoContent> get copyWith =>
      __$PhotoContentCopyWithImpl<_PhotoContent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhotoContent &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photoUrl);

  @override
  String toString() {
    return 'ChatMessageContentEntity.photo(photoUrl: $photoUrl)';
  }
}

/// @nodoc
abstract mixin class _$PhotoContentCopyWith<$Res>
    implements $ChatMessageContentEntityCopyWith<$Res> {
  factory _$PhotoContentCopyWith(
          _PhotoContent value, $Res Function(_PhotoContent) _then) =
      __$PhotoContentCopyWithImpl;
  @useResult
  $Res call({String photoUrl});
}

/// @nodoc
class __$PhotoContentCopyWithImpl<$Res>
    implements _$PhotoContentCopyWith<$Res> {
  __$PhotoContentCopyWithImpl(this._self, this._then);

  final _PhotoContent _self;
  final $Res Function(_PhotoContent) _then;

  /// Create a copy of ChatMessageContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? photoUrl = null,
  }) {
    return _then(_PhotoContent(
      photoUrl: null == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SystemContent implements ChatMessageContentEntity {
  const _SystemContent({required this.text});

  final String text;

  /// Create a copy of ChatMessageContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SystemContentCopyWith<_SystemContent> get copyWith =>
      __$SystemContentCopyWithImpl<_SystemContent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SystemContent &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @override
  String toString() {
    return 'ChatMessageContentEntity.system(text: $text)';
  }
}

/// @nodoc
abstract mixin class _$SystemContentCopyWith<$Res>
    implements $ChatMessageContentEntityCopyWith<$Res> {
  factory _$SystemContentCopyWith(
          _SystemContent value, $Res Function(_SystemContent) _then) =
      __$SystemContentCopyWithImpl;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$SystemContentCopyWithImpl<$Res>
    implements _$SystemContentCopyWith<$Res> {
  __$SystemContentCopyWithImpl(this._self, this._then);

  final _SystemContent _self;
  final $Res Function(_SystemContent) _then;

  /// Create a copy of ChatMessageContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
  }) {
    return _then(_SystemContent(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _AiAgentContent implements ChatMessageContentEntity {
  const _AiAgentContent({required this.text});

  final String text;

  /// Create a copy of ChatMessageContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiAgentContentCopyWith<_AiAgentContent> get copyWith =>
      __$AiAgentContentCopyWithImpl<_AiAgentContent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiAgentContent &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @override
  String toString() {
    return 'ChatMessageContentEntity.aiAgent(text: $text)';
  }
}

/// @nodoc
abstract mixin class _$AiAgentContentCopyWith<$Res>
    implements $ChatMessageContentEntityCopyWith<$Res> {
  factory _$AiAgentContentCopyWith(
          _AiAgentContent value, $Res Function(_AiAgentContent) _then) =
      __$AiAgentContentCopyWithImpl;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$AiAgentContentCopyWithImpl<$Res>
    implements _$AiAgentContentCopyWith<$Res> {
  __$AiAgentContentCopyWithImpl(this._self, this._then);

  final _AiAgentContent _self;
  final $Res Function(_AiAgentContent) _then;

  /// Create a copy of ChatMessageContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
  }) {
    return _then(_AiAgentContent(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _DateIntentionContent implements ChatMessageContentEntity {
  const _DateIntentionContent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DateIntentionContent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChatMessageContentEntity.dateIntention()';
  }
}

/// @nodoc
mixin _$ChatTopicsEntity {
  List<ChatTopicEntity> get items;

  /// Create a copy of ChatTopicsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatTopicsEntityCopyWith<ChatTopicsEntity> get copyWith =>
      _$ChatTopicsEntityCopyWithImpl<ChatTopicsEntity>(
          this as ChatTopicsEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatTopicsEntity &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'ChatTopicsEntity(items: $items)';
  }
}

/// @nodoc
abstract mixin class $ChatTopicsEntityCopyWith<$Res> {
  factory $ChatTopicsEntityCopyWith(
          ChatTopicsEntity value, $Res Function(ChatTopicsEntity) _then) =
      _$ChatTopicsEntityCopyWithImpl;
  @useResult
  $Res call({List<ChatTopicEntity> items});
}

/// @nodoc
class _$ChatTopicsEntityCopyWithImpl<$Res>
    implements $ChatTopicsEntityCopyWith<$Res> {
  _$ChatTopicsEntityCopyWithImpl(this._self, this._then);

  final ChatTopicsEntity _self;
  final $Res Function(ChatTopicsEntity) _then;

  /// Create a copy of ChatTopicsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChatTopicEntity>,
    ));
  }
}

/// @nodoc

class _ChatTopicsEntity implements ChatTopicsEntity {
  const _ChatTopicsEntity(
      {final List<ChatTopicEntity> items = const <ChatTopicEntity>[]})
      : _items = items;

  final List<ChatTopicEntity> _items;
  @override
  @JsonKey()
  List<ChatTopicEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of ChatTopicsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatTopicsEntityCopyWith<_ChatTopicsEntity> get copyWith =>
      __$ChatTopicsEntityCopyWithImpl<_ChatTopicsEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatTopicsEntity &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'ChatTopicsEntity(items: $items)';
  }
}

/// @nodoc
abstract mixin class _$ChatTopicsEntityCopyWith<$Res>
    implements $ChatTopicsEntityCopyWith<$Res> {
  factory _$ChatTopicsEntityCopyWith(
          _ChatTopicsEntity value, $Res Function(_ChatTopicsEntity) _then) =
      __$ChatTopicsEntityCopyWithImpl;
  @override
  @useResult
  $Res call({List<ChatTopicEntity> items});
}

/// @nodoc
class __$ChatTopicsEntityCopyWithImpl<$Res>
    implements _$ChatTopicsEntityCopyWith<$Res> {
  __$ChatTopicsEntityCopyWithImpl(this._self, this._then);

  final _ChatTopicsEntity _self;
  final $Res Function(_ChatTopicsEntity) _then;

  /// Create a copy of ChatTopicsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
  }) {
    return _then(_ChatTopicsEntity(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChatTopicEntity>,
    ));
  }
}

/// @nodoc
mixin _$ChatTopicEntity {
  String get message;
  String? get photoId;
  String? get tagId;

  /// Create a copy of ChatTopicEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatTopicEntityCopyWith<ChatTopicEntity> get copyWith =>
      _$ChatTopicEntityCopyWithImpl<ChatTopicEntity>(
          this as ChatTopicEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatTopicEntity &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.photoId, photoId) || other.photoId == photoId) &&
            (identical(other.tagId, tagId) || other.tagId == tagId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, photoId, tagId);

  @override
  String toString() {
    return 'ChatTopicEntity(message: $message, photoId: $photoId, tagId: $tagId)';
  }
}

/// @nodoc
abstract mixin class $ChatTopicEntityCopyWith<$Res> {
  factory $ChatTopicEntityCopyWith(
          ChatTopicEntity value, $Res Function(ChatTopicEntity) _then) =
      _$ChatTopicEntityCopyWithImpl;
  @useResult
  $Res call({String message, String? photoId, String? tagId});
}

/// @nodoc
class _$ChatTopicEntityCopyWithImpl<$Res>
    implements $ChatTopicEntityCopyWith<$Res> {
  _$ChatTopicEntityCopyWithImpl(this._self, this._then);

  final ChatTopicEntity _self;
  final $Res Function(ChatTopicEntity) _then;

  /// Create a copy of ChatTopicEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? photoId = freezed,
    Object? tagId = freezed,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      photoId: freezed == photoId
          ? _self.photoId
          : photoId // ignore: cast_nullable_to_non_nullable
              as String?,
      tagId: freezed == tagId
          ? _self.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _ChatTopicEntity implements ChatTopicEntity {
  const _ChatTopicEntity({required this.message, this.photoId, this.tagId});

  @override
  final String message;
  @override
  final String? photoId;
  @override
  final String? tagId;

  /// Create a copy of ChatTopicEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatTopicEntityCopyWith<_ChatTopicEntity> get copyWith =>
      __$ChatTopicEntityCopyWithImpl<_ChatTopicEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatTopicEntity &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.photoId, photoId) || other.photoId == photoId) &&
            (identical(other.tagId, tagId) || other.tagId == tagId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, photoId, tagId);

  @override
  String toString() {
    return 'ChatTopicEntity(message: $message, photoId: $photoId, tagId: $tagId)';
  }
}

/// @nodoc
abstract mixin class _$ChatTopicEntityCopyWith<$Res>
    implements $ChatTopicEntityCopyWith<$Res> {
  factory _$ChatTopicEntityCopyWith(
          _ChatTopicEntity value, $Res Function(_ChatTopicEntity) _then) =
      __$ChatTopicEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String message, String? photoId, String? tagId});
}

/// @nodoc
class __$ChatTopicEntityCopyWithImpl<$Res>
    implements _$ChatTopicEntityCopyWith<$Res> {
  __$ChatTopicEntityCopyWithImpl(this._self, this._then);

  final _ChatTopicEntity _self;
  final $Res Function(_ChatTopicEntity) _then;

  /// Create a copy of ChatTopicEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? photoId = freezed,
    Object? tagId = freezed,
  }) {
    return _then(_ChatTopicEntity(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      photoId: freezed == photoId
          ? _self.photoId
          : photoId // ignore: cast_nullable_to_non_nullable
              as String?,
      tagId: freezed == tagId
          ? _self.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$DateIntentionEntity {
  String get userId;
  String get chatMessageId;
  bool get hasDateIntention;

  /// Create a copy of DateIntentionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DateIntentionEntityCopyWith<DateIntentionEntity> get copyWith =>
      _$DateIntentionEntityCopyWithImpl<DateIntentionEntity>(
          this as DateIntentionEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DateIntentionEntity &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.chatMessageId, chatMessageId) ||
                other.chatMessageId == chatMessageId) &&
            (identical(other.hasDateIntention, hasDateIntention) ||
                other.hasDateIntention == hasDateIntention));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, chatMessageId, hasDateIntention);

  @override
  String toString() {
    return 'DateIntentionEntity(userId: $userId, chatMessageId: $chatMessageId, hasDateIntention: $hasDateIntention)';
  }
}

/// @nodoc
abstract mixin class $DateIntentionEntityCopyWith<$Res> {
  factory $DateIntentionEntityCopyWith(
          DateIntentionEntity value, $Res Function(DateIntentionEntity) _then) =
      _$DateIntentionEntityCopyWithImpl;
  @useResult
  $Res call({String userId, String chatMessageId, bool hasDateIntention});
}

/// @nodoc
class _$DateIntentionEntityCopyWithImpl<$Res>
    implements $DateIntentionEntityCopyWith<$Res> {
  _$DateIntentionEntityCopyWithImpl(this._self, this._then);

  final DateIntentionEntity _self;
  final $Res Function(DateIntentionEntity) _then;

  /// Create a copy of DateIntentionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? chatMessageId = null,
    Object? hasDateIntention = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      chatMessageId: null == chatMessageId
          ? _self.chatMessageId
          : chatMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      hasDateIntention: null == hasDateIntention
          ? _self.hasDateIntention
          : hasDateIntention // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _DateIntentionEntity implements DateIntentionEntity {
  const _DateIntentionEntity(
      {required this.userId,
      required this.chatMessageId,
      required this.hasDateIntention});

  @override
  final String userId;
  @override
  final String chatMessageId;
  @override
  final bool hasDateIntention;

  /// Create a copy of DateIntentionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DateIntentionEntityCopyWith<_DateIntentionEntity> get copyWith =>
      __$DateIntentionEntityCopyWithImpl<_DateIntentionEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DateIntentionEntity &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.chatMessageId, chatMessageId) ||
                other.chatMessageId == chatMessageId) &&
            (identical(other.hasDateIntention, hasDateIntention) ||
                other.hasDateIntention == hasDateIntention));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, chatMessageId, hasDateIntention);

  @override
  String toString() {
    return 'DateIntentionEntity(userId: $userId, chatMessageId: $chatMessageId, hasDateIntention: $hasDateIntention)';
  }
}

/// @nodoc
abstract mixin class _$DateIntentionEntityCopyWith<$Res>
    implements $DateIntentionEntityCopyWith<$Res> {
  factory _$DateIntentionEntityCopyWith(_DateIntentionEntity value,
          $Res Function(_DateIntentionEntity) _then) =
      __$DateIntentionEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String userId, String chatMessageId, bool hasDateIntention});
}

/// @nodoc
class __$DateIntentionEntityCopyWithImpl<$Res>
    implements _$DateIntentionEntityCopyWith<$Res> {
  __$DateIntentionEntityCopyWithImpl(this._self, this._then);

  final _DateIntentionEntity _self;
  final $Res Function(_DateIntentionEntity) _then;

  /// Create a copy of DateIntentionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? chatMessageId = null,
    Object? hasDateIntention = null,
  }) {
    return _then(_DateIntentionEntity(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      chatMessageId: null == chatMessageId
          ? _self.chatMessageId
          : chatMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      hasDateIntention: null == hasDateIntention
          ? _self.hasDateIntention
          : hasDateIntention // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$ChatSessionEventEntity {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChatSessionEventEntity);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChatSessionEventEntity()';
  }
}

/// @nodoc
class $ChatSessionEventEntityCopyWith<$Res> {
  $ChatSessionEventEntityCopyWith(
      ChatSessionEventEntity _, $Res Function(ChatSessionEventEntity) __);
}

/// @nodoc

class _EventMessage implements ChatSessionEventEntity {
  const _EventMessage(this.message);

  final ChatMessageEntity message;

  /// Create a copy of ChatSessionEventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventMessageCopyWith<_EventMessage> get copyWith =>
      __$EventMessageCopyWithImpl<_EventMessage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventMessage &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ChatSessionEventEntity.message(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$EventMessageCopyWith<$Res>
    implements $ChatSessionEventEntityCopyWith<$Res> {
  factory _$EventMessageCopyWith(
          _EventMessage value, $Res Function(_EventMessage) _then) =
      __$EventMessageCopyWithImpl;
  @useResult
  $Res call({ChatMessageEntity message});

  $ChatMessageEntityCopyWith<$Res> get message;
}

/// @nodoc
class __$EventMessageCopyWithImpl<$Res>
    implements _$EventMessageCopyWith<$Res> {
  __$EventMessageCopyWithImpl(this._self, this._then);

  final _EventMessage _self;
  final $Res Function(_EventMessage) _then;

  /// Create a copy of ChatSessionEventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_EventMessage(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessageEntity,
    ));
  }

  /// Create a copy of ChatSessionEventEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageEntityCopyWith<$Res> get message {
    return $ChatMessageEntityCopyWith<$Res>(_self.message, (value) {
      return _then(_self.copyWith(message: value));
    });
  }
}

/// @nodoc

class _EventReadLastId implements ChatSessionEventEntity {
  const _EventReadLastId(this.id);

  final String id;

  /// Create a copy of ChatSessionEventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventReadLastIdCopyWith<_EventReadLastId> get copyWith =>
      __$EventReadLastIdCopyWithImpl<_EventReadLastId>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventReadLastId &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'ChatSessionEventEntity.readLastChatMessageId(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$EventReadLastIdCopyWith<$Res>
    implements $ChatSessionEventEntityCopyWith<$Res> {
  factory _$EventReadLastIdCopyWith(
          _EventReadLastId value, $Res Function(_EventReadLastId) _then) =
      __$EventReadLastIdCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$EventReadLastIdCopyWithImpl<$Res>
    implements _$EventReadLastIdCopyWith<$Res> {
  __$EventReadLastIdCopyWithImpl(this._self, this._then);

  final _EventReadLastId _self;
  final $Res Function(_EventReadLastId) _then;

  /// Create a copy of ChatSessionEventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_EventReadLastId(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _EventTyping implements ChatSessionEventEntity {
  const _EventTyping(this.isToUserTyping);

  final bool isToUserTyping;

  /// Create a copy of ChatSessionEventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventTypingCopyWith<_EventTyping> get copyWith =>
      __$EventTypingCopyWithImpl<_EventTyping>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventTyping &&
            (identical(other.isToUserTyping, isToUserTyping) ||
                other.isToUserTyping == isToUserTyping));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isToUserTyping);

  @override
  String toString() {
    return 'ChatSessionEventEntity.typing(isToUserTyping: $isToUserTyping)';
  }
}

/// @nodoc
abstract mixin class _$EventTypingCopyWith<$Res>
    implements $ChatSessionEventEntityCopyWith<$Res> {
  factory _$EventTypingCopyWith(
          _EventTyping value, $Res Function(_EventTyping) _then) =
      __$EventTypingCopyWithImpl;
  @useResult
  $Res call({bool isToUserTyping});
}

/// @nodoc
class __$EventTypingCopyWithImpl<$Res> implements _$EventTypingCopyWith<$Res> {
  __$EventTypingCopyWithImpl(this._self, this._then);

  final _EventTyping _self;
  final $Res Function(_EventTyping) _then;

  /// Create a copy of ChatSessionEventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isToUserTyping = null,
  }) {
    return _then(_EventTyping(
      null == isToUserTyping
          ? _self.isToUserTyping
          : isToUserTyping // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _EventEditingText implements ChatSessionEventEntity {
  const _EventEditingText(this.text);

  final String text;

  /// Create a copy of ChatSessionEventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventEditingTextCopyWith<_EventEditingText> get copyWith =>
      __$EventEditingTextCopyWithImpl<_EventEditingText>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventEditingText &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @override
  String toString() {
    return 'ChatSessionEventEntity.editingText(text: $text)';
  }
}

/// @nodoc
abstract mixin class _$EventEditingTextCopyWith<$Res>
    implements $ChatSessionEventEntityCopyWith<$Res> {
  factory _$EventEditingTextCopyWith(
          _EventEditingText value, $Res Function(_EventEditingText) _then) =
      __$EventEditingTextCopyWithImpl;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$EventEditingTextCopyWithImpl<$Res>
    implements _$EventEditingTextCopyWith<$Res> {
  __$EventEditingTextCopyWithImpl(this._self, this._then);

  final _EventEditingText _self;
  final $Res Function(_EventEditingText) _then;

  /// Create a copy of ChatSessionEventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
  }) {
    return _then(_EventEditingText(
      null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _EventEditableChatTopics implements ChatSessionEventEntity {
  const _EventEditableChatTopics(this.topics);

  final ChatTopics topics;

  /// Create a copy of ChatSessionEventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventEditableChatTopicsCopyWith<_EventEditableChatTopics> get copyWith =>
      __$EventEditableChatTopicsCopyWithImpl<_EventEditableChatTopics>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventEditableChatTopics &&
            (identical(other.topics, topics) || other.topics == topics));
  }

  @override
  int get hashCode => Object.hash(runtimeType, topics);

  @override
  String toString() {
    return 'ChatSessionEventEntity.editableChatTopics(topics: $topics)';
  }
}

/// @nodoc
abstract mixin class _$EventEditableChatTopicsCopyWith<$Res>
    implements $ChatSessionEventEntityCopyWith<$Res> {
  factory _$EventEditableChatTopicsCopyWith(_EventEditableChatTopics value,
          $Res Function(_EventEditableChatTopics) _then) =
      __$EventEditableChatTopicsCopyWithImpl;
  @useResult
  $Res call({ChatTopics topics});
}

/// @nodoc
class __$EventEditableChatTopicsCopyWithImpl<$Res>
    implements _$EventEditableChatTopicsCopyWith<$Res> {
  __$EventEditableChatTopicsCopyWithImpl(this._self, this._then);

  final _EventEditableChatTopics _self;
  final $Res Function(_EventEditableChatTopics) _then;

  /// Create a copy of ChatSessionEventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? topics = null,
  }) {
    return _then(_EventEditableChatTopics(
      null == topics
          ? _self.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as ChatTopics,
    ));
  }
}

/// @nodoc

class _EventUnknown implements ChatSessionEventEntity {
  const _EventUnknown();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EventUnknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChatSessionEventEntity.unknown()';
  }
}

// dart format on
