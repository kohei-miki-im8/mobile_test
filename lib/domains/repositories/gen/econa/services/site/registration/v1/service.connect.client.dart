//
//  Generated code. Do not modify.
//  source: econa/services/site/registration/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_registration_step_log.pb.dart" as econaservicessiteregistrationv1create_registration_step_log;
import "service.connect.spec.dart" as specs;
import "get_latest_registration_step.pb.dart" as econaservicessiteregistrationv1get_latest_registration_step;

/// 登録ステップサービス
extension type RegistrationServiceClient (connect.Transport _transport) {
  /// CreateRegistrationStepLog:登録ステップログ作成
  Future<econaservicessiteregistrationv1create_registration_step_log.CreateRegistrationStepLogResponse> createRegistrationStepLog(
    econaservicessiteregistrationv1create_registration_step_log.CreateRegistrationStepLogRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.RegistrationService.createRegistrationStepLog,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetLatestRegistrationStep:最新の登録ステップ取得
  Future<econaservicessiteregistrationv1get_latest_registration_step.GetLatestRegistrationStepResponse> getLatestRegistrationStep(
    econaservicessiteregistrationv1get_latest_registration_step.GetLatestRegistrationStepRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.RegistrationService.getLatestRegistrationStep,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
