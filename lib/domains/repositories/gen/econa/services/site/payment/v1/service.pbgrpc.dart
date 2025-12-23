//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'create_billing_portal_session.pb.dart' as $55;
import 'create_checkout_session.pb.dart' as $54;
import 'create_payment.pb.dart' as $51;
import 'get_product_catalogs.pb.dart' as $52;
import 'get_user_subscriptions.pb.dart' as $53;
import 'restore_subscriptions.pb.dart' as $56;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.payment.v1.PaymentService')
class PaymentServiceClient extends $grpc.Client {
  static final _$createPayment = $grpc.ClientMethod<$51.CreatePaymentRequest, $51.CreatePaymentResponse>(
      '/econa.services.site.payment.v1.PaymentService/CreatePayment',
      ($51.CreatePaymentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $51.CreatePaymentResponse.fromBuffer(value));
  static final _$getProductCatalogs = $grpc.ClientMethod<$52.GetProductCatalogsRequest, $52.GetProductCatalogsResponse>(
      '/econa.services.site.payment.v1.PaymentService/GetProductCatalogs',
      ($52.GetProductCatalogsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $52.GetProductCatalogsResponse.fromBuffer(value));
  static final _$getUserSubscriptions = $grpc.ClientMethod<$53.GetUserSubscriptionsRequest, $53.GetUserSubscriptionsResponse>(
      '/econa.services.site.payment.v1.PaymentService/GetUserSubscriptions',
      ($53.GetUserSubscriptionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $53.GetUserSubscriptionsResponse.fromBuffer(value));
  static final _$createCheckoutSession = $grpc.ClientMethod<$54.CreateCheckoutSessionRequest, $54.CreateCheckoutSessionResponse>(
      '/econa.services.site.payment.v1.PaymentService/CreateCheckoutSession',
      ($54.CreateCheckoutSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $54.CreateCheckoutSessionResponse.fromBuffer(value));
  static final _$completeCheckout = $grpc.ClientMethod<$54.CompleteCheckoutRequest, $54.CompleteCheckoutResponse>(
      '/econa.services.site.payment.v1.PaymentService/CompleteCheckout',
      ($54.CompleteCheckoutRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $54.CompleteCheckoutResponse.fromBuffer(value));
  static final _$createBillingPortalSession = $grpc.ClientMethod<$55.CreateBillingPortalSessionRequest, $55.CreateBillingPortalSessionResponse>(
      '/econa.services.site.payment.v1.PaymentService/CreateBillingPortalSession',
      ($55.CreateBillingPortalSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $55.CreateBillingPortalSessionResponse.fromBuffer(value));
  static final _$restoreSubscriptions = $grpc.ClientMethod<$56.RestoreSubscriptionsRequest, $56.RestoreSubscriptionsResponse>(
      '/econa.services.site.payment.v1.PaymentService/RestoreSubscriptions',
      ($56.RestoreSubscriptionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $56.RestoreSubscriptionsResponse.fromBuffer(value));

  PaymentServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$51.CreatePaymentResponse> createPayment($51.CreatePaymentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPayment, request, options: options);
  }

  $grpc.ResponseFuture<$52.GetProductCatalogsResponse> getProductCatalogs($52.GetProductCatalogsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProductCatalogs, request, options: options);
  }

  $grpc.ResponseFuture<$53.GetUserSubscriptionsResponse> getUserSubscriptions($53.GetUserSubscriptionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserSubscriptions, request, options: options);
  }

  $grpc.ResponseFuture<$54.CreateCheckoutSessionResponse> createCheckoutSession($54.CreateCheckoutSessionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createCheckoutSession, request, options: options);
  }

  $grpc.ResponseFuture<$54.CompleteCheckoutResponse> completeCheckout($54.CompleteCheckoutRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$completeCheckout, request, options: options);
  }

  $grpc.ResponseFuture<$55.CreateBillingPortalSessionResponse> createBillingPortalSession($55.CreateBillingPortalSessionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBillingPortalSession, request, options: options);
  }

  $grpc.ResponseFuture<$56.RestoreSubscriptionsResponse> restoreSubscriptions($56.RestoreSubscriptionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$restoreSubscriptions, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.payment.v1.PaymentService')
abstract class PaymentServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.payment.v1.PaymentService';

  PaymentServiceBase() {
    $addMethod($grpc.ServiceMethod<$51.CreatePaymentRequest, $51.CreatePaymentResponse>(
        'CreatePayment',
        createPayment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $51.CreatePaymentRequest.fromBuffer(value),
        ($51.CreatePaymentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$52.GetProductCatalogsRequest, $52.GetProductCatalogsResponse>(
        'GetProductCatalogs',
        getProductCatalogs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $52.GetProductCatalogsRequest.fromBuffer(value),
        ($52.GetProductCatalogsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$53.GetUserSubscriptionsRequest, $53.GetUserSubscriptionsResponse>(
        'GetUserSubscriptions',
        getUserSubscriptions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $53.GetUserSubscriptionsRequest.fromBuffer(value),
        ($53.GetUserSubscriptionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$54.CreateCheckoutSessionRequest, $54.CreateCheckoutSessionResponse>(
        'CreateCheckoutSession',
        createCheckoutSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $54.CreateCheckoutSessionRequest.fromBuffer(value),
        ($54.CreateCheckoutSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$54.CompleteCheckoutRequest, $54.CompleteCheckoutResponse>(
        'CompleteCheckout',
        completeCheckout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $54.CompleteCheckoutRequest.fromBuffer(value),
        ($54.CompleteCheckoutResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$55.CreateBillingPortalSessionRequest, $55.CreateBillingPortalSessionResponse>(
        'CreateBillingPortalSession',
        createBillingPortalSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $55.CreateBillingPortalSessionRequest.fromBuffer(value),
        ($55.CreateBillingPortalSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$56.RestoreSubscriptionsRequest, $56.RestoreSubscriptionsResponse>(
        'RestoreSubscriptions',
        restoreSubscriptions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $56.RestoreSubscriptionsRequest.fromBuffer(value),
        ($56.RestoreSubscriptionsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$51.CreatePaymentResponse> createPayment_Pre($grpc.ServiceCall call, $async.Future<$51.CreatePaymentRequest> request) async {
    return createPayment(call, await request);
  }

  $async.Future<$52.GetProductCatalogsResponse> getProductCatalogs_Pre($grpc.ServiceCall call, $async.Future<$52.GetProductCatalogsRequest> request) async {
    return getProductCatalogs(call, await request);
  }

  $async.Future<$53.GetUserSubscriptionsResponse> getUserSubscriptions_Pre($grpc.ServiceCall call, $async.Future<$53.GetUserSubscriptionsRequest> request) async {
    return getUserSubscriptions(call, await request);
  }

  $async.Future<$54.CreateCheckoutSessionResponse> createCheckoutSession_Pre($grpc.ServiceCall call, $async.Future<$54.CreateCheckoutSessionRequest> request) async {
    return createCheckoutSession(call, await request);
  }

  $async.Future<$54.CompleteCheckoutResponse> completeCheckout_Pre($grpc.ServiceCall call, $async.Future<$54.CompleteCheckoutRequest> request) async {
    return completeCheckout(call, await request);
  }

  $async.Future<$55.CreateBillingPortalSessionResponse> createBillingPortalSession_Pre($grpc.ServiceCall call, $async.Future<$55.CreateBillingPortalSessionRequest> request) async {
    return createBillingPortalSession(call, await request);
  }

  $async.Future<$56.RestoreSubscriptionsResponse> restoreSubscriptions_Pre($grpc.ServiceCall call, $async.Future<$56.RestoreSubscriptionsRequest> request) async {
    return restoreSubscriptions(call, await request);
  }

  $async.Future<$51.CreatePaymentResponse> createPayment($grpc.ServiceCall call, $51.CreatePaymentRequest request);
  $async.Future<$52.GetProductCatalogsResponse> getProductCatalogs($grpc.ServiceCall call, $52.GetProductCatalogsRequest request);
  $async.Future<$53.GetUserSubscriptionsResponse> getUserSubscriptions($grpc.ServiceCall call, $53.GetUserSubscriptionsRequest request);
  $async.Future<$54.CreateCheckoutSessionResponse> createCheckoutSession($grpc.ServiceCall call, $54.CreateCheckoutSessionRequest request);
  $async.Future<$54.CompleteCheckoutResponse> completeCheckout($grpc.ServiceCall call, $54.CompleteCheckoutRequest request);
  $async.Future<$55.CreateBillingPortalSessionResponse> createBillingPortalSession($grpc.ServiceCall call, $55.CreateBillingPortalSessionRequest request);
  $async.Future<$56.RestoreSubscriptionsResponse> restoreSubscriptions($grpc.ServiceCall call, $56.RestoreSubscriptionsRequest request);
}
