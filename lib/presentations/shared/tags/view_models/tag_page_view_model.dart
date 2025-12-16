  import 'dart:async';

import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_tag_categories.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_tags.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_user_tags.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/tag.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/tag_category.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user_tag.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/tag.dart';
import 'package:flutter/foundation.dart'; // debugPrint用
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_page_view_model.g.dart';

/// タグ状態管理クラス
class TagState {
  const TagState({
    this.tagCategories,
    this.tagsByCategory, // カテゴリIDをキーにしたタグのマップ
    this.userTags,
    this.selectedTagCategoryIndices, // 選択されたタグカテゴリのインデックス
    this.selectedTagIds, // 選択されたタグID
  });

  final List<TagCategory>? tagCategories;
  final Map<int, List<Tag>>? tagsByCategory; // カテゴリIDをキーにしたタグのマップ
  final List<UserTag>? userTags;
  final Set<int>? selectedTagCategoryIndices; // 選択されたタグカテゴリのインデックス
  final Set<String>? selectedTagIds; // 選択されたタグID

  TagState copyWith({
    List<TagCategory>? tagCategories,
    Map<int, List<Tag>>? tagsByCategory,
    List<UserTag>? userTags,
    Set<int>? selectedTagCategoryIndices,
    Set<String>? selectedTagIds,
  }) {
    return TagState(
      tagCategories: tagCategories ?? this.tagCategories,
      tagsByCategory: tagsByCategory ?? this.tagsByCategory,
      userTags: userTags ?? this.userTags,
      selectedTagCategoryIndices: selectedTagCategoryIndices ?? this.selectedTagCategoryIndices,
      selectedTagIds: selectedTagIds ?? this.selectedTagIds,
    );
  }

  /// 指定されたカテゴリIDのタグリストを取得
  List<Tag>? getTagsByCategory(int categoryId) {
    return tagsByCategory?[categoryId];
  }

  /// 全てのタグを1つのリストにまとめて取得
  List<Tag> getAllTags() {
    if (tagsByCategory == null) return [];
    return tagsByCategory!.values.expand((tags) => tags).toList();
  }
}

/// 共有タグ状態管理プロバイダー
@riverpod
class SharedTagState extends _$SharedTagState {
  @override
  TagState build() {
    return const TagState(
      selectedTagCategoryIndices: {},
      selectedTagIds: {},
    );
  }

  void updateTagCategories(List<TagCategory> tagCategories) {
    state = state.copyWith(tagCategories: tagCategories);
  }

  void updateTagsForCategory(int categoryId, List<Tag> tags) {
    final currentMap = Map<int, List<Tag>>.from(state.tagsByCategory ?? {});
    currentMap[categoryId] = tags;
    state = state.copyWith(tagsByCategory: currentMap);
  }

  void updateUserTags(List<UserTag> userTags) {
    state = state.copyWith(userTags: userTags);
  }
}

@riverpod
class TagPageViewModel extends _$TagPageViewModel {
  @override
  Future<TagState> build() async {
    return const TagState(
      selectedTagCategoryIndices: {},
      selectedTagIds: {},
    );
  }

  // 1. 初期化・データ取得系
  Future<void> getTagCategories(GetTagCategoriesRequest request) async {
    final previousState = state;
    try {
      final response = await ref.read(tagRepositoryProvider).getTagCategories(request);
      final oldState = previousState.valueOrNull ?? const TagState();

      state = AsyncData(oldState.copyWith(
        tagCategories: response.tagCategories,
      ));
    } on Object catch (e, stack) {
      state = AsyncError<TagState>(e, stack).copyWithPrevious(previousState);
    }
  }

  Future<void> loadTagsForCategories(List<TagCategory> categories) async {
    if (categories.isEmpty) return;

    final previousState = state;
    try {
      final responses = await Future.wait(
        categories.map((category) => 
          _getTagsResponse(GetTagsRequest(tagCategoryId: category.tagCategoryId))
        ),
      );

      final oldState = previousState.valueOrNull ?? const TagState();
      final updatedTagsByCategory = Map<int, List<Tag>>.from(oldState.tagsByCategory ?? {});
      
      for (int i = 0; i < categories.length; i++) {
        final category = categories[i];
        final response = responses[i];
        updatedTagsByCategory[category.tagCategoryId] = response.tags;
      }

      state = AsyncData(oldState.copyWith(
        tagsByCategory: updatedTagsByCategory,
      ));
    } catch (e, stack) {
      state = AsyncError<TagState>(e, stack).copyWithPrevious(previousState);
      rethrow;
    }
  }

  Future<GetTagsResponse> _getTagsResponse(GetTagsRequest request) async {
    return await ref.read(tagRepositoryProvider).getTags(request);
  }

  Future<void> getTags(GetTagsRequest request) async {
    final previousState = state;
    try {
      final response = await _getTagsResponse(request);
      final oldState = previousState.valueOrNull ?? const TagState();
      
      final updatedTagsByCategory = Map<int, List<Tag>>.from(oldState.tagsByCategory ?? {});
      updatedTagsByCategory[request.tagCategoryId] = response.tags;

      state = AsyncData(oldState.copyWith(
        tagsByCategory: updatedTagsByCategory,
      ));
    } on Object catch (e, stack) {
      state = AsyncError<TagState>(e, stack).copyWithPrevious(previousState);
    }
  }

  Future<void> getUserTags(GetUserTagsRequest request) async {
    final previousState = state;
    try {
      final response = await ref.read(tagRepositoryProvider).getUserTags(request);
      final oldState = previousState.valueOrNull ?? const TagState();

      state = AsyncData(oldState.copyWith(
        userTags: response.userTags,
      ));
    } on Object catch (e, stack) {
      state = AsyncError<TagState>(e, stack).copyWithPrevious(previousState);
    }
  }
}


