//
//  Generated code. Do not modify.
//  source: econa/services/site/footprint/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_footprints.pb.dart" as econaservicessitefootprintv1get_footprints;
import "service.connect.spec.dart" as specs;

/// 足跡機能を提供するサービス
extension type FootprintServiceClient (connect.Transport _transport) {
  /// GetFootprints: 足跡ユーザー一覧を取得する
  Future<econaservicessitefootprintv1get_footprints.GetFootprintsResponse> getFootprints(
    econaservicessitefootprintv1get_footprints.GetFootprintsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.FootprintService.getFootprints,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
