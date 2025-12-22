//
//  Generated code. Do not modify.
//  source: econa/services/site/hide/v1/service.proto
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

import 'get_hidden_users.pb.dart' as $37;
import 'update_user_hide.pb.dart' as $38;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.hide.v1.HideService')
class HideServiceClient extends $grpc.Client {
  static final _$getHiddenUsers = $grpc.ClientMethod<$37.GetHiddenUsersRequest, $37.GetHiddenUsersResponse>(
      '/econa.services.site.hide.v1.HideService/GetHiddenUsers',
      ($37.GetHiddenUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $37.GetHiddenUsersResponse.fromBuffer(value));
  static final _$updateUserHide = $grpc.ClientMethod<$38.UpdateUserHideRequest, $38.UpdateUserHideResponse>(
      '/econa.services.site.hide.v1.HideService/UpdateUserHide',
      ($38.UpdateUserHideRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $38.UpdateUserHideResponse.fromBuffer(value));

  HideServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$37.GetHiddenUsersResponse> getHiddenUsers($37.GetHiddenUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHiddenUsers, request, options: options);
  }

  $grpc.ResponseFuture<$38.UpdateUserHideResponse> updateUserHide($38.UpdateUserHideRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUserHide, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.hide.v1.HideService')
abstract class HideServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.hide.v1.HideService';

  HideServiceBase() {
    $addMethod($grpc.ServiceMethod<$37.GetHiddenUsersRequest, $37.GetHiddenUsersResponse>(
        'GetHiddenUsers',
        getHiddenUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $37.GetHiddenUsersRequest.fromBuffer(value),
        ($37.GetHiddenUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$38.UpdateUserHideRequest, $38.UpdateUserHideResponse>(
        'UpdateUserHide',
        updateUserHide_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $38.UpdateUserHideRequest.fromBuffer(value),
        ($38.UpdateUserHideResponse value) => value.writeToBuffer()));
  }

  $async.Future<$37.GetHiddenUsersResponse> getHiddenUsers_Pre($grpc.ServiceCall call, $async.Future<$37.GetHiddenUsersRequest> request) async {
    return getHiddenUsers(call, await request);
  }

  $async.Future<$38.UpdateUserHideResponse> updateUserHide_Pre($grpc.ServiceCall call, $async.Future<$38.UpdateUserHideRequest> request) async {
    return updateUserHide(call, await request);
  }

  $async.Future<$37.GetHiddenUsersResponse> getHiddenUsers($grpc.ServiceCall call, $37.GetHiddenUsersRequest request);
  $async.Future<$38.UpdateUserHideResponse> updateUserHide($grpc.ServiceCall call, $38.UpdateUserHideRequest request);
}
