import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_photo_view_model.g.dart';

@riverpod
class SelectedPhotoViewModel extends _$SelectedPhotoViewModel {
  @override
  File? build() {
    ref.keepAlive();
    return null;
  }

  /// 選択された画像を設定
  void setSelectedPhoto(File photo) {
    state = photo;
  }

  /// 選択された画像をクリア
  void clearSelectedPhoto() {
    state = null;
  }
}

