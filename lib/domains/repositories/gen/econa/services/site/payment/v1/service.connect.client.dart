//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_payment.pb.dart" as econaservicessitepaymentv1create_payment;
import "service.connect.spec.dart" as specs;
import "get_product_catalogs.pb.dart" as econaservicessitepaymentv1get_product_catalogs;
import "get_user_subscriptions.pb.dart" as econaservicessitepaymentv1get_user_subscriptions;
import "create_checkout_session.pb.dart" as econaservicessitepaymentv1create_checkout_session;
import "create_billing_portal_session.pb.dart" as econaservicessitepaymentv1create_billing_portal_session;
import "restore_subscriptions.pb.dart" as econaservicessitepaymentv1restore_subscriptions;

/// Payment機能を提供するサービスです。
extension type PaymentServiceClient (connect.Transport _transport) {
  /// CreatePayment:支払いを作成
  Future<econaservicessitepaymentv1create_payment.CreatePaymentResponse> createPayment(
    econaservicessitepaymentv1create_payment.CreatePaymentRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PaymentService.createPayment,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetProductCatalog:商品カタログを取得
  Future<econaservicessitepaymentv1get_product_catalogs.GetProductCatalogsResponse> getProductCatalogs(
    econaservicessitepaymentv1get_product_catalogs.GetProductCatalogsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PaymentService.getProductCatalogs,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetUserSubscriptions:契約中のサブスクリプションを取得
  Future<econaservicessitepaymentv1get_user_subscriptions.GetUserSubscriptionsResponse> getUserSubscriptions(
    econaservicessitepaymentv1get_user_subscriptions.GetUserSubscriptionsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PaymentService.getUserSubscriptions,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// CreateCheckoutSession:Stripe Checkoutセッションを作成 (Web決済用)
  Future<econaservicessitepaymentv1create_checkout_session.CreateCheckoutSessionResponse> createCheckoutSession(
    econaservicessitepaymentv1create_checkout_session.CreateCheckoutSessionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PaymentService.createCheckoutSession,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// CompleteCheckout:Checkoutセッション完了確認
  Future<econaservicessitepaymentv1create_checkout_session.CompleteCheckoutResponse> completeCheckout(
    econaservicessitepaymentv1create_checkout_session.CompleteCheckoutRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PaymentService.completeCheckout,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// CreateBillingPortalSession: Stripe Customer Portal セッション作成（契約管理用）
  Future<econaservicessitepaymentv1create_billing_portal_session.CreateBillingPortalSessionResponse> createBillingPortalSession(
    econaservicessitepaymentv1create_billing_portal_session.CreateBillingPortalSessionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PaymentService.createBillingPortalSession,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// RestoreSubscriptions:RevenueCatのサブスクリプションを復元
  Future<econaservicessitepaymentv1restore_subscriptions.RestoreSubscriptionsResponse> restoreSubscriptions(
    econaservicessitepaymentv1restore_subscriptions.RestoreSubscriptionsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PaymentService.restoreSubscriptions,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
