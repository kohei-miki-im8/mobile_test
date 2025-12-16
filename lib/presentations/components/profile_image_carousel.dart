import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_badge.dart';
import 'package:econa_mobile_app/presentations/components/profile_info.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfileImageCarousel extends HookWidget {
  const ProfileImageCarousel({
    required this.profile,
    this.onStarTap,
    this.onProfileInfoTap,
    this.isStarred = false,
    this.showStarButton = true,
    this.showProfileInfo = true,
    this.showBadge = true,
    this.width = 337,
    this.height = 420,
    this.enableScroll = true,
    this.rightSwipeProgress = 0.0,
    this.leftSwipeProgress = 0.0,
    super.key,
  });

  final Profile profile;
  final VoidCallback? onStarTap;
  final VoidCallback? onProfileInfoTap;
  final bool isStarred;
  final bool showStarButton;
  final bool showProfileInfo;
  final bool showBadge;
  final double width;
  final double height;
  final bool enableScroll;
  final double rightSwipeProgress;
  final double leftSwipeProgress;

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final currentIndex = useState(0);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6F75B0).withValues(alpha: 0.4),
            offset: const Offset(4, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0xFF7273AB).withValues(alpha: 0.1),
            offset: const Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0xFF2F3A76).withValues(alpha: 0.24),
            offset: const Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          // 画像カルーセル
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(24),
            ),
            child: PageView.builder(
              controller: controller,
              physics:
                  enableScroll ? null : const NeverScrollableScrollPhysics(),
              itemCount: profile.images.length,
              onPageChanged: (index) => currentIndex.value = index,
              itemBuilder: (context, index) {
                return Image(
                  image: profile.images[index].image,
                  width: width,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // 上部グラデーション
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 74,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  gradient: LinearGradient(
                    begin: const Alignment(0.8, 1),
                    end: Alignment.topRight,
                    colors: [
                      const Color(0xFFFFFFFF).withValues(alpha: 0), // 透明な白
                      const Color(0xFF07123A)
                          .withValues(alpha: 0.5), // 50%の#07123A
                    ],
                    stops: const [0, 1],
                  ),
                ),
              ),
            ),
          ),
          // 下部グラデーション
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 166,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF2F64F5).withValues(alpha: 0),
                      const Color(0xFF07123A).withValues(alpha: 0.6),
                    ],
                    stops: const [0, 1],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(24),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFFD9D9D9).withValues(alpha: 0),
                      const Color(0xFF737373).withValues(alpha: 0.5),
                    ],
                    stops: const [0, 1],
                  ),
                ),
              ),
            ),
          ),

          // 上部インジケーター
          Positioned(
            top: 12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                profile.images.length,
                (i) => Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: i == currentIndex.value
                        ? EconaColor.grayTextInvert
                        : EconaColor.grayLightActive,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
          // 右半分タップで次へ
          Positioned.fill(
            left: width / 2,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (currentIndex.value < profile.images.length - 1) {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
            ),
          ),
          // 左半分タップで前へ
          Positioned.fill(
            right: width / 2,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (currentIndex.value > 0) {
                  controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
            ),
          ),

          // 下部のプロフィール情報
          if (showProfileInfo)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onProfileInfoTap,
                child: ProfileInfo(profile: profile),
              ),
            ),
          // 右上のバッジ
          if (showBadge && profile.badgeType != null)
            Positioned(
              top: showStarButton ? 64 : 37,
              right: 22,
              child: EconaBadge(
                badgeType: profile.badgeType!,
                height: 20,
              ),
            ),
          // オプションのグラデーションオーバーレイ
          if (rightSwipeProgress > 0)
            Positioned.fill(
              child: IgnorePointer(
                child: AnimatedOpacity(
                  opacity: rightSwipeProgress,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFF5759D).withValues(alpha: 0.9),
                          const Color(0xFFBF22FF).withValues(alpha: 0),
                        ],
                        stops: const [0, 1],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // オプションのハートアイコン
          if (rightSwipeProgress > 0)
            Positioned(
              top: 40,
              left: 24,
              child: AnimatedOpacity(
                opacity: rightSwipeProgress,
                duration: const Duration(milliseconds: 300),
                child: Transform.rotate(
                  angle: -10.59 * 3.14159 / 180, // 度をラジアンに変換
                  child: SizedBox(
                    width: 47.77,
                    height: 36.54,
                    child: Assets.images.icons.whiteHeartAngled.image(),
                  ),
                ),
              ),
            ),
          // 左スワイプ時の暗いオーバーレイ
          if (leftSwipeProgress > 0)
            Positioned.fill(
              child: IgnorePointer(
                child: AnimatedOpacity(
                  opacity: leftSwipeProgress,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.black.withValues(alpha: 0.9),
                          Colors.black.withValues(alpha: 0),
                        ],
                        stops: const [0, 1],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // オプションのスワイプ左アイコン
          if (leftSwipeProgress > 0)
            Positioned(
              top: 40, //64.41,
              right: 24, //272.23,
              child: AnimatedOpacity(
                opacity: leftSwipeProgress,
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  width: 43,
                  height: 37,
                  child: Assets.images.icons.swipeLeft.image(),
                ),
              ),
            ),
          // 右上のスターアイコン（オプション）
          if (showStarButton)
            Positioned(
              top: 28,
              right: 28,
              child: SizedBox(
                width: 24,
                height: 24,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: isStarred
                      ? Assets.images.icons.starSelected.image()
                      : Assets.images.icons.star.image(),
                  onPressed: onStarTap,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
