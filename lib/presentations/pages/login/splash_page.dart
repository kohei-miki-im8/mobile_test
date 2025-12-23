import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/shared/users/user_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        Future.microtask(() async {
          final currentUser = FirebaseAuth.instance.currentUser;

          // 未ログインならそのままログイン画面へ
          if (currentUser == null) {
            if (!context.mounted) {
              return;
            }
            context.go(EconaPath.login);
            return;
          }

          try {
            // ユーザーIDをキャッシュ
            final authRepository = ref.read(authRepositoryProvider);
            final userViewModelNotifier = ref.read(userViewModelProvider.notifier);
            final userStatus = await userViewModelNotifier.getUserStatus(
              GetUserStatusRequest(),
            );
            final userId = userStatus?.userId;
            if (userId != null) {
              authRepository.cacheUserId(userId);
            }

            // 既存ユーザーと同じロジックで次の画面を判定
            final registrationNotifier =
                ref.read(registrationPageViewModelProvider.notifier);
            final nextPath =
                await registrationNotifier.determineUserRouteAfterSignIn();

            if (!context.mounted) {
              return;
            }
            context.go(nextPath);
          } catch (_) {
            if (!context.mounted) {
              return;
            }
            context.go(EconaPath.login);
          }
        });
        return null;
      },
      const [],
    );

    return Scaffold(
      backgroundColor: EconaColor.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            Assets.images.illusts.laviLogo.image(width: 180, height: 148),
            const EconaLoadingIndicator(),
            Text(
              '読み込み中です...',
              style: EconaTextStyle.regularSmall140(
                color: EconaColor.grayDarkActive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


