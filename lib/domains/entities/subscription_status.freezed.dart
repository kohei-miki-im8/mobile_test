// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionStatus {
  SubscriptionPlan get plan;
  int get remainingDays;
  GenderCode get gender;

  /// Create a copy of SubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionStatusCopyWith<SubscriptionStatus> get copyWith =>
      _$SubscriptionStatusCopyWithImpl<SubscriptionStatus>(
          this as SubscriptionStatus, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionStatus &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.remainingDays, remainingDays) ||
                other.remainingDays == remainingDays) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode => Object.hash(runtimeType, plan, remainingDays, gender);

  @override
  String toString() {
    return 'SubscriptionStatus(plan: $plan, remainingDays: $remainingDays, gender: $gender)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionStatusCopyWith<$Res> {
  factory $SubscriptionStatusCopyWith(
          SubscriptionStatus value, $Res Function(SubscriptionStatus) _then) =
      _$SubscriptionStatusCopyWithImpl;
  @useResult
  $Res call({SubscriptionPlan plan, int remainingDays, GenderCode gender});
}

/// @nodoc
class _$SubscriptionStatusCopyWithImpl<$Res>
    implements $SubscriptionStatusCopyWith<$Res> {
  _$SubscriptionStatusCopyWithImpl(this._self, this._then);

  final SubscriptionStatus _self;
  final $Res Function(SubscriptionStatus) _then;

  /// Create a copy of SubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plan = null,
    Object? remainingDays = null,
    Object? gender = null,
  }) {
    return _then(_self.copyWith(
      plan: null == plan
          ? _self.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as SubscriptionPlan,
      remainingDays: null == remainingDays
          ? _self.remainingDays
          : remainingDays // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderCode,
    ));
  }
}

/// @nodoc

class _SubscriptionStatus extends SubscriptionStatus {
  const _SubscriptionStatus(
      {required this.plan, required this.remainingDays, required this.gender})
      : super._();

  @override
  final SubscriptionPlan plan;
  @override
  final int remainingDays;
  @override
  final GenderCode gender;

  /// Create a copy of SubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionStatusCopyWith<_SubscriptionStatus> get copyWith =>
      __$SubscriptionStatusCopyWithImpl<_SubscriptionStatus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionStatus &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.remainingDays, remainingDays) ||
                other.remainingDays == remainingDays) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode => Object.hash(runtimeType, plan, remainingDays, gender);

  @override
  String toString() {
    return 'SubscriptionStatus(plan: $plan, remainingDays: $remainingDays, gender: $gender)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionStatusCopyWith<$Res>
    implements $SubscriptionStatusCopyWith<$Res> {
  factory _$SubscriptionStatusCopyWith(
          _SubscriptionStatus value, $Res Function(_SubscriptionStatus) _then) =
      __$SubscriptionStatusCopyWithImpl;
  @override
  @useResult
  $Res call({SubscriptionPlan plan, int remainingDays, GenderCode gender});
}

/// @nodoc
class __$SubscriptionStatusCopyWithImpl<$Res>
    implements _$SubscriptionStatusCopyWith<$Res> {
  __$SubscriptionStatusCopyWithImpl(this._self, this._then);

  final _SubscriptionStatus _self;
  final $Res Function(_SubscriptionStatus) _then;

  /// Create a copy of SubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? plan = null,
    Object? remainingDays = null,
    Object? gender = null,
  }) {
    return _then(_SubscriptionStatus(
      plan: null == plan
          ? _self.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as SubscriptionPlan,
      remainingDays: null == remainingDays
          ? _self.remainingDays
          : remainingDays // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderCode,
    ));
  }
}

// dart format on
