import 'package:econa_mobile_app/domains/entities/approach_analysis.dart';
import 'package:econa_mobile_app/domains/entities/ideal.dart';
import 'package:econa_mobile_app/domains/entities/profile_label_keys.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/body_type_code.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/salary_range_code.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/date_tab.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_tab.dart';
import 'package:econa_mobile_app/presentations/components/empty_state.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/helpers/label_localizer.dart';
import 'package:econa_mobile_app/presentations/layout.dart';
import 'package:econa_mobile_app/presentations/pages/karute/karute_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/karute/karute_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/karute/love_advice_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/karute/love_advice_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum PageType {
  karute,
  loveAdvice,
}

class PageDetails {
  const PageDetails({
    required this.titleText,
    required this.leadingIcon,
    required this.tabLabels,
    required this.showDateTabRow,
    this.actions,
  });

  factory PageDetails.karuteDetails() {
    return PageDetails(
      titleText: EconaAppBarText.karuteTitle,
      leadingIcon: Assets.images.icons.close.image(),
      actions: null,
      tabLabels: ['あなたの診断結果'],
      showDateTabRow: true,
    );
  }

  factory PageDetails.loveAdviceDetails() {
    return PageDetails(
      titleText: EconaAppBarText.loveAdviceTitle,
      leadingIcon: Assets.images.icons.close.image(),
      actions: null,
      tabLabels: ['理想について', 'アプローチ分析'],
      showDateTabRow: false,
    );
  }

  final String titleText;
  final Widget leadingIcon;
  final List<Widget>? actions;
  final List<String> tabLabels;
  final bool showDateTabRow;
}

class KaruteLoveAdvicePage extends StatelessWidget {
  KaruteLoveAdvicePage({
    required this.pageType,
    super.key,
  }) : pageDetails = pageType == PageType.karute
            ? PageDetails.karuteDetails()
            : PageDetails.loveAdviceDetails();
  final PageType pageType;
  final PageDetails pageDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CenterAppBar(
        titleText: pageDetails.titleText,
        leading: IconButton(
          icon: pageDetails.leadingIcon,
          iconSize: 32,
          padding: EdgeInsets.zero,
          onPressed: () {
            context.pop();
          },
        ),
        actions: pageDetails.actions,
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: EconaPagePadding.horizontal),
        child: _PageBody(pageType: pageType),
      ),
    );
  }
}

class _PageBody extends ConsumerWidget {
  const _PageBody({
    required this.pageType,
  });
  final PageType pageType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageDetails = pageType == PageType.karute
        ? PageDetails.karuteDetails()
        : PageDetails.loveAdviceDetails();
    final selectedIndex = ref.watch(tabIndexProvider('karute_love_advice'));

    // PageTypeに応じて適切なviewmodelのみを使用
    if (pageType == PageType.karute) {
      final karuteState = ref.watch(karutePageViewModelProvider);

      // カルテページのエラーでメンテナンスモードを検知
      ref.listen<KarutePageState>(karutePageViewModelProvider, (previous, next) async {
        final error = next.error;
        if (error == null) {
          return;
        }

        await handleEconaError(context, error);
      });

      if (karuteState.isLoading) {
        return const Center(child: EconaLoadingIndicator());
      }
      if (karuteState.error != null) {
        return EmptyState(
          title: karuteState.error!.operationMessage,
          buttonText: '再試行',
          onButtonTap: () =>
              ref.read(karutePageViewModelProvider.notifier).fetchKarte(),
        );
      }
    } else {
      final state = ref.watch(loveAdvicePageViewModelProvider);

      // 恋愛アドバイスページのエラーでメンテナンスモードを検知
      ref.listen<LoveAdvicePageState>(loveAdvicePageViewModelProvider, (previous, next) async {
        final error = next.error;
        if (error == null) {
          return;
        }

        await handleEconaError(context, error);
      });

      if (state.isLoading) {
        return const Center(child: EconaLoadingIndicator());
      }
      if (state.error != null) {
        return EmptyState(
          title: state.error!.operationMessage,
          buttonText: '再試行',
          onButtonTap: () =>
              ref.read(loveAdvicePageViewModelProvider.notifier).fetchAll(),
        );
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 6),
          child: switch (pageDetails.tabLabels.length) {
            0 => const SizedBox.shrink(),
            1 => Text(
                pageDetails.tabLabels.first,
                style: EconaTextStyle.headlineHeadline(
                  color: EconaColor.grayDarkActive,
                ),
              ),
            _ => EconaTabWithProvider(
                labels: pageDetails.tabLabels,
                pageKey: 'karute_love_advice',
              ),
          },
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: EconaPagePadding.bottom),
            child: IndexedStack(
              index: selectedIndex,
              children: List.generate(pageDetails.tabLabels.length, (index) {
                return _DateTabSection(
                  key: ValueKey(index),
                  pageType: pageType,
                  showDateTabRow: pageDetails.showDateTabRow,
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class _DateTabSection extends HookConsumerWidget {
  const _DateTabSection({
    required this.pageType,
    required this.showDateTabRow,
    super.key,
  });
  final PageType pageType;
  final bool showDateTabRow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDateIndex = useState(0);

    // PageTypeに応じて適切なviewmodelのみを使用
    List<String> dates;
    if (pageType == PageType.karute) {
      final karuteState = ref.watch(karutePageViewModelProvider);

      // カルテ画面の場合、カルテデータから日付を取得
      if (karuteState.karte != null) {
        dates = karuteState.karte!.userAnalyses.map((analysis) {
          if (analysis.createdAt != null) {
            return '${analysis.createdAt!.month}/${analysis.createdAt!.day}';
          }
          return '診断日';
        }).toList();
      } else {
        dates = [];
      }
    } else {
      dates = [];
    }

    return Column(
      children: [
        if (showDateTabRow)
          _DateTabRow(dates: dates, selectedIndex: selectedDateIndex),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: pageType == PageType.loveAdvice
              ? const LoveAdviceBody()
              : KaruteBody(
                  selectedDateIndex: selectedDateIndex,
                  dates: dates,
                ),
        ),
      ],
    );
  }
}

class KaruteBody extends ConsumerWidget {
  const KaruteBody({
    required this.selectedDateIndex,
    required this.dates,
    super.key,
  });

  final ValueNotifier<int> selectedDateIndex;
  final List<String> dates;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (dates.isEmpty) {
      return Center(
        child: Text(
          'データがありません',
          style: EconaTextStyle.regularMedium1160(),
        ),
      );
    }
    return IndexedStack(
      index: selectedDateIndex.value,
      children: List.generate(dates.length, (index) {
        final karuteState = ref.watch(karutePageViewModelProvider);
        if (karuteState.karte == null ||
            karuteState.karte!.userAnalyses.isEmpty) {
          return Center(
            child: Text(
              'データがありません',
              style: EconaTextStyle.regularMedium1160(),
            ),
          );
        }

        // 選択された日付のカルテデータを取得
        final selectedAnalysis =
            karuteState.karte!.userAnalyses[selectedDateIndex.value];

        final subsections = [
          if (selectedAnalysis.philosophyOnLove != null)
            Subsection(
              icon: Assets.images.icons.karute.image(height: 24),
              title: 'あなたの恋愛観',
              body: Text(selectedAnalysis.philosophyOnLove!),
            ),
          if (selectedAnalysis.potentialNeeds != null)
            Subsection(
              icon: Assets.images.icons.karute.image(height: 24),
              title: 'あなたの潜在的な欲求',
              body: Text(selectedAnalysis.potentialNeeds!),
            ),
          if (selectedAnalysis.compatibilityFeatures != null)
            Subsection(
              icon: Assets.images.icons.karute.image(height: 24),
              title: '相性が良いお相手の特徴',
              body: Text(selectedAnalysis.compatibilityFeatures!),
            ),
          if (selectedAnalysis.comprehensiveAnalysis != null)
            Subsection(
              icon: Assets.images.icons.karute.image(height: 24),
              title: '総合的な分析',
              body: Text(selectedAnalysis.comprehensiveAnalysis!),
            ),
        ];

        return _Tab(
          subsections: subsections,
        );
      }),
    );
  }
}

class LoveAdviceBody extends ConsumerWidget {
  const LoveAdviceBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final econaTabSelectedIndex =
        ref.watch(tabIndexProvider('karute_love_advice'));
    final state = ref.watch(loveAdvicePageViewModelProvider);

    if (econaTabSelectedIndex == 0 && state.idealAdvice != null) {
      final ideal = state.idealAdvice!;
      final subsections = [
        Subsection(
          icon: Assets.images.icons.lightbulb.image(height: 24),
          title: 'アドバイス',
          body: Text(ideal.adviceMessage),
        ),
        Subsection(
          icon: Assets.images.icons.faceHeartBottomLeft.image(height: 24),
          title: 'あなたが興味を持ったお相手の特徴',
          body: _IdealPersonalityTable(
            personality: ideal.userSimplifiedPersonality,
          ),
        ),
        Subsection(
          icon: Assets.images.icons.faceHeartBottomRight.image(height: 24),
          title: 'あなたに興味を持ったお相手の特徴',
          body: _IdealPersonalityTable(
            personality: ideal.toUserSimplifiedPersonality,
          ),
        ),
        Subsection(
          icon: Assets.images.icons.threePeople.image(height: 24),
          title: 'あなたと同世代の理想のタイプ',
          body: _IdealPersonalityTable(
            personality: ideal.sameGenderSameGenerationIdealPersonality,
          ),
        ),
      ];
      return _Tab(
        subsections: subsections,
      );
    }
    if (econaTabSelectedIndex == 1 && state.approachAnalysis != null) {
      final approach = state.approachAnalysis!;
      final subsections = [
        Subsection(
          icon: Assets.images.icons.lightbulb.image(height: 24),
          title: 'アドバイス',
          body: Text(approach.adviceMessage),
        ),
        Subsection(
          icon: Assets.images.icons.footPrint.image(height: 24),
          title: '足あと推移',
          body: FootPrintChart(
            histories: approach.footprintHistories,
          ),
          bodyPadding: const EdgeInsets.fromLTRB(5, 12, 24, 12),
        ),
        Subsection(
          icon: Assets.images.icons.heart.image(height: 24),
          title: 'いいね推移',
          body: LikeCountChart(
            histories: approach.likeHistories,
          ),
          bodyPadding: const EdgeInsets.fromLTRB(5, 12, 24, 12),
        ),
      ];
      return _Tab(
        subsections: subsections,
      );
    }
    return const SizedBox.shrink();
  }
}

class Subsection {
  const Subsection({
    required this.icon,
    required this.title,
    required this.body,
    this.bodyPadding,
  });
  final Widget icon;
  final String title;
  final Widget body;
  final EdgeInsets? bodyPadding;
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.subsections,
  });
  final List<Subsection> subsections;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final subsection in subsections) ...[
          _Subtitle(
            icon: subsection.icon,
            text: subsection.title,
          ),
          _Paragraph(
            body: subsection.body,
            bodyPadding: subsection.bodyPadding,
          ),
        ],
      ],
    );
  }
}

class _DateTabRow extends StatelessWidget {
  const _DateTabRow({
    required this.dates,
    required this.selectedIndex,
  });

  final List<String> dates;
  final ValueNotifier<int> selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '診断日：',
            style: EconaTextStyle.labelSmall22(
              color: EconaColor.grayGrayPurple400,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: DateTab(
              dates: dates,
              selectedIndex: selectedIndex.value,
              selectedColor: EconaColor.grayDarkActive,
              unselectedColor: EconaColor.grayGrayPurple400,
              selectedOpacity: 1,
              unselectedOpacity: 0.4,
              onTap: (index) => selectedIndex.value = index,
            ),
          ),
        ],
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({required this.text, required this.icon});

  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            text,
            style: EconaTextStyle.labelSmall22(
              color: EconaColor.grayNormalHover,
            ),
          ),
        ],
      ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  const _Paragraph({
    required this.body,
    EdgeInsets? bodyPadding,
  }) : bodyPadding = bodyPadding ?? const EdgeInsets.all(20);

  final Widget body;
  final EdgeInsets bodyPadding;

  @override
  Widget build(BuildContext context) {
    return ShadowAndGradientBorderContainer(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderWidth: 1,
      gradients: [
        LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFFFFFFF).withValues(alpha: 1),
            const Color(0xFFFFFFFF).withValues(alpha: 0),
          ],
        ),
        LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFD6E3F3).withValues(alpha: 0.46),
            const Color(0xFFFFFFFF).withValues(alpha: 0.46),
          ],
        ),
      ],
      backgroundColor: EconaColor.tabBackgroundActive,
      innerShadows: [
        BoxShadow(
          color: const Color(0xFFFFFFFF).withValues(alpha: 0.88),
          blurRadius: 9,
          offset: const Offset(-4, -4),
        ),
      ],
      dropShadows: [
        BoxShadow(
          color: const Color(0xFF7273AB).withValues(alpha: 0.10),
          blurRadius: 4,
          offset: const Offset(2, 2),
        ),
        BoxShadow(
          color: Colors.white.withValues(alpha: 1),
          blurRadius: 20,
          offset: const Offset(-6, -6),
        ),
        BoxShadow(
          color: const Color(0xFF6F75B0).withValues(alpha: 0.24),
          blurRadius: 20,
          offset: const Offset(4, 4),
        ),
      ],
      child: Padding(
        padding: bodyPadding,
        child: body,
      ),
    );
  }
}

class PropertyItem {
  const PropertyItem({
    required this.label,
    required this.value,
  });
  final String label;
  final String value;
}

class _PropertyRows extends StatelessWidget {
  const _PropertyRows({
    required this.rows,
  });
  final List<List<PropertyItem>> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final items in rows) _PropertyRow(items: items),
      ],
    );
  }
}

class _PropertyRow extends StatelessWidget {
  const _PropertyRow({
    required this.items,
  });
  final List<PropertyItem> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 303,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0) const SizedBox(width: 16),
            Expanded(
              child: _Property(label: items[i].label, value: items[i].value),
            ),
          ],
        ],
      ),
    );
  }
}

class _Property extends StatelessWidget {
  const _Property({
    required this.label,
    required this.value,
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: EconaTextStyle.regularMedium1160(
            color: EconaColor.grayNormal,
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            value,
            style: EconaTextStyle.regularMedium1160(
              color: EconaColor.grayDarkActive,
            ),
          ),
        ),
      ],
    );
  }
}

// FootPrintChart: APIデータを受け取れるよう拡張
class FootPrintChart extends StatelessWidget {
  const FootPrintChart({super.key, this.histories});

  final List<ApproachFootprintHistory>? histories;

  static const double xLabelTopPadding = 8.4;

  // データの最大値に基づいてY軸ラベルを生成
  List<int> _generateYLabels(double maxValue) {
    if (maxValue <= 0) return [0, 25, 50, 75, 100];

    // 最大値を適切な間隔で分割
    final step = _calculateStep(maxValue);
    final maxLabel = (maxValue / step).ceil() * step;

    final labels = <int>[];
    for (int i = 0; i <= maxLabel; i += step) {
      labels.add(i);
    }

    // ラベルが多すぎる場合は間隔を調整
    if (labels.length > 6) {
      final adjustedStep = _calculateStep(maxValue * 1.5);
      final adjustedMaxLabel = (maxValue / adjustedStep).ceil() * adjustedStep;
      labels.clear();
      for (int i = 0; i <= adjustedMaxLabel; i += adjustedStep) {
        labels.add(i);
      }
    }

    return labels;
  }

  // 適切なステップ値を計算
  int _calculateStep(double maxValue) {
    if (maxValue <= 10) return 2;
    if (maxValue <= 50) return 10;
    if (maxValue <= 100) return 20;
    if (maxValue <= 500) return 100;
    if (maxValue <= 1000) return 200;
    return 500;
  }

  // APIデータに基づいてX軸ラベルを生成
  List<String> _generateXLabels(List<ApproachFootprintHistory>? histories) {
    if (histories == null || histories.isEmpty) {
      return [];
    }

    // 日付を昇順でソート
    final sortedHistories = List<ApproachFootprintHistory>.from(histories)
      ..sort((a, b) => a.historyDate.compareTo(b.historyDate));

    // データポイントが多すぎる場合は間隔を調整
    const maxLabels = 7;
    final interval = (sortedHistories.length / maxLabels).ceil();

    final labels = <String>[];
    for (int i = 0; i < sortedHistories.length; i += interval) {
      final date = sortedHistories[i].historyDate;
      labels.add('${date.month}/${date.day}');

      // 最大ラベル数に達したら終了
      if (labels.length >= maxLabels) break;
    }

    return labels;
  }

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> spots = histories == null
        ? []
        : () {
            final sortedHistories =
                List<ApproachFootprintHistory>.from(histories!)
                  ..sort((a, b) => a.historyDate.compareTo(b.historyDate));
            return sortedHistories
                .asMap()
                .entries
                .map(
                  (e) => FlSpot(
                    e.key.toDouble(),
                    e.value.footprintAmount.toDouble(),
                  ),
                )
                .toList();
          }();

    // APIデータに基づいてY軸ラベルを動的に生成
    final maxValue = spots.isNotEmpty
        ? spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b)
        : 100.0;
    final yLabels = _generateYLabels(maxValue);
    double maxLabelWidth = 0;
    for (final label in yLabels) {
      final tp = TextPainter(
        maxLines: 1,
        text: TextSpan(
          text: label.toString(),
          style: EconaTextStyle.labelXSmall(),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      if (tp.width > maxLabelWidth) {
        maxLabelWidth = tp.width;
      }
    }
    // 余白を加算
    final reservedSize = maxLabelWidth + 15; // + 15: 目盛りが正しく表示されるように調整

    // APIデータに基づいてX軸ラベルを動的に生成
    final xLabels = _generateXLabels(histories);
    double maxXLabelheight = 0;
    for (final label in xLabels) {
      final tp = TextPainter(
        maxLines: 1,
        text: TextSpan(text: label, style: EconaTextStyle.regularXSmall()),
        textDirection: TextDirection.ltr,
      )..layout();
      if (tp.height > maxXLabelheight) {
        maxXLabelheight = tp.height;
      }
    }
    final reservedXSize = maxXLabelheight + xLabelTopPadding; // 余白を加算

    return SizedBox(
      width: double.infinity,
      height: 167,
      child: LineChart(
        LineChartData(
          minY: yLabels.first.toDouble() - 1, // -1: 目盛り0の横グリッド線を表示させるため
          maxY: yLabels.last +
              (yLabels.last * 0.1 > 1
                  ? yLabels.last * 0.1
                  : 1), // 最大値に1か10%の大きい方の余裕を持たせる
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                color: EconaColor.chartBorder,
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: yLabels.length > 1
                    ? (yLabels.last - yLabels.first) / (yLabels.length - 1)
                    : 50,
                reservedSize: reservedSize,
                getTitlesWidget: (value, meta) {
                  if (yLabels.contains(value.toInt())) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 13.23),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          maxLines: 1,
                          value.toInt().toString(),
                          style: EconaTextStyle.labelXSmall(
                            color: EconaColor.grayNormal,
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final idx = value.toInt();
                  if (idx >= 0 && idx < xLabels.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: xLabelTopPadding),
                      child: Text(
                        xLabels[idx],
                        style: EconaTextStyle.regularXSmall(
                          color: idx == xLabels.length - 1
                              ? EconaColor.feedbackRedNormalHover
                              : EconaColor.grayNormal,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
                interval: 1,
                reservedSize: reservedXSize,
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: EconaColor.purpleNormal,
              barWidth: 1,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    EconaColor.purpleNormal.withValues(alpha: 0.6),
                    EconaColor.purpleNormal.withValues(alpha: 0),
                  ],
                  stops: const [0.03, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

// LikeCountChart: APIデータを受け取れるよう拡張
class LikeCountChart extends StatelessWidget {
  const LikeCountChart({super.key, this.histories});

  final List<ApproachLikeHistory>? histories;

  // APIデータに基づいてX軸ラベルを生成
  List<String> _generateXLabels(List<ApproachLikeHistory>? histories) {
    if (histories == null || histories.isEmpty) {
      return [];
    }

    // 日付を昇順でソート
    final sortedHistories = List<ApproachLikeHistory>.from(histories)
      ..sort((a, b) => a.historyDate.compareTo(b.historyDate));

    // データポイントが多すぎる場合は間隔を調整
    const maxLabels = 7;
    final interval = (sortedHistories.length / maxLabels).ceil();

    final labels = <String>[];
    for (int i = 0; i < sortedHistories.length; i += interval) {
      final date = sortedHistories[i].historyDate;
      labels.add('${date.month}/${date.day}');

      // 最大ラベル数に達したら終了
      if (labels.length >= maxLabels) break;
    }

    return labels;
  }

  static const double xLabelTopPadding = 8;
  static const double yLabelRightPadding = 8;

  // データの最大値に基づいてY軸ラベルを生成
  List<int> _generateYLabels(double maxValue) {
    if (maxValue <= 0) return [0, 25, 50, 75, 100];

    // 最大値を適切な間隔で分割
    final step = _calculateStep(maxValue);
    final maxLabel = (maxValue / step).ceil() * step;

    final labels = <int>[];
    for (int i = 0; i <= maxLabel; i += step) {
      labels.add(i);
    }

    // ラベルが多すぎる場合は間隔を調整
    if (labels.length > 6) {
      final adjustedStep = _calculateStep(maxValue * 1.5);
      final adjustedMaxLabel = (maxValue / adjustedStep).ceil() * adjustedStep;
      labels.clear();
      for (int i = 0; i <= adjustedMaxLabel; i += adjustedStep) {
        labels.add(i);
      }
    }

    return labels;
  }

  // 適切なステップ値を計算
  int _calculateStep(double maxValue) {
    if (maxValue <= 10) return 2;
    if (maxValue <= 50) return 10;
    if (maxValue <= 100) return 20;
    if (maxValue <= 500) return 100;
    if (maxValue <= 1000) return 200;
    return 500;
  }

  @override
  Widget build(BuildContext context) {
    final List<double> barValues = histories == null
        ? []
        : () {
            final sortedHistories = List<ApproachLikeHistory>.from(histories!)
              ..sort((a, b) => a.historyDate.compareTo(b.historyDate));
            return sortedHistories.map((e) => e.likeAmount.toDouble()).toList();
          }();

    // APIデータに基づいてY軸ラベルを動的に生成
    final maxValue = barValues.isNotEmpty
        ? barValues.reduce((a, b) => a > b ? a : b)
        : 100.0;
    final yLabels = _generateYLabels(maxValue);

    // Y軸ラベルの最大幅を計算
    double maxYLabelWidth = 0;
    for (final label in yLabels) {
      final tp = TextPainter(
        maxLines: 1,
        text: TextSpan(
          text: label.toString(),
          style: EconaTextStyle.labelXSmall(),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      if (tp.width > maxYLabelWidth) {
        maxYLabelWidth = tp.width;
      }
    }
    final reservedYSize = maxYLabelWidth + yLabelRightPadding;

    // APIデータに基づいてX軸ラベルを動的に生成
    final xLabels = _generateXLabels(histories);

    // X軸ラベルの最大高さを計算
    double maxXLabelHeight = 0;
    for (final label in xLabels) {
      final tp = TextPainter(
        maxLines: 1,
        text: TextSpan(text: label, style: EconaTextStyle.regularXSmall()),
        textDirection: TextDirection.ltr,
      )..layout();
      if (tp.height > maxXLabelHeight) {
        maxXLabelHeight = tp.height;
      }
    }
    final reservedXSize = maxXLabelHeight + xLabelTopPadding;

    return SizedBox(
      width: double.infinity,
      height: 160,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          minY: yLabels.first.toDouble() - 1, // -1: 目盛り0の横グリッド線を表示させるため
          maxY: yLabels.last +
              (yLabels.last * 0.1 > 1
                  ? yLabels.last * 0.1
                  : 1), // 最大値に1か10%の大きい方の余裕を持たせる
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) => const FlLine(
              color: EconaColor.chartBorder,
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: yLabels.length > 1
                    ? (yLabels.last - yLabels.first) / (yLabels.length - 1)
                    : 50,
                reservedSize: reservedYSize,
                getTitlesWidget: (value, meta) {
                  if (yLabels.contains(value.toInt())) {
                    return Padding(
                      padding: const EdgeInsets.only(right: yLabelRightPadding),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          value.toInt().toString(),
                          style: EconaTextStyle.labelXSmall(
                            color: EconaColor.grayNormal,
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final idx = value.toInt();
                  if (idx >= 0 && idx < xLabels.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        xLabels[idx],
                        style: EconaTextStyle.regularXSmall(
                          color: idx == xLabels.length - 1
                              ? EconaColor.feedbackRedNormalHover
                              : EconaColor.grayNormal,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
                interval: 1,
                reservedSize: reservedXSize,
              ),
            ),
          ),
          barGroups: List.generate(barValues.length, (i) {
            return BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: barValues[i],
                  color: EconaColor.purpleNormal,
                  width: 22,
                  borderRadius: BorderRadius.circular(0),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

// 理想の特徴テーブル
class _IdealPersonalityTable extends StatelessWidget {
  const _IdealPersonalityTable({this.personality});
  final IdealUserPersonality? personality;

  @override
  Widget build(BuildContext context) {
    if (personality == null) {
      return Text(
        '※データが不足しています。\nお相手に「いいね」をしてみましょう',
        style: EconaTextStyle.regularMedium1160(
          color: EconaColor.grayDarkActive,
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PropertyRows(
          rows: [
            [
              PropertyItem(
                label: '年齢',
                value: '${personality!.medianAge}歳',
              ),
              PropertyItem(
                label: '年収',
                value: localizeLabel(
                  (personality?.salaryRangeCode ??
                          SalaryRangeCode.SALARY_RANGE_CODE_UNSPECIFIED)
                      .labelKey,
                ),
              ),
            ],
          ],
        ),
        _PropertyRows(
          rows: [
            [
              PropertyItem(
                label: '身長',
                value: '${personality!.medianHeight}cm',
              ),
              PropertyItem(
                label: '体型',
                value: localizeLabel(
                  (personality?.bodyTypeCode ??
                          BodyTypeCode.BODY_TYPE_CODE_UNSPECIFIED)
                      .labelKey,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
