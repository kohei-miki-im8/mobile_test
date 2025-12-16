import 'dart:async';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

class EconaNotification {
  static OverlayEntry? _currentEntry;

  // 上からトースト表示（スライド）
  static Future<void> showTopToast(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) async {
    _currentEntry?.remove();
    _currentEntry = null;

    final overlay = Overlay.of(context, rootOverlay: true);
    if (overlay == null) return;

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (ctx) => _EconaNotificationSlideWidget(
        message: message,
        duration: duration,
        onDismissed: () {
          entry.remove();
          if (identical(_currentEntry, entry)) {
            _currentEntry = null;
          }
        },
      ),
    );

    _currentEntry = entry;
    overlay.insert(entry);
  }
}


class _EconaNotificationSlideWidget extends StatefulWidget {
  const _EconaNotificationSlideWidget({
    required this.message,
    required this.duration,
    required this.onDismissed,
  });

  final String message;
  final Duration duration;
  final VoidCallback onDismissed;

  @override
  State<_EconaNotificationSlideWidget> createState() => _EconaNotificationSlideWidgetState();
}

class _EconaNotificationSlideWidgetState extends State<_EconaNotificationSlideWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 220),
    reverseDuration: const Duration(milliseconds: 220),
  );

  late final Animation<Offset> _offset = Tween<Offset>(
    begin: const Offset(0, -1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut, reverseCurve: Curves.easeIn));

  @override
  void initState() {
    super.initState();
    _play();
  }

  Timer? _delayTimer;

  Future<void> _play() async {
    await _controller.forward();
    _delayTimer = Timer(widget.duration, () async {
      if (!mounted) return;
      await _controller.reverse();
      if (mounted) widget.onDismissed();
    });
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
            child: SlideTransition(
              position: _offset,
              child: _buildToast(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToast(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width - 48;
    return Container(
      constraints: BoxConstraints(minWidth: 120, maxWidth: maxWidth),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.9),
            blurRadius: 18,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Text(
        widget.message,
        textAlign: TextAlign.center,
        style: EconaTextStyle.labelSmall140(
          color: EconaColor.grayDarkActive,
        ).copyWith(decoration: TextDecoration.none),
      ),
    );
  }
}


