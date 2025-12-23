// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_certificate_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$guideTextForCertificateTypeHash() =>
    r'5a73eb970a41f5245b28cef69ddbc78e8f96403b';

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

/// 証明書タイプ別のガイドテキスト取得プロバイダー
///
/// Copied from [guideTextForCertificateType].
@ProviderFor(guideTextForCertificateType)
const guideTextForCertificateTypeProvider = GuideTextForCertificateTypeFamily();

/// 証明書タイプ別のガイドテキスト取得プロバイダー
///
/// Copied from [guideTextForCertificateType].
class GuideTextForCertificateTypeFamily extends Family<String> {
  /// 証明書タイプ別のガイドテキスト取得プロバイダー
  ///
  /// Copied from [guideTextForCertificateType].
  const GuideTextForCertificateTypeFamily();

  /// 証明書タイプ別のガイドテキスト取得プロバイダー
  ///
  /// Copied from [guideTextForCertificateType].
  GuideTextForCertificateTypeProvider call(
    CertificateType certificateType,
  ) {
    return GuideTextForCertificateTypeProvider(
      certificateType,
    );
  }

  @override
  GuideTextForCertificateTypeProvider getProviderOverride(
    covariant GuideTextForCertificateTypeProvider provider,
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
  String? get name => r'guideTextForCertificateTypeProvider';
}

/// 証明書タイプ別のガイドテキスト取得プロバイダー
///
/// Copied from [guideTextForCertificateType].
class GuideTextForCertificateTypeProvider extends AutoDisposeProvider<String> {
  /// 証明書タイプ別のガイドテキスト取得プロバイダー
  ///
  /// Copied from [guideTextForCertificateType].
  GuideTextForCertificateTypeProvider(
    CertificateType certificateType,
  ) : this._internal(
          (ref) => guideTextForCertificateType(
            ref as GuideTextForCertificateTypeRef,
            certificateType,
          ),
          from: guideTextForCertificateTypeProvider,
          name: r'guideTextForCertificateTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$guideTextForCertificateTypeHash,
          dependencies: GuideTextForCertificateTypeFamily._dependencies,
          allTransitiveDependencies:
              GuideTextForCertificateTypeFamily._allTransitiveDependencies,
          certificateType: certificateType,
        );

  GuideTextForCertificateTypeProvider._internal(
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
    String Function(GuideTextForCertificateTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GuideTextForCertificateTypeProvider._internal(
        (ref) => create(ref as GuideTextForCertificateTypeRef),
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
    return _GuideTextForCertificateTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GuideTextForCertificateTypeProvider &&
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
mixin GuideTextForCertificateTypeRef on AutoDisposeProviderRef<String> {
  /// The parameter `certificateType` of this provider.
  CertificateType get certificateType;
}

class _GuideTextForCertificateTypeProviderElement
    extends AutoDisposeProviderElement<String>
    with GuideTextForCertificateTypeRef {
  _GuideTextForCertificateTypeProviderElement(super.provider);

  @override
  CertificateType get certificateType =>
      (origin as GuideTextForCertificateTypeProvider).certificateType;
}

String _$instructionTextForCertificateTypeHash() =>
    r'797973d3e1909ec5ca4c592ea6c5d5be5676b99d';

/// 証明書タイプ別の撮影指示テキスト取得プロバイダー
///
/// Copied from [instructionTextForCertificateType].
@ProviderFor(instructionTextForCertificateType)
const instructionTextForCertificateTypeProvider =
    InstructionTextForCertificateTypeFamily();

/// 証明書タイプ別の撮影指示テキスト取得プロバイダー
///
/// Copied from [instructionTextForCertificateType].
class InstructionTextForCertificateTypeFamily extends Family<String> {
  /// 証明書タイプ別の撮影指示テキスト取得プロバイダー
  ///
  /// Copied from [instructionTextForCertificateType].
  const InstructionTextForCertificateTypeFamily();

  /// 証明書タイプ別の撮影指示テキスト取得プロバイダー
  ///
  /// Copied from [instructionTextForCertificateType].
  InstructionTextForCertificateTypeProvider call(
    CertificateType certificateType,
  ) {
    return InstructionTextForCertificateTypeProvider(
      certificateType,
    );
  }

  @override
  InstructionTextForCertificateTypeProvider getProviderOverride(
    covariant InstructionTextForCertificateTypeProvider provider,
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
  String? get name => r'instructionTextForCertificateTypeProvider';
}

/// 証明書タイプ別の撮影指示テキスト取得プロバイダー
///
/// Copied from [instructionTextForCertificateType].
class InstructionTextForCertificateTypeProvider
    extends AutoDisposeProvider<String> {
  /// 証明書タイプ別の撮影指示テキスト取得プロバイダー
  ///
  /// Copied from [instructionTextForCertificateType].
  InstructionTextForCertificateTypeProvider(
    CertificateType certificateType,
  ) : this._internal(
          (ref) => instructionTextForCertificateType(
            ref as InstructionTextForCertificateTypeRef,
            certificateType,
          ),
          from: instructionTextForCertificateTypeProvider,
          name: r'instructionTextForCertificateTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$instructionTextForCertificateTypeHash,
          dependencies: InstructionTextForCertificateTypeFamily._dependencies,
          allTransitiveDependencies: InstructionTextForCertificateTypeFamily
              ._allTransitiveDependencies,
          certificateType: certificateType,
        );

  InstructionTextForCertificateTypeProvider._internal(
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
    String Function(InstructionTextForCertificateTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InstructionTextForCertificateTypeProvider._internal(
        (ref) => create(ref as InstructionTextForCertificateTypeRef),
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
    return _InstructionTextForCertificateTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InstructionTextForCertificateTypeProvider &&
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
mixin InstructionTextForCertificateTypeRef on AutoDisposeProviderRef<String> {
  /// The parameter `certificateType` of this provider.
  CertificateType get certificateType;
}

class _InstructionTextForCertificateTypeProviderElement
    extends AutoDisposeProviderElement<String>
    with InstructionTextForCertificateTypeRef {
  _InstructionTextForCertificateTypeProviderElement(super.provider);

  @override
  CertificateType get certificateType =>
      (origin as InstructionTextForCertificateTypeProvider).certificateType;
}

String _$transitionDestinationForCertificateTypeHash() =>
    r'847f76ce422ba8950c46bf5d30ccd3cdf9dc9847';

/// 遷移先パス取得プロバイダー
///
/// Copied from [transitionDestinationForCertificateType].
@ProviderFor(transitionDestinationForCertificateType)
const transitionDestinationForCertificateTypeProvider =
    TransitionDestinationForCertificateTypeFamily();

/// 遷移先パス取得プロバイダー
///
/// Copied from [transitionDestinationForCertificateType].
class TransitionDestinationForCertificateTypeFamily extends Family<String> {
  /// 遷移先パス取得プロバイダー
  ///
  /// Copied from [transitionDestinationForCertificateType].
  const TransitionDestinationForCertificateTypeFamily();

  /// 遷移先パス取得プロバイダー
  ///
  /// Copied from [transitionDestinationForCertificateType].
  TransitionDestinationForCertificateTypeProvider call(
    CertificateType certificateType,
  ) {
    return TransitionDestinationForCertificateTypeProvider(
      certificateType,
    );
  }

  @override
  TransitionDestinationForCertificateTypeProvider getProviderOverride(
    covariant TransitionDestinationForCertificateTypeProvider provider,
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
  String? get name => r'transitionDestinationForCertificateTypeProvider';
}

/// 遷移先パス取得プロバイダー
///
/// Copied from [transitionDestinationForCertificateType].
class TransitionDestinationForCertificateTypeProvider
    extends AutoDisposeProvider<String> {
  /// 遷移先パス取得プロバイダー
  ///
  /// Copied from [transitionDestinationForCertificateType].
  TransitionDestinationForCertificateTypeProvider(
    CertificateType certificateType,
  ) : this._internal(
          (ref) => transitionDestinationForCertificateType(
            ref as TransitionDestinationForCertificateTypeRef,
            certificateType,
          ),
          from: transitionDestinationForCertificateTypeProvider,
          name: r'transitionDestinationForCertificateTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transitionDestinationForCertificateTypeHash,
          dependencies:
              TransitionDestinationForCertificateTypeFamily._dependencies,
          allTransitiveDependencies:
              TransitionDestinationForCertificateTypeFamily
                  ._allTransitiveDependencies,
          certificateType: certificateType,
        );

  TransitionDestinationForCertificateTypeProvider._internal(
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
    String Function(TransitionDestinationForCertificateTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransitionDestinationForCertificateTypeProvider._internal(
        (ref) => create(ref as TransitionDestinationForCertificateTypeRef),
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
    return _TransitionDestinationForCertificateTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransitionDestinationForCertificateTypeProvider &&
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
mixin TransitionDestinationForCertificateTypeRef
    on AutoDisposeProviderRef<String> {
  /// The parameter `certificateType` of this provider.
  CertificateType get certificateType;
}

class _TransitionDestinationForCertificateTypeProviderElement
    extends AutoDisposeProviderElement<String>
    with TransitionDestinationForCertificateTypeRef {
  _TransitionDestinationForCertificateTypeProviderElement(super.provider);

  @override
  CertificateType get certificateType =>
      (origin as TransitionDestinationForCertificateTypeProvider)
          .certificateType;
}

String _$confirmationTextsForCertificateTypeHash() =>
    r'7f6fbdc78b56652538b68e1f9f011c10d769f775';

/// 証明書タイプ別の確認テキスト取得プロバイダー
///
/// Copied from [confirmationTextsForCertificateType].
@ProviderFor(confirmationTextsForCertificateType)
const confirmationTextsForCertificateTypeProvider =
    ConfirmationTextsForCertificateTypeFamily();

/// 証明書タイプ別の確認テキスト取得プロバイダー
///
/// Copied from [confirmationTextsForCertificateType].
class ConfirmationTextsForCertificateTypeFamily extends Family<List<String>> {
  /// 証明書タイプ別の確認テキスト取得プロバイダー
  ///
  /// Copied from [confirmationTextsForCertificateType].
  const ConfirmationTextsForCertificateTypeFamily();

  /// 証明書タイプ別の確認テキスト取得プロバイダー
  ///
  /// Copied from [confirmationTextsForCertificateType].
  ConfirmationTextsForCertificateTypeProvider call(
    CertificateType certificateType,
  ) {
    return ConfirmationTextsForCertificateTypeProvider(
      certificateType,
    );
  }

  @override
  ConfirmationTextsForCertificateTypeProvider getProviderOverride(
    covariant ConfirmationTextsForCertificateTypeProvider provider,
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
  String? get name => r'confirmationTextsForCertificateTypeProvider';
}

/// 証明書タイプ別の確認テキスト取得プロバイダー
///
/// Copied from [confirmationTextsForCertificateType].
class ConfirmationTextsForCertificateTypeProvider
    extends AutoDisposeProvider<List<String>> {
  /// 証明書タイプ別の確認テキスト取得プロバイダー
  ///
  /// Copied from [confirmationTextsForCertificateType].
  ConfirmationTextsForCertificateTypeProvider(
    CertificateType certificateType,
  ) : this._internal(
          (ref) => confirmationTextsForCertificateType(
            ref as ConfirmationTextsForCertificateTypeRef,
            certificateType,
          ),
          from: confirmationTextsForCertificateTypeProvider,
          name: r'confirmationTextsForCertificateTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$confirmationTextsForCertificateTypeHash,
          dependencies: ConfirmationTextsForCertificateTypeFamily._dependencies,
          allTransitiveDependencies: ConfirmationTextsForCertificateTypeFamily
              ._allTransitiveDependencies,
          certificateType: certificateType,
        );

  ConfirmationTextsForCertificateTypeProvider._internal(
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
    List<String> Function(ConfirmationTextsForCertificateTypeRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConfirmationTextsForCertificateTypeProvider._internal(
        (ref) => create(ref as ConfirmationTextsForCertificateTypeRef),
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
  AutoDisposeProviderElement<List<String>> createElement() {
    return _ConfirmationTextsForCertificateTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConfirmationTextsForCertificateTypeProvider &&
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
mixin ConfirmationTextsForCertificateTypeRef
    on AutoDisposeProviderRef<List<String>> {
  /// The parameter `certificateType` of this provider.
  CertificateType get certificateType;
}

class _ConfirmationTextsForCertificateTypeProviderElement
    extends AutoDisposeProviderElement<List<String>>
    with ConfirmationTextsForCertificateTypeRef {
  _ConfirmationTextsForCertificateTypeProviderElement(super.provider);

  @override
  CertificateType get certificateType =>
      (origin as ConfirmationTextsForCertificateTypeProvider).certificateType;
}

String _$singleCertificatePageViewModelHash() =>
    r'f5f34d93c836b242d4ecebfde5d763be07ce31b0';

/// 証明書認証ページのViewModel
///
/// Copied from [SingleCertificatePageViewModel].
@ProviderFor(SingleCertificatePageViewModel)
final singleCertificatePageViewModelProvider = AutoDisposeNotifierProvider<
    SingleCertificatePageViewModel, SingleCertificatePageState>.internal(
  SingleCertificatePageViewModel.new,
  name: r'singleCertificatePageViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$singleCertificatePageViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SingleCertificatePageViewModel
    = AutoDisposeNotifier<SingleCertificatePageState>;
String _$cameraSettingsViewModelHash() =>
    r'2e1398e55208f70d17f502e764cd698e7fc02ad0';

/// カメラ設定管理のプロバイダー
///
/// Copied from [CameraSettingsViewModel].
@ProviderFor(CameraSettingsViewModel)
final cameraSettingsViewModelProvider = AutoDisposeNotifierProvider<
    CameraSettingsViewModel, Map<CertificateType, CameraSettings>>.internal(
  CameraSettingsViewModel.new,
  name: r'cameraSettingsViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cameraSettingsViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CameraSettingsViewModel
    = AutoDisposeNotifier<Map<CertificateType, CameraSettings>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
