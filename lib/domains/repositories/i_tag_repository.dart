import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/create_user_tag.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/delete_user_tag.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_tag_categories.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_tags.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_user_tags.pb.dart';

/// タグ関連のRepository Interface
abstract class ITagRepository {
  /// ユーザータグ作成
  Future<CreateUserTagResponse> createUserTag(CreateUserTagRequest request);
  
  /// ユーザータグ削除
  Future<DeleteUserTagResponse> deleteUserTag(DeleteUserTagRequest request);
  
  /// タグカテゴリ取得
  Future<GetTagCategoriesResponse> getTagCategories(GetTagCategoriesRequest request);
  
  /// タグ取得
  Future<GetTagsResponse> getTags(GetTagsRequest request);
  
  /// ユーザータグ取得
  Future<GetUserTagsResponse> getUserTags(GetUserTagsRequest request);
} 