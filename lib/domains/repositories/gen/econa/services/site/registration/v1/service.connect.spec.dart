//
//  Generated code. Do not modify.
//  source: econa/services/site/registration/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_registration_step_log.pb.dart" as econaservicessiteregistrationv1create_registration_step_log;
import "get_latest_registration_step.pb.dart" as econaservicessiteregistrationv1get_latest_registration_step;

/// 登録ステップサービス
abstract final class RegistrationService {
  /// Fully-qualified name of the RegistrationService service.
  static const name = 'econa.services.site.registration.v1.RegistrationService';

  /// CreateRegistrationStepLog:登録ステップログ作成
  static const createRegistrationStepLog = connect.Spec(
    '/$name/CreateRegistrationStepLog',
    connect.StreamType.unary,
    econaservicessiteregistrationv1create_registration_step_log.CreateRegistrationStepLogRequest.new,
    econaservicessiteregistrationv1create_registration_step_log.CreateRegistrationStepLogResponse.new,
  );

  /// GetLatestRegistrationStep:最新の登録ステップ取得
  static const getLatestRegistrationStep = connect.Spec(
    '/$name/GetLatestRegistrationStep',
    connect.StreamType.unary,
    econaservicessiteregistrationv1get_latest_registration_step.GetLatestRegistrationStepRequest.new,
    econaservicessiteregistrationv1get_latest_registration_step.GetLatestRegistrationStepResponse.new,
  );
}
