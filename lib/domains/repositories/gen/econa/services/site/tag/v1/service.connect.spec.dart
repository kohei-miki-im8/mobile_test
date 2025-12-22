//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_user_tag.pb.dart" as econaservicessitetagv1create_user_tag;
import "delete_user_tag.pb.dart" as econaservicessitetagv1delete_user_tag;
import "sync_user_tag.pb.dart" as econaservicessitetagv1sync_user_tag;
import "get_tag_categories.pb.dart" as econaservicessitetagv1get_tag_categories;
import "get_tags.pb.dart" as econaservicessitetagv1get_tags;
import "get_user_tags.pb.dart" as econaservicessitetagv1get_user_tags;
import "get_common_tags.pb.dart" as econaservicessitetagv1get_common_tags;

/// タグ機能を提供するサービスです。
abstract final class TagService {
  /// Fully-qualified name of the TagService service.
  static const name = 'econa.services.site.tag.v1.TagService';

  /// CreateUserTag:ユーザーのタグを作成
  /// DEPRECATED: SyncUserTagを使用してください
  static const createUserTag = connect.Spec(
    '/$name/CreateUserTag',
    connect.StreamType.unary,
    econaservicessitetagv1create_user_tag.CreateUserTagRequest.new,
    econaservicessitetagv1create_user_tag.CreateUserTagResponse.new,
  );

  /// DeleteUserTag:ユーザーのタグを削除
  /// DEPRECATED: SyncUserTagを使用してください
  static const deleteUserTag = connect.Spec(
    '/$name/DeleteUserTag',
    connect.StreamType.unary,
    econaservicessitetagv1delete_user_tag.DeleteUserTagRequest.new,
    econaservicessitetagv1delete_user_tag.DeleteUserTagResponse.new,
  );

  /// SyncUserTag:ユーザーのタグを同期（追加/削除）
  /// 冪等な操作：同一リクエストを複数回送信しても結果は一貫する
  static const syncUserTag = connect.Spec(
    '/$name/SyncUserTag',
    connect.StreamType.unary,
    econaservicessitetagv1sync_user_tag.SyncUserTagRequest.new,
    econaservicessitetagv1sync_user_tag.SyncUserTagResponse.new,
  );

  /// GetTagCategories:タグカテゴリを取得
  static const getTagCategories = connect.Spec(
    '/$name/GetTagCategories',
    connect.StreamType.unary,
    econaservicessitetagv1get_tag_categories.GetTagCategoriesRequest.new,
    econaservicessitetagv1get_tag_categories.GetTagCategoriesResponse.new,
  );

  /// GetTags:タグを取得
  static const getTags = connect.Spec(
    '/$name/GetTags',
    connect.StreamType.unary,
    econaservicessitetagv1get_tags.GetTagsRequest.new,
    econaservicessitetagv1get_tags.GetTagsResponse.new,
  );

  /// GetUserTags:ユーザーのタグを取得
  static const getUserTags = connect.Spec(
    '/$name/GetUserTags',
    connect.StreamType.unary,
    econaservicessitetagv1get_user_tags.GetUserTagsRequest.new,
    econaservicessitetagv1get_user_tags.GetUserTagsResponse.new,
  );

  /// GetCommonTags:2ユーザー間の共通タグを取得
  static const getCommonTags = connect.Spec(
    '/$name/GetCommonTags',
    connect.StreamType.unary,
    econaservicessitetagv1get_common_tags.GetCommonTagsRequest.new,
    econaservicessitetagv1get_common_tags.GetCommonTagsResponse.new,
  );
}
