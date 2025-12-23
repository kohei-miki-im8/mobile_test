// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approach_analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApproachFootprintHistory {
  DateTime get historyDate;
  int get footprintAmount;

  /// Create a copy of ApproachFootprintHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApproachFootprintHistoryCopyWith<ApproachFootprintHistory> get copyWith =>
      _$ApproachFootprintHistoryCopyWithImpl<ApproachFootprintHistory>(
          this as ApproachFootprintHistory, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApproachFootprintHistory &&
            (identical(other.historyDate, historyDate) ||
                other.historyDate == historyDate) &&
            (identical(other.footprintAmount, footprintAmount) ||
                other.footprintAmount == footprintAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, historyDate, footprintAmount);

  @override
  String toString() {
    return 'ApproachFootprintHistory(historyDate: $historyDate, footprintAmount: $footprintAmount)';
  }
}

/// @nodoc
abstract mixin class $ApproachFootprintHistoryCopyWith<$Res> {
  factory $ApproachFootprintHistoryCopyWith(ApproachFootprintHistory value,
          $Res Function(ApproachFootprintHistory) _then) =
      _$ApproachFootprintHistoryCopyWithImpl;
  @useResult
  $Res call({DateTime historyDate, int footprintAmount});
}

/// @nodoc
class _$ApproachFootprintHistoryCopyWithImpl<$Res>
    implements $ApproachFootprintHistoryCopyWith<$Res> {
  _$ApproachFootprintHistoryCopyWithImpl(this._self, this._then);

  final ApproachFootprintHistory _self;
  final $Res Function(ApproachFootprintHistory) _then;

  /// Create a copy of ApproachFootprintHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyDate = null,
    Object? footprintAmount = null,
  }) {
    return _then(_self.copyWith(
      historyDate: null == historyDate
          ? _self.historyDate
          : historyDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      footprintAmount: null == footprintAmount
          ? _self.footprintAmount
          : footprintAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _ApproachFootprintHistory implements ApproachFootprintHistory {
  const _ApproachFootprintHistory(
      {required this.historyDate, required this.footprintAmount});

  @override
  final DateTime historyDate;
  @override
  final int footprintAmount;

  /// Create a copy of ApproachFootprintHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ApproachFootprintHistoryCopyWith<_ApproachFootprintHistory> get copyWith =>
      __$ApproachFootprintHistoryCopyWithImpl<_ApproachFootprintHistory>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApproachFootprintHistory &&
            (identical(other.historyDate, historyDate) ||
                other.historyDate == historyDate) &&
            (identical(other.footprintAmount, footprintAmount) ||
                other.footprintAmount == footprintAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, historyDate, footprintAmount);

  @override
  String toString() {
    return 'ApproachFootprintHistory(historyDate: $historyDate, footprintAmount: $footprintAmount)';
  }
}

/// @nodoc
abstract mixin class _$ApproachFootprintHistoryCopyWith<$Res>
    implements $ApproachFootprintHistoryCopyWith<$Res> {
  factory _$ApproachFootprintHistoryCopyWith(_ApproachFootprintHistory value,
          $Res Function(_ApproachFootprintHistory) _then) =
      __$ApproachFootprintHistoryCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime historyDate, int footprintAmount});
}

/// @nodoc
class __$ApproachFootprintHistoryCopyWithImpl<$Res>
    implements _$ApproachFootprintHistoryCopyWith<$Res> {
  __$ApproachFootprintHistoryCopyWithImpl(this._self, this._then);

  final _ApproachFootprintHistory _self;
  final $Res Function(_ApproachFootprintHistory) _then;

  /// Create a copy of ApproachFootprintHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? historyDate = null,
    Object? footprintAmount = null,
  }) {
    return _then(_ApproachFootprintHistory(
      historyDate: null == historyDate
          ? _self.historyDate
          : historyDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      footprintAmount: null == footprintAmount
          ? _self.footprintAmount
          : footprintAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ApproachLikeHistory {
  DateTime get historyDate;
  int get likeAmount;

  /// Create a copy of ApproachLikeHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApproachLikeHistoryCopyWith<ApproachLikeHistory> get copyWith =>
      _$ApproachLikeHistoryCopyWithImpl<ApproachLikeHistory>(
          this as ApproachLikeHistory, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApproachLikeHistory &&
            (identical(other.historyDate, historyDate) ||
                other.historyDate == historyDate) &&
            (identical(other.likeAmount, likeAmount) ||
                other.likeAmount == likeAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, historyDate, likeAmount);

  @override
  String toString() {
    return 'ApproachLikeHistory(historyDate: $historyDate, likeAmount: $likeAmount)';
  }
}

/// @nodoc
abstract mixin class $ApproachLikeHistoryCopyWith<$Res> {
  factory $ApproachLikeHistoryCopyWith(
          ApproachLikeHistory value, $Res Function(ApproachLikeHistory) _then) =
      _$ApproachLikeHistoryCopyWithImpl;
  @useResult
  $Res call({DateTime historyDate, int likeAmount});
}

/// @nodoc
class _$ApproachLikeHistoryCopyWithImpl<$Res>
    implements $ApproachLikeHistoryCopyWith<$Res> {
  _$ApproachLikeHistoryCopyWithImpl(this._self, this._then);

  final ApproachLikeHistory _self;
  final $Res Function(ApproachLikeHistory) _then;

  /// Create a copy of ApproachLikeHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyDate = null,
    Object? likeAmount = null,
  }) {
    return _then(_self.copyWith(
      historyDate: null == historyDate
          ? _self.historyDate
          : historyDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likeAmount: null == likeAmount
          ? _self.likeAmount
          : likeAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _ApproachLikeHistory implements ApproachLikeHistory {
  const _ApproachLikeHistory(
      {required this.historyDate, required this.likeAmount});

  @override
  final DateTime historyDate;
  @override
  final int likeAmount;

  /// Create a copy of ApproachLikeHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ApproachLikeHistoryCopyWith<_ApproachLikeHistory> get copyWith =>
      __$ApproachLikeHistoryCopyWithImpl<_ApproachLikeHistory>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApproachLikeHistory &&
            (identical(other.historyDate, historyDate) ||
                other.historyDate == historyDate) &&
            (identical(other.likeAmount, likeAmount) ||
                other.likeAmount == likeAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, historyDate, likeAmount);

  @override
  String toString() {
    return 'ApproachLikeHistory(historyDate: $historyDate, likeAmount: $likeAmount)';
  }
}

/// @nodoc
abstract mixin class _$ApproachLikeHistoryCopyWith<$Res>
    implements $ApproachLikeHistoryCopyWith<$Res> {
  factory _$ApproachLikeHistoryCopyWith(_ApproachLikeHistory value,
          $Res Function(_ApproachLikeHistory) _then) =
      __$ApproachLikeHistoryCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime historyDate, int likeAmount});
}

/// @nodoc
class __$ApproachLikeHistoryCopyWithImpl<$Res>
    implements _$ApproachLikeHistoryCopyWith<$Res> {
  __$ApproachLikeHistoryCopyWithImpl(this._self, this._then);

  final _ApproachLikeHistory _self;
  final $Res Function(_ApproachLikeHistory) _then;

  /// Create a copy of ApproachLikeHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? historyDate = null,
    Object? likeAmount = null,
  }) {
    return _then(_ApproachLikeHistory(
      historyDate: null == historyDate
          ? _self.historyDate
          : historyDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likeAmount: null == likeAmount
          ? _self.likeAmount
          : likeAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ApproachAnalysis {
  String get adviceMessage;
  List<ApproachFootprintHistory> get footprintHistories;
  List<ApproachLikeHistory> get likeHistories;

  /// Create a copy of ApproachAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApproachAnalysisCopyWith<ApproachAnalysis> get copyWith =>
      _$ApproachAnalysisCopyWithImpl<ApproachAnalysis>(
          this as ApproachAnalysis, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApproachAnalysis &&
            (identical(other.adviceMessage, adviceMessage) ||
                other.adviceMessage == adviceMessage) &&
            const DeepCollectionEquality()
                .equals(other.footprintHistories, footprintHistories) &&
            const DeepCollectionEquality()
                .equals(other.likeHistories, likeHistories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      adviceMessage,
      const DeepCollectionEquality().hash(footprintHistories),
      const DeepCollectionEquality().hash(likeHistories));

  @override
  String toString() {
    return 'ApproachAnalysis(adviceMessage: $adviceMessage, footprintHistories: $footprintHistories, likeHistories: $likeHistories)';
  }
}

/// @nodoc
abstract mixin class $ApproachAnalysisCopyWith<$Res> {
  factory $ApproachAnalysisCopyWith(
          ApproachAnalysis value, $Res Function(ApproachAnalysis) _then) =
      _$ApproachAnalysisCopyWithImpl;
  @useResult
  $Res call(
      {String adviceMessage,
      List<ApproachFootprintHistory> footprintHistories,
      List<ApproachLikeHistory> likeHistories});
}

/// @nodoc
class _$ApproachAnalysisCopyWithImpl<$Res>
    implements $ApproachAnalysisCopyWith<$Res> {
  _$ApproachAnalysisCopyWithImpl(this._self, this._then);

  final ApproachAnalysis _self;
  final $Res Function(ApproachAnalysis) _then;

  /// Create a copy of ApproachAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adviceMessage = null,
    Object? footprintHistories = null,
    Object? likeHistories = null,
  }) {
    return _then(_self.copyWith(
      adviceMessage: null == adviceMessage
          ? _self.adviceMessage
          : adviceMessage // ignore: cast_nullable_to_non_nullable
              as String,
      footprintHistories: null == footprintHistories
          ? _self.footprintHistories
          : footprintHistories // ignore: cast_nullable_to_non_nullable
              as List<ApproachFootprintHistory>,
      likeHistories: null == likeHistories
          ? _self.likeHistories
          : likeHistories // ignore: cast_nullable_to_non_nullable
              as List<ApproachLikeHistory>,
    ));
  }
}

/// @nodoc

class _ApproachAnalysis implements ApproachAnalysis {
  const _ApproachAnalysis(
      {required this.adviceMessage,
      required final List<ApproachFootprintHistory> footprintHistories,
      required final List<ApproachLikeHistory> likeHistories})
      : _footprintHistories = footprintHistories,
        _likeHistories = likeHistories;

  @override
  final String adviceMessage;
  final List<ApproachFootprintHistory> _footprintHistories;
  @override
  List<ApproachFootprintHistory> get footprintHistories {
    if (_footprintHistories is EqualUnmodifiableListView)
      return _footprintHistories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_footprintHistories);
  }

  final List<ApproachLikeHistory> _likeHistories;
  @override
  List<ApproachLikeHistory> get likeHistories {
    if (_likeHistories is EqualUnmodifiableListView) return _likeHistories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likeHistories);
  }

  /// Create a copy of ApproachAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ApproachAnalysisCopyWith<_ApproachAnalysis> get copyWith =>
      __$ApproachAnalysisCopyWithImpl<_ApproachAnalysis>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApproachAnalysis &&
            (identical(other.adviceMessage, adviceMessage) ||
                other.adviceMessage == adviceMessage) &&
            const DeepCollectionEquality()
                .equals(other._footprintHistories, _footprintHistories) &&
            const DeepCollectionEquality()
                .equals(other._likeHistories, _likeHistories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      adviceMessage,
      const DeepCollectionEquality().hash(_footprintHistories),
      const DeepCollectionEquality().hash(_likeHistories));

  @override
  String toString() {
    return 'ApproachAnalysis(adviceMessage: $adviceMessage, footprintHistories: $footprintHistories, likeHistories: $likeHistories)';
  }
}

/// @nodoc
abstract mixin class _$ApproachAnalysisCopyWith<$Res>
    implements $ApproachAnalysisCopyWith<$Res> {
  factory _$ApproachAnalysisCopyWith(
          _ApproachAnalysis value, $Res Function(_ApproachAnalysis) _then) =
      __$ApproachAnalysisCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String adviceMessage,
      List<ApproachFootprintHistory> footprintHistories,
      List<ApproachLikeHistory> likeHistories});
}

/// @nodoc
class __$ApproachAnalysisCopyWithImpl<$Res>
    implements _$ApproachAnalysisCopyWith<$Res> {
  __$ApproachAnalysisCopyWithImpl(this._self, this._then);

  final _ApproachAnalysis _self;
  final $Res Function(_ApproachAnalysis) _then;

  /// Create a copy of ApproachAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? adviceMessage = null,
    Object? footprintHistories = null,
    Object? likeHistories = null,
  }) {
    return _then(_ApproachAnalysis(
      adviceMessage: null == adviceMessage
          ? _self.adviceMessage
          : adviceMessage // ignore: cast_nullable_to_non_nullable
              as String,
      footprintHistories: null == footprintHistories
          ? _self._footprintHistories
          : footprintHistories // ignore: cast_nullable_to_non_nullable
              as List<ApproachFootprintHistory>,
      likeHistories: null == likeHistories
          ? _self._likeHistories
          : likeHistories // ignore: cast_nullable_to_non_nullable
              as List<ApproachLikeHistory>,
    ));
  }
}

// dart format on
