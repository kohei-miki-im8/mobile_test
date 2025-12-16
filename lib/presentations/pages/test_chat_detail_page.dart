import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:flutter/material.dart';

class TestChatDetailPage extends StatelessWidget {
  const TestChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AvatarAppBar(
        nameText: 'ゆきこ',
      ),
      body: Center(child: Text('Test Chat detail Page')),
    );
  }
}
