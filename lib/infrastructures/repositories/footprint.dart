import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/footprint/v1/get_footprints.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/footprint/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/i_footprint_repository.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'footprint.g.dart';

/// 足あと関連のRepository実装クラス
class FootprintRepository implements IFootprintRepository {
  FootprintRepository(this._apiClient) {
    _client = _apiClient.createClient(FootprintServiceClient.new);
  }

  final ApiClient _apiClient;
  late final FootprintServiceClient _client;

  @override
  Future<GetFootprintsResponse> getFootprints(
      GetFootprintsRequest request) async {
    try {
      final result = await _apiClient.call<GetFootprintsResponse>(
        client: _client,
        method: ApiMethodUnary.getFootprints,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get footprints: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get footprints: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get footprints: $e');
    }
  }
}

@riverpod
FootprintRepository footprintRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return FootprintRepository(apiClient);
}
