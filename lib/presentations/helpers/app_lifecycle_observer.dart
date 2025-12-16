import 'package:flutter/widgets.dart';

class OnResumeObserver extends WidgetsBindingObserver {
  OnResumeObserver({required this.onResume});

  final VoidCallback onResume;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onResume();
    }
  }
}


