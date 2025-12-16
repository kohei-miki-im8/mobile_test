import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: EconaLoadingIndicator(),
      ),
    );
  }
}