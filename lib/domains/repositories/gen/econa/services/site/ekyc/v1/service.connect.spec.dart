//
//  Generated code. Do not modify.
//  source: econa/services/site/ekyc/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_service_auth.pb.dart" as econaservicessiteekycv1get_service_auth;

/// eKYC機能を提供するサービスです。
abstract final class EKYCService {
  /// Fully-qualified name of the EKYCService service.
  static const name = 'econa.services.site.ekyc.v1.EKYCService';

  /// GetServiceAuth:eKYC顔認証サービスにアクセスするためのJWTトークンを発行します。
  static const getServiceAuth = connect.Spec(
    '/$name/GetServiceAuth',
    connect.StreamType.unary,
    econaservicessiteekycv1get_service_auth.GetServiceAuthRequest.new,
    econaservicessiteekycv1get_service_auth.GetServiceAuthResponse.new,
  );
}
