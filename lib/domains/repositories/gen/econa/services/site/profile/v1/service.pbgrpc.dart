//
//  Generated code. Do not modify.
//  source: econa/services/site/profile/v1/service.proto
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

import 'create_profile.pb.dart' as $61;
import 'get_profile.pb.dart' as $62;
import 'update_profile.pb.dart' as $63;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.profile.v1.ProfileService')
class ProfileServiceClient extends $grpc.Client {
  static final _$createProfile = $grpc.ClientMethod<$61.CreateProfileRequest, $61.CreateProfileResponse>(
      '/econa.services.site.profile.v1.ProfileService/CreateProfile',
      ($61.CreateProfileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $61.CreateProfileResponse.fromBuffer(value));
  static final _$getProfile = $grpc.ClientMethod<$62.GetProfileRequest, $62.GetProfileResponse>(
      '/econa.services.site.profile.v1.ProfileService/GetProfile',
      ($62.GetProfileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $62.GetProfileResponse.fromBuffer(value));
  static final _$updateProfile = $grpc.ClientMethod<$63.UpdateProfileRequest, $63.UpdateProfileResponse>(
      '/econa.services.site.profile.v1.ProfileService/UpdateProfile',
      ($63.UpdateProfileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $63.UpdateProfileResponse.fromBuffer(value));

  ProfileServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$61.CreateProfileResponse> createProfile($61.CreateProfileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createProfile, request, options: options);
  }

  $grpc.ResponseFuture<$62.GetProfileResponse> getProfile($62.GetProfileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProfile, request, options: options);
  }

  $grpc.ResponseFuture<$63.UpdateProfileResponse> updateProfile($63.UpdateProfileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfile, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.profile.v1.ProfileService')
abstract class ProfileServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.profile.v1.ProfileService';

  ProfileServiceBase() {
    $addMethod($grpc.ServiceMethod<$61.CreateProfileRequest, $61.CreateProfileResponse>(
        'CreateProfile',
        createProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $61.CreateProfileRequest.fromBuffer(value),
        ($61.CreateProfileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$62.GetProfileRequest, $62.GetProfileResponse>(
        'GetProfile',
        getProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $62.GetProfileRequest.fromBuffer(value),
        ($62.GetProfileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$63.UpdateProfileRequest, $63.UpdateProfileResponse>(
        'UpdateProfile',
        updateProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $63.UpdateProfileRequest.fromBuffer(value),
        ($63.UpdateProfileResponse value) => value.writeToBuffer()));
  }

  $async.Future<$61.CreateProfileResponse> createProfile_Pre($grpc.ServiceCall call, $async.Future<$61.CreateProfileRequest> request) async {
    return createProfile(call, await request);
  }

  $async.Future<$62.GetProfileResponse> getProfile_Pre($grpc.ServiceCall call, $async.Future<$62.GetProfileRequest> request) async {
    return getProfile(call, await request);
  }

  $async.Future<$63.UpdateProfileResponse> updateProfile_Pre($grpc.ServiceCall call, $async.Future<$63.UpdateProfileRequest> request) async {
    return updateProfile(call, await request);
  }

  $async.Future<$61.CreateProfileResponse> createProfile($grpc.ServiceCall call, $61.CreateProfileRequest request);
  $async.Future<$62.GetProfileResponse> getProfile($grpc.ServiceCall call, $62.GetProfileRequest request);
  $async.Future<$63.UpdateProfileResponse> updateProfile($grpc.ServiceCall call, $63.UpdateProfileRequest request);
}
