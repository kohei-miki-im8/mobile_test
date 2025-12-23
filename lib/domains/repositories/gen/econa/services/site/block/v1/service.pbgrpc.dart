//
//  Generated code. Do not modify.
//  source: econa/services/site/block/v1/service.proto
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

import 'get_blocked_users.pb.dart' as $2;
import 'update_user_block.pb.dart' as $3;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.block.v1.BlockService')
class BlockServiceClient extends $grpc.Client {
  static final _$getBlockedUsers = $grpc.ClientMethod<$2.GetBlockedUsersRequest, $2.GetBlockedUsersResponse>(
      '/econa.services.site.block.v1.BlockService/GetBlockedUsers',
      ($2.GetBlockedUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetBlockedUsersResponse.fromBuffer(value));
  static final _$updateUserBlock = $grpc.ClientMethod<$3.UpdateUserBlockRequest, $3.UpdateUserBlockResponse>(
      '/econa.services.site.block.v1.BlockService/UpdateUserBlock',
      ($3.UpdateUserBlockRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.UpdateUserBlockResponse.fromBuffer(value));

  BlockServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.GetBlockedUsersResponse> getBlockedUsers($2.GetBlockedUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBlockedUsers, request, options: options);
  }

  $grpc.ResponseFuture<$3.UpdateUserBlockResponse> updateUserBlock($3.UpdateUserBlockRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUserBlock, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.block.v1.BlockService')
abstract class BlockServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.block.v1.BlockService';

  BlockServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.GetBlockedUsersRequest, $2.GetBlockedUsersResponse>(
        'GetBlockedUsers',
        getBlockedUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetBlockedUsersRequest.fromBuffer(value),
        ($2.GetBlockedUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateUserBlockRequest, $3.UpdateUserBlockResponse>(
        'UpdateUserBlock',
        updateUserBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UpdateUserBlockRequest.fromBuffer(value),
        ($3.UpdateUserBlockResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.GetBlockedUsersResponse> getBlockedUsers_Pre($grpc.ServiceCall call, $async.Future<$2.GetBlockedUsersRequest> request) async {
    return getBlockedUsers(call, await request);
  }

  $async.Future<$3.UpdateUserBlockResponse> updateUserBlock_Pre($grpc.ServiceCall call, $async.Future<$3.UpdateUserBlockRequest> request) async {
    return updateUserBlock(call, await request);
  }

  $async.Future<$2.GetBlockedUsersResponse> getBlockedUsers($grpc.ServiceCall call, $2.GetBlockedUsersRequest request);
  $async.Future<$3.UpdateUserBlockResponse> updateUserBlock($grpc.ServiceCall call, $3.UpdateUserBlockRequest request);
}
