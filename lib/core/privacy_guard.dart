import 'dart:ui';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class PrivacyGuard extends StatefulWidget {
  const PrivacyGuard({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<PrivacyGuard> createState() => _PrivacyGuardState();
}

class _PrivacyGuardState extends State<PrivacyGuard>
    with WidgetsBindingObserver {
  bool _hide = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _hide = state == AppLifecycleState.inactive ||
          state == AppLifecycleState.hidden ||
          state == AppLifecycleState.paused ||
          state == AppLifecycleState.detached;
    });
  }

  @override
  Widget build(BuildContext context) {
    final overlay = Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Assets.images.illusts.laviLogo.image(
        height: 128,
        width: 128,
        errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
      ),

    );

    return Stack(
      children: [
        widget.child,
        if (_hide) Positioned.fill(child: overlay),
      ],
    );
  }
}