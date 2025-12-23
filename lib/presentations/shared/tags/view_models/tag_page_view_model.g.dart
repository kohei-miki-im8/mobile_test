// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedTagStateHash() => r'9a339995c55f6fffe8cb461059b0a5085c495098';

/// 共有タグ状態管理プロバイダー
///
/// Copied from [SharedTagState].
@ProviderFor(SharedTagState)
final sharedTagStateProvider =
    AutoDisposeNotifierProvider<SharedTagState, TagState>.internal(
  SharedTagState.new,
  name: r'sharedTagStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedTagStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SharedTagState = AutoDisposeNotifier<TagState>;
String _$tagPageViewModelHash() => r'03864c623fe6d3e4d705ed856827fcedd665266b';

/// See also [TagPageViewModel].
@ProviderFor(TagPageViewModel)
final tagPageViewModelProvider =
    AutoDisposeAsyncNotifierProvider<TagPageViewModel, TagState>.internal(
  TagPageViewModel.new,
  name: r'tagPageViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tagPageViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TagPageViewModel = AutoDisposeAsyncNotifier<TagState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
