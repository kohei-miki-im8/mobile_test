//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_user_tag.pb.dart" as econaservicessitetagv1create_user_tag;
import "service.connect.spec.dart" as specs;
import "delete_user_tag.pb.dart" as econaservicessitetagv1delete_user_tag;
import "sync_user_tag.pb.dart" as econaservicessitetagv1sync_user_tag;
import "get_tag_categories.pb.dart" as econaservicessitetagv1get_tag_categories;
import "get_tags.pb.dart" as econaservicessitetagv1get_tags;
import "get_user_tags.pb.dart" as econaservicessitetagv1get_user_tags;
import "get_common_tags.pb.dart" as econaservicessitetagv1get_common_tags;

/// タグ機能を提供するサービスです。
extension type TagServiceClient (connect.Transport _transport) {
  /// CreateUserTag:ユーザーのタグを作成
  /// DEPRECATED: SyncUserTagを使用してください
@deprecated
  Future<econaservicessitetagv1create_user_tag.CreateUserTagResponse> createUserTag(
    econaservicessitetagv1create_user_tag.CreateUserTagRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.TagService.createUserTag,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// DeleteUserTag:ユーザーのタグを削除
  /// DEPRECATED: SyncUserTagを使用してください
@deprecated
  Future<econaservicessitetagv1delete_user_tag.DeleteUserTagResponse> deleteUserTag(
    econaservicessitetagv1delete_user_tag.DeleteUserTagRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.TagService.deleteUserTag,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// SyncUserTag:ユーザーのタグを同期（追加/削除）
  /// 冪等な操作：同一リクエストを複数回送信しても結果は一貫する
  Future<econaservicessitetagv1sync_user_tag.SyncUserTagResponse> syncUserTag(
    econaservicessitetagv1sync_user_tag.SyncUserTagRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.TagService.syncUserTag,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetTagCategories:タグカテゴリを取得
  Future<econaservicessitetagv1get_tag_categories.GetTagCategoriesResponse> getTagCategories(
    econaservicessitetagv1get_tag_categories.GetTagCategoriesRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.TagService.getTagCategories,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetTags:タグを取得
  Future<econaservicessitetagv1get_tags.GetTagsResponse> getTags(
    econaservicessitetagv1get_tags.GetTagsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.TagService.getTags,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetUserTags:ユーザーのタグを取得
  Future<econaservicessitetagv1get_user_tags.GetUserTagsResponse> getUserTags(
    econaservicessitetagv1get_user_tags.GetUserTagsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.TagService.getUserTags,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetCommonTags:2ユーザー間の共通タグを取得
  Future<econaservicessitetagv1get_common_tags.GetCommonTagsResponse> getCommonTags(
    econaservicessitetagv1get_common_tags.GetCommonTagsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.TagService.getCommonTags,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
