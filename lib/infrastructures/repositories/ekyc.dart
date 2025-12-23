import 'dart:io';

import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/ekyc/v1/get_service_auth.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/ekyc/v1/service.connect.client.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ekyc.g.dart';

/// EkycRepositoryのインスタンスを提供する
class EkycRepository {
  EkycRepository(this._apiClient) {
    _ekycClient = _apiClient.createClient(EKYCServiceClient.new);
  }

  final ApiClient _apiClient;
  late final EKYCServiceClient _ekycClient;

  /// ServiceAuth取得
  Future<GetServiceAuthResponse> getServiceAuth(GetServiceAuthRequest request) async {
    try {
      String userAgent = '';

      if(Platform.isIOS) {
        userAgent = 'iPhone';
      } else if(Platform.isAndroid) {
        userAgent = 'Android';
      }

      final additionalHeaders = <String, String>{
        'User-Agent': userAgent,
      };

      final result = await _apiClient.call<GetServiceAuthResponse>(
        client: _ekycClient,
        method: ApiMethodUnary.getServiceAuth,
        request: request,
        additionalHeaders: additionalHeaders,
      );

      if (result.error != null) {
        throw Exception('failed get ServiceAuth: ${result.error}');
      }

      return result.data ??
          (throw Exception('failed get ServiceAuth: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get ServiceAuth: $e');
    }
  }
}

/// EkycRepository
@riverpod
EkycRepository ekycRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return EkycRepository(apiClient);
}