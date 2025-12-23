import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/pages/login/email_link_verify_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/shared/users/user_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailLinkVerifyPage extends HookConsumerWidget {
  const EmailLinkVerifyPage({required this.uri, super.key});
  final Uri uri;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(emailLinkVerifyViewModelProvider.notifier);
    useEffect(() {
      Future<void>(() async {
        try {
          final outcome = await notifier.signInWithEmailLink(uri);
          final nextPath = await notifier.getNextPath(outcome, ref);

          final authRepository = ref.read(authRepositoryProvider);
          final userStatus = await ref.read(userViewModelProvider.notifier)
              .getUserStatus(GetUserStatusRequest());

          authRepository.cacheUserId(userStatus?.userId ?? '');

          if(!context.mounted) return;

          if(nextPath != null) {
            context.go(nextPath);
          } else {
            await EconaNotification.showTopToast(
              context,
              message: 'メールリンク認証に失敗しました',
            );
            if(context.mounted) {
              context.go(EconaPath.login);
            }
          }
        } on Exception catch (e) {
          if (context.mounted) {
            await EconaNotification.showTopToast(
              context,
              message: 'メールリンク認証に失敗しました',
            );
            if(context.mounted) {
              context.go(EconaPath.login);
            }
          }
        }
      });
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Column(
        spacing: 64,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'メールアドレスで認証中...',
              style: EconaTextStyle.headlineLarge(
                color: EconaColor.grayDark,
              ),
            ),
          ),
          const EconaLoadingIndicator(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'しばらくお待ちください。認証が完了すると自動的に画面が切り替わります。',
              style: EconaTextStyle.labelMedium1140(
                color: EconaColor.grayNormal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
