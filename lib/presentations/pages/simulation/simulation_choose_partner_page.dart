import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/panel.dart';
import 'package:econa_mobile_app/presentations/components/photo_frame.dart';
import 'package:econa_mobile_app/presentations/components/shadow_container.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/simulation/simulation_chat_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/simulation/simulation_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:econa_mobile_app/presentations/util/age.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SimulationChoosePartnerPage extends HookConsumerWidget {
  const SimulationChoosePartnerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(simulationPageViewModelProvider);
    final notifier = ref.watch(simulationPageViewModelProvider.notifier);

    // 初回マウント時にfetchPartnersを実行
    useEffect(() {
      final route = GoRouter.of(context);
      final targetLocation = const SimulationChoosePartnerRouteData().location;
      bool hasExecutedInitial = false;

      void routeListener() {
        // 次のフレームで確認（ルート変更が反映された後）
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;

          // routerDelegate.currentConfigurationの最後の要素を確認
          final config = route.routerDelegate.currentConfiguration;
          if (config.isEmpty) return;

          final lastMatch = config.last;
          final currentLocation = lastMatch.matchedLocation;

          if (currentLocation == targetLocation) {
            // 初回マウント時は既に実行済みなのでスキップ
            if (!hasExecutedInitial) {
              hasExecutedInitial = true;
              return;
            }
            notifier.fetchPartners();
          }
        });
      }

      // 初回マウント時に実行
      Future.microtask(() async {
        await notifier.fetchPartners();
        hasExecutedInitial = true;
      });

      // routerDelegateを監視して、ルート変更を検知
      route.routerDelegate.addListener(routeListener);

      return () {
        route.routerDelegate.removeListener(routeListener);
      };
    }, const []);

    final selectedChatRoom = useState<SimulatorChatRoom?>(null);
    final selectedChatRoomIndex = useState<int?>(null);

    const titleText = '会話するお相手を選んでください';
    const cautionaryNoteText = '※ニックネームは仮名です。\n※AIによる架空の相手の為、実際の出会いはありません。';
    final buttonGradient = selectedChatRoom.value == null
        ? const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [EconaColor.grayLightActive, EconaColor.grayLightActive],
    )
        : const LinearGradient(
      begin: Alignment(0, 0.44),
      end: Alignment(1.08, 0.50),
      colors: [Color(0xFFD097DB), Color(0xFF8887EE)],
    );
    final buttonShadows = selectedChatRoom.value == null
        ? null
        : [
      const BoxShadow(
        color: Color(0xFF9A94EE),
        blurRadius: 20,
        offset: Offset(4, 4),
      ),
      const BoxShadow(
        color: Color(0xFFFFFFFF),
        blurRadius: 20,
        offset: Offset(-6, -6),
      ),
      BoxShadow(
        color: const Color(0xFFB691E2).withValues(alpha: 32),
        blurRadius: 12,
        offset: const Offset(2, 2),
      ),
    ];

    final chatRooms = state.simulationChatRooms;

    if(state.isLoading) {
      return const Center(child: EconaLoadingIndicator());
    }

    return Scaffold(
      appBar: CenterAppBar(
        leading: IconButton(
          icon: Assets.images.icons.close.image(
            height: 32,
            width: 32,
          ),
          iconSize: 32,
          padding: EdgeInsets.zero,
          onPressed: context.pop,
        ),
        titleText: EconaAppBarText.simulationTitle,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: chatRooms.isEmpty
            ? const Center(child: Text('お相手が見つかりませんでした。'))
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _Title(text: titleText),
            const SizedBox(height: 32),
            ListView.separated(
              shrinkWrap: true,
              itemCount: chatRooms.length,
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16),
              itemBuilder: (BuildContext context, int index) {
                final bool isSelected = selectedChatRoomIndex.value == index;
                return GestureDetector(
                  onTap: () {
                    selectedChatRoomIndex.value = index;
                    selectedChatRoom.value = chatRooms[index];
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 41),
                    child: _ChatRoomList(
                      simulatorChatRoom: chatRooms[index],
                      isSelected: isSelected,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            const _Content(text: cautionaryNoteText),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () async {
                final room = selectedChatRoom.value;
                if (room != null) {
                  final chatRoomId = await notifier.createChatRoom(
                    dummyChatRoomId: room.chatRoomId,
                    toUserId: room.toUserId,
                    anonymizeDummyNickname: room.anonymizeDummyNickname,
                    dummyPhotoId: room.dummyPhotoId,
                  );

                  if (chatRoomId == null) {
                    final latestState = ref.read(simulationPageViewModelProvider);
                    final error = latestState.error;

                    if (error != null && context.mounted) {
                      final handled = await handleEconaError(context, error);
                      if (handled) {
                        return;
                      }
                    }

                    final errorMessage = error?.userMessage ??
                        'チャットルームの作成に失敗しました。';

                    if (context.mounted) {
                      await EconaNotification.showTopToast(
                        context,
                        message: errorMessage,
                      );
                    }
                    return;
                  } else {
                    if(context.mounted) {
                      await context.push(
                        SimulationChatRouteData(chatRoomId: chatRoomId).location,
                        extra: room,
                      );
                    }
                  }
                }
              },
              child: Container(
                width: 177,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: buttonGradient,
                  boxShadow: buttonShadows,
                ),
                alignment: Alignment.center,
                child: Text(
                  'このお相手と話す',
                  style: EconaTextStyle.labelMedium1140(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatRoomList extends StatelessWidget {
  const _ChatRoomList({
    required this.simulatorChatRoom,
    this.isSelected = false,
  });

  final SimulatorChatRoom simulatorChatRoom;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final nickname = simulatorChatRoom.anonymizeDummyNickname;
    final age = calculateAgeJp(simulatorChatRoom.birthday);
    final avatarIconUrl = resolvePhotoUrl(
      urls: simulatorChatRoom.dummyProfilePhotoUrls,
      kind: PhotoUrlKind.avatarIconWebpUrl,
    );

    final widget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PhotoFrame(imageUrl: avatarIconUrl, size: 60),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$nickname　$age',
                  style: EconaTextStyle.simulationCardProfile(
                    color: EconaColor.grayDarkActive,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  simulatorChatRoom.simplifiedPersonalitySummary,
                  style: EconaTextStyle.simulationCardFeatures(
                    color: EconaColor.grayDarkActive,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if(isSelected) {
      return ConcavePanel(backgroundColor: EconaColor.background, child: widget);
    } else {
      return ConvexPanel(backgroundColor: EconaColor.background, child: widget);
    }
  }

}

class _Title extends StatelessWidget {
  const _Title({
    required this.text,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: EconaTextStyle.simulationTitle(
          color: EconaColor.grayDarkActive,
        ),
        textAlign: textAlign,
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: EconaTextStyle.simulationContent(
          color: EconaColor.grayDarkActive,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}