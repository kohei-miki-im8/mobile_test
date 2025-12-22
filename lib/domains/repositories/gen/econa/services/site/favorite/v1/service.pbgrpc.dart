//
//  Generated code. Do not modify.
//  source: econa/services/site/favorite/v1/service.proto
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

import 'get_favorite_users.pb.dart' as $27;
import 'update_user_favorite.pb.dart' as $28;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.favorite.v1.FavoriteService')
class FavoriteServiceClient extends $grpc.Client {
  static final _$getFavoriteUsers = $grpc.ClientMethod<$27.GetFavoriteUsersRequest, $27.GetFavoriteUsersResponse>(
      '/econa.services.site.favorite.v1.FavoriteService/GetFavoriteUsers',
      ($27.GetFavoriteUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $27.GetFavoriteUsersResponse.fromBuffer(value));
  static final _$updateUserFavorite = $grpc.ClientMethod<$28.UpdateUserFavoriteRequest, $28.UpdateUserFavoriteResponse>(
      '/econa.services.site.favorite.v1.FavoriteService/UpdateUserFavorite',
      ($28.UpdateUserFavoriteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $28.UpdateUserFavoriteResponse.fromBuffer(value));

  FavoriteServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$27.GetFavoriteUsersResponse> getFavoriteUsers($27.GetFavoriteUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFavoriteUsers, request, options: options);
  }

  $grpc.ResponseFuture<$28.UpdateUserFavoriteResponse> updateUserFavorite($28.UpdateUserFavoriteRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUserFavorite, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.favorite.v1.FavoriteService')
abstract class FavoriteServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.favorite.v1.FavoriteService';

  FavoriteServiceBase() {
    $addMethod($grpc.ServiceMethod<$27.GetFavoriteUsersRequest, $27.GetFavoriteUsersResponse>(
        'GetFavoriteUsers',
        getFavoriteUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $27.GetFavoriteUsersRequest.fromBuffer(value),
        ($27.GetFavoriteUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$28.UpdateUserFavoriteRequest, $28.UpdateUserFavoriteResponse>(
        'UpdateUserFavorite',
        updateUserFavorite_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $28.UpdateUserFavoriteRequest.fromBuffer(value),
        ($28.UpdateUserFavoriteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$27.GetFavoriteUsersResponse> getFavoriteUsers_Pre($grpc.ServiceCall call, $async.Future<$27.GetFavoriteUsersRequest> request) async {
    return getFavoriteUsers(call, await request);
  }

  $async.Future<$28.UpdateUserFavoriteResponse> updateUserFavorite_Pre($grpc.ServiceCall call, $async.Future<$28.UpdateUserFavoriteRequest> request) async {
    return updateUserFavorite(call, await request);
  }

  $async.Future<$27.GetFavoriteUsersResponse> getFavoriteUsers($grpc.ServiceCall call, $27.GetFavoriteUsersRequest request);
  $async.Future<$28.UpdateUserFavoriteResponse> updateUserFavorite($grpc.ServiceCall call, $28.UpdateUserFavoriteRequest request);
}
