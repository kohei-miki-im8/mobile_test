import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/tag.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/tag_category.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user_tag.pb.dart';

// Tagの状態を管理するクラス
class TagApiState {
  const TagApiState({
    // GetTagCategories
    this.tagCategories,

    // GetTags
    this.tags,

    // GetUserTags
    this.userTags,

    // 共通
    this.isLoading = false,
    this.error,
  });
  // GetTagCategories
  final List<TagCategory>? tagCategories;

  // GetTags
  final List<Tag>? tags;

  // GetUserTags
  final List<UserTag>? userTags;

  // 共通の状態
  final bool? isLoading;
  final String? error;

  TagApiState copyWith({
    // GetTagCategories
    List<TagCategory>? tagCategories,

    // GetTags
    List<Tag>? tags,

    // GetUserTags
    List<UserTag>? userTags,

    // 共通の状態
    bool? isLoading,
    String? error,
  }) {
    return TagApiState(
      // GetTagCategories
      tagCategories : tagCategories ?? this.tagCategories,

      // GetTags
      tags : tags ?? this.tags,

      // GetUserTags
      userTags : userTags ?? this.userTags,


      // 共通の状態
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

