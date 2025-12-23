//
//  Generated code. Do not modify.
//  source: econa/services/site/media/v1/chunked_media_upload.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/media_category.pbenum.dart' as $166;
import '../../../../shared/chunked_data.pb.dart' as $164;
import '../../../../shared/photo_crop_settings.pb.dart' as $165;
import '../../../../shared/signed_url.pb.dart' as $114;

enum ChunkedMediaUploadRequest_RelatedInfo {
  profilePhotoPriority, 
  reportId, 
  chatRoomId, 
  notSet
}

/// メディアチャンクデータをアップロードするリクエストです。
class ChunkedMediaUploadRequest extends $pb.GeneratedMessage {
  factory ChunkedMediaUploadRequest({
    $166.MediaCategory? mediaCategory,
    $164.ChunkedData? chunkedData,
    $165.PhotoCropSettings? photoCropSettings,
    $core.int? profilePhotoPriority,
    $core.String? reportId,
    $core.String? chatRoomId,
  }) {
    final $result = create();
    if (mediaCategory != null) {
      $result.mediaCategory = mediaCategory;
    }
    if (chunkedData != null) {
      $result.chunkedData = chunkedData;
    }
    if (photoCropSettings != null) {
      $result.photoCropSettings = photoCropSettings;
    }
    if (profilePhotoPriority != null) {
      $result.profilePhotoPriority = profilePhotoPriority;
    }
    if (reportId != null) {
      $result.reportId = reportId;
    }
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    return $result;
  }
  ChunkedMediaUploadRequest._() : super();
  factory ChunkedMediaUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChunkedMediaUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ChunkedMediaUploadRequest_RelatedInfo> _ChunkedMediaUploadRequest_RelatedInfoByTag = {
    4 : ChunkedMediaUploadRequest_RelatedInfo.profilePhotoPriority,
    6 : ChunkedMediaUploadRequest_RelatedInfo.reportId,
    7 : ChunkedMediaUploadRequest_RelatedInfo.chatRoomId,
    0 : ChunkedMediaUploadRequest_RelatedInfo.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChunkedMediaUploadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.media.v1'), createEmptyInstance: create)
    ..oo(0, [4, 6, 7])
    ..e<$166.MediaCategory>(1, _omitFieldNames ? '' : 'mediaCategory', $pb.PbFieldType.OE, defaultOrMaker: $166.MediaCategory.MEDIA_CATEGORY_UNSPECIFIED, valueOf: $166.MediaCategory.valueOf, enumValues: $166.MediaCategory.values)
    ..aOM<$164.ChunkedData>(2, _omitFieldNames ? '' : 'chunkedData', subBuilder: $164.ChunkedData.create)
    ..aOM<$165.PhotoCropSettings>(3, _omitFieldNames ? '' : 'photoCropSettings', subBuilder: $165.PhotoCropSettings.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'profilePhotoPriority', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'reportId')
    ..aOS(7, _omitFieldNames ? '' : 'chatRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChunkedMediaUploadRequest clone() => ChunkedMediaUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChunkedMediaUploadRequest copyWith(void Function(ChunkedMediaUploadRequest) updates) => super.copyWith((message) => updates(message as ChunkedMediaUploadRequest)) as ChunkedMediaUploadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChunkedMediaUploadRequest create() => ChunkedMediaUploadRequest._();
  ChunkedMediaUploadRequest createEmptyInstance() => create();
  static $pb.PbList<ChunkedMediaUploadRequest> createRepeated() => $pb.PbList<ChunkedMediaUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static ChunkedMediaUploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChunkedMediaUploadRequest>(create);
  static ChunkedMediaUploadRequest? _defaultInstance;

  ChunkedMediaUploadRequest_RelatedInfo whichRelatedInfo() => _ChunkedMediaUploadRequest_RelatedInfoByTag[$_whichOneof(0)]!;
  void clearRelatedInfo() => clearField($_whichOneof(0));

  /// アップロード写真カテゴリ
  @$pb.TagNumber(1)
  $166.MediaCategory get mediaCategory => $_getN(0);
  @$pb.TagNumber(1)
  set mediaCategory($166.MediaCategory v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMediaCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearMediaCategory() => clearField(1);

  /// 画像チャンクデータ
  @$pb.TagNumber(2)
  $164.ChunkedData get chunkedData => $_getN(1);
  @$pb.TagNumber(2)
  set chunkedData($164.ChunkedData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunkedData() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunkedData() => clearField(2);
  @$pb.TagNumber(2)
  $164.ChunkedData ensureChunkedData() => $_ensure(1);

  /// 画像クロップ設定（ベスト写真アップロード時のみ）
  @$pb.TagNumber(3)
  $165.PhotoCropSettings get photoCropSettings => $_getN(2);
  @$pb.TagNumber(3)
  set photoCropSettings($165.PhotoCropSettings v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPhotoCropSettings() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhotoCropSettings() => clearField(3);
  @$pb.TagNumber(3)
  $165.PhotoCropSettings ensurePhotoCropSettings() => $_ensure(2);

  /// プロフィール写真優先度（MEDIA_CATEGORY_PROFILE_PHOTOの場合に、ベスト写真=1、それ以外を2~9で指定）
  @$pb.TagNumber(4)
  $core.int get profilePhotoPriority => $_getIZ(3);
  @$pb.TagNumber(4)
  set profilePhotoPriority($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProfilePhotoPriority() => $_has(3);
  @$pb.TagNumber(4)
  void clearProfilePhotoPriority() => clearField(4);

  /// 廃止: チャットメッセージID（MEDIA_CATEGORY_CHAT_PHOTOの旧フロー）
  /// reserved 5;
  /// 通報ID（MEDIA_CATEGORY_INQUIRY_EVIDENCE_PHOTOの場合）
  @$pb.TagNumber(6)
  $core.String get reportId => $_getSZ(4);
  @$pb.TagNumber(6)
  set reportId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasReportId() => $_has(4);
  @$pb.TagNumber(6)
  void clearReportId() => clearField(6);

  /// チャットルームID（MEDIA_CATEGORY_CHAT_PHOTOの新フロー）
  @$pb.TagNumber(7)
  $core.String get chatRoomId => $_getSZ(5);
  @$pb.TagNumber(7)
  set chatRoomId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasChatRoomId() => $_has(5);
  @$pb.TagNumber(7)
  void clearChatRoomId() => clearField(7);
}

enum ChunkedMediaUploadResponse_SignedUrls {
  signedImageUrls, 
  signedVoiceUrls, 
  notSet
}

/// メディアチャンクデータをアップロードするレスポンスです。
class ChunkedMediaUploadResponse extends $pb.GeneratedMessage {
  factory ChunkedMediaUploadResponse({
    $114.SignedImageUrls? signedImageUrls,
    $114.SignedVoiceUrls? signedVoiceUrls,
    $core.String? chatMessageId,
  }) {
    final $result = create();
    if (signedImageUrls != null) {
      $result.signedImageUrls = signedImageUrls;
    }
    if (signedVoiceUrls != null) {
      $result.signedVoiceUrls = signedVoiceUrls;
    }
    if (chatMessageId != null) {
      $result.chatMessageId = chatMessageId;
    }
    return $result;
  }
  ChunkedMediaUploadResponse._() : super();
  factory ChunkedMediaUploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChunkedMediaUploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ChunkedMediaUploadResponse_SignedUrls> _ChunkedMediaUploadResponse_SignedUrlsByTag = {
    1 : ChunkedMediaUploadResponse_SignedUrls.signedImageUrls,
    2 : ChunkedMediaUploadResponse_SignedUrls.signedVoiceUrls,
    0 : ChunkedMediaUploadResponse_SignedUrls.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChunkedMediaUploadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.media.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$114.SignedImageUrls>(1, _omitFieldNames ? '' : 'signedImageUrls', subBuilder: $114.SignedImageUrls.create)
    ..aOM<$114.SignedVoiceUrls>(2, _omitFieldNames ? '' : 'signedVoiceUrls', subBuilder: $114.SignedVoiceUrls.create)
    ..aOS(3, _omitFieldNames ? '' : 'chatMessageId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChunkedMediaUploadResponse clone() => ChunkedMediaUploadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChunkedMediaUploadResponse copyWith(void Function(ChunkedMediaUploadResponse) updates) => super.copyWith((message) => updates(message as ChunkedMediaUploadResponse)) as ChunkedMediaUploadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChunkedMediaUploadResponse create() => ChunkedMediaUploadResponse._();
  ChunkedMediaUploadResponse createEmptyInstance() => create();
  static $pb.PbList<ChunkedMediaUploadResponse> createRepeated() => $pb.PbList<ChunkedMediaUploadResponse>();
  @$core.pragma('dart2js:noInline')
  static ChunkedMediaUploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChunkedMediaUploadResponse>(create);
  static ChunkedMediaUploadResponse? _defaultInstance;

  ChunkedMediaUploadResponse_SignedUrls whichSignedUrls() => _ChunkedMediaUploadResponse_SignedUrlsByTag[$_whichOneof(0)]!;
  void clearSignedUrls() => clearField($_whichOneof(0));

  /// 署名付き画像URL
  @$pb.TagNumber(1)
  $114.SignedImageUrls get signedImageUrls => $_getN(0);
  @$pb.TagNumber(1)
  set signedImageUrls($114.SignedImageUrls v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSignedImageUrls() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedImageUrls() => clearField(1);
  @$pb.TagNumber(1)
  $114.SignedImageUrls ensureSignedImageUrls() => $_ensure(0);

  /// 署名付き音声URL
  @$pb.TagNumber(2)
  $114.SignedVoiceUrls get signedVoiceUrls => $_getN(1);
  @$pb.TagNumber(2)
  set signedVoiceUrls($114.SignedVoiceUrls v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignedVoiceUrls() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignedVoiceUrls() => clearField(2);
  @$pb.TagNumber(2)
  $114.SignedVoiceUrls ensureSignedVoiceUrls() => $_ensure(1);

  /// PHOTOアップロード（チャット）時に作成されたチャットメッセージID
  @$pb.TagNumber(3)
  $core.String get chatMessageId => $_getSZ(2);
  @$pb.TagNumber(3)
  set chatMessageId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatMessageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatMessageId() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
