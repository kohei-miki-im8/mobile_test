//
//  Generated code. Do not modify.
//  source: econa/services/site/karte/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_karte.pb.dart" as econaservicessitekartev1get_karte;
import "service.connect.spec.dart" as specs;

/// カルテ機能を提供するサービスです。
extension type KarteServiceClient (connect.Transport _transport) {
  /// GetKarte:カルテを取得します。
  Future<econaservicessitekartev1get_karte.GetKarteResponse> getKarte(
    econaservicessitekartev1get_karte.GetKarteRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.KarteService.getKarte,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
