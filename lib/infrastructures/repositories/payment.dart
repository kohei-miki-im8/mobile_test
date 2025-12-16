import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/payment/v1/restore_subscriptions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/payment/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/i_payment_repository.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment.g.dart';

class PaymentRepository implements IPaymentRepository {
  PaymentRepository(this._apiClient) {
    _paymentClient = _apiClient.createClient(PaymentServiceClient.new);
  }

  final ApiClient _apiClient;
  late final PaymentServiceClient _paymentClient;

  // 購入履歴復元
  @override
  Future<RestoreSubscriptionsResponse> restoreSubscriptions(
      RestoreSubscriptionsRequest request,
      ) async {
    try {
      final result = await _apiClient.call<RestoreSubscriptionsResponse>(
        client: _paymentClient,
        method: ApiMethodUnary.restoreSubscriptions,
        request: request,
      );
      if (result.isError) {
        throw Exception('failed to restore subscriptions: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed to restore subscriptions: response data is null'));
    } catch (e) {
      throw Exception('failed to restore subscriptions: \n$e');
    }
  }
}

@riverpod
PaymentRepository paymentRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return PaymentRepository(apiClient);
}
