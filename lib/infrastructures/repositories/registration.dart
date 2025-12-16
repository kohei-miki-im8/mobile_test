import 'dart:async';
import 'package:econa_mobile_app/domains/repositories/i_registration_repository.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/create_registration_step_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/get_latest_registration_step.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/service.connect.client.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registration.g.dart';

/// 登録関連のRepository実装クラス
class RegistrationRepository implements IRegistrationRepository {
  RegistrationRepository(this._apiClient) {
    _client = _apiClient.createClient(RegistrationServiceClient.new);
  }

  final ApiClient _apiClient;
  late final RegistrationServiceClient _client;

  @override
  Future<CreateRegistrationStepLogResponse> createRegistrationStepLog(CreateRegistrationStepLogRequest request) async {
    try {
      final result = await _apiClient.call<CreateRegistrationStepLogResponse>(
        client: _client,
        method: ApiMethodUnary.createRegistrationStepLog,
        request: request,
      );
      if(result.error != null) {
        throw Exception('failed create RegistrationStepLog: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create RegistrationStepLog: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create RegistrationStepLog: $e');
    }
  }

  @override
  Future<GetLatestRegistrationStepResponse> getLatestRegistrationStep(GetLatestRegistrationStepRequest request) async {
    try {
      final result = await _apiClient.call<GetLatestRegistrationStepResponse>(
        client: _client,
        method: ApiMethodUnary.getLatestRegistrationStep,
        request: request,
      );
      if(result.error != null) {
        throw Exception('failed get LatestRegistrationStep: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get LatestRegistrationStep: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get LatestRegistrationStep: $e');
    }
  }
}

/// RegistrationRepositoryの実装インスタンスを提供
@riverpod
IRegistrationRepository registrationRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return RegistrationRepository(apiClient);
}
