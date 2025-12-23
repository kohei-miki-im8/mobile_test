//
//  Generated code. Do not modify.
//  source: econa/services/site/master/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_regions.pb.dart" as econaservicessitemasterv1get_regions;

/// マスター機能（サイトは参照のみ）を提供するサービスです。
abstract final class MasterService {
  /// Fully-qualified name of the MasterService service.
  static const name = 'econa.services.site.master.v1.MasterService';

  /// GetRegions:リージョン一覧を取得します。
  static const getRegions = connect.Spec(
    '/$name/GetRegions',
    connect.StreamType.unary,
    econaservicessitemasterv1get_regions.GetRegionsRequest.new,
    econaservicessitemasterv1get_regions.GetRegionsResponse.new,
  );
}
