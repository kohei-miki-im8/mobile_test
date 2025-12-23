import 'dart:async';

import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_tag_categories.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/tag_category.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/tag.dart';
import 'package:econa_mobile_app/presentations/enums/processing_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_category_page_view_model.g.dart';

/// タグカテゴリページの状態を表すクラス
class TagCategoryPageState {
  const TagCategoryPageState({
    this.tagCategories,
    this.selectedTagCategoryIndices = const {},
    this.isLoading = false,
    this.processingType,
    this.error,
  });

  /// タグカテゴリリスト
  final List<TagCategory>? tagCategories;

  /// 選択されたタグカテゴリのインデックス
  final Set<int> selectedTagCategoryIndices;

  /// ローディング状態
  final bool isLoading;

  /// 現在の処理タイプ
  final ProcessingType? processingType;

  /// エラーメッセージ
  final String? error;

  /// ローディングメッセージを取得
  String get loadingMessage {
    return processingType?.defaultMessage ?? '読み込み中...';
  }

  /// タグカテゴリが選択されているかチェック
  bool isTagCategorySelected(int categoryIndex) {
    return selectedTagCategoryIndices.contains(categoryIndex);
  }

  /// 選択済みタグカテゴリ数を取得
  int get selectedTagCategoryCount => selectedTagCategoryIndices.length;

  /// タグカテゴリが1つ以上選択されているか
  bool get hasSelectedTagCategories => selectedTagCategoryIndices.isNotEmpty;

  TagCategoryPageState copyWith({
    List<TagCategory>? tagCategories,
    Set<int>? selectedTagCategoryIndices,
    bool? isLoading,
    ProcessingType? processingType,
    String? error,
  }) {
    return TagCategoryPageState(
      tagCategories: tagCategories ?? this.tagCategories,
      selectedTagCategoryIndices: selectedTagCategoryIndices ?? this.selectedTagCategoryIndices,
      isLoading: isLoading ?? this.isLoading,
      processingType: processingType ?? this.processingType,
      error: error,
    );
  }
}

/// タグカテゴリページのメインViewModel
@riverpod
class TagCategoryPageViewModel extends _$TagCategoryPageViewModel {
  @override
  Future<TagCategoryPageState> build() async {
    try {
      final response = await ref.read(tagRepositoryProvider).getTagCategories(GetTagCategoriesRequest());

      return TagCategoryPageState(
        tagCategories: response.tagCategories,
        isLoading: false,
      );
    } catch (e) {
      return TagCategoryPageState(
        error: 'タグカテゴリの取得に失敗しました: ${e.toString()}',
      );
    }
  }

  /// タグカテゴリの選択/選択解除を切り替え
  void toggleTagCategorySelection(int categoryIndex) {
    final currentState = state.valueOrNull ?? const TagCategoryPageState();
    final newSelectedCategories = Set<int>.from(currentState.selectedTagCategoryIndices);
    
    if (newSelectedCategories.contains(categoryIndex)) {
      newSelectedCategories.remove(categoryIndex);
    } else {
      newSelectedCategories.add(categoryIndex);
    }

    state = AsyncData(currentState.copyWith(
      selectedTagCategoryIndices: newSelectedCategories,
    ));
  }

  /// 選択されたタグカテゴリのリストを取得
  List<TagCategory> getSelectedTagCategories() {
    final currentState = state.valueOrNull ?? const TagCategoryPageState();
    if (currentState.tagCategories == null) return [];
    
    return currentState.selectedTagCategoryIndices
        .where((index) => index < currentState.tagCategories!.length)
        .map((index) => currentState.tagCategories![index])
        .toList()
      ..sort((a, b) => a.tagCategoryId.compareTo(b.tagCategoryId));
  }

  /// 全ての選択をクリア
  void clearAllSelections() {
    final currentState = state.valueOrNull ?? const TagCategoryPageState();
    state = AsyncData(currentState.copyWith(
      selectedTagCategoryIndices: const {},
    ));
  }

  /// エラーをクリア
  void clearError() {
    final currentState = state.valueOrNull ?? const TagCategoryPageState();
    state = AsyncData(currentState.copyWith(error: null));
  }

  /// データを再取得
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref.read(tagRepositoryProvider).getTagCategories(GetTagCategoriesRequest());

      return TagCategoryPageState(
        tagCategories: response.tagCategories,
        isLoading: false,
      );
    });
  }
}


