import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_navigation_bar.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    required this.state,
    required this.navigationShell,
    super.key,
  });

  final GoRouterState state;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final path = state.uri.path;
    final bool isBranchRoot = path == EconaPath.home ||
        path == EconaPath.like ||
        path == EconaPath.lavigation ||
        path == EconaPath.chatroom ||
        path == EconaPath.myPage;

    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: isBranchRoot
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    EconaColor.background.withValues(alpha: 0),
                    EconaColor.background,
                    EconaColor.background,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.8, 1],
                ),
              ),
              child: EconaNavigationBar(
                navigationShell: navigationShell,
              ),
            )
          : null,
    );
  }
}
