part of 'chat_page.dart';

class PinnedMessage extends HookConsumerWidget {
  const PinnedMessage({
    required this.chatRoomId,
    required this.text,
    super.key,
  });

  final String chatRoomId;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = useState(false);
    final notifier = ref.read(chatPageViewModelProvider(chatRoomId).notifier);

    if (!isExpanded.value) {
      return SizedBox(
        width: 353,
        height: 60,
        child: ShadowAndGradientBorderContainer(
          borderRadius: BorderRadius.circular(12),
          borderWidth: 1,
          gradients: [
            LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFFFFFFF).withValues(alpha: 1),
                const Color(0xFFFFFFFF).withValues(alpha: 0),
              ],
            ),
            const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFD6E3F3),
                Color(0xFFFFFFFF),
              ],
            ),
          ],
          backgroundColor: EconaColor.tabBackgroundActive,
          innerShadows: const [],
          dropShadows: const [],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.icons.pinned.svg(width: 20, height: 20),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    text,
                    style: EconaTextStyle.labelMedium1140(
                      color: EconaColor.grayDarkActive,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                InkWell(
                  onTap: () => isExpanded.value = true,
                  child:
                      Assets.images.icons.chevronDown.svg(width: 20, height: 20),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: 353,
      child: ShadowAndGradientBorderContainer(
        borderRadius: BorderRadius.circular(12),
        borderWidth: 1,
        gradients: [
          LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFFFFFFF).withValues(alpha: 1),
              const Color(0xFFFFFFFF).withValues(alpha: 0),
            ],
          ),
          const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFD6E3F3),
              Color(0xFFFFFFFF),
            ],
          ),
        ],
        backgroundColor: EconaColor.tabBackgroundActive,
        innerShadows: const [],
        dropShadows: const [],
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child:
                        Assets.images.icons.pinned.svg(width: 20, height: 20),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        text,
                        style: EconaTextStyle.labelMedium1140(
                          color: EconaColor.grayDarkActive,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                  height: 24,
                  thickness: 1,
                  indent: 4,
                  endIndent: 4,
                  color: EconaColor.grayLightActive),
              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft,
                    ),
                    onPressed: () async {
                      await notifier.updatePinnedMessage(
                        chatRoomId: chatRoomId,
                        chatMessageId: null,
                      );
                    },
                    child: Text(
                      'ピン止めを解除する',
                      style: EconaTextStyle.labelXSmall(
                        color: EconaColor.grayDarkActive,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: InkWell(
                      onTap: () => isExpanded.value = false,
                      child: Assets.images.icons.chevronUp
                          .svg(width: 20, height: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



