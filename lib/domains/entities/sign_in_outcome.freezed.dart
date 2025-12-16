// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignInOutcome {
  String get userId;
  bool get isNewUser;

  /// Create a copy of SignInOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInOutcomeCopyWith<SignInOutcome> get copyWith =>
      _$SignInOutcomeCopyWithImpl<SignInOutcome>(
          this as SignInOutcome, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInOutcome &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isNewUser, isNewUser) ||
                other.isNewUser == isNewUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, isNewUser);

  @override
  String toString() {
    return 'SignInOutcome(userId: $userId, isNewUser: $isNewUser)';
  }
}

/// @nodoc
abstract mixin class $SignInOutcomeCopyWith<$Res> {
  factory $SignInOutcomeCopyWith(
          SignInOutcome value, $Res Function(SignInOutcome) _then) =
      _$SignInOutcomeCopyWithImpl;
  @useResult
  $Res call({String userId, bool isNewUser});
}

/// @nodoc
class _$SignInOutcomeCopyWithImpl<$Res>
    implements $SignInOutcomeCopyWith<$Res> {
  _$SignInOutcomeCopyWithImpl(this._self, this._then);

  final SignInOutcome _self;
  final $Res Function(SignInOutcome) _then;

  /// Create a copy of SignInOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? isNewUser = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isNewUser: null == isNewUser
          ? _self.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _SignInOutcome implements SignInOutcome {
  const _SignInOutcome({required this.userId, required this.isNewUser});

  @override
  final String userId;
  @override
  final bool isNewUser;

  /// Create a copy of SignInOutcome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignInOutcomeCopyWith<_SignInOutcome> get copyWith =>
      __$SignInOutcomeCopyWithImpl<_SignInOutcome>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInOutcome &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isNewUser, isNewUser) ||
                other.isNewUser == isNewUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, isNewUser);

  @override
  String toString() {
    return 'SignInOutcome(userId: $userId, isNewUser: $isNewUser)';
  }
}

/// @nodoc
abstract mixin class _$SignInOutcomeCopyWith<$Res>
    implements $SignInOutcomeCopyWith<$Res> {
  factory _$SignInOutcomeCopyWith(
          _SignInOutcome value, $Res Function(_SignInOutcome) _then) =
      __$SignInOutcomeCopyWithImpl;
  @override
  @useResult
  $Res call({String userId, bool isNewUser});
}

/// @nodoc
class __$SignInOutcomeCopyWithImpl<$Res>
    implements _$SignInOutcomeCopyWith<$Res> {
  __$SignInOutcomeCopyWithImpl(this._self, this._then);

  final _SignInOutcome _self;
  final $Res Function(_SignInOutcome) _then;

  /// Create a copy of SignInOutcome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? isNewUser = null,
  }) {
    return _then(_SignInOutcome(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isNewUser: null == isNewUser
          ? _self.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
