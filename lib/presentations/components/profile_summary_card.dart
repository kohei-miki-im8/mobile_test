import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/domains/entities/signed_image_urls.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/user_activity_tag.pbenum.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_navigation_bar.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/profile_image_carousel.dart';
import 'package:econa_mobile_app/presentations/helpers/login_status_helper.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

/// プロフィール情報の表示位置
enum ProfileInfoPlacement { overlay, outside }

class ProfileSummaryCard extends StatefulWidget {
  const ProfileSummaryCard({
    required this.images,
    required this.bestImageUrls,
    required this.name,
    required this.age,
    required this.cityText,
    required this.verifiedBadges,
    required this.userActivityTag,
    this.onAppealTap,
    this.onStarChanged,
    this.isStarred = false,
    this.buttonText = '',
    this.buttonLeading,
    this.buttonEnabled = true,
    this.profileInfoPlacement = ProfileInfoPlacement.outside,
    this.contentBelowImage,
    this.aspectRatio = 4 / 5,
    this.tabHeight = 0,
    super.key,
  });

  final List<Image> images;
  final SignedImageUrls? bestImageUrls;
  final String name;
  final int? age;
  final String cityText;
  final List<String> verifiedBadges;
  final UserActivityTag userActivityTag;
  final Future<void> Function()? onAppealTap;
  final ValueChanged<bool>? onStarChanged;
  final bool isStarred;
  final String buttonText;
  final Widget? buttonLeading;
  final bool buttonEnabled;
  final ProfileInfoPlacement profileInfoPlacement;
  final Widget? contentBelowImage;
  final double aspectRatio;
  final double tabHeight;

  @override
  State<ProfileSummaryCard> createState() => _ProfileSummaryCardState();
}

class _ProfileSummaryCardState extends State<ProfileSummaryCard> {
  late bool _isStarred;
  bool _isProcessingAppeal = false;

  @override
  void initState() {
    super.initState();
    _isStarred = widget.isStarred;
  }

  @override
  void didUpdateWidget(covariant ProfileSummaryCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isStarred != widget.isStarred) {
      setState(() {
        _isStarred = widget.isStarred;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showOverlay =
        widget.profileInfoPlacement == ProfileInfoPlacement.overlay;

    // ローカル完了フラグは廃止し、親から渡された buttonEnabled と処理中フラグだけを見る
    final bool appealButtonEnabled = widget.buttonEnabled &&
        !_isProcessingAppeal &&
        widget.onAppealTap != null;

    return LayoutBuilder(
      builder: (context, constraints) {
        // 基準となる比率をFigmaデザインの縦横から計算
        const scale = 337 / 585;

        // デバイスの高さ
        final deviceHeight = MediaQuery.of(context).size.height;

        // appbarの高さ
        final appBarHeight =
            toolbarHeight + MediaQuery.of(context).padding.top;

        // タブの高さ
        final tabHeight = widget.tabHeight;

        // ナビゲーションバー + 下から浮いている分の高さ
        final bottomNavigationBarHeight =
            econaNavigationBarHeight + MediaQuery.of(context).padding.bottom;

        // 上記3つを合算した値
        final usedTotalHeight =
            appBarHeight + tabHeight + bottomNavigationBarHeight;

        // カードの使える高さ
        final availableHeight = deviceHeight - usedTotalHeight;

        // 表示領域がない場合は早期に抜ける（無いとは思うが念のため）
        if (availableHeight <= 0.0) {
          return const SizedBox.shrink();
        }

        // 高さから横幅を算出
        final cardWidth = availableHeight * scale;

        // 画像部分の高さ
        final imageHeight = cardWidth / widget.aspectRatio;

        // ボタンをどの程度「食い込ませる」か（以前の Transform.offset: -28 に対応）
        const double buttonOverlap = 28;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: cardWidth),
            child: ShadowAndGradientBorderContainer(
              borderRadius: BorderRadius.circular(24),
              borderWidth: 1.5,
              gradients: const [
                LinearGradient(
                  colors: [Color(0xFFFFFFFF), Color(0xFFEFF0FE)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ],
              backgroundColor: const Color(0xFFF8FAFF),
              innerShadows: [
                const BoxShadow(
                  color: Color(0xFFFFFFFF),
                  offset: Offset(-4, -4),
                  blurRadius: 8,
                ),
                BoxShadow(
                  color: const Color(0xFF86A3C8).withValues(alpha: 0.2),
                  offset: const Offset(4, 4),
                  blurRadius: 12,
                ),
              ],
              dropShadows: [
                BoxShadow(
                  color: const Color(0xFF000000).withValues(alpha: 0.1),
                  offset: const Offset(0, 8),
                  blurRadius: 16,
                ),
              ],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 画像＋アピールボタン（ボタンを写真に食い込ませる）
                  SizedBox(
                    height: imageHeight + buttonOverlap,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: imageHeight,
                          child: ProfileImageCarousel(
                            profile: Profile(
                              images: widget.images,
                              bestImageUrls: widget.bestImageUrls,
                              name: widget.name,
                              age: widget.age,
                              location: widget.cityText,
                              userId: '',
                            ),
                            width: cardWidth,
                            height: imageHeight,
                            showProfileInfo: false,
                            showStarButton: true,
                            onStarTap: () {
                              setState(() {
                                _isStarred = !_isStarred;
                              });
                              widget.onStarChanged?.call(_isStarred);
                            },
                            isStarred: _isStarred,
                          ),
                        ),
                        if (widget.buttonText.isNotEmpty)
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Center(
                              child: EconaGradientButton(
                                text: widget.buttonText,
                                leading: widget.buttonLeading,
                                onPressed: appealButtonEnabled
                                    ? () async {
                                  final onTap = widget.onAppealTap;
                                  if (onTap == null) {
                                    return;
                                  }

                                  setState(() {
                                    _isProcessingAppeal = true;
                                  });

                                  try {
                                    await onTap();
                                  } finally {
                                    if (mounted) {
                                      setState(() {
                                        _isProcessingAppeal = false;
                                      });
                                    }
                                  }
                                }
                                    : null,
                                enabled: appealButtonEnabled,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (!showOverlay) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: loginStatusColorFromTag(
                                widget.userActivityTag,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            loginStatusTextFromTag(widget.userActivityTag),
                            style: EconaTextStyle.regularSmall140(
                              color: EconaColor.grayTextTabEnable,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        spacing: 8,
                        children: [
                          Text(
                            widget.name,
                            style: EconaTextStyle.labelMedium2140(
                              color: EconaColor.grayDarkActive,
                            ),
                          ),
                          Text(
                            '/',
                            style: EconaTextStyle.regularSmall140(
                              color: EconaColor.grayDarkActive,
                            ),
                          ),
                          Text(
                            '${widget.age}歳',
                            style: EconaTextStyle.regularSmall140(
                              color: EconaColor.grayDarkActive,
                            ),
                          ),
                          Text(
                            widget.cityText,
                            style: EconaTextStyle.regularSmall140(
                              color: EconaColor.grayDarkActive,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.verifiedBadges
                            .map((t) => _MiniBadge(text: t))
                            .toList(growable: false),
                      ),
                    ),
                  ],
                  if (widget.contentBelowImage != null) ...[
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: widget.contentBelowImage,
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MiniBadge extends StatelessWidget {
  const _MiniBadge({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: EconaColor.verifiedBadgeBg,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style:
        EconaTextStyle.regularSmall140(color: EconaColor.grayDarkActive),
      ),
    );
  }
}