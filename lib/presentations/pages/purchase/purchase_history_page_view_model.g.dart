// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_history_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$purchaseHistoryPointsHash() =>
    r'5ffe0c04cf1191744b6f6d5285a8236b85a7f923';

/// See also [purchaseHistoryPoints].
@ProviderFor(purchaseHistoryPoints)
final purchaseHistoryPointsProvider =
    AutoDisposeFutureProvider<GetUserPointsResponse>.internal(
  purchaseHistoryPoints,
  name: r'purchaseHistoryPointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$purchaseHistoryPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PurchaseHistoryPointsRef
    = AutoDisposeFutureProviderRef<GetUserPointsResponse>;
String _$purchaseHistoryPageViewModelHash() =>
    r'5c6da7ce5cb6145c94e3b20f9c3549fa6acbc967';

/// See also [PurchaseHistoryPageViewModel].
@ProviderFor(PurchaseHistoryPageViewModel)
final purchaseHistoryPageViewModelProvider = AutoDisposeAsyncNotifierProvider<
    PurchaseHistoryPageViewModel, GetUserPointHistoryResponse>.internal(
  PurchaseHistoryPageViewModel.new,
  name: r'purchaseHistoryPageViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$purchaseHistoryPageViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PurchaseHistoryPageViewModel
    = AutoDisposeAsyncNotifier<GetUserPointHistoryResponse>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
