import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_picker_service.g.dart';

/// 画像選択サービス
class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  /// ギャラリーから画像を選択
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80, // 画質を調整（0-100）
        maxWidth: 1920,
        maxHeight: 1920,
      );

      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      // エラーハンドリング
      rethrow;
    }
  }

  /// カメラから画像を撮影
  Future<File?> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxWidth: 1920,
        maxHeight: 1920,
      );

      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      // エラーハンドリング
      rethrow;
    }
  }

}

@riverpod
ImagePickerService imagePickerService(Ref ref) {
  return ImagePickerService();
}