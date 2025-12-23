//
//  Generated code. Do not modify.
//  source: econa/services/site/master/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_regions.pb.dart" as econaservicessitemasterv1get_regions;
import "service.connect.spec.dart" as specs;

/// マスター機能（サイトは参照のみ）を提供するサービスです。
extension type MasterServiceClient (connect.Transport _transport) {
  /// GetRegions:リージョン一覧を取得します。
  Future<econaservicessitemasterv1get_regions.GetRegionsResponse> getRegions(
    econaservicessitemasterv1get_regions.GetRegionsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.MasterService.getRegions,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
