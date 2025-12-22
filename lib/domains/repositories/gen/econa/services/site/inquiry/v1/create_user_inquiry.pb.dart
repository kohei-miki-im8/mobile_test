//
//  Generated code. Do not modify.
//  source: econa/services/site/inquiry/v1/create_user_inquiry.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;

/// 通報作成リクエスト
class CreateUserInquiryRequest extends $pb.GeneratedMessage {
  factory CreateUserInquiryRequest({
    $core.String? reportedUserId,
    $core.String? chatRoomId,
    $core.int? inquiryCategoryId,
    $core.String? inquiryDetails,
  }) {
    final $result = create();
    if (reportedUserId != null) {
      $result.reportedUserId = reportedUserId;
    }
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (inquiryCategoryId != null) {
      $result.inquiryCategoryId = inquiryCategoryId;
    }
    if (inquiryDetails != null) {
      $result.inquiryDetails = inquiryDetails;
    }
    return $result;
  }
  CreateUserInquiryRequest._() : super();
  factory CreateUserInquiryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserInquiryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateUserInquiryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.inquiry.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reportedUserId')
    ..aOS(2, _omitFieldNames ? '' : 'chatRoomId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'inquiryCategoryId', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'inquiryDetails')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserInquiryRequest clone() => CreateUserInquiryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserInquiryRequest copyWith(void Function(CreateUserInquiryRequest) updates) => super.copyWith((message) => updates(message as CreateUserInquiryRequest)) as CreateUserInquiryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserInquiryRequest create() => CreateUserInquiryRequest._();
  CreateUserInquiryRequest createEmptyInstance() => create();
  static $pb.PbList<CreateUserInquiryRequest> createRepeated() => $pb.PbList<CreateUserInquiryRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateUserInquiryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserInquiryRequest>(create);
  static CreateUserInquiryRequest? _defaultInstance;

  /// 通報対象ユーザーID
  @$pb.TagNumber(1)
  $core.String get reportedUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set reportedUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReportedUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReportedUserId() => clearField(1);

  /// チャットルームID
  @$pb.TagNumber(2)
  $core.String get chatRoomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chatRoomId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChatRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChatRoomId() => clearField(2);

  /// 違反種別ID
  @$pb.TagNumber(3)
  $core.int get inquiryCategoryId => $_getIZ(2);
  @$pb.TagNumber(3)
  set inquiryCategoryId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInquiryCategoryId() => $_has(2);
  @$pb.TagNumber(3)
  void clearInquiryCategoryId() => clearField(3);

  /// 詳細内容（任意）
  @$pb.TagNumber(4)
  $core.String get inquiryDetails => $_getSZ(3);
  @$pb.TagNumber(4)
  set inquiryDetails($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInquiryDetails() => $_has(3);
  @$pb.TagNumber(4)
  void clearInquiryDetails() => clearField(4);
}

/// 通報作成レスポンス
class CreateUserInquiryResponse extends $pb.GeneratedMessage {
  factory CreateUserInquiryResponse({
    $core.String? userInquiryId,
    $109.Timestamp? createdAt,
  }) {
    final $result = create();
    if (userInquiryId != null) {
      $result.userInquiryId = userInquiryId;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  CreateUserInquiryResponse._() : super();
  factory CreateUserInquiryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserInquiryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateUserInquiryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.inquiry.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userInquiryId')
    ..aOM<$109.Timestamp>(2, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserInquiryResponse clone() => CreateUserInquiryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserInquiryResponse copyWith(void Function(CreateUserInquiryResponse) updates) => super.copyWith((message) => updates(message as CreateUserInquiryResponse)) as CreateUserInquiryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserInquiryResponse create() => CreateUserInquiryResponse._();
  CreateUserInquiryResponse createEmptyInstance() => create();
  static $pb.PbList<CreateUserInquiryResponse> createRepeated() => $pb.PbList<CreateUserInquiryResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateUserInquiryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserInquiryResponse>(create);
  static CreateUserInquiryResponse? _defaultInstance;

  /// 作成された通報ID
  @$pb.TagNumber(1)
  $core.String get userInquiryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userInquiryId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserInquiryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInquiryId() => clearField(1);

  /// 作成日時
  @$pb.TagNumber(2)
  $109.Timestamp get createdAt => $_getN(1);
  @$pb.TagNumber(2)
  set createdAt($109.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);
  @$pb.TagNumber(2)
  $109.Timestamp ensureCreatedAt() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
