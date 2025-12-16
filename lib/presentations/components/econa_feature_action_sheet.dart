import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_points.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/web_view_page.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EconaFeatureActionSheet extends ConsumerWidget {
  const EconaFeatureActionSheet({
    required this.title,
    required this.leading,
    required this.text,
    this.buttonText,
    this.onPressed,
    this.detail,
    this.isSctaVisible = true,
    this.pointsToUse,
    this.pointType,
    this.isPrimaryEnabled = true,
    super.key,
  });

  final String title;
  final Widget leading;
  final String text;
  final String? buttonText;
  final VoidCallback? onPressed;
  final bool isSctaVisible; // 特商法（Specified Commercial Transactions Act）
  final Widget? detail;
  final int? pointsToUse;
  final PointType? pointType;
  final bool isPrimaryEnabled;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Material(
      color: Colors.transparent,
      child: SafeArea(
        top: false,
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: bottomInset),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.9),
                child: ShadowAndGradientBorderContainer(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  borderWidth: 1,
                  gradients: const [
                    LinearGradient(
                      colors: [Color(0xFFD6E3F3), Color(0xFFFFFFFF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ],
                  backgroundColor: const Color(0xFFF6FBFE),
                  innerShadows: const [
                    BoxShadow(
                      color: Color(0x1A7273AB), // #7273AB 10%
                      offset: Offset(-2, -2),
                      blurRadius: 4,
                    ),
                  ],
                  dropShadows: const [
                    BoxShadow(
                      color: Color(0x3D3E4AB5), // #3E4AB5 24%
                      offset: Offset(-4, -4),
                      blurRadius: 20,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-6, -6),
                      blurRadius: 20,
                    ),
                  ],
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                      spacing: 12,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                title,
                                style: EconaTextStyle.labelMedium2140(
                                  color: EconaColor.grayNormal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ),
                            if(pointType != null)...[
                              FutureBuilder<int>(
                                future: fetchUserPoint(ref, pointType!),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const EconaLoadingIndicator();
                                  }
                                  return _PossessionPoints(
                                    point: snapshot.data!,
                                    pointType: pointType!,
                                  );
                                },
                              ),
                            ],
                          ],
                        ),
                        leading,
                        if(pointsToUse != null)...[
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '$pointsToUse',
                                  style: EconaTextStyle.point(
                                    color: EconaColor.grayDarkActive,
                                  ),
                                ),
                                TextSpan(
                                  text: pointType == PointType.lp ? 'LP' : 'MP',
                                  style: EconaTextStyle.pointUnit(
                                    color: EconaColor.grayDarkActive,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        Text(
                          text,
                          style: EconaTextStyle.labelMedium2160(
                            color: EconaColor.grayDarkActive,
                          ),
                          softWrap: true,
                          textAlign: TextAlign.left,
                        ),
                        detail ?? const SizedBox.shrink(),
                        if (buttonText != null)...[
                          EconaGradientButton(
                            text: buttonText!,
                            onPressed: () {
                              if (!isPrimaryEnabled || onPressed == null) return;
                              onPressed!();
                            },
                          ),
                        ],
                        if(isSctaVisible)...[
                          const _Scta(),
                        ],
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PossessionPoints extends StatelessWidget {
  const _PossessionPoints({
    required this.point,
    required this.pointType,
    super.key,
  });

  final int point;
  final PointType pointType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 4, 12, 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color(0xFF96ABE3).withValues(alpha: 0.45),
          width: 1,        // 枠線の太さ
        ),
      ),
      child: Row(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (pointType == PointType.mp) ...[
            Assets.images.icons.pointMp.image(height: 16, width: 16),
          ] else ...[
            Assets.images.icons.pointLp.image(height: 16, width: 16),
          ],
          Text(
            '$point',
            style: EconaTextStyle.labelSmall140(
              color: EconaColor.grayDarkActive,
            ),
          )
        ],
      ),
    );
  }
}

class _Scta extends StatelessWidget {
  const _Scta();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Semantics(
        button: true,
        label: '特定商取引法に基づく表示',
        child: TextButton(
          onPressed: () async {
            // モーダルよりも前面に出したいのでNavigatorのrootNavigatorをtrueで遷移
            await Navigator.of(context, rootNavigator: true).push<void>(
              MaterialPageRoute(
                builder: (_) => const WebViewPage(
                  url: EconaWebUrl.law,
                  title: '特定商取引法に基づく表記',
                ),
              ),
            );
          },
          child: Text(
            '特定商取引法に基づく表示',
            style: EconaTextStyle.labelMedium1140(
              color: EconaColor.purpleNormal,
            ),
          ),
        ),
      ),
    );
  }
}

// PointType.lp / PointType.mp に応じて、その種別の所持ポイント合計を返す
Future<int> fetchUserPoint(WidgetRef ref, PointType pointType) async {
  try {
    final userRepo = ref.read(userRepositoryProvider);
    final res = await userRepo.getUserPoints(GetUserPointsRequest());

    final lp = res.freeLavigationPoint + res.lavigationPoint;
    final mp = res.freeMatchingPoint + res.matchingPoint;

    return pointType == PointType.lp ? lp : mp;
  } catch (_) {
    // エラー時は 0 ポイントとして扱う
    return 0;
  }
}

enum PointType {
  lp,
  mp,
}
