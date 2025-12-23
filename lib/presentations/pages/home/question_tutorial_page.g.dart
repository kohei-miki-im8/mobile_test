// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_tutorial_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tutorialDataHash() => r'25910e3200bce92820d657a7602f2673f5a2ee9c';

/// See also [tutorialData].
@ProviderFor(tutorialData)
final tutorialDataProvider = AutoDisposeProvider<List<TutorialData>>.internal(
  tutorialData,
  name: r'tutorialDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tutorialDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TutorialDataRef = AutoDisposeProviderRef<List<TutorialData>>;
String _$tutorialControllerHash() =>
    r'7a0de5fa9159eff1565f933e1bec61159feef2e7';

/// See also [TutorialController].
@ProviderFor(TutorialController)
final tutorialControllerProvider = AutoDisposeNotifierProvider<
    TutorialController,
    ({PageController pageController, int currentIndex})>.internal(
  TutorialController.new,
  name: r'tutorialControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tutorialControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TutorialController
    = AutoDisposeNotifier<({PageController pageController, int currentIndex})>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
