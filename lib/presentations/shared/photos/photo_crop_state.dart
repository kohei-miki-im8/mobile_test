import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoCropState {
  const PhotoCropState({
    required this.scale,
    required this.transX,
    required this.transY,
    required this.viewportWidth,
    required this.viewportHeight,
  });

  final double scale;
  final double transX;
  final double transY;
  final double viewportWidth;
  final double viewportHeight;
}

class PhotoCropStateViewModel extends StateNotifier<PhotoCropState?> {
  PhotoCropStateViewModel() : super(null);

  void set(PhotoCropState value) => state = value;
  void clear() => state = null;
}

final photoCropStateViewModelProvider =
    StateNotifierProvider<PhotoCropStateViewModel, PhotoCropState?>(
  (ref) => PhotoCropStateViewModel(),
);
