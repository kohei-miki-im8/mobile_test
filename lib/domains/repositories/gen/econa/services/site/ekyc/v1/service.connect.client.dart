//
//  Generated code. Do not modify.
//  source: econa/services/site/ekyc/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_service_auth.pb.dart" as econaservicessiteekycv1get_service_auth;
import "service.connect.spec.dart" as specs;

/// eKYC機能を提供するサービスです。
extension type EKYCServiceClient (connect.Transport _transport) {
  /// GetServiceAuth:eKYC顔認証サービスにアクセスするためのJWTトークンを発行します。
  Future<econaservicessiteekycv1get_service_auth.GetServiceAuthResponse> getServiceAuth(
    econaservicessiteekycv1get_service_auth.GetServiceAuthRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.EKYCService.getServiceAuth,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
