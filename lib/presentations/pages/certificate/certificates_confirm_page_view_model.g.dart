// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificates_confirm_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$confirmText1ForCertificateTypeHash() =>
    r'05a69b4a6c5ac0ddaa3da20aa90efd798972f6b3';

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

/// 証明書タイプ別の確認テキスト1取得プロバイダー
///
/// Copied from [confirmText1ForCertificateType].
@ProviderFor(confirmText1ForCertificateType)
const confirmText1ForCertificateTypeProvider =
    ConfirmText1ForCertificateTypeFamily();

/// 証明書タイプ別の確認テキスト1取得プロバイダー
///
/// Copied from [confirmText1ForCertificateType].
class ConfirmText1ForCertificateTypeFamily extends Family<String> {
  /// 証明書タイプ別の確認テキスト1取得プロバイダー
  ///
  /// Copied from [confirmText1ForCertificateType].
  const ConfirmText1ForCertificateTypeFamily();

  /// 証明書タイプ別の確認テキスト1取得プロバイダー
  ///
  /// Copied from [confirmText1ForCertificateType].
  ConfirmText1ForCertificateTypeProvider call(
    CertificateType certificateType,
  ) {
    return ConfirmText1ForCertificateTypeProvider(
      certificateType,
    );
  }

  @override
  ConfirmText1ForCertificateTypeProvider getProviderOverride(
    covariant ConfirmText1ForCertificateTypeProvider provider,
  ) {
    return call(
      provider.certificateType,
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
  String? get name => r'confirmText1ForCertificateTypeProvider';
}

/// 証明書タイプ別の確認テキスト1取得プロバイダー
///
/// Copied from [confirmText1ForCertificateType].
class ConfirmText1ForCertificateTypeProvider
    extends AutoDisposeProvider<String> {
  /// 証明書タイプ別の確認テキスト1取得プロバイダー
  ///
  /// Copied from [confirmText1ForCertificateType].
  ConfirmText1ForCertificateTypeProvider(
    CertificateType certificateType,
  ) : this._internal(
          (ref) => confirmText1ForCertificateType(
            ref as ConfirmText1ForCertificateTypeRef,
            certificateType,
          ),
          from: confirmText1ForCertificateTypeProvider,
          name: r'confirmText1ForCertificateTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$confirmText1ForCertificateTypeHash,
          dependencies: ConfirmText1ForCertificateTypeFamily._dependencies,
          allTransitiveDependencies:
              ConfirmText1ForCertificateTypeFamily._allTransitiveDependencies,
          certificateType: certificateType,
        );

  ConfirmText1ForCertificateTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.certificateType,
  }) : super.internal();

  final CertificateType certificateType;

  @override
  Override overrideWith(
    String Function(ConfirmText1ForCertificateTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConfirmText1ForCertificateTypeProvider._internal(
        (ref) => create(ref as ConfirmText1ForCertificateTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        certificateType: certificateType,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _ConfirmText1ForCertificateTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConfirmText1ForCertificateTypeProvider &&
        other.certificateType == certificateType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, certificateType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConfirmText1ForCertificateTypeRef on AutoDisposeProviderRef<String> {
  /// The parameter `certificateType` of this provider.
  CertificateType get certificateType;
}

class _ConfirmText1ForCertificateTypeProviderElement
    extends AutoDisposeProviderElement<String>
    with ConfirmText1ForCertificateTypeRef {
  _ConfirmText1ForCertificateTypeProviderElement(super.provider);

  @override
  CertificateType get certificateType =>
      (origin as ConfirmText1ForCertificateTypeProvider).certificateType;
}

String _$confirmText2ForCertificateTypeHash() =>
    r'0671fe670f11b1e30c23659725878245d3c8c4ff';

/// 証明書タイプ別の確認テキスト2取得プロバイダー
///
/// Copied from [confirmText2ForCertificateType].
@ProviderFor(confirmText2ForCertificateType)
const confirmText2ForCertificateTypeProvider =
    ConfirmText2ForCertificateTypeFamily();

/// 証明書タイプ別の確認テキスト2取得プロバイダー
///
/// Copied from [confirmText2ForCertificateType].
class ConfirmText2ForCertificateTypeFamily extends Family<String> {
  /// 証明書タイプ別の確認テキスト2取得プロバイダー
  ///
  /// Copied from [confirmText2ForCertificateType].
  const ConfirmText2ForCertificateTypeFamily();

  /// 証明書タイプ別の確認テキスト2取得プロバイダー
  ///
  /// Copied from [confirmText2ForCertificateType].
  ConfirmText2ForCertificateTypeProvider call(
    CertificateType certificateType,
  ) {
    return ConfirmText2ForCertificateTypeProvider(
      certificateType,
    );
  }

  @override
  ConfirmText2ForCertificateTypeProvider getProviderOverride(
    covariant ConfirmText2ForCertificateTypeProvider provider,
  ) {
    return call(
      provider.certificateType,
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
  String? get name => r'confirmText2ForCertificateTypeProvider';
}

/// 証明書タイプ別の確認テキスト2取得プロバイダー
///
/// Copied from [confirmText2ForCertificateType].
class ConfirmText2ForCertificateTypeProvider
    extends AutoDisposeProvider<String> {
  /// 証明書タイプ別の確認テキスト2取得プロバイダー
  ///
  /// Copied from [confirmText2ForCertificateType].
  ConfirmText2ForCertificateTypeProvider(
    CertificateType certificateType,
  ) : this._internal(
          (ref) => confirmText2ForCertificateType(
            ref as ConfirmText2ForCertificateTypeRef,
            certificateType,
          ),
          from: confirmText2ForCertificateTypeProvider,
          name: r'confirmText2ForCertificateTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$confirmText2ForCertificateTypeHash,
          dependencies: ConfirmText2ForCertificateTypeFamily._dependencies,
          allTransitiveDependencies:
              ConfirmText2ForCertificateTypeFamily._allTransitiveDependencies,
          certificateType: certificateType,
        );

  ConfirmText2ForCertificateTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.certificateType,
  }) : super.internal();

  final CertificateType certificateType;

  @override
  Override overrideWith(
    String Function(ConfirmText2ForCertificateTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConfirmText2ForCertificateTypeProvider._internal(
        (ref) => create(ref as ConfirmText2ForCertificateTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        certificateType: certificateType,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _ConfirmText2ForCertificateTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConfirmText2ForCertificateTypeProvider &&
        other.certificateType == certificateType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, certificateType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConfirmText2ForCertificateTypeRef on AutoDisposeProviderRef<String> {
  /// The parameter `certificateType` of this provider.
  CertificateType get certificateType;
}

class _ConfirmText2ForCertificateTypeProviderElement
    extends AutoDisposeProviderElement<String>
    with ConfirmText2ForCertificateTypeRef {
  _ConfirmText2ForCertificateTypeProviderElement(super.provider);

  @override
  CertificateType get certificateType =>
      (origin as ConfirmText2ForCertificateTypeProvider).certificateType;
}

String _$confirmGuideTextForCertificateTypeHash() =>
    r'9ac4ff37aae072a9f8842e0f60fd379bbbf150fc';

/// 証明書タイプ別のガイドテキスト取得プロバイダー
///
/// Copied from [confirmGuideTextForCertificateType].
@ProviderFor(confirmGuideTextForCertificateType)
const confirmGuideTextForCertificateTypeProvider =
    ConfirmGuideTextForCertificateTypeFamily();

/// 証明書タイプ別のガイドテキスト取得プロバイダー
///
/// Copied from [confirmGuideTextForCertificateType].
class ConfirmGuideTextForCertificateTypeFamily extends Family<String> {
  /// 証明書タイプ別のガイドテキスト取得プロバイダー
  ///
  /// Copied from [confirmGuideTextForCertificateType].
  const ConfirmGuideTextForCertificateTypeFamily();

  /// 証明書タイプ別のガイドテキスト取得プロバイダー
  ///
  /// Copied from [confirmGuideTextForCertificateType].
  ConfirmGuideTextForCertificateTypeProvider call(
    CertificateType certificateType,
  ) {
    return ConfirmGuideTextForCertificateTypeProvider(
      certificateType,
    );
  }

  @override
  ConfirmGuideTextForCertificateTypeProvider getProviderOverride(
    covariant ConfirmGuideTextForCertificateTypeProvider provider,
  ) {
    return call(
      provider.certificateType,
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
  String? get name => r'confirmGuideTextForCertificateTypeProvider';
}

/// 証明書タイプ別のガイドテキスト取得プロバイダー
///
/// Copied from [confirmGuideTextForCertificateType].
class ConfirmGuideTextForCertificateTypeProvider
    extends AutoDisposeProvider<String> {
  /// 証明書タイプ別のガイドテキスト取得プロバイダー
  ///
  /// Copied from [confirmGuideTextForCertificateType].
  ConfirmGuideTextForCertificateTypeProvider(
    CertificateType certificateType,
  ) : this._internal(
          (ref) => confirmGuideTextForCertificateType(
            ref as ConfirmGuideTextForCertificateTypeRef,
            certificateType,
          ),
          from: confirmGuideTextForCertificateTypeProvider,
          name: r'confirmGuideTextForCertificateTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$confirmGuideTextForCertificateTypeHash,
          dependencies: ConfirmGuideTextForCertificateTypeFamily._dependencies,
          allTransitiveDependencies: ConfirmGuideTextForCertificateTypeFamily
              ._allTransitiveDependencies,
          certificateType: certificateType,
        );

  ConfirmGuideTextForCertificateTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.certificateType,
  }) : super.internal();

  final CertificateType certificateType;

  @override
  Override overrideWith(
    String Function(ConfirmGuideTextForCertificateTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConfirmGuideTextForCertificateTypeProvider._internal(
        (ref) => create(ref as ConfirmGuideTextForCertificateTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        certificateType: certificateType,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _ConfirmGuideTextForCertificateTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConfirmGuideTextForCertificateTypeProvider &&
        other.certificateType == certificateType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, certificateType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConfirmGuideTextForCertificateTypeRef on AutoDisposeProviderRef<String> {
  /// The parameter `certificateType` of this provider.
  CertificateType get certificateType;
}

class _ConfirmGuideTextForCertificateTypeProviderElement
    extends AutoDisposeProviderElement<String>
    with ConfirmGuideTextForCertificateTypeRef {
  _ConfirmGuideTextForCertificateTypeProviderElement(super.provider);

  @override
  CertificateType get certificateType =>
      (origin as ConfirmGuideTextForCertificateTypeProvider).certificateType;
}

String _$confirmTransitionDestinationForCertificateTypeHash() =>
    r'476f8c79121fd7ae5d199a04cb67358b2be85227';

/// 証明書タイプ別の遷移先取得プロバイダー（Aポリシー：一時的にリテラルパス）
///
/// Copied from [confirmTransitionDestinationForCertificateType].
@ProviderFor(confirmTransitionDestinationForCertificateType)
const confirmTransitionDestinationForCertificateTypeProvider =
    ConfirmTransitionDestinationForCertificateTypeFamily();

/// 証明書タイプ別の遷移先取得プロバイダー（Aポリシー：一時的にリテラルパス）
///
/// Copied from [confirmTransitionDestinationForCertificateType].
class ConfirmTransitionDestinationForCertificateTypeFamily
    extends Family<String> {
  /// 証明書タイプ別の遷移先取得プロバイダー（Aポリシー：一時的にリテラルパス）
  ///
  /// Copied from [confirmTransitionDestinationForCertificateType].
  const ConfirmTransitionDestinationForCertificateTypeFamily();

  /// 証明書タイプ別の遷移先取得プロバイダー（Aポリシー：一時的にリテラルパス）
  ///
  /// Copied from [confirmTransitionDestinationForCertificateType].
  ConfirmTransitionDestinationForCertificateTypeProvider call(
    CertificateType certificateType,
  ) {
    return ConfirmTransitionDestinationForCertificateTypeProvider(
      certificateType,
    );
  }

  @override
  ConfirmTransitionDestinationForCertificateTypeProvider getProviderOverride(
    covariant ConfirmTransitionDestinationForCertificateTypeProvider provider,
  ) {
    return call(
      provider.certificateType,
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
  String? get name => r'confirmTransitionDestinationForCertificateTypeProvider';
}

/// 証明書タイプ別の遷移先取得プロバイダー（Aポリシー：一時的にリテラルパス）
///
/// Copied from [confirmTransitionDestinationForCertificateType].
class ConfirmTransitionDestinationForCertificateTypeProvider
    extends AutoDisposeProvider<String> {
  /// 証明書タイプ別の遷移先取得プロバイダー（Aポリシー：一時的にリテラルパス）
  ///
  /// Copied from [confirmTransitionDestinationForCertificateType].
  ConfirmTransitionDestinationForCertificateTypeProvider(
    CertificateType certificateType,
  ) : this._internal(
          (ref) => confirmTransitionDestinationForCertificateType(
            ref as ConfirmTransitionDestinationForCertificateTypeRef,
            certificateType,
          ),
          from: confirmTransitionDestinationForCertificateTypeProvider,
          name: r'confirmTransitionDestinationForCertificateTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$confirmTransitionDestinationForCertificateTypeHash,
          dependencies: ConfirmTransitionDestinationForCertificateTypeFamily
              ._dependencies,
          allTransitiveDependencies:
              ConfirmTransitionDestinationForCertificateTypeFamily
                  ._allTransitiveDependencies,
          certificateType: certificateType,
        );

  ConfirmTransitionDestinationForCertificateTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.certificateType,
  }) : super.internal();

  final CertificateType certificateType;

  @override
  Override overrideWith(
    String Function(ConfirmTransitionDestinationForCertificateTypeRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override:
          ConfirmTransitionDestinationForCertificateTypeProvider._internal(
        (ref) =>
            create(ref as ConfirmTransitionDestinationForCertificateTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        certificateType: certificateType,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _ConfirmTransitionDestinationForCertificateTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConfirmTransitionDestinationForCertificateTypeProvider &&
        other.certificateType == certificateType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, certificateType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConfirmTransitionDestinationForCertificateTypeRef
    on AutoDisposeProviderRef<String> {
  /// The parameter `certificateType` of this provider.
  CertificateType get certificateType;
}

class _ConfirmTransitionDestinationForCertificateTypeProviderElement
    extends AutoDisposeProviderElement<String>
    with ConfirmTransitionDestinationForCertificateTypeRef {
  _ConfirmTransitionDestinationForCertificateTypeProviderElement(
      super.provider);

  @override
  CertificateType get certificateType =>
      (origin as ConfirmTransitionDestinationForCertificateTypeProvider)
          .certificateType;
}

String _$certificateConfirmViewModelHash() =>
    r'd72e931fdb495bd78b3bbb2a1f4c5d1bcbb5ee78';

/// 証明書確認ページのViewModel
///
/// Copied from [CertificateConfirmViewModel].
@ProviderFor(CertificateConfirmViewModel)
final certificateConfirmViewModelProvider = AutoDisposeAsyncNotifierProvider<
    CertificateConfirmViewModel, CertificateConfirmState>.internal(
  CertificateConfirmViewModel.new,
  name: r'certificateConfirmViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$certificateConfirmViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CertificateConfirmViewModel
    = AutoDisposeAsyncNotifier<CertificateConfirmState>;
String _$certificateConfirmTextViewModelHash() =>
    r'4f718fa3dd9e3e11c13889fd0b293832dca5a9dd';

/// 証明書タイプ別の確認テキスト設定管理
///
/// Copied from [CertificateConfirmTextViewModel].
@ProviderFor(CertificateConfirmTextViewModel)
final certificateConfirmTextViewModelProvider = AutoDisposeNotifierProvider<
    CertificateConfirmTextViewModel,
    Map<CertificateType, CertificateConfirmTexts>>.internal(
  CertificateConfirmTextViewModel.new,
  name: r'certificateConfirmTextViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$certificateConfirmTextViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CertificateConfirmTextViewModel
    = AutoDisposeNotifier<Map<CertificateType, CertificateConfirmTexts>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
