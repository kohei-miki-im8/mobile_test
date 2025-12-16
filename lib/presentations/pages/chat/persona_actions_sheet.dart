part of 'chat_page.dart';

const _doNotShowAgainModalKey = 'do_not_show_persona_modal_again';

/// なりきり返信/挨拶ボタン
class _PersonaActionsEntry extends HookConsumerWidget {
  const _PersonaActionsEntry({
    required this.userId,
    required this.chatRoomId,
    required this.isPersonaGreeting,
  });

  final String userId;
  final String chatRoomId;
  final bool isPersonaGreeting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(chatPageViewModelProvider(chatRoomId));
    final notifier = ref.read(chatPageViewModelProvider(chatRoomId).notifier);

    Future<void> openPersonaSheet() async {
      await showModalBottomSheet<void>(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return GradientBorderContainer(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
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
            padding: const EdgeInsets.only(
              top: 12,
              left: 20,
              right: 20,
              bottom: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: [
                const _PersonaActionsSheetHeader(),
                const _PersonaActionsSheetTitle(),
                _PersonaActionsSheetBody(
                  chatRoomId: chatRoomId,
                  isPersonaGreeting: isPersonaGreeting,
                  doNotShowAgainKey: _doNotShowAgainModalKey,
                ),
              ],
            ),
          );
        },
      );
    }

    return TextButton(
      onPressed: () async {
        if (state.isCreatingPersonaAction) {
          return;
        }

        // 人格/口調サマリ未作成ならモーダルを出してカウンセリングへ
        final userStatus = state.userStatus;
        final hasPersonalitySummary = userStatus?.hasPersonalitySummary ?? false;
        final hasToneSummary = userStatus?.hasToneSummary ?? false;

        if (!hasPersonalitySummary || !hasToneSummary) {
          if (!context.mounted) {
            return;
          }
          await _showPersonaRequireCounselingModal(
            context,
            isPersonaGreeting: isPersonaGreeting,
          );
          return;
        }

        final prefs = await SharedPreferences.getInstance();
        final doNotShowAgain = prefs.getBool(_doNotShowAgainModalKey) ?? false;

        if (doNotShowAgain) {
          try {
            if (isPersonaGreeting) {
              await notifier.createPersonaGreeting(chatRoomId: chatRoomId);
            } else {
              await notifier.createPersonaReply(chatRoomId: chatRoomId);
            }
          } on Exception catch (e) {
            final econaError = EconaError.fromException(
              e,
              operation: isPersonaGreeting
                  ? EconaErrorOperation.personaReplyCreate
                  : EconaErrorOperation.personaGreetingCreate,
            );

            if (context.mounted) {
              await EconaNotification.showTopToast(
                context,
                message: econaError.operationMessage,
              );
            }
          }
          return;
        }
        await openPersonaSheet();
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        minimumSize: const Size(0, 28),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.icons.personaAction.svg(width: 24, height: 24),
          const SizedBox(width: 4),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            transitionBuilder: (child, anim) =>
                FadeTransition(opacity: anim, child: child),
            child: state.isCreatingPersonaAction
                ? const SizedBox(
              height: 16,
              width: 80,
              child: Center(
                child: EconaLoadingIndicator(
                  size: 14,
                  strokeWidth: 2,
                ),
              ),
            )
                : SizedBox(
              width: 80,
              child: Text(
                isPersonaGreeting ? 'なりきり挨拶' : 'なりきり返信',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: EconaTextStyle.labelSmall140(
                  color: EconaColor.grayNormal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _PersonaActionsSheetHeader extends StatelessWidget {
  const _PersonaActionsSheetHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'なりきり挨拶、なりきり返信',
          style: EconaTextStyle.labelMedium2140(
            color: EconaColor.grayNormal,
          ),
          textAlign: TextAlign.left,
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Assets.images.icons.close.image(height: 30, width: 30),
        ),
      ],
    );
  }
}

class _PersonaActionsSheetTitle extends StatelessWidget {
  const _PersonaActionsSheetTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'ワンタップで\nあなたらしいメッセージを再現！',
      style: EconaTextStyle.headlineHeadline2(
        color: EconaColor.grayDarkActive,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _PersonaActionsSheetBody extends HookConsumerWidget {
  const _PersonaActionsSheetBody({
    required this.chatRoomId,
    required this.isPersonaGreeting,
    required this.doNotShowAgainKey,
  });

  final String chatRoomId;
  final bool isPersonaGreeting;
  final String doNotShowAgainKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = useState(false);
    final notifier = ref.read(chatPageViewModelProvider(chatRoomId).notifier);

    return Column(
      spacing: 16,
      children: [
        Text(
          'AIがあなたの口調を再現して、お相手にぴったりのメッセージを提案してくれるので、スムーズに会話を楽しめます。',
          style: EconaTextStyle.regularMedium2160(
            color: EconaColor.grayDarkActive,
          ),
          textAlign: TextAlign.left,
          softWrap: true,
        ),
        EconaCheckbox(
          text: '次回から表示させない',
          textStyle: EconaTextStyle.regularMedium2160(
            color: EconaColor.grayDarkActive,
          ),
          value: isChecked.value,
          onChanged: (bool value) async {
            isChecked.value = value;
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool(doNotShowAgainKey, isChecked.value);
          },
        ),
        EconaGradientButton(
          text: 'つかってみる',
          onPressed: () async {
            context.pop();
            if(isPersonaGreeting) {
              await notifier.createPersonaGreeting(chatRoomId: chatRoomId);
            } else {
              await notifier.createPersonaReply(chatRoomId: chatRoomId);
            }
          },
        ),
      ],
    );
  }
}
