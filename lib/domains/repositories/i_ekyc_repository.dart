import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/ekyc/v1/get_service_auth.pb.dart';

/// ekyc関連のRepository Interface
abstract class IEkycRepository {
  /// アクセストークンを取得
  Future<GetServiceAuthResponse> getServiceAuth(GetServiceAuthRequest request);
}