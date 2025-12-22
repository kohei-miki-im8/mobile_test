//
//  Generated code. Do not modify.
//  source: econa/services/site/footprint/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_footprints.pb.dart" as econaservicessitefootprintv1get_footprints;

/// 足跡機能を提供するサービス
abstract final class FootprintService {
  /// Fully-qualified name of the FootprintService service.
  static const name = 'econa.services.site.footprint.v1.FootprintService';

  /// GetFootprints: 足跡ユーザー一覧を取得する
  static const getFootprints = connect.Spec(
    '/$name/GetFootprints',
    connect.StreamType.unary,
    econaservicessitefootprintv1get_footprints.GetFootprintsRequest.new,
    econaservicessitefootprintv1get_footprints.GetFootprintsResponse.new,
  );
}
