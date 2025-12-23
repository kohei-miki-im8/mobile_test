//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/service.proto
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

import 'create_external_user.pb.dart' as $87;
import 'create_user_agreement_log.pb.dart' as $88;
import 'create_user_boost.pb.dart' as $89;
import 'enable_device_change_mode.pb.dart' as $90;
import 'exchange_matching_to_like.pb.dart' as $91;
import 'get_external_user.pb.dart' as $92;
import 'get_user_agreement_log.pb.dart' as $93;
import 'get_user_boost.pb.dart' as $94;
import 'get_user_inquiries.pb.dart' as $95;
import 'get_user_point_history.pb.dart' as $96;
import 'get_user_points.pb.dart' as $97;
import 'get_user_private_mode.pb.dart' as $98;
import 'get_user_settings.pb.dart' as $99;
import 'get_user_status.pb.dart' as $100;
import 'update_user_settings.pb.dart' as $101;
import 'update_user_status.pb.dart' as $102;
import 'upsert_user_private_mode.pb.dart' as $103;
import 'withdraw_user.pb.dart' as $104;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.user.v1.UserService')
class UserServiceClient extends $grpc.Client {
  static final _$createExternalUser = $grpc.ClientMethod<$87.CreateExternalUserRequest, $87.CreateExternalUserResponse>(
      '/econa.services.site.user.v1.UserService/CreateExternalUser',
      ($87.CreateExternalUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $87.CreateExternalUserResponse.fromBuffer(value));
  static final _$createUserAgreementLog = $grpc.ClientMethod<$88.CreateUserAgreementLogRequest, $88.CreateUserAgreementLogResponse>(
      '/econa.services.site.user.v1.UserService/CreateUserAgreementLog',
      ($88.CreateUserAgreementLogRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $88.CreateUserAgreementLogResponse.fromBuffer(value));
  static final _$createUserBoost = $grpc.ClientMethod<$89.CreateUserBoostRequest, $89.CreateUserBoostResponse>(
      '/econa.services.site.user.v1.UserService/CreateUserBoost',
      ($89.CreateUserBoostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $89.CreateUserBoostResponse.fromBuffer(value));
  static final _$enableDeviceChangeMode = $grpc.ClientMethod<$90.EnableDeviceChangeModeRequest, $90.EnableDeviceChangeModeResponse>(
      '/econa.services.site.user.v1.UserService/EnableDeviceChangeMode',
      ($90.EnableDeviceChangeModeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $90.EnableDeviceChangeModeResponse.fromBuffer(value));
  static final _$exchangeMatchingToLike = $grpc.ClientMethod<$91.ExchangeMatchingToLikeRequest, $91.ExchangeMatchingToLikeResponse>(
      '/econa.services.site.user.v1.UserService/ExchangeMatchingToLike',
      ($91.ExchangeMatchingToLikeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $91.ExchangeMatchingToLikeResponse.fromBuffer(value));
  static final _$getExternalUser = $grpc.ClientMethod<$92.GetExternalUserRequest, $92.GetExternalUserResponse>(
      '/econa.services.site.user.v1.UserService/GetExternalUser',
      ($92.GetExternalUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $92.GetExternalUserResponse.fromBuffer(value));
  static final _$getUserAgreementLog = $grpc.ClientMethod<$93.GetUserAgreementLogRequest, $93.GetUserAgreementLogResponse>(
      '/econa.services.site.user.v1.UserService/GetUserAgreementLog',
      ($93.GetUserAgreementLogRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $93.GetUserAgreementLogResponse.fromBuffer(value));
  static final _$getUserBoost = $grpc.ClientMethod<$94.GetUserBoostRequest, $94.GetUserBoostResponse>(
      '/econa.services.site.user.v1.UserService/GetUserBoost',
      ($94.GetUserBoostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $94.GetUserBoostResponse.fromBuffer(value));
  static final _$getUserInquiries = $grpc.ClientMethod<$95.GetUserInquiriesRequest, $95.GetUserInquiriesResponse>(
      '/econa.services.site.user.v1.UserService/GetUserInquiries',
      ($95.GetUserInquiriesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $95.GetUserInquiriesResponse.fromBuffer(value));
  static final _$getUserPointHistory = $grpc.ClientMethod<$96.GetUserPointHistoryRequest, $96.GetUserPointHistoryResponse>(
      '/econa.services.site.user.v1.UserService/GetUserPointHistory',
      ($96.GetUserPointHistoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $96.GetUserPointHistoryResponse.fromBuffer(value));
  static final _$getUserPoints = $grpc.ClientMethod<$97.GetUserPointsRequest, $97.GetUserPointsResponse>(
      '/econa.services.site.user.v1.UserService/GetUserPoints',
      ($97.GetUserPointsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $97.GetUserPointsResponse.fromBuffer(value));
  static final _$getUserPrivateMode = $grpc.ClientMethod<$98.GetUserPrivateModeRequest, $98.GetUserPrivateModeResponse>(
      '/econa.services.site.user.v1.UserService/GetUserPrivateMode',
      ($98.GetUserPrivateModeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $98.GetUserPrivateModeResponse.fromBuffer(value));
  static final _$getUserSettings = $grpc.ClientMethod<$99.GetUserSettingsRequest, $99.GetUserSettingsResponse>(
      '/econa.services.site.user.v1.UserService/GetUserSettings',
      ($99.GetUserSettingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $99.GetUserSettingsResponse.fromBuffer(value));
  static final _$getUserStatus = $grpc.ClientMethod<$100.GetUserStatusRequest, $100.GetUserStatusResponse>(
      '/econa.services.site.user.v1.UserService/GetUserStatus',
      ($100.GetUserStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $100.GetUserStatusResponse.fromBuffer(value));
  static final _$updateUserSettings = $grpc.ClientMethod<$101.UpdateUserSettingsRequest, $101.UpdateUserSettingsResponse>(
      '/econa.services.site.user.v1.UserService/UpdateUserSettings',
      ($101.UpdateUserSettingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $101.UpdateUserSettingsResponse.fromBuffer(value));
  static final _$updateUserStatus = $grpc.ClientMethod<$102.UpdateUserStatusRequest, $102.UpdateUserStatusResponse>(
      '/econa.services.site.user.v1.UserService/UpdateUserStatus',
      ($102.UpdateUserStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $102.UpdateUserStatusResponse.fromBuffer(value));
  static final _$upsertUserPrivateMode = $grpc.ClientMethod<$103.UpsertUserPrivateModeRequest, $103.UpsertUserPrivateModeResponse>(
      '/econa.services.site.user.v1.UserService/UpsertUserPrivateMode',
      ($103.UpsertUserPrivateModeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $103.UpsertUserPrivateModeResponse.fromBuffer(value));
  static final _$withdrawUser = $grpc.ClientMethod<$104.WithdrawUserRequest, $104.WithdrawUserResponse>(
      '/econa.services.site.user.v1.UserService/WithdrawUser',
      ($104.WithdrawUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $104.WithdrawUserResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$87.CreateExternalUserResponse> createExternalUser($87.CreateExternalUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createExternalUser, request, options: options);
  }

  $grpc.ResponseFuture<$88.CreateUserAgreementLogResponse> createUserAgreementLog($88.CreateUserAgreementLogRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUserAgreementLog, request, options: options);
  }

  $grpc.ResponseFuture<$89.CreateUserBoostResponse> createUserBoost($89.CreateUserBoostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUserBoost, request, options: options);
  }

  $grpc.ResponseFuture<$90.EnableDeviceChangeModeResponse> enableDeviceChangeMode($90.EnableDeviceChangeModeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$enableDeviceChangeMode, request, options: options);
  }

  $grpc.ResponseFuture<$91.ExchangeMatchingToLikeResponse> exchangeMatchingToLike($91.ExchangeMatchingToLikeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$exchangeMatchingToLike, request, options: options);
  }

  $grpc.ResponseFuture<$92.GetExternalUserResponse> getExternalUser($92.GetExternalUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getExternalUser, request, options: options);
  }

  $grpc.ResponseFuture<$93.GetUserAgreementLogResponse> getUserAgreementLog($93.GetUserAgreementLogRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserAgreementLog, request, options: options);
  }

  $grpc.ResponseFuture<$94.GetUserBoostResponse> getUserBoost($94.GetUserBoostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserBoost, request, options: options);
  }

  $grpc.ResponseFuture<$95.GetUserInquiriesResponse> getUserInquiries($95.GetUserInquiriesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserInquiries, request, options: options);
  }

  $grpc.ResponseFuture<$96.GetUserPointHistoryResponse> getUserPointHistory($96.GetUserPointHistoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserPointHistory, request, options: options);
  }

  $grpc.ResponseFuture<$97.GetUserPointsResponse> getUserPoints($97.GetUserPointsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserPoints, request, options: options);
  }

  $grpc.ResponseFuture<$98.GetUserPrivateModeResponse> getUserPrivateMode($98.GetUserPrivateModeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserPrivateMode, request, options: options);
  }

  $grpc.ResponseFuture<$99.GetUserSettingsResponse> getUserSettings($99.GetUserSettingsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserSettings, request, options: options);
  }

  $grpc.ResponseFuture<$100.GetUserStatusResponse> getUserStatus($100.GetUserStatusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserStatus, request, options: options);
  }

  $grpc.ResponseFuture<$101.UpdateUserSettingsResponse> updateUserSettings($101.UpdateUserSettingsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUserSettings, request, options: options);
  }

  $grpc.ResponseFuture<$102.UpdateUserStatusResponse> updateUserStatus($102.UpdateUserStatusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUserStatus, request, options: options);
  }

  $grpc.ResponseFuture<$103.UpsertUserPrivateModeResponse> upsertUserPrivateMode($103.UpsertUserPrivateModeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$upsertUserPrivateMode, request, options: options);
  }

  $grpc.ResponseFuture<$104.WithdrawUserResponse> withdrawUser($104.WithdrawUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$withdrawUser, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.user.v1.UserService')
abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.user.v1.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$87.CreateExternalUserRequest, $87.CreateExternalUserResponse>(
        'CreateExternalUser',
        createExternalUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $87.CreateExternalUserRequest.fromBuffer(value),
        ($87.CreateExternalUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$88.CreateUserAgreementLogRequest, $88.CreateUserAgreementLogResponse>(
        'CreateUserAgreementLog',
        createUserAgreementLog_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $88.CreateUserAgreementLogRequest.fromBuffer(value),
        ($88.CreateUserAgreementLogResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$89.CreateUserBoostRequest, $89.CreateUserBoostResponse>(
        'CreateUserBoost',
        createUserBoost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $89.CreateUserBoostRequest.fromBuffer(value),
        ($89.CreateUserBoostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$90.EnableDeviceChangeModeRequest, $90.EnableDeviceChangeModeResponse>(
        'EnableDeviceChangeMode',
        enableDeviceChangeMode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $90.EnableDeviceChangeModeRequest.fromBuffer(value),
        ($90.EnableDeviceChangeModeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$91.ExchangeMatchingToLikeRequest, $91.ExchangeMatchingToLikeResponse>(
        'ExchangeMatchingToLike',
        exchangeMatchingToLike_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $91.ExchangeMatchingToLikeRequest.fromBuffer(value),
        ($91.ExchangeMatchingToLikeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$92.GetExternalUserRequest, $92.GetExternalUserResponse>(
        'GetExternalUser',
        getExternalUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $92.GetExternalUserRequest.fromBuffer(value),
        ($92.GetExternalUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$93.GetUserAgreementLogRequest, $93.GetUserAgreementLogResponse>(
        'GetUserAgreementLog',
        getUserAgreementLog_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $93.GetUserAgreementLogRequest.fromBuffer(value),
        ($93.GetUserAgreementLogResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$94.GetUserBoostRequest, $94.GetUserBoostResponse>(
        'GetUserBoost',
        getUserBoost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $94.GetUserBoostRequest.fromBuffer(value),
        ($94.GetUserBoostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$95.GetUserInquiriesRequest, $95.GetUserInquiriesResponse>(
        'GetUserInquiries',
        getUserInquiries_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $95.GetUserInquiriesRequest.fromBuffer(value),
        ($95.GetUserInquiriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$96.GetUserPointHistoryRequest, $96.GetUserPointHistoryResponse>(
        'GetUserPointHistory',
        getUserPointHistory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $96.GetUserPointHistoryRequest.fromBuffer(value),
        ($96.GetUserPointHistoryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$97.GetUserPointsRequest, $97.GetUserPointsResponse>(
        'GetUserPoints',
        getUserPoints_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $97.GetUserPointsRequest.fromBuffer(value),
        ($97.GetUserPointsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$98.GetUserPrivateModeRequest, $98.GetUserPrivateModeResponse>(
        'GetUserPrivateMode',
        getUserPrivateMode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $98.GetUserPrivateModeRequest.fromBuffer(value),
        ($98.GetUserPrivateModeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$99.GetUserSettingsRequest, $99.GetUserSettingsResponse>(
        'GetUserSettings',
        getUserSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $99.GetUserSettingsRequest.fromBuffer(value),
        ($99.GetUserSettingsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$100.GetUserStatusRequest, $100.GetUserStatusResponse>(
        'GetUserStatus',
        getUserStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $100.GetUserStatusRequest.fromBuffer(value),
        ($100.GetUserStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$101.UpdateUserSettingsRequest, $101.UpdateUserSettingsResponse>(
        'UpdateUserSettings',
        updateUserSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $101.UpdateUserSettingsRequest.fromBuffer(value),
        ($101.UpdateUserSettingsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$102.UpdateUserStatusRequest, $102.UpdateUserStatusResponse>(
        'UpdateUserStatus',
        updateUserStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $102.UpdateUserStatusRequest.fromBuffer(value),
        ($102.UpdateUserStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$103.UpsertUserPrivateModeRequest, $103.UpsertUserPrivateModeResponse>(
        'UpsertUserPrivateMode',
        upsertUserPrivateMode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $103.UpsertUserPrivateModeRequest.fromBuffer(value),
        ($103.UpsertUserPrivateModeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$104.WithdrawUserRequest, $104.WithdrawUserResponse>(
        'WithdrawUser',
        withdrawUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $104.WithdrawUserRequest.fromBuffer(value),
        ($104.WithdrawUserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$87.CreateExternalUserResponse> createExternalUser_Pre($grpc.ServiceCall call, $async.Future<$87.CreateExternalUserRequest> request) async {
    return createExternalUser(call, await request);
  }

  $async.Future<$88.CreateUserAgreementLogResponse> createUserAgreementLog_Pre($grpc.ServiceCall call, $async.Future<$88.CreateUserAgreementLogRequest> request) async {
    return createUserAgreementLog(call, await request);
  }

  $async.Future<$89.CreateUserBoostResponse> createUserBoost_Pre($grpc.ServiceCall call, $async.Future<$89.CreateUserBoostRequest> request) async {
    return createUserBoost(call, await request);
  }

  $async.Future<$90.EnableDeviceChangeModeResponse> enableDeviceChangeMode_Pre($grpc.ServiceCall call, $async.Future<$90.EnableDeviceChangeModeRequest> request) async {
    return enableDeviceChangeMode(call, await request);
  }

  $async.Future<$91.ExchangeMatchingToLikeResponse> exchangeMatchingToLike_Pre($grpc.ServiceCall call, $async.Future<$91.ExchangeMatchingToLikeRequest> request) async {
    return exchangeMatchingToLike(call, await request);
  }

  $async.Future<$92.GetExternalUserResponse> getExternalUser_Pre($grpc.ServiceCall call, $async.Future<$92.GetExternalUserRequest> request) async {
    return getExternalUser(call, await request);
  }

  $async.Future<$93.GetUserAgreementLogResponse> getUserAgreementLog_Pre($grpc.ServiceCall call, $async.Future<$93.GetUserAgreementLogRequest> request) async {
    return getUserAgreementLog(call, await request);
  }

  $async.Future<$94.GetUserBoostResponse> getUserBoost_Pre($grpc.ServiceCall call, $async.Future<$94.GetUserBoostRequest> request) async {
    return getUserBoost(call, await request);
  }

  $async.Future<$95.GetUserInquiriesResponse> getUserInquiries_Pre($grpc.ServiceCall call, $async.Future<$95.GetUserInquiriesRequest> request) async {
    return getUserInquiries(call, await request);
  }

  $async.Future<$96.GetUserPointHistoryResponse> getUserPointHistory_Pre($grpc.ServiceCall call, $async.Future<$96.GetUserPointHistoryRequest> request) async {
    return getUserPointHistory(call, await request);
  }

  $async.Future<$97.GetUserPointsResponse> getUserPoints_Pre($grpc.ServiceCall call, $async.Future<$97.GetUserPointsRequest> request) async {
    return getUserPoints(call, await request);
  }

  $async.Future<$98.GetUserPrivateModeResponse> getUserPrivateMode_Pre($grpc.ServiceCall call, $async.Future<$98.GetUserPrivateModeRequest> request) async {
    return getUserPrivateMode(call, await request);
  }

  $async.Future<$99.GetUserSettingsResponse> getUserSettings_Pre($grpc.ServiceCall call, $async.Future<$99.GetUserSettingsRequest> request) async {
    return getUserSettings(call, await request);
  }

  $async.Future<$100.GetUserStatusResponse> getUserStatus_Pre($grpc.ServiceCall call, $async.Future<$100.GetUserStatusRequest> request) async {
    return getUserStatus(call, await request);
  }

  $async.Future<$101.UpdateUserSettingsResponse> updateUserSettings_Pre($grpc.ServiceCall call, $async.Future<$101.UpdateUserSettingsRequest> request) async {
    return updateUserSettings(call, await request);
  }

  $async.Future<$102.UpdateUserStatusResponse> updateUserStatus_Pre($grpc.ServiceCall call, $async.Future<$102.UpdateUserStatusRequest> request) async {
    return updateUserStatus(call, await request);
  }

  $async.Future<$103.UpsertUserPrivateModeResponse> upsertUserPrivateMode_Pre($grpc.ServiceCall call, $async.Future<$103.UpsertUserPrivateModeRequest> request) async {
    return upsertUserPrivateMode(call, await request);
  }

  $async.Future<$104.WithdrawUserResponse> withdrawUser_Pre($grpc.ServiceCall call, $async.Future<$104.WithdrawUserRequest> request) async {
    return withdrawUser(call, await request);
  }

  $async.Future<$87.CreateExternalUserResponse> createExternalUser($grpc.ServiceCall call, $87.CreateExternalUserRequest request);
  $async.Future<$88.CreateUserAgreementLogResponse> createUserAgreementLog($grpc.ServiceCall call, $88.CreateUserAgreementLogRequest request);
  $async.Future<$89.CreateUserBoostResponse> createUserBoost($grpc.ServiceCall call, $89.CreateUserBoostRequest request);
  $async.Future<$90.EnableDeviceChangeModeResponse> enableDeviceChangeMode($grpc.ServiceCall call, $90.EnableDeviceChangeModeRequest request);
  $async.Future<$91.ExchangeMatchingToLikeResponse> exchangeMatchingToLike($grpc.ServiceCall call, $91.ExchangeMatchingToLikeRequest request);
  $async.Future<$92.GetExternalUserResponse> getExternalUser($grpc.ServiceCall call, $92.GetExternalUserRequest request);
  $async.Future<$93.GetUserAgreementLogResponse> getUserAgreementLog($grpc.ServiceCall call, $93.GetUserAgreementLogRequest request);
  $async.Future<$94.GetUserBoostResponse> getUserBoost($grpc.ServiceCall call, $94.GetUserBoostRequest request);
  $async.Future<$95.GetUserInquiriesResponse> getUserInquiries($grpc.ServiceCall call, $95.GetUserInquiriesRequest request);
  $async.Future<$96.GetUserPointHistoryResponse> getUserPointHistory($grpc.ServiceCall call, $96.GetUserPointHistoryRequest request);
  $async.Future<$97.GetUserPointsResponse> getUserPoints($grpc.ServiceCall call, $97.GetUserPointsRequest request);
  $async.Future<$98.GetUserPrivateModeResponse> getUserPrivateMode($grpc.ServiceCall call, $98.GetUserPrivateModeRequest request);
  $async.Future<$99.GetUserSettingsResponse> getUserSettings($grpc.ServiceCall call, $99.GetUserSettingsRequest request);
  $async.Future<$100.GetUserStatusResponse> getUserStatus($grpc.ServiceCall call, $100.GetUserStatusRequest request);
  $async.Future<$101.UpdateUserSettingsResponse> updateUserSettings($grpc.ServiceCall call, $101.UpdateUserSettingsRequest request);
  $async.Future<$102.UpdateUserStatusResponse> updateUserStatus($grpc.ServiceCall call, $102.UpdateUserStatusRequest request);
  $async.Future<$103.UpsertUserPrivateModeResponse> upsertUserPrivateMode($grpc.ServiceCall call, $103.UpsertUserPrivateModeRequest request);
  $async.Future<$104.WithdrawUserResponse> withdrawUser($grpc.ServiceCall call, $104.WithdrawUserRequest request);
}
