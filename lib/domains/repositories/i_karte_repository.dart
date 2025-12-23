import 'package:econa_mobile_app/domains/entities/karte.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/karte/v1/get_karte.pb.dart';

/// カルテ関連のRepository Interface
abstract class IKarteRepository {
  /// カルテ取得
  Future<Karte> getKarte(GetKarteRequest request);
}
