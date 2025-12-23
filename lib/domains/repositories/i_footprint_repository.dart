import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/footprint/v1/get_footprints.pb.dart';

/// 足あと関連のRepository Interface
abstract class IFootprintRepository {
  /// 足あとを取得
  Future<GetFootprintsResponse> getFootprints(GetFootprintsRequest request);
}


