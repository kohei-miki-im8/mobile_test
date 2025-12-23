import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_point_history.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_history_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class PurchaseHistoryPage extends HookConsumerWidget {
  const PurchaseHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pointsAsync = ref.watch(purchaseHistoryPointsProvider);
    final historyAsync = ref.watch(purchaseHistoryPageViewModelProvider);

    return Scaffold(
      appBar: CenterAppBar(
        titleText: 'ポイント履歴',
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: EconaColor.background,
      body: pointsAsync.when(
        loading: () => const Center(
          child: EconaLoadingIndicator(),
        ),
        error: (error, stackTrace) => const Center(
          child: Text('ポイント情報の取得に失敗しました'),
        ),
        data: (points) {
          return historyAsync.when(
            loading: () => const Center(
              child: EconaLoadingIndicator(),
            ),
            error: (error, stackTrace) => const Center(
              child: Text('ポイント履歴の取得に失敗しました'),
            ),
            data: (historyResponse) {
              final historyItems =
                  _buildPurchaseHistoryListItems(historyResponse);

              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 64),
                child: Column(
                  children: [
                    _PossessionPointsGrid(
                      purchasedMp: points.matchingPoint,
                      purchasedLp: points.lavigationPoint,
                      grantedMp: points.freeMatchingPoint,
                      grantedLp: points.freeLavigationPoint,
                    ),
                    _PurchaseHistoryTable(
                      items: historyItems,
                    ),
                    const SizedBox(height: 24),
                    const _AttentionText(
                      text: '※ご購入いただいたポイントの有効期限は購入日より180日となります。',
                    ),
                    const SizedBox(height: 12),
                    const _AttentionText(
                      text: '※「付与LP」とは、Laviからお客様へ付与したラヴィゲーションポイント（LP）です。',
                    ),
                    const SizedBox(height: 12),
                    const _AttentionText(
                      text: '※「付与MP」とは、Laviからお客様へ付与したマッチングポイント（MP）です。',
                    ),
                    const SizedBox(height: 12),
                    const _AttentionText(
                      text: '※「購入LP」とは、お客様が購入したラヴィゲーションポイント（LP）です。',
                    ),
                    const SizedBox(height: 12),
                    const _AttentionText(
                      text: '※「購入MP」とは、お客様が購入したマッチングポイント（MP）です。',
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// 保有ポイントのグリッド
class _PossessionPointsGrid extends StatelessWidget {
  const _PossessionPointsGrid({
    required this.purchasedMp,
    required this.purchasedLp,
    required this.grantedMp,
    required this.grantedLp,
  });

  final int purchasedMp;
  final int purchasedLp;
  final int grantedMp;
  final int grantedLp;

  @override
  Widget build(BuildContext context) {

    final items = <_PurchaseSummaryItem>[
      _PurchaseSummaryItem(
        icon: Assets.images.icons.pointMp.image(height: 32, width: 32),
        label: '購入：${purchasedMp}MP',
      ),
      _PurchaseSummaryItem(
        icon: Assets.images.icons.pointLp.image(height: 32, width: 32),
        label: '購入：${purchasedLp}LP',
      ),
      _PurchaseSummaryItem(
        icon: Assets.images.icons.pointMp.image(height: 32, width: 32),
        label: '付与：${grantedMp}MP',
      ),
      _PurchaseSummaryItem(
        icon: Assets.images.icons.pointLp.image(height: 32, width: 32),
        label: '付与：${grantedLp}LP',
      ),
    ];

    const horizontalPadding = 24.0;
    const columnSpacing = 12.0;
    const desiredTileHeight = 100.0;

    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth =
        screenWidth - (horizontalPadding * 2) - columnSpacing;
    final tileWidth = availableWidth / 2;
    final aspectRatio = tileWidth / desiredTileHeight;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: aspectRatio,
        children: items.map((item) => _PurchaseSummaryCard(
          icon: item.icon,
          label: item.label,
        ),
        ).toList(),
      ),
    );
  }
}

/// グリッド内の各アイテムを集約したカード
class _PurchaseSummaryCard extends StatelessWidget {
  const _PurchaseSummaryCard({
    required this.icon,
    required this.label,
  });

  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        InnerShadowText(
          text: label,
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
      ],
    );
  }
}

/// グリッド内の各アイテム
class _PurchaseSummaryItem {
  const _PurchaseSummaryItem({
    required this.icon,
    required this.label,
  });

  final Widget icon;
  final String label;
}

/// 購入履歴のリストアイテム
class _PurchaseHistoryListItem {
  const _PurchaseHistoryListItem({
    required this.date,
    required this.item,
    required this.points,
  });

  final String date;
  final String item;
  final int points;
}

/// 購入履歴テーブル
class _PurchaseHistoryTable extends StatelessWidget {
  const _PurchaseHistoryTable({
    required this.items,
  });

  final List<_PurchaseHistoryListItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Table(
        border: TableBorder.all(
          color: const Color(0xFF8895DD),
          width: 1,
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(1),
        },
        children: [
          const TableRow(
            children: [
              _TableHeader(title: '日付'),
              _TableHeader(title: '項目'),
              _TableHeader(title: 'ポイント数'),
            ],
          ),
          ...items.map((e) => TableRow(
            children: [
              _TableItem(text: e.date),
              _TableItem(text: e.item),
              _TableItem(point: e.points),
            ],
          )),
        ],
      ),
    );
  }
}

/// テーブルヘッダー
class _TableHeader extends StatelessWidget{
  const _TableHeader({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFD097DB).withValues(alpha: 0.7),
            const Color(0xFF8887EE).withValues(alpha: 0.7),
          ],
          stops: const [0, 1],
        ),
      ),
      child: Text(
        title,
        style: EconaTextStyle.labelSmall140(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// テーブルアイテム
class _TableItem extends StatelessWidget {
  const _TableItem({
    this.text,
    this.point,
  });

  final String? text;
  final int? point;

  @override
  Widget build(BuildContext context) {
    final String itemText;
    final Color itemColor;
    if(text != null) {
      itemText = text!;
      itemColor = EconaColor.grayNormal;
    } else if(point != null) {
      itemText = point.toString();
      if(point! >= 0) {
        itemColor = EconaColor.grayNormal;
      } else {
        itemColor = EconaColor.feedbackRed400;
      }

    } else {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        itemText,
        style: EconaTextStyle.labelSmall22(
          color: itemColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// 注意書き
class _AttentionText extends StatelessWidget {
  const _AttentionText({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Text(
        text,
        style: EconaTextStyle.regularSmall160(
          color: EconaColor.grayDarkHover,
        ),
      ),
    );
  }
}

List<_PurchaseHistoryListItem> _buildPurchaseHistoryListItems(
  GetUserPointHistoryResponse response,
) {
  final formatter = DateFormat('yyyy/MM/dd');

  return response.items
      .map(
        (item) => _PurchaseHistoryListItem(
          date: formatter
              .format(item.createdAt.toDateTime().toLocal()),
          item: item.transactionReason,
          points: item.amount,
        ),
      )
      .toList();
}