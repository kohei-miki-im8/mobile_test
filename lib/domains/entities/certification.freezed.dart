// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Certification {
  CertificateLevel get level;

  /// Create a copy of Certification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CertificationCopyWith<Certification> get copyWith =>
      _$CertificationCopyWithImpl<Certification>(
          this as Certification, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Certification &&
            (identical(other.level, level) || other.level == level));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level);

  @override
  String toString() {
    return 'Certification(level: $level)';
  }
}

/// @nodoc
abstract mixin class $CertificationCopyWith<$Res> {
  factory $CertificationCopyWith(
          Certification value, $Res Function(Certification) _then) =
      _$CertificationCopyWithImpl;
  @useResult
  $Res call({CertificateLevel level});
}

/// @nodoc
class _$CertificationCopyWithImpl<$Res>
    implements $CertificationCopyWith<$Res> {
  _$CertificationCopyWithImpl(this._self, this._then);

  final Certification _self;
  final $Res Function(Certification) _then;

  /// Create a copy of Certification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
  }) {
    return _then(_self.copyWith(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as CertificateLevel,
    ));
  }
}

/// @nodoc

class _Certification implements Certification {
  const _Certification({required this.level});

  @override
  final CertificateLevel level;

  /// Create a copy of Certification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CertificationCopyWith<_Certification> get copyWith =>
      __$CertificationCopyWithImpl<_Certification>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Certification &&
            (identical(other.level, level) || other.level == level));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level);

  @override
  String toString() {
    return 'Certification(level: $level)';
  }
}

/// @nodoc
abstract mixin class _$CertificationCopyWith<$Res>
    implements $CertificationCopyWith<$Res> {
  factory _$CertificationCopyWith(
          _Certification value, $Res Function(_Certification) _then) =
      __$CertificationCopyWithImpl;
  @override
  @useResult
  $Res call({CertificateLevel level});
}

/// @nodoc
class __$CertificationCopyWithImpl<$Res>
    implements _$CertificationCopyWith<$Res> {
  __$CertificationCopyWithImpl(this._self, this._then);

  final _Certification _self;
  final $Res Function(_Certification) _then;

  /// Create a copy of Certification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
  }) {
    return _then(_Certification(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as CertificateLevel,
    ));
  }
}

// dart format on
