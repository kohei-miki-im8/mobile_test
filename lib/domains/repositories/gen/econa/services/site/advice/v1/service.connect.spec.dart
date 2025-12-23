//
//  Generated code. Do not modify.
//  source: econa/services/site/advice/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_approach_analysis.pb.dart" as econaservicessiteadvicev1get_approach_analysis;
import "get_ideal.pb.dart" as econaservicessiteadvicev1get_ideal;

/// アドバイス機能を提供するサービスです。
abstract final class AdviceService {
  /// Fully-qualified name of the AdviceService service.
  static const name = 'econa.services.site.advice.v1.AdviceService';

  /// GetApproachAnalysis:「アプローチ分析」を取得します。
  static const getApproachAnalysis = connect.Spec(
    '/$name/GetApproachAnalysis',
    connect.StreamType.unary,
    econaservicessiteadvicev1get_approach_analysis.GetApproachAnalysisRequest.new,
    econaservicessiteadvicev1get_approach_analysis.GetApproachAnalysisResponse.new,
  );

  /// GetIdeals:「理想について」を取得します。
  static const getIdeal = connect.Spec(
    '/$name/GetIdeal',
    connect.StreamType.unary,
    econaservicessiteadvicev1get_ideal.GetIdealRequest.new,
    econaservicessiteadvicev1get_ideal.GetIdealResponse.new,
  );
}
