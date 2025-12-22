//
//  Generated code. Do not modify.
//  source: econa/services/site/public/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_server_info.pb.dart" as econaservicessitepublicv1get_server_info;
import "service.connect.spec.dart" as specs;

/// 公開機能を提供するサービスです。
extension type PublicServiceClient (connect.Transport _transport) {
  /// GetServerInfo:サーバー情報を取得します。
  Future<econaservicessitepublicv1get_server_info.GetServerInfoResponse> getServerInfo(
    econaservicessitepublicv1get_server_info.GetServerInfoRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PublicService.getServerInfo,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
