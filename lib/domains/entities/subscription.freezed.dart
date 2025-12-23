// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionOffering {
  String get identifier;
  List<SubscriptionPackage> get packages;

  /// Create a copy of SubscriptionOffering
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionOfferingCopyWith<SubscriptionOffering> get copyWith =>
      _$SubscriptionOfferingCopyWithImpl<SubscriptionOffering>(
          this as SubscriptionOffering, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionOffering &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            const DeepCollectionEquality().equals(other.packages, packages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, identifier, const DeepCollectionEquality().hash(packages));

  @override
  String toString() {
    return 'SubscriptionOffering(identifier: $identifier, packages: $packages)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionOfferingCopyWith<$Res> {
  factory $SubscriptionOfferingCopyWith(SubscriptionOffering value,
          $Res Function(SubscriptionOffering) _then) =
      _$SubscriptionOfferingCopyWithImpl;
  @useResult
  $Res call({String identifier, List<SubscriptionPackage> packages});
}

/// @nodoc
class _$SubscriptionOfferingCopyWithImpl<$Res>
    implements $SubscriptionOfferingCopyWith<$Res> {
  _$SubscriptionOfferingCopyWithImpl(this._self, this._then);

  final SubscriptionOffering _self;
  final $Res Function(SubscriptionOffering) _then;

  /// Create a copy of SubscriptionOffering
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? packages = null,
  }) {
    return _then(_self.copyWith(
      identifier: null == identifier
          ? _self.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      packages: null == packages
          ? _self.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionPackage>,
    ));
  }
}

/// @nodoc

class _SubscriptionOffering implements SubscriptionOffering {
  const _SubscriptionOffering(
      {required this.identifier,
      required final List<SubscriptionPackage> packages})
      : _packages = packages;

  @override
  final String identifier;
  final List<SubscriptionPackage> _packages;
  @override
  List<SubscriptionPackage> get packages {
    if (_packages is EqualUnmodifiableListView) return _packages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packages);
  }

  /// Create a copy of SubscriptionOffering
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionOfferingCopyWith<_SubscriptionOffering> get copyWith =>
      __$SubscriptionOfferingCopyWithImpl<_SubscriptionOffering>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionOffering &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            const DeepCollectionEquality().equals(other._packages, _packages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, identifier, const DeepCollectionEquality().hash(_packages));

  @override
  String toString() {
    return 'SubscriptionOffering(identifier: $identifier, packages: $packages)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionOfferingCopyWith<$Res>
    implements $SubscriptionOfferingCopyWith<$Res> {
  factory _$SubscriptionOfferingCopyWith(_SubscriptionOffering value,
          $Res Function(_SubscriptionOffering) _then) =
      __$SubscriptionOfferingCopyWithImpl;
  @override
  @useResult
  $Res call({String identifier, List<SubscriptionPackage> packages});
}

/// @nodoc
class __$SubscriptionOfferingCopyWithImpl<$Res>
    implements _$SubscriptionOfferingCopyWith<$Res> {
  __$SubscriptionOfferingCopyWithImpl(this._self, this._then);

  final _SubscriptionOffering _self;
  final $Res Function(_SubscriptionOffering) _then;

  /// Create a copy of SubscriptionOffering
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? identifier = null,
    Object? packages = null,
  }) {
    return _then(_SubscriptionOffering(
      identifier: null == identifier
          ? _self.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      packages: null == packages
          ? _self._packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionPackage>,
    ));
  }
}

/// @nodoc
mixin _$SubscriptionPackage {
  String get identifier;
  String get title;
  String get description;
  String get priceString;
  String get packageType;
  bool get hasFreeTrial;

  /// Create a copy of SubscriptionPackage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionPackageCopyWith<SubscriptionPackage> get copyWith =>
      _$SubscriptionPackageCopyWithImpl<SubscriptionPackage>(
          this as SubscriptionPackage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionPackage &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priceString, priceString) ||
                other.priceString == priceString) &&
            (identical(other.packageType, packageType) ||
                other.packageType == packageType) &&
            (identical(other.hasFreeTrial, hasFreeTrial) ||
                other.hasFreeTrial == hasFreeTrial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identifier, title, description,
      priceString, packageType, hasFreeTrial);

  @override
  String toString() {
    return 'SubscriptionPackage(identifier: $identifier, title: $title, description: $description, priceString: $priceString, packageType: $packageType, hasFreeTrial: $hasFreeTrial)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionPackageCopyWith<$Res> {
  factory $SubscriptionPackageCopyWith(
          SubscriptionPackage value, $Res Function(SubscriptionPackage) _then) =
      _$SubscriptionPackageCopyWithImpl;
  @useResult
  $Res call(
      {String identifier,
      String title,
      String description,
      String priceString,
      String packageType,
      bool hasFreeTrial});
}

/// @nodoc
class _$SubscriptionPackageCopyWithImpl<$Res>
    implements $SubscriptionPackageCopyWith<$Res> {
  _$SubscriptionPackageCopyWithImpl(this._self, this._then);

  final SubscriptionPackage _self;
  final $Res Function(SubscriptionPackage) _then;

  /// Create a copy of SubscriptionPackage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? title = null,
    Object? description = null,
    Object? priceString = null,
    Object? packageType = null,
    Object? hasFreeTrial = null,
  }) {
    return _then(_self.copyWith(
      identifier: null == identifier
          ? _self.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priceString: null == priceString
          ? _self.priceString
          : priceString // ignore: cast_nullable_to_non_nullable
              as String,
      packageType: null == packageType
          ? _self.packageType
          : packageType // ignore: cast_nullable_to_non_nullable
              as String,
      hasFreeTrial: null == hasFreeTrial
          ? _self.hasFreeTrial
          : hasFreeTrial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _SubscriptionPackage implements SubscriptionPackage {
  const _SubscriptionPackage(
      {required this.identifier,
      required this.title,
      required this.description,
      required this.priceString,
      required this.packageType,
      required this.hasFreeTrial});

  @override
  final String identifier;
  @override
  final String title;
  @override
  final String description;
  @override
  final String priceString;
  @override
  final String packageType;
  @override
  final bool hasFreeTrial;

  /// Create a copy of SubscriptionPackage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionPackageCopyWith<_SubscriptionPackage> get copyWith =>
      __$SubscriptionPackageCopyWithImpl<_SubscriptionPackage>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionPackage &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priceString, priceString) ||
                other.priceString == priceString) &&
            (identical(other.packageType, packageType) ||
                other.packageType == packageType) &&
            (identical(other.hasFreeTrial, hasFreeTrial) ||
                other.hasFreeTrial == hasFreeTrial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identifier, title, description,
      priceString, packageType, hasFreeTrial);

  @override
  String toString() {
    return 'SubscriptionPackage(identifier: $identifier, title: $title, description: $description, priceString: $priceString, packageType: $packageType, hasFreeTrial: $hasFreeTrial)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionPackageCopyWith<$Res>
    implements $SubscriptionPackageCopyWith<$Res> {
  factory _$SubscriptionPackageCopyWith(_SubscriptionPackage value,
          $Res Function(_SubscriptionPackage) _then) =
      __$SubscriptionPackageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String identifier,
      String title,
      String description,
      String priceString,
      String packageType,
      bool hasFreeTrial});
}

/// @nodoc
class __$SubscriptionPackageCopyWithImpl<$Res>
    implements _$SubscriptionPackageCopyWith<$Res> {
  __$SubscriptionPackageCopyWithImpl(this._self, this._then);

  final _SubscriptionPackage _self;
  final $Res Function(_SubscriptionPackage) _then;

  /// Create a copy of SubscriptionPackage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? identifier = null,
    Object? title = null,
    Object? description = null,
    Object? priceString = null,
    Object? packageType = null,
    Object? hasFreeTrial = null,
  }) {
    return _then(_SubscriptionPackage(
      identifier: null == identifier
          ? _self.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priceString: null == priceString
          ? _self.priceString
          : priceString // ignore: cast_nullable_to_non_nullable
              as String,
      packageType: null == packageType
          ? _self.packageType
          : packageType // ignore: cast_nullable_to_non_nullable
              as String,
      hasFreeTrial: null == hasFreeTrial
          ? _self.hasFreeTrial
          : hasFreeTrial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
