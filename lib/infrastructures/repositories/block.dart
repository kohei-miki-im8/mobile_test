import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/get_blocked_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/update_user_block.pb.dart';
import 'package:econa_mobile_app/domains/repositories/i_block_repository.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'block.g.dart';

class BlockRepository implements IBlockRepository {
  BlockRepository(this._apiClient) {
    _client = _apiClient.createClient(BlockServiceClient.new);
  }

  final ApiClient _apiClient;
  late final BlockServiceClient _client;

  @override
  Future<GetBlockedUsersResponse> getBlockedUsers(GetBlockedUsersRequest request) async {
    try {
      final result = await _apiClient.call<GetBlockedUsersResponse>(
        client: _client,
        method: ApiMethodUnary.getBlockedUsers,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get BlockedUsers: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get BlockedUsers: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get BlockedUsers: ${e.toString()}');
    }
  }

  @override
  Future<UpdateUserBlockResponse> updateUserBlock(UpdateUserBlockRequest request) async {
    try {
      final result = await _apiClient.call<UpdateUserBlockResponse>(
        client: _client,
        method: ApiMethodUnary.updateUserBlock,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed update UserBlock: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed update UserBlock: response data is null'));
    } on Exception {
      rethrow;  // Exceptionはそのまま伝播
    }  catch (e) {
      throw Exception('failed update UserBlock: ${e.toString()}');
    }
  }
}

@riverpod
IBlockRepository blockRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return BlockRepository(apiClient);
}
