import 'dart:async';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/master/regions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart' as p;
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/services/login_log_service.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestHomePage extends ConsumerWidget {
  const TestHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: EconaAppBarText.homeTitle,
        actions: [
          IconButton(
            icon: Assets.images.icons.settings.image(
              height: 24,
              width: 24,
            ),
            iconSize: 32,
            padding: EdgeInsets.zero,
            onPressed: () async {
              await const SettingsRouteData().push<Object>(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          spacing: 16,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.pinkAccent),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () async {

                    },
                    child: const Text('良子→貴大'),
                  ),
                ),
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () async {

                    },
                    child: const Text('貴大→良子'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.pinkAccent),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () async {
                      await _signInWithTestUser(
                        context,
                        ref,
                        'debug.user.1756253203319.1377@example.com',
                        'debuguser',
                        null,
                      );
                    },
                    child: const Text('良子'),
                  ),
                ),
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () async {
                      await _signInWithTestUser(
                        context,
                        ref,
                        'debug.user.1756253202161.9876@example.com',
                        'debuguser',
                        null,
                      );
                    },
                    child: const Text('貴大'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.pinkAccent),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () async {
                      await _signInWithTestUser(
                        context,
                        ref,
                        'debug.user.1756253203319.1377@example.com',
                        'debuguser',
                        null,
                      );
                    },
                    child: const Text('良子'),
                  ),
                ),
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.pinkAccent),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () async {
                      await _signInWithTestUser(
                        context,
                        ref,
                        'dev.hanako.yamada@ai-mate.co.jp',
                        '47LF7pfLYrLT',
                        null,
                      );
                    },
                    child: const Text('はなちゃん'),
                  ),
                ),
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () async {
                      await _signInWithTestUser(
                        context,
                        ref,
                        'dev.taro.yamada@ai-mate.co.jp',
                        'YT5N43mhEA5L',
                        null,
                      );
                    },
                    child: const Text('たろっち'),
                  ),
                ),
              ],
            ),
            StreamBuilder(
              stream: authRepository.authStateChanges,
              builder: (context, snapshot) {
                final user = snapshot.data;
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '認証状態',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text('ログイン中: ${user != null ? 'はい' : 'いいえ'}'),
                        if (user != null) ...[
                          Text('ユーザーID: ${user.uid}'),
                          FutureBuilder<String?>(
                            future: user.getIdToken(),
                            builder: (context, tokenSnapshot) {
                              final token = tokenSnapshot.data;
                              final displayToken =
                              token != null && token.length > 20
                                  ? '${token.substring(0, 20)}...'
                                  : token ?? '取得中...';
                              return Text('ID Token: $displayToken');
                            },
                          ),
                          Text('メール: ${user.email ?? '未設定'}'),
                          Text('表示名: ${user.displayName ?? '未設定'}'),
                          Text('メール確認: ${user.emailVerified ? '済み' : '未確認'}'),
                          Text(
                            'プロバイダー: '
                                '${user.providerData.map((p) => p.providerId).join(', ')}',
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signInWithTestUser(
      BuildContext context,
      WidgetRef ref,
      String email,
      String password,
      String? navigateTo,
      ) async {
    try {
      // テスト用ユーザーの場合は、Firebase Authを直接使用
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      unawaited(
        LoginLogService.logLoginSuccess(
          method: 'email_password_test_manual',
          content: email,
        ),
      );

      if (navigateTo != null && context.mounted) {
        context
          ..pop()
          ..go(navigateTo);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'ログインに失敗しました';
      if (e.code == 'user-not-found') {
        errorMessage = 'ユーザーが見つかりません';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'パスワードが間違っています';
      }

      unawaited(
        LoginLogService.logLoginFailure(
          method: 'email_password_test_manual',
          content: email,
          detail: 'FirebaseAuthException(${e.code}): $errorMessage',
        ),
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }
}

// ThumbnailUserのテストデータを作る
final testThumbnailUser1 = ThumbnailUser(
  userId: '0198e964-53fb-7459-bf01-a69446883fcf',
  profile: p.Profile(
    genderCode: GenderCode.GENDER_CODE_MALE,
    updatableProfile: p.UpdatableProfile(
      requiringReviewNickname: p.RequiringReviewNickname(
        currentNickname: '貴大',
      ),
      residenceRegion: Region(
        id: 13,
        name: '東京都',
      ),
    ),
  ),
);

final testThumbnailUser2 = ThumbnailUser(
  userId: '0198e8d9-e80a-7602-ab0c-decb6a779c7c',
  profile: p.Profile(
    genderCode: GenderCode.GENDER_CODE_FEMALE,
    updatableProfile: p.UpdatableProfile(
      requiringReviewNickname: p.RequiringReviewNickname(
        currentNickname: '良子',
      ),
      residenceRegion: Region(
        id: 13,
        name: '東京都',
      ),
    ),
  ),
);