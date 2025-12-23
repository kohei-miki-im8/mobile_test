import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:flutter/material.dart';

class TestChatListPage extends StatelessWidget {
  const TestChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LargeTitleAppBar(titleText: EconaAppBarText.chatListTitle),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Test Chat list Page'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // const ChatRouteData(chatRoomId: '', toUserNickname: '').go(context);
              },
              child: const Text('Go to Test Chat Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
