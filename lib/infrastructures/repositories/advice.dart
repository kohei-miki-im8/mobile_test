import 'package:econa_mobile_app/domains/entities/approach_analysis.dart';
import 'package:econa_mobile_app/domains/entities/ideal.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/advice/v1/get_approach_analysis.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/advice/v1/get_ideal.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/advice/v1/service.connect.client.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'advice.g.dart';

class AdviceRepository {
  AdviceRepository(this._apiClient) {
    _adviceClient = _apiClient.createClient(AdviceServiceClient.new);
  }

  final ApiClient _apiClient;
  late final AdviceServiceClient _adviceClient;

  // 理想について取得
  Future<IdealAdvice> getIdeal(GetIdealRequest request) async {
    try {
      final result = await _apiClient.call<GetIdealResponse>(
        client: _adviceClient,
        method: ApiMethodUnary.getIdeal,
        request: request,
      );
      if (result.isError) {
        throw Exception('API call failed: ${result.error}');
      }
      if (result.data == null) {
        throw Exception('API response data is null');
      }
      return IdealAdvice.fromProto(result.data!);
    } catch (e) {
      throw Exception('\n$e');
    }
  }

  // アプローチ分析取得
  Future<ApproachAnalysis> getApproachAnalysis(
    GetApproachAnalysisRequest request,
  ) async {
    try {
      final result = await _apiClient.call<GetApproachAnalysisResponse>(
        client: _adviceClient,
        method: ApiMethodUnary.getApproachAnalysis,
        request: request,
      );
      if (result.isError) {
        throw Exception('API call failed: ${result.error}');
      }
      if (result.data == null) {
        throw Exception('API response data is null');
      }
      return ApproachAnalysis.fromProto(result.data!);
    } catch (e) {
      throw Exception('\n$e');
    }
  }
}

@riverpod
AdviceRepository adviceRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AdviceRepository(apiClient);
}
