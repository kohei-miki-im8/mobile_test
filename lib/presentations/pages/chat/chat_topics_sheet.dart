part of 'chat_page.dart';

Future<void> _openChatTopicsContentSheet({
  required BuildContext context,
  required WidgetRef ref,
  required String chatRoomId,
  required ThumbnailUser toUser,
}) async {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        final pageController = PageController();
        return Consumer(
          builder: (context, ref, __) {
            final state = ref.watch(chatPageViewModelProvider(chatRoomId));
            final isLoading = state.isFetchingTopics || state.isCreatingTopics;
            final topics = state.chatTopics.items;
            final messages = topics.map((t) => t.message).toList();

            if (isLoading) {
              return const Center(child: EconaLoadingIndicator());
            }

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
                top: 24,
                left: 20,
                right: 4,
                bottom: 48,
              ),
              child: _TopicsSheetBody(
                pageController: pageController,
                messages: messages,
                chatRoomId: chatRoomId,
                isLoading: isLoading,
                topics: topics,
                toUser: toUser,
              ),
            );
          },
        );
      },
    );
  });
}

///　話題ボタン
class _ChatTopicsEntry extends HookConsumerWidget {
  const _ChatTopicsEntry({
    required this.userId,
    required this.chatRoomId,
    required this.toUser,
  });

  final String userId;
  final String chatRoomId;
  final ThumbnailUser toUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const doNotShowAgainTopicsKey = 'do_not_show_topics_modal_again';
    final state = ref.read(chatPageViewModelProvider(chatRoomId));

    Future<void> openTopics() async {
      final prefs = await SharedPreferences.getInstance();
      final skipSheet = prefs.getBool(doNotShowAgainTopicsKey) ?? false;
      final notifier = ref.read(chatPageViewModelProvider(chatRoomId).notifier);

      // 説明のスキップ有無で分岐し、まずはGetChatTopicsを実行
      if (skipSheet) {
        await notifier.getChatTopics(chatRoomId: chatRoomId);

        if (!context.mounted) return;
        final modalContext = Navigator.of(context, rootNavigator: true).context;

        final items = ref.read(chatPageViewModelProvider(chatRoomId)).chatTopics.items;

        // ポイント確認
        if (items.isEmpty) {
          final confirmed = await _showTopicPointConfirmModal(modalContext);
          if (!confirmed) return;
          await notifier.createChatTopics(chatRoomId: chatRoomId);
          await notifier.getChatTopics(chatRoomId: chatRoomId);
        }

        // シート表示
        if (modalContext.mounted) {
          await _openChatTopicsContentSheet(
            context: modalContext,
            ref: ref,
            chatRoomId: chatRoomId,
            toUser: toUser,
          );
          return;
        }
      }

      if (!context.mounted) return;
      final introContext = Navigator.of(context, rootNavigator: true).context;
      await showModalBottomSheet<void>(
        context: introContext,
        useRootNavigator: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return _ChatTopicsIntroSheet(
            chatRoomId: chatRoomId,
            toUser: toUser,
          );
        },
      );
    }

    return TextButton(
      onPressed: () async {
        // 人格/口調サマリ未作成ならモーダルを出してカウンセリングへ
        final userStatus = state.userStatus;
        final hasPersonalitySummary = userStatus?.hasPersonalitySummary ?? false;
        final hasToneSummary = userStatus?.hasToneSummary ?? false;

        if (!hasPersonalitySummary || !hasToneSummary) {
          await showDialog<void>(
            context: context,
            builder: (dialogContext) => Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              insetPadding: const EdgeInsets.symmetric(horizontal: 12),
              child: EconaModal(
                message: '話題を利用するには、AIカウンセリングを行ってください',
                buttonText: 'AIカウンセリングで\n価値観診断をする',
                onButtonPressed: () {
                  dialogContext.pop();
                  const CounselingRouteData().push<void>(dialogContext);
                },
              ),
            ),
          );
          return;
        }
        await openTopics();
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        minimumSize: const Size(0, 28),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Row(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.icons.chatTopics.svg(width: 24, height: 24),
          Text(
            '話題',
            style: EconaTextStyle.labelSmall140(color: EconaColor.grayNormal),
          ),
        ],
      ),
    );
  }
}

/// 話題シート構築
class _TopicsSheetBody extends HookConsumerWidget {
  const _TopicsSheetBody({
    required this.pageController,
    required this.messages,
    required this.chatRoomId,
    required this.isLoading,
    required this.topics,
    required this.toUser,
  });

  final PageController pageController;
  final List<String> messages;
  final String chatRoomId;
  final bool isLoading;
  final List<ChatTopicEntity> topics;
  final ThumbnailUser toUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ValueNotifier<int>(0);
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        const _ChatTopicsSheetHeader(text: 'こちらの話題はどうですか'),
        _ChatTopicsContents(
          chatRoomId: chatRoomId,
          pageController: pageController,
          currentPage: currentPage,
          messages: messages,
          topics: topics,
          toUser: toUser,
        ),
        _ChatTopicsPageIndicator(
          currentPage: currentPage,
          messages: messages,
        ),
        _ChatTopicsButtonsRow(
          chatRoomId: chatRoomId,
          messages: messages,
          currentPage: currentPage,
        ),
      ],
    );
  }
}

/// 話題シートの内容
class _ChatTopicsContents extends ConsumerWidget {
  const _ChatTopicsContents({
    required this.chatRoomId,
    required this.pageController,
    required this.currentPage,
    required this.messages,
    required this.topics,
    required this.toUser,
  });

  final String chatRoomId;
  final PageController pageController;
  final ValueNotifier<int> currentPage;
  final List<String> messages;
  final List<ChatTopicEntity> topics;
  final ThumbnailUser toUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatPageViewModelProvider(chatRoomId));
    final sheetHeight = MediaQuery.of(context).size.height * 0.55;
    if (state.isFetchingTopics) {
      return const SizedBox(
        width: 300,
        height: 306,
        child: Center(child: EconaLoadingIndicator(size: 24)),
      );
    }
    if (messages.isEmpty || topics.isEmpty) {
      return const SizedBox(
        width: 300,
        height: 306,
        child: Center(child: EconaLoadingIndicator(size: 24)),
      );
    }

    // ChatTopic.photoId と相手ユーザーのプロフィール写真IDを紐付けてURLを解決
    final photos = toUser.profile.requiringReviewProfilePhotos;
    final Map<String, String> photoUrlById = {
      for (final p in photos)
        if (p.hasUserProfilePhotoId() &&
            p.userProfilePhotoId.isNotEmpty &&
            p.hasCurrentSignedImageUrls())
          p.userProfilePhotoId: resolveImageSize(
            urls: p.currentSignedImageUrls,
            kind: PhotoUrlKind.smallThumbnailWebpUrl,
          ),
    };

    // 相手ユーザーのタグID -> タグ名（userTagMapProvider を利用）
    final tagMapAsync = ref.watch(userTagMapProvider(toUser.userId));
    final Map<String, String> tagMap = tagMapAsync.maybeWhen(
      data: (map) => map,
      orElse: () => const <String, String>{},
    );

    return SizedBox(
      height: sheetHeight,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (int page) => currentPage.value = page,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final topic = topics[index];

          final photoId = topic.photoId;
          final String? photoUrl =
          photoId != null && photoId.isNotEmpty ? photoUrlById[photoId] : null;

          final tagId = topic.tagId;
          final String? tagName =
          tagId != null && tagId.isNotEmpty ? tagMap[tagId] : null;

          // tagId があり、かつ名称解決できたものを「タグ話題」として扱う
          final bool isTagTopic =
              tagId != null && tagId.isNotEmpty && tagName != null;

          return ShadowAndGradientBorderContainer(
            borderRadius: BorderRadius.circular(16),
            borderWidth: 1,
            gradients: const [],
            backgroundColor: Colors.white,
            innerShadows: const [],
            dropShadows: [
              BoxShadow(
                color: const Color(0xFF587CA7).withValues(alpha: 0.14),
                blurRadius: 12,
                offset: const Offset(6, 6),
              ),
              BoxShadow(
                color: const Color(0xFFFFFFFF).withValues(alpha: 0.5),
                blurRadius: 12,
                offset: const Offset(-4, -4),
              ),
            ],
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      // 高さが足りないときはカード高いっぱいに広げる
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 24,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isTagTopic ? 'お相手のタグについて' : 'お相手の写真について',
                          style: EconaTextStyle.labelMedium2140(
                            color: EconaColor.grayDarkActive,
                          ),
                        ),
                        if (isTagTopic)
                          EconaTag(tag: tagName)
                        else
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: photoUrl != null && photoUrl.isNotEmpty
                                ? Image.network(
                              photoUrl,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            )
                                : Text(
                              '画像の読み込みに失敗しました。\n\n恐れ入りますが、他のメッセージを選択してください。',
                              style: EconaTextStyle.labelMedium2140(
                                color: EconaColor.grayDarkActive,
                              ),
                            ),
                          ),
                        Text(
                          'あなたのメッセージ',
                          style: EconaTextStyle.labelMedium2140(
                            color: EconaColor.grayDarkActive,
                          ),
                        ),
                        ChatBubble(
                          message: messages[index],
                          isMe: true,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

/// 話題シートのページインジケーター
class _ChatTopicsPageIndicator extends StatelessWidget {
  const _ChatTopicsPageIndicator({
    required this.currentPage,
    required this.messages,
  });

  final ValueNotifier<int> currentPage;
  final List<String> messages;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentPage,
      builder: (context, page, _) {
        if (messages.isEmpty) {
          return const SizedBox.shrink();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(messages.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: page == index
                    ? const LinearGradient(
                  colors: [Color(0xFFD097DB), Color(0xFF8887EE)],
                )
                    : null,
                color: page != index ? const Color(0x667A95BA) : null,
              ),
            );
          }),
        );
      },
    );
  }
}

/// 話題シートのボタン群
class _ChatTopicsButtonsRow extends ConsumerWidget {
  const _ChatTopicsButtonsRow({
    required this.chatRoomId,
    required this.messages,
    required this.currentPage,
  });

  final String chatRoomId;
  final List<String> messages;
  final ValueNotifier<int> currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(chatPageViewModelProvider(chatRoomId));
    final notifier = ref.read(chatPageViewModelProvider(chatRoomId).notifier);
    final inputNotifier = ref.read(econaChatInputViewModelProvider.notifier);
    final isBusy = ref.watch(chatPageViewModelProvider(chatRoomId)).isCreatingTopics
        || ref.watch(chatPageViewModelProvider(chatRoomId)).isFetchingTopics;

    return Row(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // 話題チェンジボタン
        IconButton(
          onPressed: isBusy
              ? null
              : () async {
                final confirmed = await _showTopicPointConfirmModal(context);
                if (!confirmed) return;
                await notifier.createChatTopics(chatRoomId: chatRoomId);
                await notifier.getChatTopics(chatRoomId: chatRoomId);
              },
          icon: isBusy
              ? const EconaLoadingIndicator()
              : Assets.images.icons.reload.image(width: 24, height: 24),
        ),
        // メッセージを編集ボタン
        EconaPlainButton(
          text: 'メッセージを編集',
          onPressed: () async {
            if (messages.isEmpty) return;
            final idx = currentPage.value.clamp(0, messages.length - 1);
            inputNotifier
              ..clearPhoto()
              ..setText(messages[idx])
              ..requestFocus();
            context.pop();
          },
        ),
        // この内容でお相手に送るボタン（データ空のときは非活性）
        Opacity(
          opacity: messages.isNotEmpty ? 1.0 : 0.5,
          child: IgnorePointer(
            ignoring: !messages.isNotEmpty,
            child: EconaPlainButton(
              text: 'この内容で送る',
              onPressed: () async {
                if (messages.isEmpty) return;
                final index = currentPage.value.clamp(0, messages.length - 1);
                // 入力欄へ反映
                inputNotifier
                  ..clearPhoto()
                  ..setText(messages[index]);
                await _handleSendMessageWithValidationCheck(
                  context,
                  ref,
                  userId: state.userStatus!.userId,
                  chatRoomId: chatRoomId,
                );
                if (context.mounted) {
                  context.pop();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// 説明シート
class _ChatTopicsIntroSheet extends HookConsumerWidget {
  const _ChatTopicsIntroSheet({
    required this.chatRoomId,
    required this.toUser,
  });

  final String chatRoomId;
  final ThumbnailUser toUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        bottom: 48,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          const _ChatTopicsSheetHeader(text: '話題'),
          const _ChatTopicsIntroSheetTitle(),
          _ChatTopicsIntroSheetBody(
            chatRoomId: chatRoomId,
            toUser: toUser,
          ),
        ],
      ),
    );
  }
}

/// 説明シートのタイトル
class _ChatTopicsIntroSheetTitle extends StatelessWidget {
  const _ChatTopicsIntroSheetTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'ワンタップで\n一緒に盛り上がるメッセージが作れる！',
      style: EconaTextStyle.headlineHeadline2(
        color: EconaColor.grayDarkActive,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// 説明シートの内容
class _ChatTopicsIntroSheetBody extends HookConsumerWidget {
  const _ChatTopicsIntroSheetBody({
    required this.chatRoomId,
    required this.toUser,
  });

  final String chatRoomId;
  final ThumbnailUser toUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String doNotShowAgainKey = 'do_not_show_topics_modal_again';

    final isChecked = useState(false);
    final notifier = ref.read(chatPageViewModelProvider(chatRoomId).notifier);

    return Column(
      spacing: 16,
      children: [
        Text(
          'AIがお相手の写真やタグをもとにメッセージを提案してくれるので、もう話題選びに困ることはありません。',
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
            // GetChatTopics実行
            await notifier.getChatTopics(chatRoomId: chatRoomId);

            // ポイント確認（GetChatTopics結果がなければ）
            final items = ref.read(chatPageViewModelProvider(chatRoomId)).chatTopics.items;
            if (items.isEmpty) {
              final confirmed = await _showTopicPointConfirmModal(context);
              if (!confirmed) return;
              await notifier.createChatTopics(chatRoomId: chatRoomId);
              await notifier.getChatTopics(chatRoomId: chatRoomId);
            }

            // 説明を閉じて内容シート表示
            if (!context.mounted) return;
            Navigator.pop(context);
            final rootContext = Navigator.of(context, rootNavigator: true).context;
            await _openChatTopicsContentSheet(
              context: rootContext,
              ref: ref,
              chatRoomId: chatRoomId,
              toUser: toUser,
            );
          },
        ),
      ],
    );
  }
}

/// シートの共通ヘッダー部分
class _ChatTopicsSheetHeader extends StatelessWidget {
  const _ChatTopicsSheetHeader({
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: EconaTextStyle.labelMedium2140(
            color: EconaColor.grayNormal,
          ),
          textAlign: TextAlign.left,
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Assets.images.icons.close.image(height: 32, width: 32),
        ),
      ],
    );
  }
}

/// ポイントモーダル表示
Future<bool> _showTopicPointConfirmModal(
    BuildContext context, {
      Future<void> Function()? onConfirmed,
      bool isCreate = true,
    }) async {
  var confirmed = false;

  final String message;
  final String buttonText;
  final String? subMessage;

  if(isCreate) {
    message = '3LPを消費して\n話題を作りますか？';
    buttonText = '話題を作る';
    subMessage = null;
  } else {
    message = '3LPを消費して\n話題を変えますか？';
    buttonText = '話題を変える';
    subMessage = '現在の話題は消去されます';
  }

  await showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 12),
      child: EconaModal(
        message: message,
        buttonText: buttonText,
        subMessage: subMessage,
        onButtonPressed: () async {
          confirmed = true;
          context.pop();
          if (onConfirmed != null) {
            await onConfirmed();
          }
        },
      ),
    ),
  );
  return confirmed;
}