import 'dart:async';

import 'package:econa_mobile_app/presentations/components/econa_banner.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';

// ============================================================================
// 共通定数
// ============================================================================

class ButtonConstants {
  // 共通のボーダーグラデーション
  static const borderGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0x80FFFFFF)], // 白から50%透明度の白
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ピンク系ボーダーグラデーション
  static const pinkBorderGradient = LinearGradient(
    colors: [Color(0xFFD9568B), Color(0x80FFFFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // デフォルトのシャドウセット
  static const defaultShadows = [
    BoxShadow(
      color: Color(0x38A799CB), // #A799CB 22%
      offset: Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x33AA98E1), // #AA98E1 20%
      offset: Offset(4, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0xCCFFFFFF), // #FFFFFF 80%
      offset: Offset(-4, -4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x4298BAE1), // #98BAE1 26%
      offset: Offset(0, 12),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  // ピンク系シャドウセット
  static const pinkShadows = [
    BoxShadow(
      color: Color(0x3899ACCB), // #99ACCB 22%
      offset: Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x3398BAE1), // #98BAE1 20%
      offset: Offset(4, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0xCCFFFFFF), // #FFFFFF 80%
      offset: Offset(-4, -4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x59FE799C), // #FE799C 35%
      offset: Offset(0, 12),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  // デフォルトのグラデーション
  static const defaultGradient = LinearGradient(
    colors: [Color(0xFFF9FBFF), Color(0xFFEFF0FE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ボタン別グラデーション
  static const historyButtonGradient = LinearGradient(
    colors: [Color(0xFF9EF3A7), Color(0xFF65D5DB)], // ライトグリーンからライトブルー
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const skipButtonGradient = LinearGradient(
    colors: [
      Color(0xFF97E1D4),
      Color(0xFF6284FF),
      Color(0xFFA27DE1),
    ], // ライトティール、ミディアムブルー、ライトパープル
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const likeButtonGradient = LinearGradient(
    colors: [Color(0xFFF0AFD2), Color(0xFFD385E8)], // ライトピンクからライトパープル
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const lightningButtonGradient = LinearGradient(
    colors: [Color(0xFFF5C372), Color(0xFFFF9361)], // ライトオレンジからオレンジ
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const likeMessageButtonGradient = RadialGradient(
    colors: [Color(0x80F68CA5), Color(0xFFFE9878)],
    center: Alignment.center,
    radius: 0.8,
  );

  static const likeMessageButtonPressedGradient = LinearGradient(
    colors: [Color(0xFFF9FBFF), Color(0xFFEFF0FE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class GradientCircleButton extends StatelessWidget {
  const GradientCircleButton({
    required this.icon,
    super.key,
    this.onTap,
    this.size = 56,
    this.backgroundGradient = ButtonConstants.defaultGradient,
    this.border,
    this.boxShadow = ButtonConstants.defaultShadows,
    this.iconSize,
    this.iconAlignment = const Alignment(-0.1, 0), // 影込みのアイコン画像のため若干の位置補正を行う
  });
  final Widget icon;
  final VoidCallback? onTap;
  final double size;
  final Gradient backgroundGradient;
  final BoxBorder? border;
  final List<BoxShadow> boxShadow;
  final double? iconSize;
  final Alignment iconAlignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: backgroundGradient,
          border: border,
          boxShadow: boxShadow,
        ),
        child: Align(
          alignment: iconAlignment,
          child: iconSize != null
              ? SizedBox(
                  width: iconSize,
                  height: iconSize,
                  child: icon,
                )
              : icon,
        ),
      ),
    );
  }
}

// ============================================================================
// 履歴ボタングループ
// ============================================================================

// 履歴アイコンボタン（リバース）
class HistoryButton extends StatelessWidget {
  const HistoryButton({
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 外側グラデーションボーダー
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: ButtonConstants.borderGradient,
            ),
          ),
          // 内側ボタン本体
          GradientCircleButton(
            onTap: onTap,
            size: size - 1, // ボーダー分を1px引く
            iconSize: iconSize,
            backgroundGradient: ButtonConstants.defaultGradient,
            boxShadow: ButtonConstants.defaultShadows,
            icon: Assets.images.icons.history.image(
              height: iconSize,
              width: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}

// 履歴アイコンボタン（リバース）押下時
class HistoryButtonPressed extends StatelessWidget {
  const HistoryButtonPressed({
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 外側グラデーションボーダー
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: ButtonConstants.borderGradient,
            ),
          ),
          // 内側ボタン本体
          GradientCircleButton(
            onTap: onTap,
            size: size - 1, // ボーダー分を1px引く
            iconSize: iconSize,
            backgroundGradient: ButtonConstants.historyButtonGradient,
            boxShadow: ButtonConstants.defaultShadows,
            icon: Assets.images.icons.historyPressed.image(
              height: iconSize,
              width: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}

// 履歴ボタン（押下時デザイン変化機能付き）
// Timerのdisposeをするため、stateless(Hook)ではなくStatefulWidgetとしている。
class HistoryBtnWithPress extends StatefulWidget {
  const HistoryBtnWithPress({
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    this.autoResetDuration = const Duration(milliseconds: 150),
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final double iconSize;
  final Duration autoResetDuration;

  @override
  State<HistoryBtnWithPress> createState() => _HistoryBtnWithPressState();
}

class _HistoryBtnWithPressState extends State<HistoryBtnWithPress> {
  bool _isPressed = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _handleTap() {
    // 既存のTimerがあればキャンセル
    _timer?.cancel();

    // 押下状態を設定
    setState(() {
      _isPressed = true;
    });

    // アクションを実行
    widget.onTap?.call();

    // 一定時間後に押下状態を解除
    _timer = Timer(widget.autoResetDuration, () {
      if (mounted) {
        setState(() {
          _isPressed = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isPressed
        ? HistoryButtonPressed(
            onTap: _handleTap,
            size: widget.size,
            iconSize: widget.iconSize,
          )
        : HistoryButton(
            onTap: _handleTap,
            size: widget.size,
            iconSize: widget.iconSize,
          );
  }
}

// ============================================================================
// スキップボタングループ
// ============================================================================

// スキップボタン
class SkipButton extends StatelessWidget {
  const SkipButton({
    this.onTap,
    this.size = 52,
    this.iconSize = 24,
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 外側グラデーションボーダー
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: ButtonConstants.borderGradient,
            ),
          ),
          // 内側ボタン本体
          GradientCircleButton(
            onTap: onTap,
            size: size - 1, // ボーダー分を1px引く
            iconSize: iconSize,
            backgroundGradient: ButtonConstants.defaultGradient,
            boxShadow: ButtonConstants.defaultShadows,
            icon: Assets.images.icons.skip.image(
              height: iconSize,
              width: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}

// スキップボタン押下時
class SkipButtonPressed extends StatelessWidget {
  const SkipButtonPressed({
    this.onTap,
    this.size = 52,
    this.iconSize = 24,
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 外側グラデーションボーダー
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: ButtonConstants.borderGradient,
            ),
          ),
          // 内側ボタン本体
          GradientCircleButton(
            onTap: onTap,
            size: size - 1, // ボーダー分を1px引く
            iconSize: iconSize,
            backgroundGradient: ButtonConstants.skipButtonGradient,
            boxShadow: ButtonConstants.defaultShadows,
            icon: Assets.images.icons.skipPressed.image(
              height: iconSize,
              width: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}

// スキップボタン（押下時デザイン変化機能付き）
// Timerのdisposeをするため、stateless(Hook)ではなくStatefulWidgetとしている。
class SkipBtnWithPress extends StatefulWidget {
  const SkipBtnWithPress({
    this.onTap,
    this.size = 52,
    this.iconSize = 24,
    this.autoResetDuration = const Duration(milliseconds: 150),
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final double iconSize;
  final Duration autoResetDuration;

  @override
  State<SkipBtnWithPress> createState() => _SkipBtnWithPressState();
}

class _SkipBtnWithPressState extends State<SkipBtnWithPress> {
  bool _isPressed = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _handleTap() {
    // 既存のTimerがあればキャンセル
    _timer?.cancel();

    // 押下状態を設定
    setState(() {
      _isPressed = true;
    });

    // アクションを実行
    widget.onTap?.call();

    // 一定時間後に押下状態を解除
    _timer = Timer(widget.autoResetDuration, () {
      if (mounted) {
        setState(() {
          _isPressed = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isPressed
        ? SkipButtonPressed(
            onTap: _handleTap,
            size: widget.size,
            iconSize: widget.iconSize,
          )
        : SkipButton(
            onTap: _handleTap,
            size: widget.size,
            iconSize: widget.iconSize,
          );
  }
}

// ============================================================================
// メッセージ付きいいねボタングループ
// ============================================================================

// メッセージ付きいいねボタン
class LikeMessageButton extends StatelessWidget {
  const LikeMessageButton({
    this.onTap,
    super.key,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 外側グラデーションボーダー
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: ButtonConstants.pinkBorderGradient,
            ),
          ),
          // 内側ボタン本体（GradientCircleButtonを再利用）
          GradientCircleButton(
            icon: Assets.images.icons.mailHeart.image(
              height: 24,
              width: 24,
            ),
            onTap: onTap,
            size: 44,
            backgroundGradient: ButtonConstants.likeMessageButtonGradient,
            boxShadow: ButtonConstants.pinkShadows,
          ),
        ],
      ),
    );
  }
}

// メッセージ付きいいねボタン押下時
class LikeMessageButtonPressed extends StatelessWidget {
  const LikeMessageButtonPressed({
    this.onTap,
    super.key,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final likeMessageButtonPressedShadows = [
      ...ButtonConstants.pinkShadows,
      BoxShadow(
        color: const Color(0xFFF16C84).withValues(alpha: 0.6), // #F16C84
        offset: const Offset(0, -4),
        blurRadius: 6,
        spreadRadius: 0,
        inset: true,
      ),
      BoxShadow(
        color: const Color(0xFFFB6191).withValues(alpha: 0.6), // #FB6191
        offset: const Offset(0, 4),
        blurRadius: 12,
        spreadRadius: 0,
        inset: true,
      ),
    ];

    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 外側グラデーションボーダー
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: ButtonConstants.pinkBorderGradient,
              boxShadow: [
                BoxShadow(
                  color: Color(0x40000000),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
          GradientCircleButton(
            icon: Assets.images.icons.mailHeartPressed.image(
              height: 24,
              width: 24,
            ),
            onTap: onTap,
            size: 44,
            backgroundGradient:
                ButtonConstants.likeMessageButtonPressedGradient,
            boxShadow: likeMessageButtonPressedShadows,
          ),
        ],
      ),
    );
  }
}

// メッセージ付きいいねボタン（押下時デザイン変化機能付き）
// Timerのdisposeをするため、stateless(Hook)ではなくStatefulWidgetとしている。
class LikeMessageBtnWithPress extends StatefulWidget {
  const LikeMessageBtnWithPress({
    this.onTap,
    this.autoResetDuration = const Duration(milliseconds: 150),
    super.key,
  });

  final VoidCallback? onTap;
  final Duration autoResetDuration;

  @override
  State<LikeMessageBtnWithPress> createState() =>
      _LikeMessageBtnWithPressState();
}

class _LikeMessageBtnWithPressState extends State<LikeMessageBtnWithPress> {
  bool _isPressed = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _handleTap() {
    // 既存のTimerがあればキャンセル
    _timer?.cancel();

    // 押下状態を設定
    setState(() {
      _isPressed = true;
    });

    // アクションを実行
    widget.onTap?.call();

    // 一定時間後に押下状態を解除
    _timer = Timer(widget.autoResetDuration, () {
      if (mounted) {
        setState(() {
          _isPressed = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isPressed
        ? LikeMessageButtonPressed(onTap: _handleTap)
        : LikeMessageButton(onTap: _handleTap);
  }
}

// ============================================================================
// いいねボタングループ
// ============================================================================

// いいねボタン
class LikeButton extends StatelessWidget {
  const LikeButton({
    this.size = 52,
    this.onTap,
    this.showFreeBadge = false,
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final bool showFreeBadge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientCircleButton(
          size: size,
          icon: Assets.images.icons.pinkHeart.image(
            height: 25,
            width: 25,
          ),
          onTap: onTap,
        ),
        if(showFreeBadge)...[
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Assets.images.icons.freeBadge.image(
                height: 16,
                width: 41,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// いいねボタン押下時
class LikeButtonPressed extends StatelessWidget {
  const LikeButtonPressed({
    this.onTap,
    this.size = 52,
    this.iconSize = 25,
    this.showFreeBadge = false,
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final double iconSize;
  final bool showFreeBadge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 外側グラデーションボーダー
              Container(
                width: size,
                height: size,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: ButtonConstants.borderGradient,
                ),
              ),
              // 内側ボタン本体
              GradientCircleButton(
                onTap: onTap,
                size: size - 1, // ボーダー分を1px引く
                iconSize: iconSize,
                backgroundGradient: ButtonConstants.likeButtonGradient,
                boxShadow: ButtonConstants.defaultShadows,
                icon: Assets.images.icons.pinkHeartPressed.image(
                  height: iconSize,
                  width: iconSize,
                ),
              ),
            ],
          ),
        ),
        // FREEバッジを同じ位置に追加
        if(showFreeBadge)...[
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Assets.images.icons.freeBadge.image(
                height: 16,
                width: 41,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// いいねボタン（押下時デザイン変化機能付き）
// Timerのdisposeをするため、stateless(Hook)ではなくStatefulWidgetとしている。
class LikeBtnWithPress extends StatefulWidget {
  const LikeBtnWithPress({
    this.onTap,
    this.size = 52,
    this.autoResetDuration = const Duration(milliseconds: 150),
    this.showFreeBadge = false,
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final Duration autoResetDuration;
  final bool showFreeBadge;

  @override
  State<LikeBtnWithPress> createState() => _LikeBtnWithPressState();
}

class _LikeBtnWithPressState extends State<LikeBtnWithPress> {
  bool _isPressed = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _handleTap() {
    // 既存のTimerがあればキャンセル
    _timer?.cancel();

    // 押下状態を設定
    setState(() {
      _isPressed = true;
    });

    // アクションを実行
    widget.onTap?.call();

    // 一定時間後に押下状態を解除
    _timer = Timer(widget.autoResetDuration, () {
      if (mounted) {
        setState(() {
          _isPressed = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isPressed
        ? LikeButtonPressed(
            onTap: _handleTap,
            size: widget.size,
            showFreeBadge: widget.showFreeBadge,
          )
        : LikeButton(
            onTap: _handleTap,
            size: widget.size,
            showFreeBadge: widget.showFreeBadge,
          );
  }
}

// ============================================================================
// 稲妻ボタングループ
// ============================================================================

// 稲妻アイコンボタン（ブースト）
class LightningButton extends StatelessWidget {
  const LightningButton({
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 外側グラデーションボーダー
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: ButtonConstants.borderGradient,
            ),
          ),
          // 内側ボタン本体
          GradientCircleButton(
            onTap: onTap,
            size: size - 1, // ボーダー分を1px引く
            iconSize: iconSize,
            backgroundGradient: ButtonConstants.defaultGradient,
            boxShadow: ButtonConstants.defaultShadows,
            icon: Assets.images.icons.lightning.image(
              height: iconSize,
              width: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}

// 稲妻アイコンボタン（ブースト）押下時
class LightningButtonPressed extends StatelessWidget {
  const LightningButtonPressed({
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 外側グラデーションボーダー
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: ButtonConstants.borderGradient,
            ),
          ),
          // 内側ボタン本体
          GradientCircleButton(
            onTap: onTap,
            size: size - 1, // ボーダー分を1px引く
            iconSize: iconSize,
            backgroundGradient: ButtonConstants.lightningButtonGradient,
            boxShadow: ButtonConstants.defaultShadows,
            icon: Assets.images.icons.lightningPressed.image(
              height: iconSize,
              width: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}

// 稲妻ボタン（押下時デザイン変化機能付き）
// Timerのdisposeをするため、stateless(Hook)ではなくStatefulWidgetとしている。
class LightningBtnWithPress extends StatefulWidget {
  const LightningBtnWithPress({
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    this.autoResetDuration = const Duration(milliseconds: 150),
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final double iconSize;
  final Duration autoResetDuration;

  @override
  State<LightningBtnWithPress> createState() => _LightningBtnWithPressState();
}

class _LightningBtnWithPressState extends State<LightningBtnWithPress> {
  bool _isPressed = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _handleTap() {
    // 既存のTimerがあればキャンセル
    _timer?.cancel();

    // 押下状態を設定
    setState(() {
      _isPressed = true;
    });

    // アクションを実行
    widget.onTap?.call();

    // 一定時間後に押下状態を解除
    _timer = Timer(widget.autoResetDuration, () {
      if (mounted) {
        setState(() {
          _isPressed = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isPressed
        ? LightningButtonPressed(
            onTap: _handleTap,
            size: widget.size,
            iconSize: widget.iconSize,
          )
        : LightningButton(
            onTap: _handleTap,
            size: widget.size,
            iconSize: widget.iconSize,
          );
  }
}

// ============================================================================
// その他のボタン
// ============================================================================

// しつもんボタン
class QuestionButton extends StatelessWidget {
  const QuestionButton({
    this.onTap,
    super.key,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GradientCircleButton(
      icon: Assets.images.icons.hatena.image(
        height: 24,
        width: 24,
      ),
      onTap: onTap,
    );
  }
}

// しつもんボタン（押下時）
class QuestionButtonPressed extends StatelessWidget {
  const QuestionButtonPressed({
    this.onTap,
    super.key,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GradientCircleButton(
      icon: Assets.images.icons.hatena.image(
        height: 24,
        width: 24,
      ),
      onTap: onTap,
    );
  }
}

// しつもんボタン（押下時デザイン変化機能付き）+ データ取得＆モーダル表示
class QuestionBtnWithPress extends StatefulWidget {
  const QuestionBtnWithPress({
    this.onTap,
    this.autoResetDuration = const Duration(milliseconds: 150),
    super.key,
  });

  final VoidCallback? onTap;
  final Duration autoResetDuration;

  @override
  State<QuestionBtnWithPress> createState() => _QuestionBtnWithPressState();
}

class _QuestionBtnWithPressState extends State<QuestionBtnWithPress> {
  bool _isPressed = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _handleTap() {
    _timer?.cancel();
    setState(() => _isPressed = true);
    // アクションは外部から受け取る
    widget.onTap?.call();
    _timer = Timer(widget.autoResetDuration, () {
      if (mounted) {
        setState(() => _isPressed = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isPressed
        ? QuestionButtonPressed(onTap: _handleTap)
        : QuestionButton(onTap: _handleTap);
  }
}
