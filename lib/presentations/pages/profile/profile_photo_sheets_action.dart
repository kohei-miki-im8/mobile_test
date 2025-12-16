
part of 'profile_photo_sheets.dart';

enum _ActionSheetTrigger { gallery, camera }

class _ActionSheetBody extends HookConsumerWidget {
  const _ActionSheetBody({
    required this.isMain,
    required this.subIndex,
    required this.onPickFromGallery,
    required this.onPickFromCamera,
    this.onEditCaption,
    this.onDeletePhoto,
    this.profileState,
    this.existingPhoto,
  });

  final bool isMain;
  final int? subIndex;
  final RequiringReviewProfilePhoto? existingPhoto;
  final ProfilePageState? profileState;

  final Future<void> Function(BuildContext context) onPickFromGallery;
  final Future<void> Function(BuildContext context) onPickFromCamera;
  final Future<void> Function(BuildContext context)? onEditCaption;
  final Future<void> Function(BuildContext context)? onDeletePhoto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gender = profileState?.profile?.genderCode;
    List<MapEntry<String, String>> goodList;
    List<MapEntry<String, String>> badList;

    if (gender == GenderCode.GENDER_CODE_MALE) {
      goodList = EconaSamplePhoto.goodPhotoMale.entries.toList();
      badList = EconaSamplePhoto.badPhotoMale.entries.toList();
    } else {
      goodList = EconaSamplePhoto.goodPhotoFemale.entries.toList();
      badList = EconaSamplePhoto.badPhotoFemale.entries.toList();
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Text(
              '写真選びのポイント',
              style: EconaTextStyle.labelMedium2140(
                color: EconaColor.grayNormal,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Good！',
              style: EconaTextStyle.labelMedium2140(
                color: EconaColor.grayNormal,
              ),
            ),
            _SamplePhotoGrid(samplePhotos: goodList),
            const SizedBox(height: 12),
            Text(
              'Bad',
              style: EconaTextStyle.labelMedium2140(
                color: EconaColor.grayNormal,
              ),
            ),
            _SamplePhotoGrid(samplePhotos: badList),
            const SizedBox(height: 24),
            _ActionButtonList(
              onPickFromGallery: onPickFromGallery,
              onPickFromCamera: onPickFromCamera,
              onEditCaption: onEditCaption,
              onDeletePhoto: onDeletePhoto,
              canEditCaption: existingPhoto != null && onEditCaption != null,
              canDeletePhoto: !isMain && existingPhoto != null && onDeletePhoto != null,
            )
          ],
        ),
      ),
    );
  }
}

class _SamplePhotoGrid extends StatelessWidget {
  const _SamplePhotoGrid({
    required this.samplePhotos,
  });

  final List<MapEntry<String, String>> samplePhotos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 113 / 183,
      ),
      itemCount: samplePhotos.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  samplePhotos[index].key,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              samplePhotos[index].value,
              style: EconaTextStyle.labelSmall140(
                color: EconaColor.grayNormal,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
    );
  }
}

class _ActionButtonList extends HookConsumerWidget {
  const _ActionButtonList({
    required this.onPickFromGallery,
    required this.onPickFromCamera,
    this.onEditCaption,
    this.onDeletePhoto,
    this.canEditCaption = false,
    this.canDeletePhoto = false,
  });

  final Future<void> Function(BuildContext context) onPickFromGallery;
  final Future<void> Function(BuildContext context) onPickFromCamera;
  final Future<void> Function(BuildContext context)? onEditCaption;
  final Future<void> Function(BuildContext context)? onDeletePhoto;
  final bool canEditCaption;
  final bool canDeletePhoto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profilePhotoSheetsViewModelProvider);
    final isProcessing = useState(false);
    final activeTrigger = useState<_ActionSheetTrigger?>(null);

    String buttonText(_ActionSheetTrigger trigger) {
      if (isProcessing.value && activeTrigger.value == trigger) {
        return state.isUploading ? 'アップロード中…' : '選択中…';
      }
      return trigger == _ActionSheetTrigger.gallery ? 'ライブラリから選ぶ' : '撮影する';
    }

    return Column(
      spacing: 12,
      children: [
        EconaPlainButton(
          text: buttonText(_ActionSheetTrigger.gallery),
          expandWidth: true,
          onPressed: isProcessing.value
              ? null
              : () async {
            isProcessing.value = true;
            activeTrigger.value = _ActionSheetTrigger.gallery;
            try {
              await onPickFromGallery(context);
            } finally {
              if (context.mounted) {
                isProcessing.value = false;
                activeTrigger.value = null;
              }
            }
          },
        ),
        EconaPlainButton(
          text: buttonText(_ActionSheetTrigger.camera),
          expandWidth: true,
          onPressed: isProcessing.value
              ? null
              : () async {
            isProcessing.value = true;
            activeTrigger.value = _ActionSheetTrigger.camera;
            try {
              await onPickFromCamera(context);
            } finally {
              if (context.mounted) {
                isProcessing.value = false;
                activeTrigger.value = null;
              }
            }
          },
        ),
        if (canEditCaption) ...[
          EconaPlainButton(
            text: 'コメントを追加する・編集する',
            expandWidth: true,
            onPressed: isProcessing.value
                ? null
                : () async {
              await onEditCaption!(context);
            },
          ),
        ],
        if (canDeletePhoto) ...[
          EconaPlainButton(
            text: '写真を削除する',
            expandWidth: true,
            onPressed: isProcessing.value
                ? null
                : () async {
              await onDeletePhoto!(context);
            },
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}