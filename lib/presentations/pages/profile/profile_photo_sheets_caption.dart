part of 'profile_photo_sheets.dart';

class _CaptionSheetBody extends HookConsumerWidget {
  const _CaptionSheetBody({
    required this.photoEditing,
    required this.onSaveCaption,
    required this.onRePick,
  });

  final PhotoEditing? photoEditing;
  final Future<void> Function(
      BuildContext context, {
      required String text,
      }) onSaveCaption;
  final Future<void> Function(BuildContext context) onRePick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final scrollController = useScrollController();
    final focusNode = useFocusNode();
    final sheetsState = ref.watch(profilePhotoSheetsViewModelProvider);
    final isSaving = sheetsState.isSaving;

    // 既存のキャプションを設定（既存写真を編集中の場合）
    useEffect(() {
      final photoEditing = sheetsState.photoEditing;
      final editingPhoto = photoEditing?.editingPhoto;
      if (editingPhoto != null) {
        controller
          ..text = editingPhoto.caption
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
      } else {
        controller
          ..text = ''
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
      }
      return null;
    }, [photoEditing?.editingPhoto?.userProfilePhotoId]);

    useEffect(() {
      void listener() {
        if (focusNode.hasFocus) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (scrollController.hasClients) {
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              );
            }
          });
        }
      }

      focusNode.addListener(listener);
      return () => focusNode.removeListener(listener);
    }, [focusNode]);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '写真',
                  style: EconaTextStyle.labelMedium2140(
                    color: EconaColor.grayNormal,
                  ),
                ),
              ),
              _PhotoPreview(
                photoEditing: photoEditing,
              ),
              _CaptionInputArea(
                controller: controller,
                focusNode: focusNode,
              ),
              _CaptionSaveButton(
                controller: controller,
                isSaving: isSaving,
                onSave: onSaveCaption,
              ),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: EconaPlainButton(
                  text: '選びなおす',
                  onPressed: isSaving
                      ? null
                      : () async {
                    await onRePick(context);
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhotoPreview extends HookConsumerWidget {
  const _PhotoPreview({
    required this.photoEditing,
  });

  final PhotoEditing? photoEditing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editingPhoto = photoEditing?.editingPhoto;

    // エンティティ側 SignedImageUrls から表示用URLを決定
    final urls = editingPhoto?.pendingSignedImageUrls ?? editingPhoto?.currentSignedImageUrls;
    String imageUrl = '';
    if (urls != null) {
      if ((urls.largeThumbnailWebpUrl ?? '').isNotEmpty) {
        imageUrl = urls.largeThumbnailWebpUrl!;
      } else if ((urls.originUrl ?? '').isNotEmpty) {
        imageUrl = urls.originUrl!;
      }
    }

    return SizedBox(
      width: 333,
      height: 444,
      child: ShadowAndGradientBorderContainer(
        borderRadius: BorderRadius.circular(16),
        borderWidth: 1,
        gradients: const [],
        backgroundColor: EconaColor.grayLightActive,
        innerShadows: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 12,
            color: const Color(0xFF353E72).withValues(alpha: 0.1),
          ),
        ],
        dropShadows: const [],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: (imageUrl.isNotEmpty)
              ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
              )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _CaptionInputArea extends StatelessWidget {
  const _CaptionInputArea({
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 82,
      child: ShadowAndGradientBorderContainer(
        borderRadius: BorderRadius.circular(16),
        borderWidth: 1,
        gradients: const [
          LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFD6E3F3),
              Color(0xFFFFFFFF),
            ],
          ),
          LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
            ],
          ),
        ],
        backgroundColor: Colors.white,
        innerShadows: [
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 14,
            color: const Color(0xFFC1C7EE).withValues(alpha: 0.5),
          ),
          BoxShadow(
            offset: const Offset(-4, -4),
            blurRadius: 9,
            color: const Color(0xFFFFFFFF).withValues(alpha: 0.88),
          ),
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            color: const Color(0xFFC5C1EE).withValues(alpha: 0.25),
          ),
        ],
        dropShadows: const [
          BoxShadow(
            offset: Offset(-6, -6),
            blurRadius: 20,
            color: Color(0xFFFFFFFF),
          ),
        ],
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          maxLength: 24,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            hintText: '写真の説明やお相手にアピールしたい内容を一言',
            hintStyle: EconaTextStyle.labelHintText(
              color: EconaColor.chatInputHintText,
            ),
            border: InputBorder.none,
          ),
          onChanged: (_) {},
        ),
      ),
    );
  }
}

class _CaptionSaveButton extends StatelessWidget {
  const _CaptionSaveButton({
    required this.controller,
    required this.isSaving,
    required this.onSave,
  });

  final TextEditingController controller;
  final bool isSaving;
  final Future<void> Function(BuildContext context, {required String text}) onSave;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: EconaGradientButton(
        text: isSaving ? '保存中…' : '保存',
        onPressed: isSaving
            ? null
            : () async {
          final text = controller.text.trim();
          await onSave(
            context,
            text: text,
          );
        },
      ),
    );
  }
}