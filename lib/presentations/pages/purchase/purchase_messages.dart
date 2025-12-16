import 'package:flutter/services.dart';
import 'package:econa_mobile_app/core/errors/econa_error.dart';

/// RevenueCat PlatformException をユーザー向け文言へ
String mapRevenueCatErrorToUserMessage(Object error) {
  final econa = EconaError.fromPlatformException(
    error,
    operation: EconaErrorOperation.unknown,
  );
  return econa.causeMessage;
}

bool isPurchaseCancelled(Object error) {
  if (error is PlatformException) {
    return _readableErrorCode(error) == 'PurchaseCancelledError';
  }
  return false;
}

String _readableErrorCode(PlatformException e) {
  final details = e.details;
  if (details is Map) {
    final code = details['readableErrorCode'] ?? details['readable_error_code'];
    if (code is String) return code;
  }
  // Android/iOS の差異対策: 最終的に e.code を返す
  return e.code;
}

/// 成功メッセージ（既存 UI 互換）
const purchaseSuccessMessageDefault = '購入が完了しました';
const purchaseSuccessMessageAlt1 = 'ご購入ありがとうございます。引き続きお楽しみください。';
const purchaseSuccessMessageAlt2 = '購入が完了しました。特典の反映まで少々お待ちください。';
