import 'dart:async';

import 'package:econa_mobile_app/presentations/components/econa_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// フローティングタブ付きスクロールビューの設定
class FloatingTabScrollConfig {
  const FloatingTabScrollConfig({
    required this.tabPosition,
    required this.tabLabels,
    required this.pageKey,
    this.enableFloatingTab = true,
    this.scrollToPosition,
  });

  /// タブの位置（スクロール位置）
  final double tabPosition;

  /// タブのラベル
  final List<String> tabLabels;

  /// ページ固有のキー
  final String pageKey;

  /// フローティングタブを有効にするかどうか
  final bool enableFloatingTab;

  /// タブクリック時のスクロール位置（省略時はtabPositionを使用）
  final double? scrollToPosition;
}

/// フローティングタブ付きスクロールビュー
///
/// スクロール位置に応じてフローティングタブの表示/非表示を制御する
/// 共通コンポーネント
class FloatingTabScrollView extends HookConsumerWidget {
  const FloatingTabScrollView({
    required this.child,
    required this.config,
    super.key,
  });

  final Widget child;
  final FloatingTabScrollConfig config;
  static const double _floatingTabTopMargin = 12;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final debounceTimer = useRef<Timer?>(null);

    useEffect(
      () {
        // フローティングタブが無効な場合はスクロールリスナーを追加しない
        if (!config.enableFloatingTab) {
          return null;
        }

        // スクロール位置に応じてタブのフロートON/OFFを制御
        void onScroll() {
          // 既存のタイマーをキャンセル
          debounceTimer.value?.cancel();

          // 新しいタイマーを設定（16ms = 60fps）
          debounceTimer.value = Timer(const Duration(milliseconds: 16), () {
            if (scrollController.hasClients) {
              ref
                  .read(isOverlayVisibleProvider(config.pageKey).notifier)
                  .updateVisibility(
                    isOverlayVisible:
                        scrollController.offset > config.tabPosition,
                  );
            }
          });
        }

        scrollController.addListener(onScroll);
        return () {
          debounceTimer.value?.cancel();
          scrollController.removeListener(onScroll);
        };
      },
      [scrollController, config.enableFloatingTab, config.tabPosition],
    );

    useEffect(
      () {
        // フローティングタブが無効な場合はタブを表示しない
        if (!config.enableFloatingTab) {
          return null;
        }

        // スクロール位置に応じて表示されるフローティングタブを作成
        final overlay = OverlayEntry(
          builder: (context) => Consumer(
            builder: (context, ref, child) => Positioned(
              top: MediaQuery.of(context).padding.top +
                  kToolbarHeight +
                  _floatingTabTopMargin,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: ref.watch(isOverlayVisibleProvider(config.pageKey))
                        ? 1.0
                        : 0.0,
                    child: EconaTabWithProvider(
                      labels: config.tabLabels,
                      pageKey: config.pageKey,
                      scrollController: scrollController,
                      scrollToPosition:
                          config.scrollToPosition ?? config.tabPosition,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        // フレーム描画後にOverlayEntryを挿入
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;
          Overlay.of(context).insert(overlay);
        });

        return overlay.remove; // クリーンアップ関数
      },
      [
        config.enableFloatingTab,
        config.tabLabels,
        config.scrollToPosition,
        config.tabPosition,
      ],
    );

    return SingleChildScrollView(
      controller: scrollController,
      child: child,
    );
  }
}
