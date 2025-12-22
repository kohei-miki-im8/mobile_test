//
//  Generated code. Do not modify.
//  source: econa/services/site/public/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_server_info.pb.dart" as econaservicessitepublicv1get_server_info;

/// 公開機能を提供するサービスです。
abstract final class PublicService {
  /// Fully-qualified name of the PublicService service.
  static const name = 'econa.services.site.public.v1.PublicService';

  /// GetServerInfo:サーバー情報を取得します。
  static const getServerInfo = connect.Spec(
    '/$name/GetServerInfo',
    connect.StreamType.unary,
    econaservicessitepublicv1get_server_info.GetServerInfoRequest.new,
    econaservicessitepublicv1get_server_info.GetServerInfoResponse.new,
  );
}
