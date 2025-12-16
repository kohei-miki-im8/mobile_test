import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/create_registration_step_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/get_latest_registration_step.pb.dart';

/// 登録関連のRepository Interface
abstract class IRegistrationRepository {
  /// 登録ステップログ作成
  Future<CreateRegistrationStepLogResponse> createRegistrationStepLog(CreateRegistrationStepLogRequest request);
  
  /// 最新の登録ステップ取得
  Future<GetLatestRegistrationStepResponse> getLatestRegistrationStep(GetLatestRegistrationStepRequest request);
} 