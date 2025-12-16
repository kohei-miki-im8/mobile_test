// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subscriptionPageViewModelHash() =>
    r'4bc26fc592df731144d708e504b2445e089334ce';

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

abstract class _$SubscriptionPageViewModel
    extends BuildlessAutoDisposeAsyncNotifier<SubscriptionPageState> {
  late final SubscriptionPageType type;

  FutureOr<SubscriptionPageState> build(
    SubscriptionPageType type,
  );
}

/// See also [SubscriptionPageViewModel].
@ProviderFor(SubscriptionPageViewModel)
const subscriptionPageViewModelProvider = SubscriptionPageViewModelFamily();

/// See also [SubscriptionPageViewModel].
class SubscriptionPageViewModelFamily
    extends Family<AsyncValue<SubscriptionPageState>> {
  /// See also [SubscriptionPageViewModel].
  const SubscriptionPageViewModelFamily();

  /// See also [SubscriptionPageViewModel].
  SubscriptionPageViewModelProvider call(
    SubscriptionPageType type,
  ) {
    return SubscriptionPageViewModelProvider(
      type,
    );
  }

  @override
  SubscriptionPageViewModelProvider getProviderOverride(
    covariant SubscriptionPageViewModelProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'subscriptionPageViewModelProvider';
}

/// See also [SubscriptionPageViewModel].
class SubscriptionPageViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SubscriptionPageViewModel,
        SubscriptionPageState> {
  /// See also [SubscriptionPageViewModel].
  SubscriptionPageViewModelProvider(
    SubscriptionPageType type,
  ) : this._internal(
          () => SubscriptionPageViewModel()..type = type,
          from: subscriptionPageViewModelProvider,
          name: r'subscriptionPageViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$subscriptionPageViewModelHash,
          dependencies: SubscriptionPageViewModelFamily._dependencies,
          allTransitiveDependencies:
              SubscriptionPageViewModelFamily._allTransitiveDependencies,
          type: type,
        );

  SubscriptionPageViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final SubscriptionPageType type;

  @override
  FutureOr<SubscriptionPageState> runNotifierBuild(
    covariant SubscriptionPageViewModel notifier,
  ) {
    return notifier.build(
      type,
    );
  }

  @override
  Override overrideWith(SubscriptionPageViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SubscriptionPageViewModelProvider._internal(
        () => create()..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SubscriptionPageViewModel,
      SubscriptionPageState> createElement() {
    return _SubscriptionPageViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubscriptionPageViewModelProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubscriptionPageViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<SubscriptionPageState> {
  /// The parameter `type` of this provider.
  SubscriptionPageType get type;
}

class _SubscriptionPageViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SubscriptionPageViewModel,
        SubscriptionPageState> with SubscriptionPageViewModelRef {
  _SubscriptionPageViewModelProviderElement(super.provider);

  @override
  SubscriptionPageType get type =>
      (origin as SubscriptionPageViewModelProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
