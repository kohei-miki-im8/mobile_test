// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificates_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$identityVerificationBadgeHash() =>
    r'db62083ece497b2ae4937285262b81fcc232724c';

/// 認証バッジ表示用のプロバイダー
///
/// Copied from [identityVerificationBadge].
@ProviderFor(identityVerificationBadge)
final identityVerificationBadgeProvider = AutoDisposeProvider<Widget>.internal(
  identityVerificationBadge,
  name: r'identityVerificationBadgeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$identityVerificationBadgeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IdentityVerificationBadgeRef = AutoDisposeProviderRef<Widget>;
String _$singleVerificationBadgeHash() =>
    r'ec7dbb2aacb9ead812a63665ba9d2e42e1537aa3';

/// 独身確認バッジ表示用のプロバイダー
///
/// Copied from [singleVerificationBadge].
@ProviderFor(singleVerificationBadge)
final singleVerificationBadgeProvider = AutoDisposeProvider<Widget>.internal(
  singleVerificationBadge,
  name: r'singleVerificationBadgeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$singleVerificationBadgeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SingleVerificationBadgeRef = AutoDisposeProviderRef<Widget>;
String _$isIdentityVerifiedHash() =>
    r'b2526d95c9d55521fc5f41d7dcfacf3fda7f43ae';

/// 本人確認セクションの有効判定
///
/// Copied from [isIdentityVerified].
@ProviderFor(isIdentityVerified)
final isIdentityVerifiedProvider = AutoDisposeProvider<bool>.internal(
  isIdentityVerified,
  name: r'isIdentityVerifiedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isIdentityVerifiedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsIdentityVerifiedRef = AutoDisposeProviderRef<bool>;
String _$isSingleVerifiedHash() => r'24f6541464a58a6b263dd5b91042df2e583bd75b';

/// 独身確認セクションの有効判定
///
/// Copied from [isSingleVerified].
@ProviderFor(isSingleVerified)
final isSingleVerifiedProvider = AutoDisposeProvider<bool>.internal(
  isSingleVerified,
  name: r'isSingleVerifiedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isSingleVerifiedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsSingleVerifiedRef = AutoDisposeProviderRef<bool>;
String _$certificationStatusViewModelHash() =>
    r'ec67c90fd203b32a4317fc33c2c867091444cee1';

/// 認証状態管理のViewModel
///
/// Copied from [CertificationStatusViewModel].
@ProviderFor(CertificationStatusViewModel)
final certificationStatusViewModelProvider = AutoDisposeAsyncNotifierProvider<
    CertificationStatusViewModel, CertificationStatus>.internal(
  CertificationStatusViewModel.new,
  name: r'certificationStatusViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$certificationStatusViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CertificationStatusViewModel
    = AutoDisposeAsyncNotifier<CertificationStatus>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
