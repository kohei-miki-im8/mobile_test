import 'dart:async';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/create_user_tag.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/delete_user_tag.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_tag_categories.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_tags.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_user_tags.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/tag.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/tag_category.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user_tag.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/repositories/tag.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';

part 'tag_view_model.g.dart';

/// タグ状態管理クラス
class TagState {
  const TagState({
    this.tagCategories,
    this.tagsByCategory,
    this.userTags,
    this.selectedTagCategoryIndices = const {},
    this.selectedTagIds = const {},
  });

  final List<TagCategory>? tagCategories;
  final Map<int, List<Tag>>? tagsByCategory;
  final List<UserTag>? userTags;
  final Set<int> selectedTagCategoryIndices;
  final Set<String> selectedTagIds;

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
      selectedTagCategoryIndices:
          selectedTagCategoryIndices ?? this.selectedTagCategoryIndices,
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

  /// タグカテゴリが選択されているかチェック
  bool isTagCategorySelected(int categoryIndex) {
    return selectedTagCategoryIndices.contains(categoryIndex);
  }

  /// タグが選択されているかチェック
  bool isTagSelected(String tagId) {
    return selectedTagIds.contains(tagId);
  }

  /// 選択されたタグカテゴリのリストを取得
  List<TagCategory> getSelectedTagCategories() {
    if (tagCategories == null) return [];
    return selectedTagCategoryIndices
        .where((index) => index < tagCategories!.length)
        .map((index) => tagCategories![index])
        .toList()
      ..sort((a, b) => a.tagCategoryId.compareTo(b.tagCategoryId));
  }

  /// 選択済みタグ数を取得
  int get selectedTagCount => selectedTagIds.length;

  /// 選択済みタグカテゴリ数を取得
  int get selectedTagCategoryCount => selectedTagCategoryIndices.length;

  /// タグカテゴリが1つ以上選択されているか
  bool get hasSelectedTagCategories => selectedTagCategoryIndices.isNotEmpty;

  /// タグが1つ以上選択されているか
  bool get hasSelectedTags => selectedTagIds.isNotEmpty;

  /// マスタデータが取得済みかチェック
  bool get hasMasterData => tagCategories != null && tagCategories!.isNotEmpty;
}

@riverpod
class TagViewModel extends _$TagViewModel {
  @override
  Future<TagState> build() async {
    return const TagState();
  }

  // ==========================================
  // 1. データ取得・初期化系
  // ==========================================

  /// データが未取得の場合のみマスタデータを取得
  Future<void> ensureDataLoaded() async {
    final currentState = state.valueOrNull ?? const TagState();
    if (!currentState.hasMasterData) {
      await loadMasterData();
    }

    // カテゴリ選択状態がない場合のみ初期選択状態を設定
    if (currentState.selectedTagCategoryIndices.isEmpty) {
      // ユーザータグを取得して初期選択状態を設定
      await _loadAndSetInitialSelections();
    } else {
      // カテゴリ選択状態がある場合は、そのカテゴリのタグのみを取得
      await loadTagsForSelectedCategories();
    }
  }

  /// ユーザータグを取得して初期選択状態を設定
  Future<void> _loadAndSetInitialSelections() async {
    try {
      // 現在のユーザーIDを取得
      final authState = ref.read(authRepositoryProvider);

      // ユーザータグを取得
      await getUserTags(GetUserTagsRequest(userId: authState.userId));

      // 取得したユーザータグを選択状態として設定
      _setInitialTagSelections();
    } catch (e) {
      /// Todo: EconaError
    }
  }

  /// ユーザータグに基づいてカテゴリの初期選択状態も設定
  void _setInitialCategorySelections() {
    final currentState = state.valueOrNull ?? const TagState();
    if (currentState.userTags == null ||
        currentState.userTags!.isEmpty ||
        currentState.tagsByCategory == null ||
        currentState.tagCategories == null) {
      return;
    }

    final userTagIds =
        currentState.userTags!.map((userTag) => userTag.tagId).toSet();

    final selectedCategoryIndices = <int>{};

    // ユーザーが選択したタグが属するカテゴリを特定
    for (int i = 0; i < currentState.tagCategories!.length; i++) {
      final category = currentState.tagCategories![i];
      final categoryTags = currentState.tagsByCategory![category.tagCategoryId];

      if (categoryTags != null) {
        // このカテゴリにユーザーが選択したタグがあるかチェック
        final hasSelectedTags =
            categoryTags.any((tag) => userTagIds.contains(tag.tagId));
        if (hasSelectedTags) {
          selectedCategoryIndices.add(i);
        }
      }
    }

    // カテゴリ選択状態を更新
    if (selectedCategoryIndices.isNotEmpty) {
      state = AsyncData(currentState.copyWith(
        selectedTagCategoryIndices: selectedCategoryIndices,
      ));
    }
  }

  /// 取得したユーザータグを選択状態として設定（カテゴリも含む）
  void _setInitialTagSelections() {
    final currentState = state.valueOrNull ?? const TagState();
    if (currentState.userTags == null || currentState.userTags!.isEmpty) {
      return;
    }

    // ユーザータグからタグIDを抽出
    final userTagIds =
        currentState.userTags!.map((userTag) => userTag.tagId).toSet();

    // タグ選択状態を更新
    state = AsyncData(currentState.copyWith(
      selectedTagIds: userTagIds,
    ));

    // カテゴリ選択状態も更新
    _setInitialCategorySelections();
  }

  /// マスタデータを強制取得（tag_category_pageアクセス時）
  Future<void> loadMasterData() async {
    final previousState = state;
    try {
      // タグカテゴリを取得
      final categoryResponse =
          await ref.read(tagRepositoryProvider).getTagCategories(
                GetTagCategoriesRequest(),
              );

      final oldState = previousState.valueOrNull ?? const TagState();

      // 選択状態を保持しながらマスタデータを更新
      state = AsyncData(oldState.copyWith(
        tagCategories: categoryResponse.tagCategories,
      ));

      // 全カテゴリのタグを並列取得
      await _loadAllCategoryTags(categoryResponse.tagCategories);

      // ユーザータグを取得して初期選択状態を設定
      await _loadAndSetInitialSelections();
    } on Object catch (e, stack) {
      state = AsyncError<TagState>(e, stack).copyWithPrevious(previousState);
      rethrow;
    }
  }

  /// 全カテゴリのタグを並列取得
  Future<void> _loadAllCategoryTags(List<TagCategory> categories) async {
    if (categories.isEmpty) return;

    final previousState = state;
    try {
      // 全カテゴリのタグを並列で取得
      final responses = await Future.wait(
        categories.map((category) => ref
            .read(tagRepositoryProvider)
            .getTags(GetTagsRequest(tagCategoryId: category.tagCategoryId))),
      );

      // 全てのレスポンスを受け取ってから一度に状態を更新
      final oldState = previousState.valueOrNull ?? const TagState();
      final updatedTagsByCategory =
          Map<int, List<Tag>>.from(oldState.tagsByCategory ?? {});

      for (int i = 0; i < categories.length; i++) {
        final category = categories[i];
        final response = responses[i];
        updatedTagsByCategory[category.tagCategoryId] = response.tags;
      }

      // 選択状態を保持しながらタグデータを更新
      state = AsyncData(oldState.copyWith(
        tagsByCategory: updatedTagsByCategory,
      ));
    } catch (e, stack) {
      /// Todo: EconaError
      state = AsyncError<TagState>(e, stack).copyWithPrevious(previousState);
      rethrow;
    }
  }

  /// 選択されたカテゴリのタグのみを取得（tag_pageアクセス時）
  Future<void> loadTagsForSelectedCategories() async {
    final currentState = state.valueOrNull ?? const TagState();
    final selectedCategories = currentState.getSelectedTagCategories();

    if (selectedCategories.isEmpty) return;

    // 選択されていないカテゴリに属するタグの選択を解除
    _clearUnselectedCategoryTags();

    await _loadSelectedCategoryTags(selectedCategories);
  }

  /// 選択されていないカテゴリに属するタグの選択を解除
  void _clearUnselectedCategoryTags() {
    final currentState = state.valueOrNull ?? const TagState();
    if (currentState.tagsByCategory == null ||
        currentState.selectedTagIds.isEmpty) {
      return;
    }

    final selectedCategoryIds = currentState
        .getSelectedTagCategories()
        .map((category) => category.tagCategoryId)
        .toSet();

    final newSelectedTagIds = <String>{};

    // 選択されたタグをチェックして、選択されたカテゴリに属するもののみ保持
    for (final tagId in currentState.selectedTagIds) {
      bool shouldKeep = false;

      // どのカテゴリに属するタグかを検索
      for (final entry in currentState.tagsByCategory!.entries) {
        final categoryId = entry.key;
        final tags = entry.value;

        if (tags.any((tag) => tag.tagId == tagId)) {
          // このタグが属するカテゴリが選択されているかチェック
          if (selectedCategoryIds.contains(categoryId)) {
            shouldKeep = true;
          }
          break;
        }
      }

      if (shouldKeep) {
        newSelectedTagIds.add(tagId);
      }
    }

    // 選択状態を更新（変更があった場合のみ）
    if (newSelectedTagIds.length != currentState.selectedTagIds.length) {
      state = AsyncData(currentState.copyWith(
        selectedTagIds: newSelectedTagIds,
      ));
    }
  }

  /// 選択されたカテゴリのタグを並列取得
  Future<void> _loadSelectedCategoryTags(List<TagCategory> categories) async {
    final previousState = state;
    try {
      final responses = await Future.wait(
        categories.map((category) => ref
            .read(tagRepositoryProvider)
            .getTags(GetTagsRequest(tagCategoryId: category.tagCategoryId))),
      );

      final oldState = previousState.valueOrNull ?? const TagState();
      final updatedTagsByCategory =
          Map<int, List<Tag>>.from(oldState.tagsByCategory ?? {});

      for (int i = 0; i < categories.length; i++) {
        final category = categories[i];
        final response = responses[i];
        updatedTagsByCategory[category.tagCategoryId] = response.tags;
      }

      // 選択状態を保持しながらタグデータを更新
      state = AsyncData(oldState.copyWith(
        tagsByCategory: updatedTagsByCategory,
      ));
    } catch (e, stack) {
      /// Todo: EconaError
      state = AsyncError<TagState>(e, stack).copyWithPrevious(previousState);
      rethrow;
    }
  }

  // ==========================================
  // 2. 選択状態管理系
  // ==========================================

  /// タグカテゴリの選択/選択解除を切り替え（タグ選択状態は保持）
  void toggleTagCategorySelection(int categoryIndex) {
    final currentState = state.valueOrNull ?? const TagState();
    final newSelectedCategories =
        Set<int>.from(currentState.selectedTagCategoryIndices);

    if (newSelectedCategories.contains(categoryIndex)) {
      newSelectedCategories.remove(categoryIndex);
    } else {
      newSelectedCategories.add(categoryIndex);
    }

    // タグ選択状態は保持したままカテゴリ選択状態のみ更新
    state = AsyncData(currentState.copyWith(
      selectedTagCategoryIndices: newSelectedCategories,
    ));
  }

  /// タグの選択/選択解除を切り替え
  void toggleTagSelection(String tagId) {
    final currentState = state.valueOrNull ?? const TagState();
    final newSelectedTags = Set<String>.from(currentState.selectedTagIds);

    if (newSelectedTags.contains(tagId)) {
      newSelectedTags.remove(tagId);
    } else {
      newSelectedTags.add(tagId);
    }

    state = AsyncData(currentState.copyWith(
      selectedTagIds: newSelectedTags,
    ));
  }

  /// 全ての選択をクリア
  void clearAllSelections() {
    final currentState = state.valueOrNull ?? const TagState();
    state = AsyncData(currentState.copyWith(
      selectedTagCategoryIndices: const {},
      selectedTagIds: const {},
    ));
  }

  /// タグ選択状態のみクリア（カテゴリ選択状態は保持）
  void clearTagSelections() {
    final currentState = state.valueOrNull ?? const TagState();
    state = AsyncData(currentState.copyWith(
      selectedTagIds: const {},
    ));
  }

  // ==========================================
  // 3. データ操作系
  // ==========================================

  /// ユーザータグ作成
  Future<void> createUserTag(CreateUserTagRequest request) async {
    final previousState = state;
    try {
      await ref.read(tagRepositoryProvider).createUserTag(request);
    } on Object catch (e, stack) {
      state = AsyncError<TagState>(e, stack).copyWithPrevious(previousState);
      rethrow;
    }
  }

  /// ユーザータグ削除
  Future<void> deleteUserTag(DeleteUserTagRequest request) async {
    final previousState = state;
    try {
      await ref.read(tagRepositoryProvider).deleteUserTag(request);
    } on Object catch (e, stack) {
      state = AsyncError<TagState>(e, stack).copyWithPrevious(previousState);
      rethrow;
    }
  }

  /// 選択されたタグを保存（削除・追加を適切に処理）
  Future<void> updateSelectedTags() async {
    final currentState = state.valueOrNull ?? const TagState();

    final previousState = state;
    try {
      // 現在のユーザーIDを取得
      final authState = ref.read(authRepositoryProvider);

      // 現在の選択状態と既存のユーザータグを比較
      final currentSelectedTagIds = currentState.selectedTagIds;
      final existingUserTagIds =
          currentState.userTags?.map((userTag) => userTag.tagId).toSet() ??
              <String>{};

      // 削除対象: 既存にあるが現在選択されていないタグ
      final tagsToDelete = existingUserTagIds
          .where((tagId) => !currentSelectedTagIds.contains(tagId))
          .toSet();

      // 追加対象: 現在選択されているが既存にないタグ
      final tagsToAdd = currentSelectedTagIds
          .where((tagId) => !existingUserTagIds.contains(tagId))
          .toSet();

      // 削除処理を並列実行
      if (tagsToDelete.isNotEmpty) {
        await Future.wait(
          tagsToDelete.map((tagId) => deleteUserTag(DeleteUserTagRequest(
                userId: authState.userId,
                tagId: tagId,
              ))),
        );
      }

      // 追加処理を並列実行
      if (tagsToAdd.isNotEmpty) {
        await Future.wait(
          tagsToAdd.map((tagId) => createUserTag(CreateUserTagRequest(
                userId: authState.userId,
                tagId: tagId,
              ))),
        );
      }

      // 成功した場合、ユーザータグを再取得して状態を更新
      await getUserTags(GetUserTagsRequest(userId: authState.userId));
    } on Object catch (e, stack) {
      state = AsyncError<TagState>(e, stack).copyWithPrevious(previousState);
      rethrow;
    }
  }

  /// ユーザータグ取得
  Future<void> getUserTags(GetUserTagsRequest request) async {
    final previousState = state;
    try {
      final response =
          await ref.read(tagRepositoryProvider).getUserTags(request);
      final oldState = previousState.valueOrNull ?? const TagState();

      state = AsyncData(oldState.copyWith(
        userTags: response.userTags,
      ));
    } on Object catch (e, stack) {
      state = AsyncError<TagState>(e, stack).copyWithPrevious(previousState);
    }
  }

  /// ユーザーのタグ名一覧を取得
  /// [userId] ユーザーID
  /// 戻り値: タグID -> タグ名のマップ
  Future<Map<String, String>> getUserTagMap(String userId) async {
    if (userId.isEmpty) return const <String, String>{};

    final resp = await ref
        .read(tagRepositoryProvider)
        .getUserTags(GetUserTagsRequest(userId: userId));

    // id -> name
    return {
      for (final t in resp.userTags)
        if (t.tagId.isNotEmpty) t.tagId: t.tagName,
    };
  }

  /// 共通タグ名一覧を取得（自分×相手）
  /// [currentUserId] 現在のユーザーID
  /// [toUserId] 相手のユーザーID
  /// 戻り値: 共通タグ名のリスト
  Future<List<String>> getCommonTags(
    String currentUserId,
    String toUserId,
  ) async {
    if (currentUserId.isEmpty || toUserId.isEmpty) return const <String>[];

    final selfMap = await getUserTagMap(currentUserId);
    final toUserMap = await getUserTagMap(toUserId);

    final selfIds = selfMap.keys.toSet();
    final toIds = toUserMap.keys.toSet();
    final commonIds = selfIds.intersection(toIds);

    // 名前は自分側の名称を優先、無ければ相手側、どちらも無ければID
    return commonIds
        .map((id) {
          final selfName = selfMap[id];
          if (selfName?.isNotEmpty ?? false) return selfName;
          final toName = toUserMap[id];
          if (toName?.isNotEmpty ?? false) return toName;
          // 名前が取得できない場合は表示しない
          return null;
        })
        .whereType<String>()
        .toList();
  }
}
