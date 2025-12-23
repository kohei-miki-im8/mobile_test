import 'package:econa_mobile_app/domains/entities/karte.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/karte/v1/get_karte.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/karte/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/i_karte_repository.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'karte.g.dart';

class KarteRepository implements IKarteRepository {
  KarteRepository(this._apiClient) {
    _karteClient = _apiClient.createClient(KarteServiceClient.new);
  }

  final ApiClient _apiClient;
  late final KarteServiceClient _karteClient;

  // カルテ取得
  @override
  Future<Karte> getKarte(GetKarteRequest request) async {
    try {
      final result = await _apiClient.call<GetKarteResponse>(
        client: _karteClient,
        method: ApiMethodUnary.getKarte,
        request: request,
      );
      if (result.isError) {
        throw Exception('API call failed: ${result.error}');
      }
      if (result.data == null) {
        throw Exception('API response data is null');
      }
      return Karte.fromProto(result.data!);
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('\n$e');
    }
  }
}

@riverpod
KarteRepository karteRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return KarteRepository(apiClient);
}
