import 'dart:io';

import 'package:camera/camera.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class EmbedCamera extends StatefulWidget {
  const EmbedCamera({
    required this.onImageCaptured,
    this.guideText = '',
    this.instructionText = '',
    super.key,
  });

  final Function(File) onImageCaptured;
  final String guideText;
  final String instructionText;

  @override
  State<EmbedCamera> createState() => _EmbedCameraState();
}

class _EmbedCameraState extends State<EmbedCamera> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;
  bool _isCapturing = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      // 現在の権限状態を取得
      var permission = await Permission.camera.status;
      debugPrint('camera status(before request): $permission');

      // granted 以外なら一度 request を投げる
      if (!permission.isGranted) {
        permission = await Permission.camera.request();
        debugPrint('camera status(after request): $permission');
      }

      // まだ granted でない場合は設定アプリに誘導
      if (!permission.isGranted) {
        if (mounted) {
          await showCupertinoDialog<void>(
            context: context,
            builder: (_) => CupertinoAlertDialog(
              title: const Text('カメラの権限が必要です'),
              content: const Text('設定アプリから「カメラ」を許可してください。'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('閉じる'),
                  onPressed: () => Navigator.pop(context),
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: const Text('設定を開く'),
                  onPressed: () async {
                    Navigator.pop(context);
                    await openAppSettings();
                  },
                ),
              ],
            ),
          );
        }
        setState(() {
          _errorMessage = 'カメラの権限が必要です';
        });
        return;
      }

      // ここから先は権限 OK の場合のみ
      _cameras = await availableCameras();
      if (_cameras == null || _cameras!.isEmpty) {
        setState(() {
          _errorMessage = 'カメラが見つかりません';
        });
        return;
      }

      final camera = _cameras!.first;

      _cameraController = CameraController(
        camera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _cameraController!.initialize();

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'カメラの初期化に失敗しました: $e';
      });
    }
  }

  Future<void> _captureImage() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    if (_isCapturing) return;

    setState(() {
      _isCapturing = true;
    });

    try {
      final XFile image = await _cameraController!.takePicture();
      widget.onImageCaptured(File(image.path));
    } catch (e) {
      if(!context.mounted) return;
      await EconaNotification.showTopToast(
        context,
        message: '撮影に失敗しました',
      );
    } finally {
      setState(() {
        _isCapturing = false;
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // カメラプレビュー領域
          Positioned.fill(
            child: Preview(
              cameraController: _cameraController,
              isInitialized: _isInitialized,
              errorMessage: _errorMessage,
              onRetry: _initializeCamera,
            ),
          ),

          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: GuideText(
              guideText: widget.guideText,
            ),
          ),

          // 四隅の枠線
          const CornerFrames(),

          // 下部のテキストと撮影ボタン
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CameraControls(
              instructionText: widget.instructionText,
              isCapturing: _isCapturing,
              onCapture: _captureImage,
            ),
          ),

          // 閉じるボタン
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            child: const CloseButton(),
          ),
        ],
      ),
    );
  }
}

class Preview extends StatelessWidget {
  const Preview({
    required this.cameraController,
    required this.isInitialized,
    required this.errorMessage,
    required this.onRetry,
  });

  final CameraController? cameraController;
  final bool isInitialized;
  final String? errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              errorMessage!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('再試行'),
            ),
          ],
        ),
      );
    }

    if (!isInitialized || cameraController == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EconaLoadingIndicator(),
            SizedBox(height: 16),
            Text(
              'カメラを初期化しています...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return CameraPreview(cameraController!);
  }
}

class GuideText extends StatelessWidget {
  const GuideText({
    required this.guideText,
  });

  final String guideText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          // 背景: 枠線用のテキスト
          Text(
            guideText,
            style: EconaTextStyle.labelMedium1140(
              foreground: Paint()
                ..style = PaintingStyle.stroke // 線で描画
                ..strokeWidth = 4             // 線の太さ
                ..color = Colors.black,       // 線の色
            ),
          ),
          // 前面: 塗りつぶし用のテキスト
          Text(
            guideText,
            style: EconaTextStyle.labelMedium1140(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CornerFrames extends StatelessWidget {
  const CornerFrames();

  static const double frameSize = 20;
  static const double frameThickness = 3;
  static const Color frameColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // 左上の角
        Positioned(
          top: 200,
          left: 40,
          child: CornerFrameWidget(
            borders: [
              Border(
                top: BorderSide(color: frameColor, width: frameThickness),
                left: BorderSide(color: frameColor, width: frameThickness),
              ),
            ],
          ),
        ),
        // 右上の角
        Positioned(
          top: 200,
          right: 40,
          child: CornerFrameWidget(
            borders: [
              Border(
                top: BorderSide(color: frameColor, width: frameThickness),
                right: BorderSide(color: frameColor, width: frameThickness),
              ),
            ],
          ),
        ),
        // 左下の角
        Positioned(
          bottom: 200,
          left: 40,
          child: CornerFrameWidget(
            borders: [
              Border(
                bottom: BorderSide(color: frameColor, width: frameThickness),
                left: BorderSide(color: frameColor, width: frameThickness),
              ),
            ],
          ),
        ),
        // 右下の角
        Positioned(
          bottom: 200,
          right: 40,
          child: CornerFrameWidget(
            borders: [
              Border(
                bottom: BorderSide(color: frameColor, width: frameThickness),
                right: BorderSide(color: frameColor, width: frameThickness),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CornerFrameWidget extends StatelessWidget {
  const CornerFrameWidget({
    required this.borders,
  });

  final List<Border> borders;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CornerFrames.frameSize,
      height: CornerFrames.frameSize,
      decoration: BoxDecoration(
        border: borders.first,
      ),
    );
  }
}

class CameraControls extends StatelessWidget {
  const CameraControls({
    required this.instructionText,
    required this.isCapturing,
    required this.onCapture,
  });

  final String instructionText;
  final bool isCapturing;
  final VoidCallback onCapture;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 説明テキスト
          Stack(
            children: <Widget>[
              // 背景: 枠線用のテキスト
              Text(
                instructionText,
                textAlign: TextAlign.center,
                style: EconaTextStyle.labelMedium1140(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke // 線で描画
                    ..strokeWidth = 4             // 線の太さ
                    ..color = Colors.black,       // 線の色
                ),
              ),
              // 前面: 塗りつぶし用のテキスト
              Text(
                instructionText,
                textAlign: TextAlign.center,
                style: EconaTextStyle.labelMedium1140(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          // 撮影ボタン
          CaptureButton(
            isCapturing: isCapturing,
            onCapture: onCapture,
          ),
        ],
      ),
    );
  }
}

class CaptureButton extends StatelessWidget {
  const CaptureButton({
    required this.isCapturing,
    required this.onCapture,
  });

  final bool isCapturing;
  final VoidCallback onCapture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isCapturing ? null : onCapture,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCapturing ? Colors.grey : Colors.white,
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
        ),
        child: isCapturing
            ? const EconaLoadingIndicator()
            : const Icon(
          Icons.camera_alt,
          size: 32,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.close,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
