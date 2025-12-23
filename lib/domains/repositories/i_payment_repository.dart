import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/payment/v1/restore_subscriptions.pb.dart';

/// 決済関連のRepository Interface
abstract class IPaymentRepository {
  /// ブロックユーザー一覧取得
  Future<RestoreSubscriptionsResponse> restoreSubscriptions(RestoreSubscriptionsRequest request);
}
