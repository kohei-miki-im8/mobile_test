//
//  Generated code. Do not modify.
//  source: econa/services/site/advice/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_approach_analysis.pb.dart" as econaservicessiteadvicev1get_approach_analysis;
import "service.connect.spec.dart" as specs;
import "get_ideal.pb.dart" as econaservicessiteadvicev1get_ideal;

/// アドバイス機能を提供するサービスです。
extension type AdviceServiceClient (connect.Transport _transport) {
  /// GetApproachAnalysis:「アプローチ分析」を取得します。
  Future<econaservicessiteadvicev1get_approach_analysis.GetApproachAnalysisResponse> getApproachAnalysis(
    econaservicessiteadvicev1get_approach_analysis.GetApproachAnalysisRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.AdviceService.getApproachAnalysis,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetIdeals:「理想について」を取得します。
  Future<econaservicessiteadvicev1get_ideal.GetIdealResponse> getIdeal(
    econaservicessiteadvicev1get_ideal.GetIdealRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.AdviceService.getIdeal,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
