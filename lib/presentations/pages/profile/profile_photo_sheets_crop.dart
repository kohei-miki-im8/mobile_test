part of 'profile_photo_sheets.dart';

class _CropSheetBody extends HookConsumerWidget {
  const _CropSheetBody({
    required this.profileState,
    required this.photoEditing,
    required this.onConfirmCrop,
    required this.onRePick,
  });

  final ProfilePageState profileState;
  final PhotoEditing? photoEditing;
  final Future<void> Function(
      BuildContext context, {
      required File file,
      required PhotoCropSettings cropSettings,
      }) onConfirmCrop;

  final void Function(BuildContext context) onRePick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = photoEditing?.selectedPhotoFile;
    final controller = useMemoized(TransformationController.new);
    final viewportSize = useRef<Size?>(null);
    final sheetsState = ref.watch(profilePhotoSheetsViewModelProvider);
    final isUploading = sheetsState.isUploading;

    // 既存のクロップ状態を復元
    useEffect(() {
      final cropState = photoEditing?.cropState;
      final m = controller.value;
      final isIdentity = m.storage[0] == 1.0 && m.storage[5] == 1.0 &&
                        m.storage[12] == 0.0 && m.storage[13] == 0.0;
      if (cropState != null && isIdentity) {
        final m = Matrix4.identity();
        m.storage[0] = cropState.scale;
        m.storage[5] = cropState.scale;
        m.storage[12] = cropState.transX;
        m.storage[13] = cropState.transY;
        controller.value = m;
      }
      return null;
    }, [photoEditing?.cropState]);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '位置とサイズの調整',
                style: EconaTextStyle.labelMedium2140(
                  color: EconaColor.grayNormal,
                ),
              ),
            ),
            const SizedBox(height: 8),
            _PhotoCropAndPreview(
              file: file,
              viewPortSize: viewportSize,
              controller: controller,
            ),
            const SizedBox(height: 16),
            _UploadButton(
              isUploading: isUploading,
              file: file,
              controller: controller,
              viewPortSize: viewportSize,
              onConfirmCrop: onConfirmCrop,
            ),
            const SizedBox(height: 8),
            _ReselectButton(
              onRePick: onRePick,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _PhotoCropAndPreview extends StatelessWidget {
  const _PhotoCropAndPreview({
    required this.file,
    required this.viewPortSize,
    required this.controller,
  });

  final File? file;
  final ObjectRef<Size?> viewPortSize;
  final TransformationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 333,
      height: 444,
      child: ShadowAndGradientBorderContainer(
        borderRadius: BorderRadius.circular(24),
        borderWidth: 1,
        gradients: const [],
        backgroundColor: EconaColor.grayLightActive,
        innerShadows: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 20,
            color: const Color(0xFF353E72).withValues(alpha: 0.1),
          ),
          BoxShadow(
            offset: const Offset(-1, -1),
            blurRadius: 3,
            color: const Color(0xFFFFFFFF).withValues(alpha: 0.8),
          ),
        ],
        dropShadows: const [],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: file == null
              ? const Center(child: Text('画像が選択されていません'))
              : LayoutBuilder(
            builder: (context, constraints) {
              viewPortSize.value = Size(
                constraints.maxWidth,
                constraints.maxHeight,
              );
              return InteractiveViewer(
                transformationController: controller,
                minScale: 1,
                maxScale: 4,
                panEnabled: true,
                scaleEnabled: true,
                boundaryMargin: const EdgeInsets.all(160),
                clipBehavior: Clip.hardEdge,
                child: Image.file(file!),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _UploadButton extends ConsumerWidget {
  const _UploadButton({
    required this.file,
    required this.isUploading,
    required this.controller,
    required this.viewPortSize,
    required this.onConfirmCrop,
  });

  final File? file;
  final bool isUploading;
  final TransformationController controller;
  final ObjectRef<Size?> viewPortSize;
  final Future<void> Function(BuildContext, {
  required PhotoCropSettings cropSettings,
  required File file,
  }) onConfirmCrop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: EconaPlainButton(
        text: isUploading ? 'アップロード中…' : '次へ',
        onPressed: file == null || isUploading
            ? null
            : () async {
          final m = controller.value;
          final scale = m.storage[0];
          final transX = m.storage[12];
          final transY = m.storage[13];
          final vp = viewPortSize.value;

          // nullになることはない想定だが念のため
          if (vp == null) {
            if (context.mounted) {
              await EconaNotification.showTopToast(
                context,
                message: '画像のトリミングに失敗しました。もう一度お試しください',
              );
            }
            return;
          }

          // クロップ状態をエンティティに保存
          ref.read(profilePhotoSheetsViewModelProvider.notifier)
              .setCropState(
                PhotoCropState(
                  scale: scale,
                  transX: transX,
                  transY: transY,
                  viewportWidth: vp.width,
                  viewportHeight: vp.height,
                ),
              );

          try {

            final vpW = vp.width;
            final vpH = vp.height;
            final centerX = ((vpW / 2 - transX) / scale).round();
            final centerY = ((vpH / 2 - transY) / scale).round();
            final cropSettings = PhotoCropSettings(
              centerX: centerX,
              centerY: centerY,
              scale: scale,
            );

            await onConfirmCrop(
              context,
              file: file!,
              cropSettings: cropSettings,
            );
          } catch (_) {
            rethrow;
          }
        },
      ),
    );
  }
}

class _ReselectButton extends StatelessWidget {
  const _ReselectButton({required this.onRePick});

  final void Function(BuildContext context) onRePick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: EconaPlainButton(
        text: '選びなおす',
        onPressed: () {
          onRePick(context);
        },
      ),
    );
  }
}