import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/media_category.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/media/v1/chunked_media_upload.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chunked_data.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/photo_crop_settings.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'media_upload_service.g.dart';

class MediaUploadService {
  const MediaUploadService();

  /// チャンクアップロードの管理キーをUUIDv7で生成する
  String generateUploadManageKey() {
    const uuid = Uuid();
    return uuid.v7();
  }

  /// 拡張子を元にコンテンツタイプを決定する
  String detectContentType(String fileName) {
    final ext = fileName.toLowerCase().split('.').last;
    switch (ext) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'webp':
        return 'image/webp';
      case 'heic':
        return 'image/heic';
      case 'heif':
        return 'image/heif';
      case 'gif':
        return 'image/gif';
      case 'bmp':
        return 'image/bmp';
      case 'tif':
      case 'tiff':
        return 'image/tiff';
      case 'mp3':
        return 'audio/mpeg';
      case 'm4a':
        return 'audio/mp4';
      case 'wav':
        return 'audio/wav';
      case 'aac':
        return 'audio/aac';
      case 'ogg':
      case 'oga':
        return 'audio/ogg';
      case 'flac':
        return 'audio/flac';
      case 'amr':
        return 'audio/amr';
      // 追加の音声拡張子
      case 'aiff':
      case 'aif':
      case 'aifc':
        return 'audio/aiff';
      case 'opus':
        return 'audio/opus';
      case 'caf':
        return 'audio/x-caf';
      case 'mid':
      case 'midi':
        return 'audio/midi';
      default:
        return 'application/octet-stream';
    }
  }

  /// バリデーションチェック
  void validate({
    required MediaCategory category,
    required int totalBytes,
    int? profilePhotoPriority,
    String? chatRoomId,
    String? reportId,
  }) {
    // 20MBを超えるファイルはアップロード不可
    const maxBytes = 20 * 1024 * 1024;
    if (totalBytes <= 0 || totalBytes > maxBytes) {
      throw Exception('20MB以上のファイルはアップロードできません');
    }
    // プロフィール写真で表示優先度が不正な場合はエラー
    if (category == MediaCategory.MEDIA_CATEGORY_PROFILE_PHOTO) {
      final p = profilePhotoPriority ?? 1;
      if (p < 1 || p > 9) {
        throw Exception('profile photo priority must be 1..9');
      }
    }
    // チャットの画像の場合、チャットルームIDがなければエラー
    if (category == MediaCategory.MEDIA_CATEGORY_CHAT_PHOTO &&
        (chatRoomId == null || chatRoomId.isEmpty)) {
      throw Exception('chat_room_id is required');
    }
    // お問い合わせの証跡ファイルの場合、レポートIDがなければエラー
    if (category == MediaCategory.MEDIA_CATEGORY_INQUIRY_EVIDENCE_PHOTO &&
        (reportId == null || reportId.isEmpty)) {
      throw Exception('report_id is required');
    }
  }

  /// バイトからStreamを構築する（カメラで撮影した場合など、Uint8Listがある場合に使用）
  Stream<ChunkedMediaUploadRequest> buildStreamFromBytes({
    required Uint8List bytes,
    required String fileName,
    required MediaCategory category,
    int chunkSize = 512 * 1024,
    int? profilePhotoPriority,
    String? chatRoomId,
    String? reportId,
    PhotoCropSettings? photoCropSettings,
  }) async* {
    validate(
      category: category,
      totalBytes: bytes.length,
      profilePhotoPriority: profilePhotoPriority,
      chatRoomId: chatRoomId,
      reportId: reportId,
    );
    final uploadManageKey = generateUploadManageKey();
    final contentType = detectContentType(fileName);

    var chunkNumber = 0;
    var offset = 0;
    final total = bytes.length;
    while (offset < total) {
      final end = (offset + chunkSize).clamp(0, total);
      final chunk = bytes.sublist(offset, end);
      final isLast = end >= total;
      yield ChunkedMediaUploadRequest(
        mediaCategory: category,
        chunkedData: ChunkedData(
          uploadManageKey: uploadManageKey,
          chunkNumber: chunkNumber,
          isLastChunk: isLast,
          chunkData: chunk,
          fileName: chunkNumber == 0 ? fileName : null,
          contentType: chunkNumber == 0 ? contentType : null,
        ),
        // Send crop settings only once at the beginning
        photoCropSettings: chunkNumber == 0 ? photoCropSettings : null,
        profilePhotoPriority:
            category == MediaCategory.MEDIA_CATEGORY_PROFILE_PHOTO
                ? (profilePhotoPriority ?? 1)
                : null,
        chatRoomId: category == MediaCategory.MEDIA_CATEGORY_CHAT_PHOTO
            ? chatRoomId
            : null,
        reportId:
            category == MediaCategory.MEDIA_CATEGORY_INQUIRY_EVIDENCE_PHOTO
                ? reportId
                : null,
      );
      chunkNumber += 1;
      offset = end;
    }
  }

  /// ファイルからStreamを構築する
  Stream<ChunkedMediaUploadRequest> buildStreamFromFile({
    required String filePath,
    required String fileName,
    required MediaCategory category,
    int chunkSize = 512 * 1024,
    int? profilePhotoPriority,
    String? chatRoomId,
    String? reportId,
    PhotoCropSettings? photoCropSettings,
    Map<String, String>? metadata,
  }) async* {
    final file = File(filePath);
    final total = await file.length();
    validate(
      category: category,
      totalBytes: total,
      profilePhotoPriority: profilePhotoPriority,
      chatRoomId: chatRoomId,
      reportId: reportId,
    );

    final uploadManageKey = generateUploadManageKey();
    final contentType = detectContentType(fileName);

    var chunkNumber = 0;
    var sent = 0;
    var isFirst = true;
    await for (final data in file.openRead()) {
      var offset = 0;
      while (offset < data.length) {
        final end = (offset + chunkSize).clamp(0, data.length);
        final slice = data.sublist(offset, end);
        sent += slice.length;
        final isLast = sent >= total;
        yield ChunkedMediaUploadRequest(
          mediaCategory: category,
          chunkedData: ChunkedData(
            metadata: metadata,
            uploadManageKey: uploadManageKey,
            chunkNumber: chunkNumber,
            isLastChunk: isLast,
            chunkData: slice,
            fileName: isFirst ? fileName : null,
            contentType: isFirst ? contentType : null,
          ),
          // Send crop settings only in the first chunk
          photoCropSettings: isFirst ? photoCropSettings : null,
          profilePhotoPriority:
              category == MediaCategory.MEDIA_CATEGORY_PROFILE_PHOTO
                  ? (profilePhotoPriority ?? 1)
                  : null,
          chatRoomId: category == MediaCategory.MEDIA_CATEGORY_CHAT_PHOTO
              ? chatRoomId
              : null,
          reportId:
              category == MediaCategory.MEDIA_CATEGORY_INQUIRY_EVIDENCE_PHOTO
                  ? reportId
                  : null,
        );
        isFirst = false;
        chunkNumber += 1;
        offset = end;
      }
    }
  }
}

@riverpod
MediaUploadService mediaUploadService(Ref ref) => const MediaUploadService();
