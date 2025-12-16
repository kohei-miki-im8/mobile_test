// 購入・サブスクリプション共通の軽量ヘルパ群（purchase配下限定で使用）
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/external_service_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_external_user.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_external_user.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

Future<void> ensureExternalUserLinked(WidgetRef ref) async {
  final userRepo = ref.read(userRepositoryProvider);

  // 外部ユーザーを取得
  final response = await userRepo.getExternalUser(
    GetExternalUserRequest(
      externalServiceCode: ExternalServiceCode.EXTERNAL_SERVICE_CODE_REVENUECAT,
    ),
  );

  // 匿名ユーザーのappUserIDを取得
  final originalAppUserID = await Purchases.appUserID;
  final String appUserID;

  if (!response.hasExternalUniqueId()) {
    appUserID = originalAppUserID.replaceFirst(r'$RCAnonymousID:', '');

    // 外部ユーザーのユニークIDが存在しない場合は作成
    await userRepo.createExternalUser(
      CreateExternalUserRequest(
        externalServiceCode: ExternalServiceCode
            .EXTERNAL_SERVICE_CODE_REVENUECAT,
        externalUniqueId: appUserID,
      ),
    );
  } else {
    appUserID = response.externalUniqueId;
  }
  // } else {
  //   final externalUserId = response.externalUniqueId;
  //   // DBのIDとRevenueCatのIDが異なる場合はRevenueCatのIDで上書き（RevenueCatが正）
  //   if (externalUserId != appUserID) {
  //     await userRepo.createExternalUser(
  //       CreateExternalUserRequest(
  //         externalServiceCode: ExternalServiceCode.EXTERNAL_SERVICE_CODE_REVENUECAT,
  //         externalUniqueId: appUserID,
  //       ),
  //     );
  //   }
  // }

  await Purchases.logIn(appUserID);
  return;
}

// 購入・サブスクリプション共通の軽量ヘルパ群（purchase配下限定で使用）

/// タイトル末尾の括弧書き（bundleId等）を除去
String sanitizeStoreTitle(String raw) {
  final idx = raw.indexOf('(');
  if (idx >= 0) {
    return raw.substring(0, idx).trimRight();
  }
  return raw;
}

/// 先頭連続数字を抽出（なければ0）
int extractLeadingInt(String text) {
  final normalized = sanitizeStoreTitle(text);
  final m = RegExp(r'^(\d+)').firstMatch(normalized.trim());
  return m != null ? int.tryParse(m.group(1)!) ?? 0 : 0;
}

/// 3桁区切り
String formatWithComma(int value) {
  final s = value.toString();
  final reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  return s.replaceAllMapped(reg, (m) => '${m[1]},');
}

/// 円表記
String formatYen(int value) => '¥${formatWithComma(value)}';


