import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SecurityIntegrityService {
  SecurityIntegrityService._();

  static const _channel = MethodChannel('app.security_integrity');
  static bool? _cachedCompromised;


  static Future<bool> isDeviceCompromised() async {
    if (_cachedCompromised != null) return _cachedCompromised!;

    if(kDebugMode) {
      _cachedCompromised = false;
      return false;
    }

    const disabled = bool.fromEnvironment('DISABLE_INTEGRITY_CHECK', defaultValue: false);
    if (disabled) {
      _cachedCompromised = false;
      return false;
    }

    const force = bool.fromEnvironment('FORCE_COMPROMISED', defaultValue: false);
    if (force) {
      _cachedCompromised = true;
      return true;
    }

    try {
      final res = await _channel.invokeMethod<bool>('isDeviceCompromised');
      _cachedCompromised = res ?? false;
      return _cachedCompromised!;
    } catch (_) {
      _cachedCompromised = false;
      return false;
    }
  }
}
