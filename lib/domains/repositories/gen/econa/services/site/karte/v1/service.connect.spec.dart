//
//  Generated code. Do not modify.
//  source: econa/services/site/karte/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_karte.pb.dart" as econaservicessitekartev1get_karte;

/// カルテ機能を提供するサービスです。
abstract final class KarteService {
  /// Fully-qualified name of the KarteService service.
  static const name = 'econa.services.site.karte.v1.KarteService';

  /// GetKarte:カルテを取得します。
  static const getKarte = connect.Spec(
    '/$name/GetKarte',
    connect.StreamType.unary,
    econaservicessitekartev1get_karte.GetKarteRequest.new,
    econaservicessitekartev1get_karte.GetKarteResponse.new,
  );
}
