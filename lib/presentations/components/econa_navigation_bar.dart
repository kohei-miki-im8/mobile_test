import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/chat_room/chat_room_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/my_page/my_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/typography_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final double econaNavigationBarHeight = 48 * EconaTypographyConfig.scale;

class EconaNavigationBar extends StatelessWidget {
  EconaNavigationBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;
  static final $AssetsImagesIconsGen _icons = Assets.images.icons;

  final _destinations = <Widget>[
    NavigationDestination(
      icon: _icons.navHome.image(width: 24, height: 24),
      selectedIcon: _icons.navSelectedHome.image(width: 24, height: 24),
      label: EconaNavigationBarText.homeLabel,
    ),
    NavigationDestination(
      icon: _icons.navLike.image(width: 24, height: 24),
      selectedIcon: _icons.navSelectedLike.image(width: 24, height: 24),
      label: EconaNavigationBarText.likeLabel,
    ),
    NavigationDestination(
      icon: _icons.navLavigation.image(width: 24, height: 24),
      selectedIcon: _icons.navSelectedLavigation.image(width: 24, height: 24),
      label: EconaNavigationBarText.karuteLabel,
    ),
    NavigationDestination(
      icon: _icons.navChat.image(width: 24, height: 24),
      selectedIcon: _icons.navSelectedChat.image(width: 24, height: 24),
      label: EconaNavigationBarText.chatLabel,
    ),
    NavigationDestination(
      icon: _icons.navProfile.image(width: 24, height: 24),
      selectedIcon: _icons.navSelectedProfile.image(width: 24, height: 24),
      label: EconaNavigationBarText.myPageLabel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;

    // フローティング風の外枠（丸角＋影）で包み、余白を確保
    return SafeArea(
      top: false,
      bottom: true,
      minimum: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ShadowAndGradientBorderContainer(
        borderRadius: BorderRadius.circular(24),
        borderWidth: 1,
        gradients: const [
          LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFEFF0FE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ],
        backgroundColor: const Color(0xF2F6FBFE), // 少し透過
        innerShadows: const [
          BoxShadow(
            color: Color(0xE0FFFFFF),
            offset: Offset(-4, -4),
            blurRadius: 9,
          ),
        ],
        dropShadows: [
          BoxShadow(
            color: const Color(0xFF7273AB).withValues(alpha: 0.1),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
          const BoxShadow(
            color: Color(0xFFFFFFFF),
            offset: Offset(-6, -6),
            blurRadius: 20,
          ),
          BoxShadow(
            color: const Color(0xFF6F75B0).withValues(alpha: 0.32),
            offset: const Offset(4, 4),
            blurRadius: 20,
          ),
        ],
        child: NavigationBar(
          destinations: _destinations,
          selectedIndex: currentIndex,
          onDestinationSelected: (int index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == currentIndex,
            );
            // ChatRoomタブ（index: 3）が選択されたらSWRで最新化
            if (index == 3) {
              final container = ProviderScope.containerOf(context, listen: false);
              container
                  .read(chatRoomPageViewModelProvider.notifier)
                  .revalidateChatRooms();
            }
            // MyPageタブ（index: 4）が選択されたらSWRで最新化
            if (index == 4) {
              final container = ProviderScope.containerOf(context, listen: false);
              container
                  .read(myPageViewModelProvider.notifier)
                  .revalidate();
            }
          },
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          backgroundColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          height: econaNavigationBarHeight,
        ),
      ),
    );
  }
}
