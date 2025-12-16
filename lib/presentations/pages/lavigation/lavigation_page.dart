import 'dart:math' as math;
import 'dart:ui';
import 'dart:ui' as ui show Image, Codec, FrameInfo, instantiateImageCodec;

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:go_router/go_router.dart';

class LavigationPage extends StatefulWidget {
  const LavigationPage({super.key});

  @override
  State<LavigationPage> createState() => _LavigationPageState();
}

class CircularItem {
  CircularItem({
    required this.title,
    required this.iconPath,
    this.onTap,
  });
  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  ui.Image? rasterImage;
}

class _LavigationPageState extends State<LavigationPage>
    with SingleTickerProviderStateMixin {
  // 円形スワイプリストのアイテムを定義
  late final List<CircularItem> _items;

  // アイテム同士の幅調整のため_items.lengthに + 5する
  final int _totalSlots = 8;
  double _currentRotationAngle = 0.0;
  late AnimationController _controller;
  late Animation<double> _animation;
  late final double _anglePerItem;
  final double _snapPointAngle = math.pi * 0.1;

  @override
  void initState() {
    super.initState();

    // アイテムを初期化
    _items = [
      CircularItem(
          title: '恋愛アドバイス',
          iconPath: 'assets/images/icons/love_advice_icon.webp',
          onTap: () => const LoveAdviceRouteData().push<void>(context)),
      CircularItem(
          title: 'AI\nカウンセリング',
          iconPath: 'assets/images/icons/counseling_icon.webp',
          onTap: () => const CounselingRouteData().push<void>(context)),
      CircularItem(
          title: 'やりとり\nシミュレーション',
          iconPath: 'assets/images/icons/simulation_icon.webp',
          onTap: () => const SimulationRouteData().push<void>(context)),
      CircularItem(
        // title: 'らしさマッチ',
        title: 'Coming Soon...',
        iconPath: 'assets/images/icons/uniqueness_match_icon.webp',
        // onTap: () => const RashisaMatchRouteData().push<void>(context),
        onTap: () {},
      ),
    ];

    //  1つのアイテムあたりの角度を計算
    _anglePerItem = (2 * math.pi) / _totalSlots;

    // アニメーション制御用のコントローラーを作成
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // アニメーションの値が変化した時のリスナー
    _controller.addListener(() {
      setState(() {
        // アニメーションの現在値を回転角度に反映
        _currentRotationAngle = _animation.value;
      });
    });

    // アイコン（webp/png/jpg 等ラスタ）を事前に読み込み
    _preloadIcons();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// スナップポイント（特定の位置でストップ）の位置を計算
  double _calculateSnapPointAngle(double currentAngle) {
    // 現在の角度を0～2πの範囲に正規化
    double normalizedCurrentAngle = currentAngle % (2 * math.pi);
    // 正規化された角度が負の場合に正の範囲に変換
    if (normalizedCurrentAngle < 0) normalizedCurrentAngle += 2 * math.pi;

    double minDiff = double.infinity;
    int closestItemIndex = 0;

    for (int i = 0; i < _totalSlots; i++) {
      // 各アイテムがスナップポイントに来る場合の回転角度
      final double targetItemRelativeAngle =
          _snapPointAngle - (i * _anglePerItem);

      // 円形なので±2πの範囲もチェック
      for (int j = -1; j <= 1; j++) {
        // 候補となる角度
        final candidateAngle = targetItemRelativeAngle + (j * 2 * math.pi);
        // 現在角度と候補角度の差分を計算
        final diff = (normalizedCurrentAngle - candidateAngle).abs();
        // より差分が小さいものがあれば更新
        if (diff < minDiff) {
          minDiff = diff;
          closestItemIndex = i;
        }
      }
    }

    // 最も近いアイテムがスナップポイントに来る最終的な回転角度を返す
    return _snapPointAngle - (closestItemIndex * _anglePerItem);
  }

  /// タップ位置がリストアイテム内に存在するかを判定
  bool _isPointInCircle(Offset point, Offset center, double radius) {
    final distance = (point - center).distance;
    return distance <= radius;
  }

  /// 画面をタップ時の処理
  void _handleTap(Offset tapPosition) {
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final size = renderBox.size;

    // 当たり判定がリストアイテムと同じ位置に配置されるように調整
    final center = Offset(size.width / 12, size.height * 0.65);
    final radius = size.width * 0.8;
    final itemRadius = size.width * 0.17;
    const double initialItemPlacementAngle = math.pi * -0.44;

    for (int i = 0; i < _totalSlots; i++) {
      final item = _items[i % _items.length];
      final itemAngle = initialItemPlacementAngle +
          (i * _anglePerItem) +
          _currentRotationAngle;

      final itemCenterX = center.dx + radius * math.cos(itemAngle);
      final itemCenterY = center.dy + radius * math.sin(itemAngle);
      final itemOffset = Offset(itemCenterX, itemCenterY);

      if (_isPointInCircle(tapPosition, itemOffset, itemRadius)) {
        item.onTap?.call();
        break;
      }
    }
  }

  /// アイコンを事前に読み込んでおく（raster のみ）
  Future<void> _preloadIcons() async {
    for (final item in _items) {
      try {
        final data = await rootBundle.load(item.iconPath);
        final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
        final frame = await codec.getNextFrame();
        item.rasterImage = frame.image;
      } catch (e) {
        // 読み込みエラー時は何もしない
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      const LargeTitleAppBar(titleText: EconaAppBarText.lavigationLabel),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // 背景色（仮）
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(-0.7, 0.8),
                colors: [
                  const Color(0xFFEDE7F9),
                  const Color(0xFFDDE6FC).withValues(alpha: 0.5),
                  EconaColor.background,
                  EconaColor.background,
                ],
                stops: const [0.1, 0.5, 0.8, 1],
                radius: 2.2,
              ),
            ),
          ),
          GestureDetector(
            onTapUp: (details) {
              _handleTap(details.localPosition);
            },
            onPanStart: (details) {
              _controller.stop();
            },
            onPanUpdate: (details) {
              // 画面幅を180度回転にマッピング
              final rotationSpeedFactor =
                  math.pi / MediaQuery.of(context).size.width * 0.4;
              setState(() {
                _currentRotationAngle +=
                    (details.delta.dy - details.delta.dx) * rotationSpeedFactor;
              });
            },
            onPanEnd: (details) {
              final velocity = details.velocity.pixelsPerSecond.dx * 0.00025;
              final finalAngle = _currentRotationAngle + velocity;
              final targetAngle = _calculateSnapPointAngle(finalAngle);
              final diff = _currentRotationAngle - targetAngle;
              final revolutions = (diff / (2 * math.pi)).round();
              final adjustedTargetAngle =
                  targetAngle + revolutions * (2 * math.pi);

              _animation = Tween<double>(
                begin: _currentRotationAngle,
                end: adjustedTargetAngle,
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.easeOutCubic,
              ));

              _controller.forward(from: 0.0);
            },
            child: CustomPaint(
              painter: ItemArcPainter(
                items: _items,
                totalSlots: _totalSlots,
                currentRotationAngle: _currentRotationAngle,
                anglePerItem: _anglePerItem,
                snapPointAngle: _snapPointAngle, // スナップターゲットをPainterにも渡す
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ),
          Positioned(
            // カルテを左下に固定で追加
            left: -40,
            bottom: 130,
            child: GestureDetector(
              onTap: () {
                const KaruteRouteData().go(context);
              },
              child: ShadowAndGradientBorderContainer(
                borderRadius: const BorderRadius.all(Radius.circular(120)),
                borderWidth: 1,
                gradients: const [
                  LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                ],
                backgroundColor: Colors.white,
                innerShadows: const [],
                dropShadows: [
                  BoxShadow(
                    color: const Color(0xFF6F75B0).withValues(alpha: 0.4),
                    blurRadius: 20,
                    offset: const Offset(4, 4),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    blurRadius: 10,
                    offset: Offset(-2, -2),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    blurRadius: 20,
                    offset: Offset(-8, -8),
                  ),
                  BoxShadow(
                    color: const Color(0xFF7273AB).withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
                child: Container(
                  width: 233,
                  height: 233,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.images.icons.karteIcon.image(width: 64, height: 64),
                      const SizedBox(height: 4),
                      Text(
                        'カルテ',
                        style: EconaTextStyle.lavigationMainIconText(
                          color: EconaColor.grayDarkActive,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemArcPainter extends CustomPainter {
  ItemArcPainter({
    required this.items,
    required this.totalSlots,
    required this.currentRotationAngle,
    required this.anglePerItem,
    required this.snapPointAngle,
  });

  final List<CircularItem> items;
  final int totalSlots;
  final double currentRotationAngle;
  final double anglePerItem;
  final double snapPointAngle;

  /// リストアイテムや円弧等を描画
  @override
  void paint(Canvas canvas, Size size) {
    /// グラデーション円弧
    // 中心と半径
    final center = Offset(size.width / 12, size.height * 0.65);
    final radius = size.width * 0.8;

    // 円弧の作成
    final Paint arcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          const Color(0xFFFF72B6).withValues(alpha: 0.6),
          const Color(0xFF6284FF).withValues(alpha: 0.6),
        ],
      ).createShader(Rect.fromLTWH(0, 10, size.width, size.height));

    // 矩形を描く
    final rect = Rect.fromCircle(center: center, radius: radius);

    // 円弧の開始角度と掃引角度
    const startAngleArc = math.pi * 0;
    const sweepAngleArc = math.pi * 2;

    // 円弧を描画
    canvas.drawArc(rect, startAngleArc, sweepAngleArc, false, arcPaint);

    /// リストアイテム
    // アイテムの半径
    final itemRadius = size.width * 0.17;

    // アイテムの配置
    const double initialItemPlacementAngle = math.pi * -0.44;

    // アイテムの描画
    for (int i = 0; i < totalSlots; i++) {
      // 実際のアイテムからアイテムを取得
      final item = items[i % items.length];
      // 各アイテムの最終的な描画角度
      final itemAngle =
          initialItemPlacementAngle + (i * anglePerItem) + currentRotationAngle;

      // アイテムの中心座標を計算
      final itemCenterX = center.dx + radius * math.cos(itemAngle);
      final itemCenterY = center.dy + radius * math.sin(itemAngle);
      final itemOffset = Offset(itemCenterX, itemCenterY);

      /// 現在の回転角度
      // 0～2πに正規化(角度が無限に大きくなっても360度に収める)
      double normalizedRotation = currentRotationAngle % (2 * math.pi);
      // 正規化された角度が負の場合に正の範囲に変換
      if (normalizedRotation < 0) normalizedRotation += 2 * math.pi;

      /// アイテムの初期配置角度
      // アイテムの初期配置角度
      final currentItemTheoreticalAngle =
          initialItemPlacementAngle + (i * anglePerItem);
      // 0～2πに正規化
      double normalizedItemTheoreticalAngle =
          currentItemTheoreticalAngle % (2 * math.pi);
      // 正規化された角度が負の場合に正の範囲に変換
      if (normalizedItemTheoreticalAngle < 0)
        normalizedItemTheoreticalAngle += (2 * math.pi);

      /// アイテムの現在位置とスナップポイント
      // アイテムの現在位置とスナップポイントの角度差
      double angleDifference =
          normalizedItemTheoreticalAngle + normalizedRotation - snapPointAngle;
      // -π～πに正規化（スナップポイントに最も短い距離を判断するため）
      angleDifference = (angleDifference + math.pi) % (2 * math.pi) - math.pi;

      // 現在のCanvasの状態を保存
      canvas.save();

      // 左上の明るいシャドウ
      final highlightPaint1 = Paint()
        ..color = Colors.white
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
      canvas.drawCircle(
          itemOffset + const Offset(-8, -4), itemRadius, highlightPaint1);

      final highlightPaint2 = Paint()
        ..color = Colors.white
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);
      canvas.drawCircle(
          itemOffset + const Offset(-8, -8), itemRadius, highlightPaint2);

      // 右下の暗いシャドウ
      final shadowPaint1 = Paint()
        ..color = const Color(0xFF6F75B0).withValues(alpha: 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);
      canvas.drawCircle(
          itemOffset + const Offset(3, 6), itemRadius, shadowPaint1);

      final shadowPaint2 = Paint()
        ..color = const Color(0xFF7273AB).withValues(alpha: 0.5)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
      canvas.drawCircle(
          itemOffset + const Offset(1, 2), itemRadius, shadowPaint2);

      // アイテムの円を描画
      final itemPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      canvas.drawCircle(itemOffset, itemRadius, itemPaint);

      // アイコンを描画（ラスタのみ）
      final iconSize = itemRadius * 0.6;
      if (item.rasterImage != null) {
        final double dx;
        final double dy;
        if (item.title.contains('\n')) {
          dx = itemOffset.dx - iconSize / 2;
          // 間隔を詰める（0.15 -> 0.10）
          dy = itemOffset.dy - iconSize - itemRadius * 0.01;
        } else {
          dx = itemOffset.dx - iconSize / 2;
          // 間隔を詰める（0.05 -> 0.03）
          dy = itemOffset.dy - iconSize - itemRadius * 0.01;
        }
        final dst = Rect.fromLTWH(dx, dy, iconSize, iconSize);
        final src = Rect.fromLTWH(
          0,
          0,
          item.rasterImage!.width.toDouble(),
          item.rasterImage!.height.toDouble(),
        );
        canvas.drawImageRect(item.rasterImage!, src, dst, Paint());
      }

      // アイテムのテキストを描画（アイコンとの間隔を縮小）
      final titlePainter = TextPainter(
        text: TextSpan(
          text: item.title,
          style: EconaTextStyle.lavigationIconListText(
            color: EconaColor.grayDarkActive,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: itemRadius * 1.8);
      // 改行の有無で配置を調整
      if (item.title.contains('\n')) {
        // 間隔を詰める（0.10 -> 0.04）
        titlePainter.paint(
          canvas,
          itemOffset - Offset(titlePainter.width / 2, -itemRadius * 0.04),
        );
      } else {
        // 間隔を詰める（0.25 -> 0.16）
        titlePainter.paint(
          canvas,
          itemOffset - Offset(titlePainter.width / 2, -itemRadius * 0.16),
        );
      }

      canvas.restore(); // Canvasの状態を復元
    }
  }

  /// 回転角度が変わっていれば再描画する判断を返す
  @override
  bool shouldRepaint(covariant ItemArcPainter oldDelegate) {
    return oldDelegate.currentRotationAngle != currentRotationAngle;
  }
}