import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/get_hidden_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/update_user_hide.pb.dart';
import 'package:econa_mobile_app/domains/repositories/i_hide_repository.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hide.g.dart';

class HideRepository implements IHideRepository {
  HideRepository(this._apiClient) {
    _client = _apiClient.createClient(HideServiceClient.new);
  }

  final ApiClient _apiClient;
  late final HideServiceClient _client;

  @override
  Future<GetHiddenUsersResponse> getHiddenUsers(
      GetHiddenUsersRequest request) async {
    try {
      final result = await _apiClient.call<GetHiddenUsersResponse>(
        client: _client,
        method: ApiMethodUnary.getHiddenUsers,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get HiddenUsers: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get HiddenUsers: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get HiddenUsers: $e');
    }
  }

  @override
  Future<UpdateUserHideResponse> updateUserHide(
      UpdateUserHideRequest request) async {
    try {
      final result = await _apiClient.call<UpdateUserHideResponse>(
        client: _client,
        method: ApiMethodUnary.updateUserHide,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed update UserHide: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed update UserHide: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed update UserHide: ${e.toString()}');
    }
  }
}

@riverpod
IHideRepository hideRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return HideRepository(apiClient);
}
