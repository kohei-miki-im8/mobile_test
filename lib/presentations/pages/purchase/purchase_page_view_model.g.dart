// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$purchasePageViewModelHash() =>
    r'dab877b8177a8743cc8ddc8063211d09a63d3edb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PurchasePageViewModel
    extends BuildlessAutoDisposeAsyncNotifier<PurchasePageState> {
  late final PurchasePageType pageType;

  FutureOr<PurchasePageState> build(
    PurchasePageType pageType,
  );
}

/// See also [PurchasePageViewModel].
@ProviderFor(PurchasePageViewModel)
const purchasePageViewModelProvider = PurchasePageViewModelFamily();

/// See also [PurchasePageViewModel].
class PurchasePageViewModelFamily
    extends Family<AsyncValue<PurchasePageState>> {
  /// See also [PurchasePageViewModel].
  const PurchasePageViewModelFamily();

  /// See also [PurchasePageViewModel].
  PurchasePageViewModelProvider call(
    PurchasePageType pageType,
  ) {
    return PurchasePageViewModelProvider(
      pageType,
    );
  }

  @override
  PurchasePageViewModelProvider getProviderOverride(
    covariant PurchasePageViewModelProvider provider,
  ) {
    return call(
      provider.pageType,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'purchasePageViewModelProvider';
}

/// See also [PurchasePageViewModel].
class PurchasePageViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PurchasePageViewModel,
        PurchasePageState> {
  /// See also [PurchasePageViewModel].
  PurchasePageViewModelProvider(
    PurchasePageType pageType,
  ) : this._internal(
          () => PurchasePageViewModel()..pageType = pageType,
          from: purchasePageViewModelProvider,
          name: r'purchasePageViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$purchasePageViewModelHash,
          dependencies: PurchasePageViewModelFamily._dependencies,
          allTransitiveDependencies:
              PurchasePageViewModelFamily._allTransitiveDependencies,
          pageType: pageType,
        );

  PurchasePageViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageType,
  }) : super.internal();

  final PurchasePageType pageType;

  @override
  FutureOr<PurchasePageState> runNotifierBuild(
    covariant PurchasePageViewModel notifier,
  ) {
    return notifier.build(
      pageType,
    );
  }

  @override
  Override overrideWith(PurchasePageViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: PurchasePageViewModelProvider._internal(
        () => create()..pageType = pageType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageType: pageType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PurchasePageViewModel,
      PurchasePageState> createElement() {
    return _PurchasePageViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PurchasePageViewModelProvider && other.pageType == pageType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PurchasePageViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<PurchasePageState> {
  /// The parameter `pageType` of this provider.
  PurchasePageType get pageType;
}

class _PurchasePageViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PurchasePageViewModel,
        PurchasePageState> with PurchasePageViewModelRef {
  _PurchasePageViewModelProviderElement(super.provider);

  @override
  PurchasePageType get pageType =>
      (origin as PurchasePageViewModelProvider).pageType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
