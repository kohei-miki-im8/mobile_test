import 'dart:async';
import 'dart:io';

import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:econa_mobile_app/config/app_config.dart';
import 'package:econa_mobile_app/core/privacy_guard.dart';
import 'package:econa_mobile_app/firebase_options.dart';
import 'package:econa_mobile_app/i18n/strings.g.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_deferred_deep_link_handler.dart';
import 'package:econa_mobile_app/infrastructures/services/remote_config_service.dart';
import 'package:econa_mobile_app/infrastructures/services/revenuecat_service.dart';
import 'package:econa_mobile_app/presentations/app.dart';
import 'package:econa_mobile_app/presentations/env.dart';
import 'package:econa_mobile_app/presentations/pages/maintenance_page.dart';
import 'package:econa_mobile_app/presentations/shared/typography_config.dart';
import 'package:econa_mobile_app/presentations/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Todo:リリース時にはsandboxからproductionに変更
  final config = AdjustConfig(Env.adjustToken, AdjustEnvironment.sandbox);
  // // ディファードディープリンク受信時のコールバック
  // ..deferredDeeplinkCallback = (String? uri) {
  //   if (uri == null || uri.isEmpty) {
  //     return;
  //   }
  //   debugPrint('[Adjust] Received deferred deeplink: $uri');
  //
  //   AdjustDeferredDeepLinkHandler.instance.onDeferredDeeplinkReceived(uri);
  // };

  Adjust.initSdk(config);

  await requestAppTrackingTransparency();

  // 翻訳の初期ロケールを日本語に固定
  // LocaleSettings.useDeviceLocale();
  await LocaleSettings.setLocale(AppLocale.ja);

  await LineSDK.instance.setup(Env.lineChannelId);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final app = Firebase.app();

  // メンテナンスモードのチェック
  await RemoteConfigService.initialize();
  final isMaintenanceMode = RemoteConfigService.isMaintenanceMode;
  final maintenanceMessage = RemoteConfigService.maintenanceMessage;


  // RevenueCat SDK初期化
  await initRevenueCat();

  // デバイスの横幅を取得し、基準の大きさからの比率を保存
  final view = WidgetsBinding.instance.platformDispatcher.views.first;
  final deviceWidth = view.physicalSize.width / view.devicePixelRatio;
  EconaTypographyConfig.initialize(deviceWidth: deviceWidth);

  // 画面の向きを縦に固定
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await SentryFlutter.init(
        (options) {
      options..dsn = Env.sentryDsn
      ..tracesSampleRate = 0.3
      ..sendDefaultPii = false;
    },
    appRunner: () => runApp(
      SentryWidget(
        child: ProviderScope(
          child: isMaintenanceMode
              ? MaterialApp(
                  theme: EconaTheme.econaThemeData,
                  home: MaintenancePage(message: maintenanceMessage),
                )
              : const PrivacyGuard(child: MainApp()),
        ),
      ),
    ),
  );

}

Future<void> initRevenueCat() async {
  PurchasesConfiguration configuration;
  if (Platform.isAndroid) {
    configuration = PurchasesConfiguration(Env.revenueCatGooglePublicApiKey);
  } else if (Platform.isIOS) {
    configuration = PurchasesConfiguration(Env.revenueCatIosPublicApiKey);
  } else {
    configuration = PurchasesConfiguration(Env.revenueCatGooglePublicApiKey);
  }
  await Purchases.configure(configuration);

  // Offeringsを事前にウォームアップ（キャッシュに保存して初回体感を改善）
  unawaited(RevenueCatService.getOfferings());

  Purchases.addCustomerInfoUpdateListener((customerInfo) {});
}

Future<void> requestAppTrackingTransparency() async {
  if (!Platform.isIOS) return;
  final status = await AppTrackingTransparency.trackingAuthorizationStatus;
  if (status == TrackingStatus.notDetermined) {
    // iOSの表示準備に少し待機（クラッシュ回避のため）
    await Future.delayed(const Duration(milliseconds: 300));
    await AppTrackingTransparency.requestTrackingAuthorization();
  }
}