import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/infrastructures/services/revenuecat_service.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/feature_card.dart';
import 'package:econa_mobile_app/presentations/components/features_list.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_overlay.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/panel.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_history_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_helpers.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_messages.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchasePage extends HookConsumerWidget {
  const PurchasePage({
    required this.pointType,
    super.key,
  });

  final PurchasePageType pointType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ViewModelから状態を取得
    final purchaseStateAsync = ref.watch(
      purchasePageViewModelProvider(pointType),
    );

    // UI側で選択されたパッケージを管理
    final selectedPackage = useState<Package?>(null);

    // ポイントの種類に応じたUIデータを決定
    final String whatCanLPTBody;
    final Widget pointIcon;
    final Widget pointIconSmall;

    switch (pointType) {
      case PurchasePageType.lp:
        whatCanLPTBody = 'LP（ラヴィゲーションポイント）は、Lavi 独自のAI機能を使う際に消費するポイントです。';
        pointIcon = Assets.images.icons.pointLp.image(height: 32, width: 32);
        pointIconSmall =
            Assets.images.icons.pointLp.image(height: 24, width: 24);
      case PurchasePageType.mp:
        whatCanLPTBody = 'MP（マッチングポイント）は、マッチングを効率的にする機能を使う際に消費するポイントです。';
        pointIcon = Assets.images.icons.pointMp.image(height: 32, width: 32);
        pointIconSmall =
            Assets.images.icons.pointMp.image(height: 24, width: 24);
    }

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '${pointType.name.toUpperCase()}購入',
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.back.image(height: 32, width: 32),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: purchaseStateAsync.when(
        loading: () => const Center(child: EconaLoadingIndicator()),
        error: (err, stack) => const SizedBox.shrink(),
        data: (state) {
          // 画面ブロックは行わない。エラーはトーストで通知済み。
          useEffect(() {
            // ポイント情報・ポイント履歴をバックグラウンドでプリフェッチ
            ref.read(purchaseHistoryPointsProvider.future);
            ref.read(purchaseHistoryPageViewModelProvider.future);
            return null;
          }, const []);

          final offering = state.offering;
          final packages = offering?.availablePackages ?? [];
          final isLp = pointType == PurchasePageType.lp;
          final pointUnit = isLp ? 'LP' : 'MP';
          final ownedPoints = isLp ? state.lp : state.mp;
          final featureList = isLp ? _lpFeatures : _mpFeatures;
          final providerForType =
              isLp ? PurchasePageType.lp : PurchasePageType.mp;

          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        pointIcon,
                        InnerShadowText(
                          text: '所持 : $ownedPoints$pointUnit',
                          textStyle: EconaTextStyle.labelMedium2140(
                            color: EconaColor.grayNormal,
                            shadows: EconaShadow.headlineShadows,
                          ),
                          innerShadowTextStyles: [
                            EconaTextStyle.labelMedium2140(
                              foreground: EconaShadow().headlineInnerShadow,
                            ),
                          ],
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () async {
                            await PurchaseHistoryRouteData(
                              type: pointType,
                            ).push<void>(context);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InnerShadowText(
                                text: '購入履歴',
                                textStyle: EconaTextStyle.regularSmall140(
                                  color: EconaColor.gray200,
                                  shadows: EconaShadow.headlineShadows,
                                ),
                                innerShadowTextStyles: [
                                  EconaTextStyle.regularSmall140(
                                    foreground:
                                        EconaShadow().headlineInnerShadow,
                                  ),
                                ],
                              ),
                              Assets.images.icons.chevronRight
                                  .svg(height: 16, width: 16),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // プラン表示
                    if (packages.isNotEmpty)
                      ...(() {
                        // 先頭数値（ポイント）を抽出し、不正タイトルは除外
                        final items = packages
                            .map((p) => {
                                  'p': p,
                                  'pts':
                                      extractLeadingInt(p.storeProduct.title),
                                })
                            .where((m) => (m['pts']! as int) > 0)
                            .toList();

                        // すべて不正なら素の表示にフォールバック
                        if (items.isEmpty) {
                          return packages.map((p) {
                            final isSelected =
                                selectedPackage.value?.identifier ==
                                    p.identifier;
                            Widget tile = _PointPackageTile(
                              icon: pointIconSmall,
                              title: sanitizeStoreTitle(p.storeProduct.title),
                              finalPriceText: p.storeProduct.priceString,
                              rightMeta: const [],
                              borderWidth: isSelected ? 0 : 1,
                            );
                            if (isSelected) {
                              tile = GradientBorderOverlay(
                                borderRadius: BorderRadius.circular(16),
                                strokeWidth: 3,
                                gradients: const [
                                  LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFD097DB),
                                      Color(0xFF8887EE)
                                    ],
                                  ),
                                  LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFD097DB),
                                      Color(0xFF8887EE)
                                    ],
                                  ),
                                ],
                                child: tile,
                              );
                            }
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              child: GestureDetector(
                                onTap: () {
                                  if (isSelected) {
                                    selectedPackage.value = null;
                                  } else {
                                    selectedPackage.value = p;
                                  }
                                },
                                child: tile,
                              ),
                            );
                          });
                        }

                        // 基準は最小ポイントのパッケージ
                        final baseItem = items.reduce(
                          (a, b) =>
                              (a['pts'] as int) < (b['pts'] as int) ? a : b,
                        );
                        final basePts = baseItem['pts'] as int;
                        final basePrice = (baseItem['p'] as Package)
                            .storeProduct
                            .price; // basePts個の価格

                        final rows = items.map((m) {
                          final p = m['p'] as Package;
                          final pts = m['pts'] as int;
                          final multiplier = pts / basePts; // 基準パッケージに対する倍数
                          final reference = (basePrice * multiplier).round();
                          final actual = p.storeProduct.price.round();
                          final saving = (reference - actual).clamp(0, 1 << 31);
                          return {
                            'p': p,
                            'pts': pts,
                            'ref': reference,
                            'act': actual,
                            'sav': saving,
                          };
                        }).toList()
                          ..sort((a, b) =>
                              (b['pts'] as int).compareTo(a['pts'] as int));

                        return rows.map((row) {
                          final current = row['p'] as Package;
                          final pts = row['pts'] as int;
                          final refV = row['ref'] as int;
                          final actV = row['act'] as int;
                          final savV = row['sav'] as int;
                          final isSelected =
                              selectedPackage.value?.identifier ==
                                  current.identifier;

                          final rightMeta = <_MetaText>[
                            if (pts != basePts)
                              _MetaText(
                                formatWithComma(refV),
                                EconaColor.grayNormal,
                                strike: true,
                              ),
                            if (savV > 0)
                              _MetaText(
                                '${formatYen(savV)}お得',
                                const Color(0xFFFF2C6E),
                              ),
                          ];

                          Widget tile = _PointPackageTile(
                            icon: pointIconSmall,
                            title: '${pts}${pointUnit}',
                            finalPriceText: formatWithComma(actV),
                            rightMeta: rightMeta,
                            // borderWidth: isSelected ? 0 : 1,
                          );

                          if (isSelected) {
                            tile = GradientBorderOverlay(
                              borderRadius: BorderRadius.circular(16),
                              strokeWidth: 3,
                              gradients: const [
                                LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFD097DB),
                                    Color(0xFF8887EE)
                                  ],
                                ),
                                LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFD097DB),
                                    Color(0xFF8887EE)
                                  ],
                                ),
                              ],
                              child: tile,
                            );
                          }

                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            child: GestureDetector(
                              onTap: () {
                                if (isSelected) {
                                  selectedPackage.value = null;
                                } else {
                                  selectedPackage.value = current;
                                }
                              },
                              child: tile,
                            ),
                          );
                        });
                      })(),

                    TextTitle(title: '${pointType.name.toUpperCase()}は何に使えるの？'),
                    TextBody(body: whatCanLPTBody),
                    const TextTitle(title: 'Pt利用でできること'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FeaturesList(
                        features: featureList,
                      ),
                    ),

                    // 機能一覧
                    const SizedBox(height: 8),

                    const TextTitle(title: '注意事項'),
                    TextBody(
                        body:
                            '※取り消し線の価格は、10${pointUnit}単位で該当の${pointUnit}数を購入した場合の合計金額です。\n'
                            '※ご購入いただいた${pointUnit}の返金はできません。\n'
                            '※購入された${pointUnit}の有効期限は、購入日を含めて180日です。\n'),

                    // 復元ボタン
                    Text(
                      '決済内容が反映されない場合、リストアをしてください',
                      style: EconaTextStyle.regularSmall140(
                        color: EconaColor.grayDarkActive,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await ref
                            .read(purchasePageViewModelProvider(providerForType)
                                .notifier)
                            .restore();
                        if (!context.mounted) return;
                        await EconaNotification.showTopToast(context,
                            message: '購入履歴の復元が完了しました');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                        ),
                        child: Text(
                          'リストア',
                          style: EconaTextStyle.regularMedium2200(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // フッター
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Column(
                        spacing: 20,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () async {
                              await const WebViewRouteData(
                                url: EconaWebUrl.privacy,
                                title: 'プライバシーポリシー',
                              ).push<void>(context);
                            },
                            child: Text(
                              'プライバシーポリシー',
                              style: EconaTextStyle.regularSmall140(
                                color: EconaColor.grayDarkActive,
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () async {
                              await const WebViewRouteData(
                                url: EconaWebUrl.privacy,
                                title: '利用規約',
                              ).push<void>(context);
                            },
                            child: Text(
                              '利用規約',
                              style: EconaTextStyle.regularSmall140(
                                color: EconaColor.grayDarkActive,
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () async {
                              await const WebViewRouteData(
                                url: EconaWebUrl.law,
                                title: '特定商取引法に基づく表記',
                              ).push<void>(context);
                            },
                            child: Text(
                              '特定商取引法に基づく表記',
                              style: EconaTextStyle.regularSmall140(
                                color: EconaColor.grayDarkActive,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // フローティングボタンの余白 + 最下部空白
                    if (selectedPackage.value != null)
                      const SizedBox(height: 120)
                    else
                      const SizedBox(height: 24),
                  ],
                ),
              ),

              // フローティング購入ボタン
              if (selectedPackage.value != null)
                Positioned(
                  bottom: 60, // subscriptionと同等の浮き位置
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    color: Colors.transparent,
                    child: EconaGradientButton(
                      text: '購入する',
                      onPressed: () async {
                        if (selectedPackage.value == null) return;
                        final pointsToBuy = extractLeadingInt(selectedPackage.value!.storeProduct.title);
                        if(ownedPoints + pointsToBuy >= 10000) {
                          await showDialog<void>(
                            context: context,
                            builder: (ctx) => Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                              child: EconaModal(
                                message: '10000を超える場合はポイントを購入できません',
                                buttonText: 'OK',
                                onButtonPressed: () async {
                                  if(ctx.mounted) {
                                    ctx.pop();
                                  }
                                },
                              ),
                            ),
                          );
                          return;
                        }
                        final package = selectedPackage.value;
                        if (package == null) return;
                        try {
                          // 購入前に外部ユーザーとRevenueCat IDの整合を保証
                          await ensureExternalUserLinked(ref);
                          final info =
                              await RevenueCatService.purchasePackage(package);
                          if (info != null) {
                            final transactionId =
                                RevenueCatService.findTransactionIdForProduct(
                              customerInfo: info,
                              productIdentifier:
                                  package.storeProduct.identifier,
                            );
                            final points =
                                extractLeadingInt(package.storeProduct.title);
                            final price = package.storeProduct.price;
                            final currency = package.storeProduct.currencyCode;
                            if (isLp) {
                              AdjustEventTracker.trackLpPurchase(
                                points: points,
                                revenue: price,
                                currency: currency,
                                transactionId: transactionId,
                              );
                            } else {
                              AdjustEventTracker.trackMpPurchase(
                                points: points,
                                revenue: price,
                                currency: currency,
                                transactionId: transactionId,
                              );
                            }
                            await EconaNotification.showTopToast(context,
                                message: purchaseSuccessMessageDefault);
                            selectedPackage.value = null;
                            return;
                          }
                          final fallback = EconaError(
                              cause: EconaErrorCause.unknown,
                              operation: EconaErrorOperation.unknown,
                              message: '購入に失敗しました');
                          await EconaNotification.showTopToast(context,
                              message: fallback.userMessage);
                        } on PlatformException catch (e) {
                          final mapped = EconaError.fromPlatformException(
                            e,
                            operation: EconaErrorOperation.unknown,
                          );

                          final handled = await handleEconaError(context, mapped);
                          if (handled) {
                            return;
                          }

                          await EconaNotification.showTopToast(
                            context,
                            message: mapped.userMessage,
                          );
                        } catch (e) {
                          final mapped = EconaError.fromException(
                            e,
                            operation: EconaErrorOperation.unknown,
                          );

                          final handled = await handleEconaError(context, mapped);
                          if (handled) {
                            return;
                          }

                          await EconaNotification.showTopToast(
                            context,
                            message: mapped.userMessage,
                          );
                        }
                      },
                      // ボタン内部のローディングは別UIに委ねる（必要なら差し替え）
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _PointPackageTile extends StatelessWidget {
  const _PointPackageTile({
    required this.icon,
    required this.title,
    required this.finalPriceText,
    required this.rightMeta,
    this.borderWidth = 1,
  });

  final Widget icon;
  final String title;
  final String finalPriceText;
  final List<_MetaText> rightMeta;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return ConvexPanel(
      borderWidth: borderWidth,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title.split(RegExp(r'[^0-9]')).first,
                    style: EconaTextStyle.priceTitle(
                      color: EconaColor.grayDarkActive,
                    ),
                  ),
                  TextSpan(
                    text: title.replaceFirst(RegExp(r'^[0-9]+'), ''),
                    style: EconaTextStyle.labelMedium2140(
                      color: EconaColor.grayDarkActive,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // 取り消し線やお得表示
            ...rightMeta
                .map((m) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        m.text,
                        style: (m.strike
                            ? EconaTextStyle.labelSmall140(
                                color: m.color,
                              ).copyWith(decoration: TextDecoration.lineThrough)
                            : EconaTextStyle.labelSmall140(color: m.color)),
                      ),
                    ))
                .toList(),
            InnerShadowText(
                text: finalPriceText,
                textStyle: EconaTextStyle.headlineEmptyState(
                  color: EconaColor.grayNormal,
                  shadows: EconaShadow.headlineShadows,
                ),
                innerShadowTextStyles: [
                  EconaTextStyle.headlineEmptyState(
                    foreground: EconaShadow().headlineInnerShadow,
                  ),
                ])
          ],
        ),
      ),
    );
  }
}

class _MetaText {
  const _MetaText(this.text, this.color, {this.strike = false});
  final String text;
  final Color color;
  final bool strike;
}

// MP向け機能一覧（画像の内容に準拠、必要に応じて調整）
final List<FeatureData> _mpFeatures = [
  FeatureData(
    icon: Assets.images.icons.featureGrantLike.image(height: 40, width: 40),
    title: 'いいねと交換',
    body: '1mpにつき、1いいねに交換できます',
    cost: 1,
    unit: 'MP',
  ),
  FeatureData(
    icon:
        Assets.images.icons.featureLikeWithMessage.image(height: 40, width: 40),
    title: 'メッセージ付きいいね',
    body: 'いいねと一緒にメッセージを送ることができます',
    cost: 3,
    unit: 'MP',
  ),
  FeatureData(
    icon: Assets.images.icons.featureAppeal.image(height: 40, width: 40),
    title: 'みてね',
    body: 'いいねをしたお相手にあなたのプロフィールを目立たせることができます',
    cost: 3,
    unit: 'MP',
  ),
  FeatureData(
    icon: Assets.images.icons.featureBoost.image(height: 40, width: 40),
    title: 'ブースト',
    body: '30分間あなたのプロフィールが優先的に表示され、お相手の注目を集めやすくなります',
    cost: 5,
    unit: 'MP',
  ),
  FeatureData(
    icon: Assets.images.icons.featureMessageRead.image(height: 40, width: 40),
    title: 'メッセージの既読',
    body: '送ったメッセージがお相手に読まれたか確認できます。お相手1人につき1回の使用で、お相手が退会するまで有効です',
    cost: 5,
    unit: 'MP',
  ),
];

// LP向け機能一覧（画像の内容に準拠、必要に応じて調整）
final List<FeatureData> _lpFeatures = [
  FeatureData(
    icon: Assets.images.icons.featureCounseling.image(height: 40, width: 40),
    title: 'AIカウンセリング',
    body: 'AIカウンセラーがあなたの内面や価値観、深層心理を明らかにします。診断結果は「カルテ」から確認できます',
    cost: 10,
    unit: 'LP',
  ),
  FeatureData(
    icon: Assets.images.icons.featureSimulation.image(height: 40, width: 40),
    title: 'やりとりシミュレーション',
    body: '気になるお相手の人格を模したAIと会話を楽しむことができます',
    cost: 1,
    unit: 'LP',
  ),
  FeatureData(
    icon: Assets.images.icons.featureTopics.image(height: 40, width: 40),
    title: '話題',
    body: 'お相手が登録しているプロフィール項目やタグに沿うメッセージをAIがあなたに代わって作成します',
    cost: 3,
    unit: 'LP',
  ),
  FeatureData(
    icon: Assets.images.icons.featurePersona.image(height: 40, width: 40),
    title: 'なりきり挨拶・返信',
    body: 'あなたの人格を模したAIがあなたの代わりにメッセージを作成してくれます',
    cost: 1,
    unit: 'LP',
  ),
  FeatureData(
    icon: Assets.images.icons.featureQuestion.image(height: 40, width: 40),
    title: 'しつもん回答の閲覧',
    body: 'いいねをする前にお相手にしつもんをすることができます',
    cost: 1,
    unit: 'LP',
  ),
];

class TextTitle extends StatelessWidget {
  const TextTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 393,
      margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
      alignment: Alignment.centerLeft,
      child: InnerShadowText(
        text: title,
        textStyle: EconaTextStyle.labelMedium2140(
          color: EconaColor.grayNormal,
          shadows: EconaShadow.headlineShadows,
        ),
        innerShadowTextStyles: [
          EconaTextStyle.labelMedium2140(
            foreground: EconaShadow().headlineInnerShadow,
          ),
        ],
      ),
    );
  }
}

class TextBody extends StatelessWidget {
  const TextBody({
    super.key,
    required this.body,
  });
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        body,
        style: EconaTextStyle.regularMedium2200(
          color: EconaColor.grayDarkActive,
        ),
      ),
    );
  }
}