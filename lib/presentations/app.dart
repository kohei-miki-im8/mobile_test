import 'package:econa_mobile_app/i18n/strings.g.dart';
import 'package:econa_mobile_app/infrastructures/services/global_notification_service.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  bool _notificationServiceInitialized = false;
  GlobalNotificationService? _notificationService;

  @override
  void dispose() {
    // フィールドに保持していた service を止める
    _notificationService?.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: MaterialApp.router(
        theme: EconaTheme.econaThemeData,
        routerConfig: EconaRouter.router,
        // 日本語のみサポート（将来拡張時に追加）
        locale: const Locale('ja'),
        supportedLocales: const [Locale('ja')],
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        // ★ ここで「MaterialApp.router の内側の context」を取得する
        builder: (innerContext, child) {
          final currentUser = FirebaseAuth.instance.currentUser;

          _notificationService ??=
              ref.read(globalNotificationServiceProvider);

          _notificationService!.updateContext(innerContext);

          // ログイン済み & まだ購読開始していないときだけ start する
          if (!_notificationServiceInitialized && currentUser != null) {
            _notificationServiceInitialized = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) {
                return;
              }
              // 通知ストリーム購読開始（初回のみ）
              _notificationService!.start(innerContext);
            });
          }


          return child!;
        },
      ),
    );
  }
}
