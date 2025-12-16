import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/profile_image_carousel.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/tab_section.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

/// ユーザープロフィールのメインコンテンツ
/// プロフィール画像、背景カード、タブセクションを含む
class UserProfile extends StatelessWidget {
  const UserProfile({
    required this.userDetail,
    required this.pageType,
    super.key,
  });

  final UserDetail userDetail;
  final DetailPageType pageType;

  @override
  Widget build(BuildContext context) {
    return UserDetailBackgroundCard(
      pageType: pageType,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                switch (pageType) {
                  DetailPageType.home ||
                  DetailPageType.chat ||
                  DetailPageType.like ||
                  DetailPageType.profile =>
                    const SizedBox.shrink(),
                  DetailPageType.rashisaMatch => Text(
                      userDetail.matchingReason?.mainTitle ?? '',
                      style: EconaTextStyle.headlineHeadline(
                        color: EconaColor.grayTextInvert,
                      ),
                      textAlign: TextAlign.center,
                    ),
                },
                switch (pageType) {
                  // ホーム画面からの遷移時はAppBarの高さが小さいため
                  // その分だけ高さを増やす
                  DetailPageType.home ||
                  DetailPageType.chat ||
                  DetailPageType.like ||
                  DetailPageType.profile =>
                    const SizedBox(height: 514),
                  DetailPageType.rashisaMatch => const SizedBox(height: 490),
                },
                TabSection(
                  userDetail: userDetail,
                  pageType: pageType,
                ),
              ],
            ),
            Positioned(
              top: switch (pageType) {
                DetailPageType.home ||
                DetailPageType.profile ||
                DetailPageType.like ||
                DetailPageType.chat => 42,
                DetailPageType.rashisaMatch => 72,
              },
              left: 0,
              right: 0,
              child: ProfileImageCarousel(
                profile: userDetail.profile,
                width: 393,
                height: 491,
                showProfileInfo: false,
                showStarButton: false,
                showBadge: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ユーザー詳細ページの背景カード
/// ホーム画面とらしさマッチ画面で異なる背景デザインを提供
class UserDetailBackgroundCard extends StatelessWidget {
  const UserDetailBackgroundCard({
    required this.child,
    required this.pageType,
    super.key,
  });
  final Widget child;
  final DetailPageType pageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      // 高さはchildに合わせて可変
      padding: const EdgeInsets.only(
        top: 56,
        bottom: 12,
      ),
      color: switch (pageType) {
        DetailPageType.home ||
        DetailPageType.chat ||
        DetailPageType.like ||
        DetailPageType.profile =>
          Colors.white, // ホーム画面時は白背景
        DetailPageType.rashisaMatch => null, // らしさマッチ画面時はグラデーション背景
      },
      decoration: switch (pageType) {
        DetailPageType.home || DetailPageType.profile ||
        DetailPageType.like || DetailPageType.chat => null,
        DetailPageType.rashisaMatch => BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFFB416C).withValues(alpha: 0.6),
                const Color(0xFFF5DE2F).withValues(alpha: 0.2),
                const Color(0xFFFB416C).withValues(alpha: 0.6),
              ],
              stops: const [0.0, 0.39, 0.86],
            ),
          ),
      },
      child: child,
    );
  }
}
