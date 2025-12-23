// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomePageState {
  /// プロフィールデータ一覧
  List<Profile> get profiles;

  /// ユーザー詳細データ一覧（UserDetailPageで使用）
  List<UserDetail> get userDetails;

  /// 読み込み中フラグ
  bool get isLoading;

  /// エラー情報
  EconaError? get error;

  /// おすすめユーザーの次のカーソルID
  String? get nextCursorId;

  /// スキップされたユーザーIDのセット
  Set<String> get skippedUserIds;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      _$HomePageStateCopyWithImpl<HomePageState>(
          this as HomePageState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomePageState &&
            const DeepCollectionEquality().equals(other.profiles, profiles) &&
            const DeepCollectionEquality()
                .equals(other.userDetails, userDetails) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.nextCursorId, nextCursorId) ||
                other.nextCursorId == nextCursorId) &&
            const DeepCollectionEquality()
                .equals(other.skippedUserIds, skippedUserIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(profiles),
      const DeepCollectionEquality().hash(userDetails),
      isLoading,
      error,
      nextCursorId,
      const DeepCollectionEquality().hash(skippedUserIds));

  @override
  String toString() {
    return 'HomePageState(profiles: $profiles, userDetails: $userDetails, isLoading: $isLoading, error: $error, nextCursorId: $nextCursorId, skippedUserIds: $skippedUserIds)';
  }
}

/// @nodoc
abstract mixin class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) _then) =
      _$HomePageStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Profile> profiles,
      List<UserDetail> userDetails,
      bool isLoading,
      EconaError? error,
      String? nextCursorId,
      Set<String> skippedUserIds});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._self, this._then);

  final HomePageState _self;
  final $Res Function(HomePageState) _then;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profiles = null,
    Object? userDetails = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? nextCursorId = freezed,
    Object? skippedUserIds = null,
  }) {
    return _then(_self.copyWith(
      profiles: null == profiles
          ? _self.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
      userDetails: null == userDetails
          ? _self.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as List<UserDetail>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as EconaError?,
      nextCursorId: freezed == nextCursorId
          ? _self.nextCursorId
          : nextCursorId // ignore: cast_nullable_to_non_nullable
              as String?,
      skippedUserIds: null == skippedUserIds
          ? _self.skippedUserIds
          : skippedUserIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _HomePageState extends HomePageState {
  const _HomePageState(
      {final List<Profile> profiles = const [],
      final List<UserDetail> userDetails = const [],
      this.isLoading = true,
      this.error,
      this.nextCursorId,
      final Set<String> skippedUserIds = const <String>{}})
      : _profiles = profiles,
        _userDetails = userDetails,
        _skippedUserIds = skippedUserIds,
        super._();

  /// プロフィールデータ一覧
  final List<Profile> _profiles;

  /// プロフィールデータ一覧
  @override
  @JsonKey()
  List<Profile> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  /// ユーザー詳細データ一覧（UserDetailPageで使用）
  final List<UserDetail> _userDetails;

  /// ユーザー詳細データ一覧（UserDetailPageで使用）
  @override
  @JsonKey()
  List<UserDetail> get userDetails {
    if (_userDetails is EqualUnmodifiableListView) return _userDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userDetails);
  }

  /// 読み込み中フラグ
  @override
  @JsonKey()
  final bool isLoading;

  /// エラー情報
  @override
  final EconaError? error;

  /// おすすめユーザーの次のカーソルID
  @override
  final String? nextCursorId;

  /// スキップされたユーザーIDのセット
  final Set<String> _skippedUserIds;

  /// スキップされたユーザーIDのセット
  @override
  @JsonKey()
  Set<String> get skippedUserIds {
    if (_skippedUserIds is EqualUnmodifiableSetView) return _skippedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_skippedUserIds);
  }

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomePageStateCopyWith<_HomePageState> get copyWith =>
      __$HomePageStateCopyWithImpl<_HomePageState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomePageState &&
            const DeepCollectionEquality().equals(other._profiles, _profiles) &&
            const DeepCollectionEquality()
                .equals(other._userDetails, _userDetails) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.nextCursorId, nextCursorId) ||
                other.nextCursorId == nextCursorId) &&
            const DeepCollectionEquality()
                .equals(other._skippedUserIds, _skippedUserIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_profiles),
      const DeepCollectionEquality().hash(_userDetails),
      isLoading,
      error,
      nextCursorId,
      const DeepCollectionEquality().hash(_skippedUserIds));

  @override
  String toString() {
    return 'HomePageState(profiles: $profiles, userDetails: $userDetails, isLoading: $isLoading, error: $error, nextCursorId: $nextCursorId, skippedUserIds: $skippedUserIds)';
  }
}

/// @nodoc
abstract mixin class _$HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$HomePageStateCopyWith(
          _HomePageState value, $Res Function(_HomePageState) _then) =
      __$HomePageStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Profile> profiles,
      List<UserDetail> userDetails,
      bool isLoading,
      EconaError? error,
      String? nextCursorId,
      Set<String> skippedUserIds});
}

/// @nodoc
class __$HomePageStateCopyWithImpl<$Res>
    implements _$HomePageStateCopyWith<$Res> {
  __$HomePageStateCopyWithImpl(this._self, this._then);

  final _HomePageState _self;
  final $Res Function(_HomePageState) _then;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profiles = null,
    Object? userDetails = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? nextCursorId = freezed,
    Object? skippedUserIds = null,
  }) {
    return _then(_HomePageState(
      profiles: null == profiles
          ? _self._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
      userDetails: null == userDetails
          ? _self._userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as List<UserDetail>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as EconaError?,
      nextCursorId: freezed == nextCursorId
          ? _self.nextCursorId
          : nextCursorId // ignore: cast_nullable_to_non_nullable
              as String?,
      skippedUserIds: null == skippedUserIds
          ? _self._skippedUserIds
          : skippedUserIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

// dart format on
