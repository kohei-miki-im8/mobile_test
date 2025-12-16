// ignore_for_file: unused_element
import 'dart:async';
import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/certification.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/infrastructures/services/revenuecat_service.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_overlay.dart';
import 'package:econa_mobile_app/presentations/components/panel.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/subscription_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_messages.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_helpers.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/certificate_level_code.pbenum.dart';

class SubscriptionPage extends HookConsumerWidget {
  const SubscriptionPage({
    required this.type,
    super.key,
  });

  final SubscriptionPageType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscriptionStateAsync = ref.watch(
      subscriptionPageViewModelProvider(type),
    );
    final selectedPackage = useState<Package?>(null);
    final titleText =
    (type == SubscriptionPageType.basic) ? 'ベーシックプラン' : 'プレミアムプラン';
    // handledInitialDataはトースト抑制用途だったが未使用に変更

    // ViewModelはLoadingに遷移しないため、ここでは直接エラー/成功を拾わない
    return Scaffold(
      appBar: CenterAppBar(
        titleText: titleText,
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.leftArrow.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: subscriptionStateAsync.when(
        loading: () => const Center(child: EconaLoadingIndicator()),
        error: (err, stack) => const SizedBox.shrink(),
        data: (state) {
          // 正常にデータが取得できた場合
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  children: [
                    // _RotationBanner(bannerData: bannerData),
                    const _SingleStatusCertificateRecommend(),
                    const _PriceSheetsTitle(),
                    PackageList(
                      offering: state.offering,
                      discountOffering: state.discountOffering,
                      showSingleCampaign: state
                          .userStatus?.certificateLevelCode !=
                          CertificateLevelCode
                              .CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED &&
                          state.discountOffering != null,
                      selectedPackage: selectedPackage.value,
                      onPackageSelected: (package) {
                        if (selectedPackage.value?.identifier ==
                            package.identifier) {
                          selectedPackage.value = null;
                        } else {
                          selectedPackage.value = package;
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    const TextTitle(title: '有料プランについて'),
                    const TextBody(
                        body:
                        'プラン料金の支払いは一括支払いのみとなります。複数月プランの購入であっても分割によるお支払いはできませんのでご了承ください。'),
                    const TextTitle(title: '注意事項'),
                    const TextBody(
                        body: '有料プランには1ヶ月、3ヶ月、6ヶ月ごとに自動継続機能をご用意しております。\n'
                            'ご自身で設定された自動継続機能を停止するには、有料プランの期限が切れる24時間以上前にお客様ご自身で自動継続機能をキャンセル処理をお手続きいただく必要がございます。\n\n'
                            '購入済みの有料プランのキャンセル処理は、プランの期間満了後に行われます。'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: 'キャンセルのお手続き方法は',
                            style: EconaTextStyle.regularMedium2200(
                              color: EconaColor.grayDarkActive,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'こちら',
                                style: EconaTextStyle.regularMedium2200(
                                  color: EconaColor.purpleNormal,
                                ).copyWith(
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    await const WebViewRouteData(
                                      url: EconaWebUrl.contact,
                                      title: 'ヘルプ・お問い合わせ',
                                    ).push<void>(context);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: 'プランの変更は',
                            style: EconaTextStyle.regularMedium2200(
                              color: EconaColor.grayDarkActive,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'こちら',
                                style: EconaTextStyle.regularMedium2200(
                                  color: EconaColor.purpleNormal,
                                ).copyWith(
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    await const WebViewRouteData(
                                      url: EconaWebUrl.contact,
                                      title: 'ヘルプ・お問い合わせ',
                                    ).push<void>(context);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 16),
                      child: InkWell(
                        onTap: () async {
                          final isSuccess = await ref.read(subscriptionPageViewModelProvider(type).notifier).restore();
                          if(!isSuccess) {
                            await EconaNotification.showTopToast(
                              context,
                              message: '復元処理に失敗しました\nサポートへお問い合わせください',
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 2,
                              color: EconaColor.purpleNormal,
                            ),
                          ),
                          child: Text(
                            '購入履歴を復元',
                            style: EconaTextStyle.regularMedium2200(
                              color: EconaColor.purpleNormal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
              // フローティングボタン
              if (selectedPackage.value != null)
                _PurchaseButton(
                  selectedPackage: selectedPackage.value!,
                  onTap: () async {
                    final isVerified = Certification
                        .fromCode(state.userStatus?.certificateLevelCode ??
                            CertificateLevelCode.CERTIFICATE_LEVEL_CODE_UNSPECIFIED)
                        .isIdentityVerified;
                    if(!isVerified) {
                      await showDialog<void>(
                        context: context,
                        builder: (ctx) => Dialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                          child: EconaModal(
                            message: 'まずは本人確認！',
                            subMessage: '有料プランを購入するには\n本人確認が必要です。',
                            buttonText: '本人確認をする',
                            onButtonPressed: () async {
                              if(ctx.mounted) {
                                ctx.pop();
                              }
                              await const CertificatesRouteData().push<void>(context);
                              // 戻ってきたらstate更新
                              await ref
                                  .read(subscriptionPageViewModelProvider(type).notifier)
                                  .reload();
                            },
                          ),
                        ),
                      );
                      return;
                    }

                    try {
                      // 購入前に外部ユーザーとRevenueCat IDの整合を保証
                      await ensureExternalUserLinked(ref);
                      final notifier =
                          ref.read(subscriptionPageViewModelProvider(type).notifier);
                      final state =
                          await ref.read(subscriptionPageViewModelProvider(type).future);
                      final customerInfo =
                          await RevenueCatService.purchasePackage(selectedPackage.value!);
                      if (customerInfo != null) {
                        final transactionId =
                            RevenueCatService.findTransactionIdForProduct(
                          customerInfo: customerInfo,
                          productIdentifier:
                              selectedPackage.value!.storeProduct.identifier,
                        );
                        final genderCode = state.genderCode;
                        if (genderCode != null) {
                          AdjustEventTracker.trackSubscriptionPurchase(
                            isBasicPlan: type == SubscriptionPageType.basic,
                            genderCode: genderCode,
                            packageType: selectedPackage.value!.packageType,
                            isSingleDiscount:
                                state.isSingleDiscountOffering ?? false,
                            revenue: selectedPackage.value!.storeProduct.price,
                            currency:
                                selectedPackage.value!.storeProduct.currencyCode,
                            transactionId: transactionId,
                          );
                        }
                        await notifier.build(type);

                        if (!context.mounted) return;
                        await EconaNotification.showTopToast(
                          context,
                          message: purchaseSuccessMessageDefault,
                        );
                        selectedPackage.value = null;
                        return;
                      }

                      if (!context.mounted) return;
                      await EconaNotification.showTopToast(
                        context,
                        message: const EconaError(
                          cause: EconaErrorCause.unknown,
                          operation: EconaErrorOperation.unknown,
                          message: '購入に失敗しました',
                        ).userMessage,
                      );
                    } on PlatformException catch (e) {
                      final mapped = EconaError.fromPlatformException(
                        e,
                        operation: EconaErrorOperation.unknown,
                      );

                      if (!context.mounted) return;

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

                      if (!context.mounted) return;

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
                ),
            ],
          );
        },
      ),
    );
  }
}

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
      margin: const EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: EconaTextStyle.labelMedium2140(
          color: EconaColor.grayNormal,
        ),
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

// バナーデータ（仮）
final List<BannerData> bannerData = [
  const BannerData(
    title: 'RevenueCat',
    subtitle: 'ベーシックプランの特典内容',
    colors: [Color(0xFFD4B5E8), Color(0xFFA094E6)],
  ),
  const BannerData(
    title: 'RevenueCat',
    subtitle: 'プレミアムプランの特典内容',
    colors: [Color(0xFFFFB3D1), Color(0xFFFF8FAB)],
  ),
  const BannerData(
    title: 'RevenueCat',
    subtitle: 'エクスクルーシブプランの特典内容',
    colors: [Color(0xFFAED6F1), Color(0xFF85C1E9)],
  ),
];

class _SingleStatusCertificateRecommend extends StatelessWidget {
  const _SingleStatusCertificateRecommend();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5FAFE),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-4, -4),
            blurRadius: 20,
            color: const Color(0xFF3E4AB5).withValues(alpha: 0.24),
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-6, -6),
            blurRadius: 20,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '独身証明完了でさらにお得に！',
          style: EconaTextStyle.labelMedium1140(
            color: EconaColor.grayDarkActive,
          ),
        ),
      ),
    );
  }
}

class BannerData {
  final String title;
  final String subtitle;
  final List<Color> colors;

  const BannerData({
    required this.title,
    required this.subtitle,
    required this.colors,
  });
}

class _RotationBanner extends HookConsumerWidget {
  const _RotationBanner({
    required this.bannerData,
  });

  final List<BannerData> bannerData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannerCount = bannerData.length;
    // 無限ループ: 実データ数×1000の中程から開始（クローン不要でジャンプも発生しない）
    final initial = bannerCount * 1000;
    final pageController =
    usePageController(viewportFraction: 0.85, initialPage: initial);
    final currentPage = useState(initial);
    final timerRef = useRef<Timer?>(null);
    final isAutoScrolling = useRef(false);
    final isUserDragging = useRef(false);

    void stopTimer() {
      timerRef.value?.cancel();
      timerRef.value = null;
    }

    void startTimer() {
      stopTimer();
      timerRef.value = Timer.periodic(const Duration(seconds: 3), (timer) {
        if (!pageController.hasClients) return;
        if (isAutoScrolling.value || isUserDragging.value) return;
        isAutoScrolling.value = true;
        final nextPage = currentPage.value + 1;
        pageController
            .animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        )
            .then((_) {
          if (!pageController.hasClients) return;
          currentPage.value = nextPage;
          isAutoScrolling.value = false;
        });
      });
    }

    useEffect(() {
      startTimer();
      return () => stopTimer();
    }, []);

    return Column(
      children: [
        Container(
          height: 155,
          margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollStartNotification) {
                  isUserDragging.value = true;
                  stopTimer();
                } else if (notification is ScrollEndNotification) {
                  isUserDragging.value = false;
                  // 少し待ってから再開（指離し直後の慣性スクロールを避ける）
                  Future.delayed(const Duration(milliseconds: 300), () {
                    if (!isUserDragging.value) startTimer();
                  });
                }
                return false;
              },
              child: PageView.builder(
                controller: pageController,
                clipBehavior: Clip.none,
                padEnds: false,
                onPageChanged: (index) {
                  currentPage.value = index;
                  if (!isAutoScrolling.value && !isUserDragging.value) {
                    startTimer();
                  }
                },
                itemBuilder: (context, index) {
                  final bannerIndex = index % bannerCount;
                  final banner = bannerData[bannerIndex];
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: banner.colors,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              banner.title,
                              style: EconaTextStyle.labelMedium2140(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              banner.subtitle,
                              style: EconaTextStyle.labelMedium2140(
                                color: Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '詳細を見る',
                                  style: EconaTextStyle.labelMedium2140(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PurchaseButton extends ConsumerWidget {
  const _PurchaseButton({
    required this.selectedPackage,
    required this.onTap,
  });

  final Package? selectedPackage;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String buttonText;
    if (selectedPackage != null) {
      buttonText = '${sanitizeStoreTitle(selectedPackage!.storeProduct.title)}を購入';
    } else {
      buttonText = 'プランを選択してください';
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 339,
        margin: const EdgeInsets.only(left: 35, top: 25, right: 35, bottom: 60),
        child: EconaGradientButton(
          text: buttonText,
          onPressed: selectedPackage != null
              ? () async {
            await onTap();
          }
              : () async {},
        ),
      ),
    );
  }
}

class PackageList extends StatelessWidget {
  const PackageList({
    required this.offering,
    this.discountOffering,
    this.showSingleCampaign = false,
    required this.selectedPackage,
    required this.onPackageSelected,
    super.key,
  });

  final Offering? offering;
  final Offering? discountOffering;
  final bool showSingleCampaign;
  final Package? selectedPackage;
  final ValueChanged<Package> onPackageSelected;

  @override
  Widget build(BuildContext context) {
    final packages = offering?.availablePackages ?? <Package>[];
    final discountPackages = discountOffering?.availablePackages ?? <Package>[];
    // 取り消し線表示に使う基準のパッケージ（通常1ヶ月の月額）
    Package? oneMonthPackage;
    for (final p in packages) {
      if (p.packageType == PackageType.monthly) {
        oneMonthPackage = p;
        break;
      }
    }
    final String oneMonthMonthlyText = oneMonthPackage != null
        ? '${_formatWithComma(PackageTypeHelper.calculateMonthlyPrice(oneMonthPackage).round())}/月'
        : '';

    // 表示順: 6ヶ月 → 3ヶ月 → 1ヶ月
    final filtered = packages
        .where((p) =>
    p.packageType == PackageType.sixMonth ||
        p.packageType == PackageType.threeMonth ||
        p.packageType == PackageType.monthly)
        .toList()
      ..sort((a, b) => _extractMonths(
          PackageTypeHelper.getPeriodText(b.packageType))
          .compareTo(
          _extractMonths(PackageTypeHelper.getPeriodText(a.packageType))));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 12,
        children: filtered.map((packageItem) {
          final matchedDiscounts = discountPackages.where(
                (d) => d.packageType == packageItem.packageType,
          );
          final Package? discountPackage =
          matchedDiscounts.isNotEmpty ? matchedDiscounts.first : null;
          final isSelected =
              selectedPackage?.identifier == packageItem.identifier;

          return GestureDetector(
            onTap: () => onPackageSelected(packageItem),
            child: _PlanCard(
              primaryPackage: packageItem,
              discountPackage: showSingleCampaign ? discountPackage : null,
              originalMonthlyPriceText: oneMonthMonthlyText,
              isSelected: isSelected,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _PriceSheetsTitle extends StatelessWidget {
  const _PriceSheetsTitle();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        '料金表',
        style: EconaTextStyle.labelMedium2140(
          color: EconaColor.grayNormal,
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.primaryPackage,
    this.discountPackage,
    this.originalMonthlyPriceText = '',
    this.isSelected = false,
  });

  // 通常表示のパッケージ（未証明:通常, 証明済:割引）
  final Package primaryPackage;
  // オプションの割引パッケージ（未証明時にある場合のみ表示）
  final Package? discountPackage;
  // 上段取り消し線テキスト（通常の1ヶ月金額）
  final String originalMonthlyPriceText;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    String labelOf(Package p) => PackageTypeHelper.getPeriodText(p.packageType);
    String monthTextOf(Package p) {
      final formatter = NumberFormat('#,###');
      final price = p.storeProduct.price.round();
      final pricePerMonth = (price / _extractMonths(labelOf(p))).round();

      final priceText = formatter.format(pricePerMonth);
      return '$priceText/月';
    }

    String totalTextOf(Package p) {
      final formatter = NumberFormat('#,###');
      final priceText = formatter.format(p.storeProduct.price.round());
      final months = _extractMonths(labelOf(p));

      return '$priceText/$monthsヶ月';
    }

    Widget content = ConvexPanel(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (originalMonthlyPriceText.isNotEmpty)
              Text(
                originalMonthlyPriceText,
                style: EconaTextStyle.labelSmall120(
                  color: EconaColor.grayNormal,
                  textDecoration: TextDecoration.lineThrough,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PlanLabelRich(
                  planLabelText: labelOf(primaryPackage),
                  color: EconaColor.grayDarkActive,
                ),
                _PricePerMonthRich(
                  priceText: monthTextOf(primaryPackage),
                  color: EconaColor.grayDarkActive,
                  hideUnit: primaryPackage.packageType == PackageType.monthly,
                ),
              ],
            ),
            if (primaryPackage.packageType != PackageType.monthly)
              Text(
                totalTextOf(primaryPackage),
                style:
                EconaTextStyle.labelSmall140(color: EconaColor.grayNormal),
              ),
            if (discountPackage != null) ...[
              const SizedBox(height: 20),
              _SingleCampaign(
                labelText: '独身証明完了で',
                originalMonthlyPriceText: originalMonthlyPriceText.isNotEmpty
                    ? originalMonthlyPriceText
                    : null,
                monthlyPriceText: monthTextOf(discountPackage!),
                normalTotalText:
                primaryPackage.packageType == PackageType.monthly
                    ? ''
                    : totalTextOf(primaryPackage),
                campaignTotalText:
                discountPackage!.packageType == PackageType.monthly
                    ? ''
                    : totalTextOf(discountPackage!),
                hideUnit: primaryPackage.packageType == PackageType.monthly,
                hideTotal: primaryPackage.packageType == PackageType.monthly,
                showSavingsBadge:
                primaryPackage.packageType != PackageType.monthly,
              ),
            ],
          ],
        ),
      ),
    );

    if (isSelected) {
      content = GradientBorderOverlay(
        borderRadius: BorderRadius.circular(16),
        strokeWidth: 3,
        gradients: const [
          LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFD097DB), Color(0xFF8887EE)],
          ),
          LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFD097DB), Color(0xFF8887EE)],
          ),
        ],
        child: content,
      );
    }

    return content;
  }
}

class _SingleCampaign extends StatelessWidget {
  const _SingleCampaign({
    required this.labelText,
    required this.monthlyPriceText,
    required this.normalTotalText,
    required this.campaignTotalText,
    this.originalMonthlyPriceText,
    this.hideUnit = false,
    this.hideTotal = false,
    this.showSavingsBadge = true,
  });

  final String? originalMonthlyPriceText;
  final String labelText;
  final String monthlyPriceText;
  final String normalTotalText;
  final String campaignTotalText;
  final bool hideUnit;
  final bool hideTotal;
  final bool showSavingsBadge;

  @override
  Widget build(BuildContext context) {
    return ConcavePanel(
      backgroundColor: const Color(0xFFF5F5FE),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (originalMonthlyPriceText != null)
              Text(
                originalMonthlyPriceText!,
                style: EconaTextStyle.labelSmall120(
                  color: EconaColor.grayNormal,
                  textDecoration: TextDecoration.lineThrough,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  labelText,
                  style: EconaTextStyle.labelSmall140(
                    color: EconaColor.grayDarkActive,
                  ),
                ),
                _PricePerMonthRich(
                  priceText: monthlyPriceText,
                  color: EconaColor.grayDarkActive,
                  hideUnit: hideUnit,
                ),
              ],
            ),
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (showSavingsBadge)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: EconaColor.feedbackRed400,
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      _formatSavings(normalTotalText, campaignTotalText),
                      style: EconaTextStyle.labelSmall140(
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (!hideTotal)
                  Text(
                    campaignTotalText,
                    style: EconaTextStyle.labelSmall140(
                      color: EconaColor.grayNormal,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanLabelRich extends StatelessWidget {
  const _PlanLabelRich({
    required this.planLabelText,
    required this.color,
  });

  final String planLabelText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final match = RegExp(r'^(\d+)(.*)$').firstMatch(planLabelText);
    final numPart =
    match != null ? match.group(1) ?? planLabelText : planLabelText;
    final unitPart = match != null ? match.group(2) ?? '' : '';
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: numPart,
            style: EconaTextStyle.priceTitle(color: color),
          ),
          if (unitPart.isNotEmpty)
            TextSpan(
              text: unitPart,
              style: EconaTextStyle.labelMedium2140(color: color),
            ),
        ],
      ),
    );
  }
}

class _PricePerMonthRich extends StatelessWidget {
  const _PricePerMonthRich({
    required this.priceText,
    required this.color,
    this.hideUnit = false,
  });

  final String priceText; // e.g., "3,233/月"
  final Color color;
  final bool hideUnit;

  @override
  Widget build(BuildContext context) {
    if (hideUnit) {
      return Text(
        priceText.replaceAll('/月', ''),
        style: EconaTextStyle.priceTitle(color: color),
      );
    }
    final parts = priceText.split('/');
    final price = parts.isNotEmpty ? parts.first : priceText;
    final unit = parts.length > 1 ? '/${parts[1]}' : '';
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: price,
            style: EconaTextStyle.priceTitle(color: color),
          ),
          if (unit.isNotEmpty)
            TextSpan(
              text: unit,
              style: EconaTextStyle.labelMedium2140(color: color),
            ),
        ],
      ),
    );
  }
}

String _formatWithComma(int value) {
  final s = value.toString();
  final reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  return s.replaceAllMapped(reg, (m) => '${m[1]},');
}

int _extractMonths(String label) {
  final match = RegExp(r'^(\d+)').firstMatch(label);
  if (match != null) {
    return int.tryParse(match.group(1)!) ?? 1;
  }
  return 1;
}

String _formatSavings(String normalTotalText, String campaignTotalText) {
  int parseAmount(String text) {
    final digits = text.split('/').first.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return 0;
    return int.tryParse(digits) ?? 0;
  }

  final normal = parseAmount(normalTotalText);
  final campaign = parseAmount(campaignTotalText);
  final diff = (normal - campaign).clamp(0, 1 << 31);
  return '¥${_formatWithComma(diff)}お得！';
}