// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentOffering {
  String get identifier;
  List<PaymentPackage> get packages;

  /// Create a copy of PaymentOffering
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentOfferingCopyWith<PaymentOffering> get copyWith =>
      _$PaymentOfferingCopyWithImpl<PaymentOffering>(
          this as PaymentOffering, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentOffering &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            const DeepCollectionEquality().equals(other.packages, packages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, identifier, const DeepCollectionEquality().hash(packages));

  @override
  String toString() {
    return 'PaymentOffering(identifier: $identifier, packages: $packages)';
  }
}

/// @nodoc
abstract mixin class $PaymentOfferingCopyWith<$Res> {
  factory $PaymentOfferingCopyWith(
          PaymentOffering value, $Res Function(PaymentOffering) _then) =
      _$PaymentOfferingCopyWithImpl;
  @useResult
  $Res call({String identifier, List<PaymentPackage> packages});
}

/// @nodoc
class _$PaymentOfferingCopyWithImpl<$Res>
    implements $PaymentOfferingCopyWith<$Res> {
  _$PaymentOfferingCopyWithImpl(this._self, this._then);

  final PaymentOffering _self;
  final $Res Function(PaymentOffering) _then;

  /// Create a copy of PaymentOffering
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
              as List<PaymentPackage>,
    ));
  }
}

/// @nodoc

class _PaymentOffering implements PaymentOffering {
  const _PaymentOffering(
      {required this.identifier, required final List<PaymentPackage> packages})
      : _packages = packages;

  @override
  final String identifier;
  final List<PaymentPackage> _packages;
  @override
  List<PaymentPackage> get packages {
    if (_packages is EqualUnmodifiableListView) return _packages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packages);
  }

  /// Create a copy of PaymentOffering
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentOfferingCopyWith<_PaymentOffering> get copyWith =>
      __$PaymentOfferingCopyWithImpl<_PaymentOffering>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentOffering &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            const DeepCollectionEquality().equals(other._packages, _packages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, identifier, const DeepCollectionEquality().hash(_packages));

  @override
  String toString() {
    return 'PaymentOffering(identifier: $identifier, packages: $packages)';
  }
}

/// @nodoc
abstract mixin class _$PaymentOfferingCopyWith<$Res>
    implements $PaymentOfferingCopyWith<$Res> {
  factory _$PaymentOfferingCopyWith(
          _PaymentOffering value, $Res Function(_PaymentOffering) _then) =
      __$PaymentOfferingCopyWithImpl;
  @override
  @useResult
  $Res call({String identifier, List<PaymentPackage> packages});
}

/// @nodoc
class __$PaymentOfferingCopyWithImpl<$Res>
    implements _$PaymentOfferingCopyWith<$Res> {
  __$PaymentOfferingCopyWithImpl(this._self, this._then);

  final _PaymentOffering _self;
  final $Res Function(_PaymentOffering) _then;

  /// Create a copy of PaymentOffering
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? identifier = null,
    Object? packages = null,
  }) {
    return _then(_PaymentOffering(
      identifier: null == identifier
          ? _self.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      packages: null == packages
          ? _self._packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<PaymentPackage>,
    ));
  }
}

/// @nodoc
mixin _$PaymentPackage {
  String get identifier;
  String get title;
  String get description;
  String get priceString;
  String get packageType;
  bool get hasFreeTrial;

  /// Create a copy of PaymentPackage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentPackageCopyWith<PaymentPackage> get copyWith =>
      _$PaymentPackageCopyWithImpl<PaymentPackage>(
          this as PaymentPackage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentPackage &&
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
    return 'PaymentPackage(identifier: $identifier, title: $title, description: $description, priceString: $priceString, packageType: $packageType, hasFreeTrial: $hasFreeTrial)';
  }
}

/// @nodoc
abstract mixin class $PaymentPackageCopyWith<$Res> {
  factory $PaymentPackageCopyWith(
          PaymentPackage value, $Res Function(PaymentPackage) _then) =
      _$PaymentPackageCopyWithImpl;
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
class _$PaymentPackageCopyWithImpl<$Res>
    implements $PaymentPackageCopyWith<$Res> {
  _$PaymentPackageCopyWithImpl(this._self, this._then);

  final PaymentPackage _self;
  final $Res Function(PaymentPackage) _then;

  /// Create a copy of PaymentPackage
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

class _PaymentPackage implements PaymentPackage {
  const _PaymentPackage(
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

  /// Create a copy of PaymentPackage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentPackageCopyWith<_PaymentPackage> get copyWith =>
      __$PaymentPackageCopyWithImpl<_PaymentPackage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentPackage &&
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
    return 'PaymentPackage(identifier: $identifier, title: $title, description: $description, priceString: $priceString, packageType: $packageType, hasFreeTrial: $hasFreeTrial)';
  }
}

/// @nodoc
abstract mixin class _$PaymentPackageCopyWith<$Res>
    implements $PaymentPackageCopyWith<$Res> {
  factory _$PaymentPackageCopyWith(
          _PaymentPackage value, $Res Function(_PaymentPackage) _then) =
      __$PaymentPackageCopyWithImpl;
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
class __$PaymentPackageCopyWithImpl<$Res>
    implements _$PaymentPackageCopyWith<$Res> {
  __$PaymentPackageCopyWithImpl(this._self, this._then);

  final _PaymentPackage _self;
  final $Res Function(_PaymentPackage) _then;

  /// Create a copy of PaymentPackage
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
    return _then(_PaymentPackage(
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
