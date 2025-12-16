import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  static FirebaseRemoteConfig? _remoteConfig;

  static Future<void> initialize() async {
    _remoteConfig = FirebaseRemoteConfig.instance;

    // デフォルト値を設定
    await _remoteConfig!.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ),
    );

    // デフォルト値の設定（現在のFirebase設定に合わせる）
    await _remoteConfig!.setDefaults({
      'is_maintenance_mode': false,
      'maintenance_message': 'メンテナンス中です。しばらくお待ちください。',
    });

    // リモートから取得
    try {
      final activated = await _remoteConfig!.fetchAndActivate();
      print('Remote Config fetch success: $activated');
    } catch (e) {
      // エラー時はデフォルト値を使用
      print('Remote Config fetch error: $e');
    }
  }

  /// メンテナンスモードかどうかを判定
  /// is_maintenance_modeがtrueの場合にtrueを返す
  static bool get isMaintenanceMode {
    return _remoteConfig?.getBool('is_maintenance_mode') ?? false;
  }

  static String get maintenanceMessage {
    return _remoteConfig?.getString('maintenance_message') ??
        'メンテナンス中です。しばらくお待ちください。';
  }

  /// デバッグ用: Remote Configの値を取得
  static Map<String, dynamic> getDebugValues() {
    return {
      'is_maintenance_mode': _remoteConfig?.getBool('is_maintenance_mode') ?? false,
      'maintenance_message': _remoteConfig?.getString('maintenance_message') ?? '',
    };
  }

  static Future<void> fetchAndActivate() async {
    try {
      await _remoteConfig?.fetchAndActivate();
    } catch (e) {
      print('Remote Config fetch error: $e');
    }
  }
}