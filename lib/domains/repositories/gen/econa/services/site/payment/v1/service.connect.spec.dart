//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_payment.pb.dart" as econaservicessitepaymentv1create_payment;
import "get_product_catalogs.pb.dart" as econaservicessitepaymentv1get_product_catalogs;
import "get_user_subscriptions.pb.dart" as econaservicessitepaymentv1get_user_subscriptions;
import "create_checkout_session.pb.dart" as econaservicessitepaymentv1create_checkout_session;
import "create_billing_portal_session.pb.dart" as econaservicessitepaymentv1create_billing_portal_session;
import "restore_subscriptions.pb.dart" as econaservicessitepaymentv1restore_subscriptions;

/// Payment機能を提供するサービスです。
abstract final class PaymentService {
  /// Fully-qualified name of the PaymentService service.
  static const name = 'econa.services.site.payment.v1.PaymentService';

  /// CreatePayment:支払いを作成
  static const createPayment = connect.Spec(
    '/$name/CreatePayment',
    connect.StreamType.unary,
    econaservicessitepaymentv1create_payment.CreatePaymentRequest.new,
    econaservicessitepaymentv1create_payment.CreatePaymentResponse.new,
  );

  /// GetProductCatalog:商品カタログを取得
  static const getProductCatalogs = connect.Spec(
    '/$name/GetProductCatalogs',
    connect.StreamType.unary,
    econaservicessitepaymentv1get_product_catalogs.GetProductCatalogsRequest.new,
    econaservicessitepaymentv1get_product_catalogs.GetProductCatalogsResponse.new,
  );

  /// GetUserSubscriptions:契約中のサブスクリプションを取得
  static const getUserSubscriptions = connect.Spec(
    '/$name/GetUserSubscriptions',
    connect.StreamType.unary,
    econaservicessitepaymentv1get_user_subscriptions.GetUserSubscriptionsRequest.new,
    econaservicessitepaymentv1get_user_subscriptions.GetUserSubscriptionsResponse.new,
  );

  /// CreateCheckoutSession:Stripe Checkoutセッションを作成 (Web決済用)
  static const createCheckoutSession = connect.Spec(
    '/$name/CreateCheckoutSession',
    connect.StreamType.unary,
    econaservicessitepaymentv1create_checkout_session.CreateCheckoutSessionRequest.new,
    econaservicessitepaymentv1create_checkout_session.CreateCheckoutSessionResponse.new,
  );

  /// CompleteCheckout:Checkoutセッション完了確認
  static const completeCheckout = connect.Spec(
    '/$name/CompleteCheckout',
    connect.StreamType.unary,
    econaservicessitepaymentv1create_checkout_session.CompleteCheckoutRequest.new,
    econaservicessitepaymentv1create_checkout_session.CompleteCheckoutResponse.new,
  );

  /// CreateBillingPortalSession: Stripe Customer Portal セッション作成（契約管理用）
  static const createBillingPortalSession = connect.Spec(
    '/$name/CreateBillingPortalSession',
    connect.StreamType.unary,
    econaservicessitepaymentv1create_billing_portal_session.CreateBillingPortalSessionRequest.new,
    econaservicessitepaymentv1create_billing_portal_session.CreateBillingPortalSessionResponse.new,
  );

  /// RestoreSubscriptions:RevenueCatのサブスクリプションを復元
  static const restoreSubscriptions = connect.Spec(
    '/$name/RestoreSubscriptions',
    connect.StreamType.unary,
    econaservicessitepaymentv1restore_subscriptions.RestoreSubscriptionsRequest.new,
    econaservicessitepaymentv1restore_subscriptions.RestoreSubscriptionsResponse.new,
  );
}
