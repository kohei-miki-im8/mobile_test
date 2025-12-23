//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/service.proto
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

import 'create_user_tag.pb.dart' as $80;
import 'delete_user_tag.pb.dart' as $81;
import 'get_common_tags.pb.dart' as $86;
import 'get_tag_categories.pb.dart' as $83;
import 'get_tags.pb.dart' as $84;
import 'get_user_tags.pb.dart' as $85;
import 'sync_user_tag.pb.dart' as $82;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.tag.v1.TagService')
class TagServiceClient extends $grpc.Client {
  static final _$createUserTag = $grpc.ClientMethod<$80.CreateUserTagRequest, $80.CreateUserTagResponse>(
      '/econa.services.site.tag.v1.TagService/CreateUserTag',
      ($80.CreateUserTagRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $80.CreateUserTagResponse.fromBuffer(value));
  static final _$deleteUserTag = $grpc.ClientMethod<$81.DeleteUserTagRequest, $81.DeleteUserTagResponse>(
      '/econa.services.site.tag.v1.TagService/DeleteUserTag',
      ($81.DeleteUserTagRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $81.DeleteUserTagResponse.fromBuffer(value));
  static final _$syncUserTag = $grpc.ClientMethod<$82.SyncUserTagRequest, $82.SyncUserTagResponse>(
      '/econa.services.site.tag.v1.TagService/SyncUserTag',
      ($82.SyncUserTagRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $82.SyncUserTagResponse.fromBuffer(value));
  static final _$getTagCategories = $grpc.ClientMethod<$83.GetTagCategoriesRequest, $83.GetTagCategoriesResponse>(
      '/econa.services.site.tag.v1.TagService/GetTagCategories',
      ($83.GetTagCategoriesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $83.GetTagCategoriesResponse.fromBuffer(value));
  static final _$getTags = $grpc.ClientMethod<$84.GetTagsRequest, $84.GetTagsResponse>(
      '/econa.services.site.tag.v1.TagService/GetTags',
      ($84.GetTagsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $84.GetTagsResponse.fromBuffer(value));
  static final _$getUserTags = $grpc.ClientMethod<$85.GetUserTagsRequest, $85.GetUserTagsResponse>(
      '/econa.services.site.tag.v1.TagService/GetUserTags',
      ($85.GetUserTagsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $85.GetUserTagsResponse.fromBuffer(value));
  static final _$getCommonTags = $grpc.ClientMethod<$86.GetCommonTagsRequest, $86.GetCommonTagsResponse>(
      '/econa.services.site.tag.v1.TagService/GetCommonTags',
      ($86.GetCommonTagsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $86.GetCommonTagsResponse.fromBuffer(value));

  TagServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$80.CreateUserTagResponse> createUserTag($80.CreateUserTagRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUserTag, request, options: options);
  }

  $grpc.ResponseFuture<$81.DeleteUserTagResponse> deleteUserTag($81.DeleteUserTagRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUserTag, request, options: options);
  }

  $grpc.ResponseFuture<$82.SyncUserTagResponse> syncUserTag($82.SyncUserTagRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$syncUserTag, request, options: options);
  }

  $grpc.ResponseFuture<$83.GetTagCategoriesResponse> getTagCategories($83.GetTagCategoriesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTagCategories, request, options: options);
  }

  $grpc.ResponseFuture<$84.GetTagsResponse> getTags($84.GetTagsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTags, request, options: options);
  }

  $grpc.ResponseFuture<$85.GetUserTagsResponse> getUserTags($85.GetUserTagsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserTags, request, options: options);
  }

  $grpc.ResponseFuture<$86.GetCommonTagsResponse> getCommonTags($86.GetCommonTagsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCommonTags, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.tag.v1.TagService')
abstract class TagServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.tag.v1.TagService';

  TagServiceBase() {
    $addMethod($grpc.ServiceMethod<$80.CreateUserTagRequest, $80.CreateUserTagResponse>(
        'CreateUserTag',
        createUserTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $80.CreateUserTagRequest.fromBuffer(value),
        ($80.CreateUserTagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$81.DeleteUserTagRequest, $81.DeleteUserTagResponse>(
        'DeleteUserTag',
        deleteUserTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $81.DeleteUserTagRequest.fromBuffer(value),
        ($81.DeleteUserTagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$82.SyncUserTagRequest, $82.SyncUserTagResponse>(
        'SyncUserTag',
        syncUserTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $82.SyncUserTagRequest.fromBuffer(value),
        ($82.SyncUserTagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$83.GetTagCategoriesRequest, $83.GetTagCategoriesResponse>(
        'GetTagCategories',
        getTagCategories_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $83.GetTagCategoriesRequest.fromBuffer(value),
        ($83.GetTagCategoriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$84.GetTagsRequest, $84.GetTagsResponse>(
        'GetTags',
        getTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $84.GetTagsRequest.fromBuffer(value),
        ($84.GetTagsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$85.GetUserTagsRequest, $85.GetUserTagsResponse>(
        'GetUserTags',
        getUserTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $85.GetUserTagsRequest.fromBuffer(value),
        ($85.GetUserTagsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$86.GetCommonTagsRequest, $86.GetCommonTagsResponse>(
        'GetCommonTags',
        getCommonTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $86.GetCommonTagsRequest.fromBuffer(value),
        ($86.GetCommonTagsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$80.CreateUserTagResponse> createUserTag_Pre($grpc.ServiceCall call, $async.Future<$80.CreateUserTagRequest> request) async {
    return createUserTag(call, await request);
  }

  $async.Future<$81.DeleteUserTagResponse> deleteUserTag_Pre($grpc.ServiceCall call, $async.Future<$81.DeleteUserTagRequest> request) async {
    return deleteUserTag(call, await request);
  }

  $async.Future<$82.SyncUserTagResponse> syncUserTag_Pre($grpc.ServiceCall call, $async.Future<$82.SyncUserTagRequest> request) async {
    return syncUserTag(call, await request);
  }

  $async.Future<$83.GetTagCategoriesResponse> getTagCategories_Pre($grpc.ServiceCall call, $async.Future<$83.GetTagCategoriesRequest> request) async {
    return getTagCategories(call, await request);
  }

  $async.Future<$84.GetTagsResponse> getTags_Pre($grpc.ServiceCall call, $async.Future<$84.GetTagsRequest> request) async {
    return getTags(call, await request);
  }

  $async.Future<$85.GetUserTagsResponse> getUserTags_Pre($grpc.ServiceCall call, $async.Future<$85.GetUserTagsRequest> request) async {
    return getUserTags(call, await request);
  }

  $async.Future<$86.GetCommonTagsResponse> getCommonTags_Pre($grpc.ServiceCall call, $async.Future<$86.GetCommonTagsRequest> request) async {
    return getCommonTags(call, await request);
  }

  $async.Future<$80.CreateUserTagResponse> createUserTag($grpc.ServiceCall call, $80.CreateUserTagRequest request);
  $async.Future<$81.DeleteUserTagResponse> deleteUserTag($grpc.ServiceCall call, $81.DeleteUserTagRequest request);
  $async.Future<$82.SyncUserTagResponse> syncUserTag($grpc.ServiceCall call, $82.SyncUserTagRequest request);
  $async.Future<$83.GetTagCategoriesResponse> getTagCategories($grpc.ServiceCall call, $83.GetTagCategoriesRequest request);
  $async.Future<$84.GetTagsResponse> getTags($grpc.ServiceCall call, $84.GetTagsRequest request);
  $async.Future<$85.GetUserTagsResponse> getUserTags($grpc.ServiceCall call, $85.GetUserTagsRequest request);
  $async.Future<$86.GetCommonTagsResponse> getCommonTags($grpc.ServiceCall call, $86.GetCommonTagsRequest request);
}
