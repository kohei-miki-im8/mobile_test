import 'dart:async';

import 'package:econa_mobile_app/domains/entities/tag.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/create_user_tag.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/delete_user_tag.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_tag_categories.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_tags.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_user_tags.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/tag.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/tag_category.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user_tag.pb.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag.g.dart';

/// インスタンスを提供
class TagRepository {
  TagRepository(this._apiClient) {
    _client = _apiClient.createClient(TagServiceClient.new);
  }

  final ApiClient _apiClient;
  late final TagServiceClient _client;

  // ユーザータグ作成
  Future<void> createUserTag(CreateUserTagRequest request) async {
    try {
      final result = await _apiClient.call<CreateUserTagResponse>(
        client: _client,
        method: ApiMethodUnary.createUserTag,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed create UserTag: ${result.error}');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create UserTag: $e');
    }
  }

  // ユーザータグ削除
  Future<void> deleteUserTag(DeleteUserTagRequest request) async {
    try {
      final result = await _apiClient.call<DeleteUserTagResponse>(
        client: _client,
        method: ApiMethodUnary.deleteUserTag,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed delete UserTag: ${result.error}');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed delete UserTag: $e');
    }
  }

  // タグカテゴリー取得
  Future<GetTagCategoriesResponse> getTagCategories(
    GetTagCategoriesRequest request,
  ) async {
    try {
      final result = await _apiClient.call<GetTagCategoriesResponse>(
        client: _client,
        method: ApiMethodUnary.getTagCategories,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get TagCategories: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get TagCategories: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get TagCategories: $e');
    }
  }

  // タグ群取得
  Future<GetTagsResponse> getTags(GetTagsRequest request) async {
    try {
      final result = await _apiClient.call<GetTagsResponse>(
        client: _client,
        method: ApiMethodUnary.getTags,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get Tags: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get Tags: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get Tags: $e');
    }
  }

  // ユーザータグ群取得
  Future<GetUserTagsResponse> getUserTags(GetUserTagsRequest request) async {
    try {
      final result = await _apiClient.call<GetUserTagsResponse>(
        client: _client,
        method: ApiMethodUnary.getUserTags,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get UserTags: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get UserTags: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get UserTags: $e');
    }
  }
}

@riverpod
TagRepository tagRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return TagRepository(apiClient);
}
