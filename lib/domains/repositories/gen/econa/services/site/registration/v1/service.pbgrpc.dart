//
//  Generated code. Do not modify.
//  source: econa/services/site/registration/v1/service.proto
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

import 'create_registration_step_log.pb.dart' as $72;
import 'get_latest_registration_step.pb.dart' as $73;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.registration.v1.RegistrationService')
class RegistrationServiceClient extends $grpc.Client {
  static final _$createRegistrationStepLog = $grpc.ClientMethod<$72.CreateRegistrationStepLogRequest, $72.CreateRegistrationStepLogResponse>(
      '/econa.services.site.registration.v1.RegistrationService/CreateRegistrationStepLog',
      ($72.CreateRegistrationStepLogRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $72.CreateRegistrationStepLogResponse.fromBuffer(value));
  static final _$getLatestRegistrationStep = $grpc.ClientMethod<$73.GetLatestRegistrationStepRequest, $73.GetLatestRegistrationStepResponse>(
      '/econa.services.site.registration.v1.RegistrationService/GetLatestRegistrationStep',
      ($73.GetLatestRegistrationStepRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $73.GetLatestRegistrationStepResponse.fromBuffer(value));

  RegistrationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$72.CreateRegistrationStepLogResponse> createRegistrationStepLog($72.CreateRegistrationStepLogRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRegistrationStepLog, request, options: options);
  }

  $grpc.ResponseFuture<$73.GetLatestRegistrationStepResponse> getLatestRegistrationStep($73.GetLatestRegistrationStepRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLatestRegistrationStep, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.registration.v1.RegistrationService')
abstract class RegistrationServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.registration.v1.RegistrationService';

  RegistrationServiceBase() {
    $addMethod($grpc.ServiceMethod<$72.CreateRegistrationStepLogRequest, $72.CreateRegistrationStepLogResponse>(
        'CreateRegistrationStepLog',
        createRegistrationStepLog_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $72.CreateRegistrationStepLogRequest.fromBuffer(value),
        ($72.CreateRegistrationStepLogResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$73.GetLatestRegistrationStepRequest, $73.GetLatestRegistrationStepResponse>(
        'GetLatestRegistrationStep',
        getLatestRegistrationStep_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $73.GetLatestRegistrationStepRequest.fromBuffer(value),
        ($73.GetLatestRegistrationStepResponse value) => value.writeToBuffer()));
  }

  $async.Future<$72.CreateRegistrationStepLogResponse> createRegistrationStepLog_Pre($grpc.ServiceCall call, $async.Future<$72.CreateRegistrationStepLogRequest> request) async {
    return createRegistrationStepLog(call, await request);
  }

  $async.Future<$73.GetLatestRegistrationStepResponse> getLatestRegistrationStep_Pre($grpc.ServiceCall call, $async.Future<$73.GetLatestRegistrationStepRequest> request) async {
    return getLatestRegistrationStep(call, await request);
  }

  $async.Future<$72.CreateRegistrationStepLogResponse> createRegistrationStepLog($grpc.ServiceCall call, $72.CreateRegistrationStepLogRequest request);
  $async.Future<$73.GetLatestRegistrationStepResponse> getLatestRegistrationStep($grpc.ServiceCall call, $73.GetLatestRegistrationStepRequest request);
}
