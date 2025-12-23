part of 'chat_page.dart';

class DateIntent extends HookConsumerWidget {
  const DateIntent({
    required this.currentUserId,
    required this.chatRoomId,
    required this.chatMessageId,
    required this.nickname,
    required this.initialHasDateIntention,
    super.key,
  });

  final String currentUserId;
  final String chatRoomId;
  final String chatMessageId;
  final String nickname;
  final bool initialHasDateIntention;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIntended = useState(initialHasDateIntention);
    final state = ref.read(chatPageViewModelProvider(chatRoomId));
    final notifier = ref.read(chatPageViewModelProvider(chatRoomId).notifier);

    useEffect(() {
      // 入室時に最新のデート意向を取得し、自分のhas_date_intentionを反映
      () async {
        try {
          await notifier.getDateIntention(chatRoomId: chatRoomId);
          final myDateIntention = state.dateIntention?.hasDateIntention ?? false;
          isIntended.value = myDateIntention;
        } on Exception catch (_) {
          // デート意向の取得に失敗しても何もしない
        }
      }();
      return null;
    }, [chatRoomId, currentUserId]);

    return Container(
      padding: const EdgeInsets.all(20),
      child: GradientBorderBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'このメッセージはお二人に表示されています',
                style: EconaTextStyle.labelSmall140(
                  color: EconaColor.grayDarkActive,
                ),
              ),
              SizedBox(
                width: 321,
                child: Text(
                  'やりとりが続いており、相性がとても良いようです。\n\n実際に ${nickname} さん とお会いしてみたい場合は、会ってみたいに切り替えましょう！',
                  style: EconaTextStyle.regularSmall140(
                    color: EconaColor.grayDarkActive,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      'もう少し\nやり取りして決める',
                      style: EconaTextStyle.regularSmall140(
                        color: EconaColor.grayDarkActive,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  EconaToggle(
                    enable: isIntended.value,
                    // 一度Trueにすると戻せない仕様
                    isReadOnly: isIntended.value,
                    onTap: () async {
                      isIntended.value = !isIntended.value;
                      await notifier.updateDateIntention(
                        chatMessageId: chatMessageId,
                        hasIntention: isIntended.value,
                      );
                    },
                  ),
                  SizedBox(
                    width: 120,
                    child: Text(
                      '会ってみたい',
                      style: EconaTextStyle.regularSmall140(
                        color: EconaColor.grayDarkActive,
                      ),
                      textAlign: TextAlign.center,
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
