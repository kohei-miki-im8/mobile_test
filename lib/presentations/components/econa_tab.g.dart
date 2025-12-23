// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'econa_tab.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tabIndexHash() => r'c746f65499d792be3eb6e8f7f319ab8afd9d445c';

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

abstract class _$TabIndex extends BuildlessAutoDisposeNotifier<int> {
  late final String pageKey;

  int build(
    String pageKey,
  );
}

/// See also [TabIndex].
@ProviderFor(TabIndex)
const tabIndexProvider = TabIndexFamily();

/// See also [TabIndex].
class TabIndexFamily extends Family<int> {
  /// See also [TabIndex].
  const TabIndexFamily();

  /// See also [TabIndex].
  TabIndexProvider call(
    String pageKey,
  ) {
    return TabIndexProvider(
      pageKey,
    );
  }

  @override
  TabIndexProvider getProviderOverride(
    covariant TabIndexProvider provider,
  ) {
    return call(
      provider.pageKey,
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
  String? get name => r'tabIndexProvider';
}

/// See also [TabIndex].
class TabIndexProvider extends AutoDisposeNotifierProviderImpl<TabIndex, int> {
  /// See also [TabIndex].
  TabIndexProvider(
    String pageKey,
  ) : this._internal(
          () => TabIndex()..pageKey = pageKey,
          from: tabIndexProvider,
          name: r'tabIndexProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tabIndexHash,
          dependencies: TabIndexFamily._dependencies,
          allTransitiveDependencies: TabIndexFamily._allTransitiveDependencies,
          pageKey: pageKey,
        );

  TabIndexProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageKey,
  }) : super.internal();

  final String pageKey;

  @override
  int runNotifierBuild(
    covariant TabIndex notifier,
  ) {
    return notifier.build(
      pageKey,
    );
  }

  @override
  Override overrideWith(TabIndex Function() create) {
    return ProviderOverride(
      origin: this,
      override: TabIndexProvider._internal(
        () => create()..pageKey = pageKey,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageKey: pageKey,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TabIndex, int> createElement() {
    return _TabIndexProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TabIndexProvider && other.pageKey == pageKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TabIndexRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `pageKey` of this provider.
  String get pageKey;
}

class _TabIndexProviderElement
    extends AutoDisposeNotifierProviderElement<TabIndex, int> with TabIndexRef {
  _TabIndexProviderElement(super.provider);

  @override
  String get pageKey => (origin as TabIndexProvider).pageKey;
}

String _$isOverlayVisibleHash() => r'418d9cd8cd4b8432ca034cfa9ccbc1d652ccae2c';

abstract class _$IsOverlayVisible extends BuildlessAutoDisposeNotifier<bool> {
  late final String pageKey;

  bool build(
    String pageKey,
  );
}

/// See also [IsOverlayVisible].
@ProviderFor(IsOverlayVisible)
const isOverlayVisibleProvider = IsOverlayVisibleFamily();

/// See also [IsOverlayVisible].
class IsOverlayVisibleFamily extends Family<bool> {
  /// See also [IsOverlayVisible].
  const IsOverlayVisibleFamily();

  /// See also [IsOverlayVisible].
  IsOverlayVisibleProvider call(
    String pageKey,
  ) {
    return IsOverlayVisibleProvider(
      pageKey,
    );
  }

  @override
  IsOverlayVisibleProvider getProviderOverride(
    covariant IsOverlayVisibleProvider provider,
  ) {
    return call(
      provider.pageKey,
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
  String? get name => r'isOverlayVisibleProvider';
}

/// See also [IsOverlayVisible].
class IsOverlayVisibleProvider
    extends AutoDisposeNotifierProviderImpl<IsOverlayVisible, bool> {
  /// See also [IsOverlayVisible].
  IsOverlayVisibleProvider(
    String pageKey,
  ) : this._internal(
          () => IsOverlayVisible()..pageKey = pageKey,
          from: isOverlayVisibleProvider,
          name: r'isOverlayVisibleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isOverlayVisibleHash,
          dependencies: IsOverlayVisibleFamily._dependencies,
          allTransitiveDependencies:
              IsOverlayVisibleFamily._allTransitiveDependencies,
          pageKey: pageKey,
        );

  IsOverlayVisibleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageKey,
  }) : super.internal();

  final String pageKey;

  @override
  bool runNotifierBuild(
    covariant IsOverlayVisible notifier,
  ) {
    return notifier.build(
      pageKey,
    );
  }

  @override
  Override overrideWith(IsOverlayVisible Function() create) {
    return ProviderOverride(
      origin: this,
      override: IsOverlayVisibleProvider._internal(
        () => create()..pageKey = pageKey,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageKey: pageKey,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<IsOverlayVisible, bool> createElement() {
    return _IsOverlayVisibleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsOverlayVisibleProvider && other.pageKey == pageKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsOverlayVisibleRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `pageKey` of this provider.
  String get pageKey;
}

class _IsOverlayVisibleProviderElement
    extends AutoDisposeNotifierProviderElement<IsOverlayVisible, bool>
    with IsOverlayVisibleRef {
  _IsOverlayVisibleProviderElement(super.provider);

  @override
  String get pageKey => (origin as IsOverlayVisibleProvider).pageKey;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
