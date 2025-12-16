// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matching_reason.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchingReason {
  /// メインタイトル(最大26文字)
  String? get mainTitle;

  /// 理由タイトル (最大50文字)
  String? get reasonTitle;

  /// 理由内容(最大200文字)
  String? get reasonContent;

  /// Create a copy of MatchingReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchingReasonCopyWith<MatchingReason> get copyWith =>
      _$MatchingReasonCopyWithImpl<MatchingReason>(
          this as MatchingReason, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchingReason &&
            (identical(other.mainTitle, mainTitle) ||
                other.mainTitle == mainTitle) &&
            (identical(other.reasonTitle, reasonTitle) ||
                other.reasonTitle == reasonTitle) &&
            (identical(other.reasonContent, reasonContent) ||
                other.reasonContent == reasonContent));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, mainTitle, reasonTitle, reasonContent);

  @override
  String toString() {
    return 'MatchingReason(mainTitle: $mainTitle, reasonTitle: $reasonTitle, reasonContent: $reasonContent)';
  }
}

/// @nodoc
abstract mixin class $MatchingReasonCopyWith<$Res> {
  factory $MatchingReasonCopyWith(
          MatchingReason value, $Res Function(MatchingReason) _then) =
      _$MatchingReasonCopyWithImpl;
  @useResult
  $Res call({String? mainTitle, String? reasonTitle, String? reasonContent});
}

/// @nodoc
class _$MatchingReasonCopyWithImpl<$Res>
    implements $MatchingReasonCopyWith<$Res> {
  _$MatchingReasonCopyWithImpl(this._self, this._then);

  final MatchingReason _self;
  final $Res Function(MatchingReason) _then;

  /// Create a copy of MatchingReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainTitle = freezed,
    Object? reasonTitle = freezed,
    Object? reasonContent = freezed,
  }) {
    return _then(_self.copyWith(
      mainTitle: freezed == mainTitle
          ? _self.mainTitle
          : mainTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonTitle: freezed == reasonTitle
          ? _self.reasonTitle
          : reasonTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonContent: freezed == reasonContent
          ? _self.reasonContent
          : reasonContent // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _MatchingReason extends MatchingReason {
  const _MatchingReason({this.mainTitle, this.reasonTitle, this.reasonContent})
      : super._();

  /// メインタイトル(最大26文字)
  @override
  final String? mainTitle;

  /// 理由タイトル (最大50文字)
  @override
  final String? reasonTitle;

  /// 理由内容(最大200文字)
  @override
  final String? reasonContent;

  /// Create a copy of MatchingReason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchingReasonCopyWith<_MatchingReason> get copyWith =>
      __$MatchingReasonCopyWithImpl<_MatchingReason>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchingReason &&
            (identical(other.mainTitle, mainTitle) ||
                other.mainTitle == mainTitle) &&
            (identical(other.reasonTitle, reasonTitle) ||
                other.reasonTitle == reasonTitle) &&
            (identical(other.reasonContent, reasonContent) ||
                other.reasonContent == reasonContent));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, mainTitle, reasonTitle, reasonContent);

  @override
  String toString() {
    return 'MatchingReason(mainTitle: $mainTitle, reasonTitle: $reasonTitle, reasonContent: $reasonContent)';
  }
}

/// @nodoc
abstract mixin class _$MatchingReasonCopyWith<$Res>
    implements $MatchingReasonCopyWith<$Res> {
  factory _$MatchingReasonCopyWith(
          _MatchingReason value, $Res Function(_MatchingReason) _then) =
      __$MatchingReasonCopyWithImpl;
  @override
  @useResult
  $Res call({String? mainTitle, String? reasonTitle, String? reasonContent});
}

/// @nodoc
class __$MatchingReasonCopyWithImpl<$Res>
    implements _$MatchingReasonCopyWith<$Res> {
  __$MatchingReasonCopyWithImpl(this._self, this._then);

  final _MatchingReason _self;
  final $Res Function(_MatchingReason) _then;

  /// Create a copy of MatchingReason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mainTitle = freezed,
    Object? reasonTitle = freezed,
    Object? reasonContent = freezed,
  }) {
    return _then(_MatchingReason(
      mainTitle: freezed == mainTitle
          ? _self.mainTitle
          : mainTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonTitle: freezed == reasonTitle
          ? _self.reasonTitle
          : reasonTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonContent: freezed == reasonContent
          ? _self.reasonContent
          : reasonContent // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
