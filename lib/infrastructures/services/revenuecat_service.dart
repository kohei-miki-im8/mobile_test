import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/subscription_tier.pbenum.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'revenuecat_offerings.dart';

class RevenueCatService {
  static Offerings? _cachedOfferings;
  static DateTime? _cachedAt;
  static const Duration _cacheTtl = Duration(minutes: 5);

  static Future<CustomerInfo> getCustomerInfo() async {
    try {
      return await Purchases.getCustomerInfo();
    } catch (e, st) {
      rethrow;
    }
  }

  /// サブスクリプションの有無を確認
  static Future<bool> hasActiveSubscription() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo.entitlements.active.isNotEmpty;
    } catch (e, st) {
      return false;
    }
  }

  /// エンタイトルメントの有無を確認
  static Future<bool> hasEntitlement(String entitlementId) async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo.entitlements.active[entitlementId]?.isActive ?? false;
    } catch (e, st) {
      return false;
    }
  }

  /// Offeringを取得
  static Future<Offerings?> getOfferings() async {
    try {
      if (_cachedOfferings != null && _cachedAt != null) {
        final now = DateTime.now();
        if (now.difference(_cachedAt!) < _cacheTtl) {
          return _cachedOfferings;
        }
      }

      final offerings = await Purchases.getOfferings();
      _cachedOfferings = offerings;
      _cachedAt = DateTime.now();
      return offerings;
    } catch (e, st) {
      return null;
    }
  }

  /// IDからOfferingの取得
  static Offering? getOfferingById(Offerings offerings, RevenueCatOfferingId id) {
    return offerings.getOffering(id.id);
  }

  /// パッケージを取得
  static Future<CustomerInfo?> purchasePackage(Package package) async {
    try {
      final result = await Purchases.purchasePackage(package);
      return result.customerInfo;
    } catch (e, st) {
      rethrow;
    }
  }

  /// リストア
  static Future<CustomerInfo?> restorePurchases() async {
    try {
      return await Purchases.restorePurchases();
    } catch (e, st) {
      return null;
    }
  }

  /// CustomerInfo から、指定したプロダクトに対応するトランザクションID（なければ疑似ID）を返す。
  ///
  /// 優先順位:
  /// 1. nonSubscriptionTransactions 内で productIdentifier が一致する最新のものの transactionIdentifier
  /// 2. allPurchaseDates[productIdentifier] を用いた疑似ID（`$productId:$purchaseDate`）
  /// 3. いずれも取得できない場合は null
  static String? findTransactionIdForProduct({
    required CustomerInfo customerInfo,
    required String productIdentifier,
  }) {
    // 1. 非サブスクリプション購入のトランザクションIDを優先
    StoreTransaction? latestTx;
    for (final tx in customerInfo.nonSubscriptionTransactions) {
      if (tx.productIdentifier == productIdentifier) {
        latestTx = tx;
      }
    }
    if (latestTx != null && latestTx.transactionIdentifier.isNotEmpty) {
      return latestTx.transactionIdentifier;
    }

    // 2. 購入日時から安定した疑似IDを生成（サブスクなどで transactionIdentifier が無いケース向け）
    final purchaseDate = customerInfo.allPurchaseDates[productIdentifier];
    if (purchaseDate != null && purchaseDate.isNotEmpty) {
      return '$productIdentifier:$purchaseDate';
    }

    // 3. 情報不足の場合は null
    return null;
  }

  /// 次回のプラン更新日を取得
  /// 残り日数を取得（有効なサブスクリプションがない場合やエラー時は0を返す）
  static Future<int> getRemainingDays() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      final latestExpirationString = customerInfo.latestExpirationDate;
      if (latestExpirationString == null) {
        // そもそも期限付きプランがない / まだ買ってない 等
        return 0;
      }

      final now = DateTime.now().toUtc(); // UTCに揃えるのが安全
      final expiration = DateTime.parse(latestExpirationString).toUtc();

      // 期限切れなら 0 日扱い
      if (!expiration.isAfter(now)) {
        return 0;
      }

      // 差分（日）を計算（小数点切り上げ）
      final diff = expiration.difference(now).inSeconds;
      final days = (diff / (60 * 60 * 24)).ceil();
      return days;
    } catch (e) {
      return 0;
    }
  }
}

/// RevenueCatのPackageType関連のユーティリティ
class PackageTypeHelper {
  static String getPeriodText(PackageType packageType) {
    switch (packageType) {
      case PackageType.monthly:
        return '1ヶ月プラン';
      case PackageType.threeMonth:
        return '3ヶ月プラン';
      case PackageType.sixMonth:
        return '6ヶ月プラン';
      case PackageType.annual:
      case PackageType.weekly:
      case PackageType.twoMonth:
      case PackageType.lifetime:
      case PackageType.custom:
      case PackageType.unknown:
        return '不明なプラン';
    }
  }

  static double calculateMonthlyPrice(Package package) {
    final price = package.storeProduct.price;
    switch (package.packageType) {
      case PackageType.monthly:
        return price;
      case PackageType.threeMonth:
        return price / 3;
      case PackageType.sixMonth:
        return price / 6;
      case PackageType.annual:
      case PackageType.weekly:
      case PackageType.twoMonth:
      case PackageType.lifetime:
      case PackageType.custom:
      case PackageType.unknown:
        return 0;
    }
  }
}

/// 現在加入中のサブスクリプションを取得
Future<SubscriptionTier> getSubscriptionTier({required GenderCode genderCode}) async {
  await Purchases.invalidateCustomerInfoCache();
  await Purchases.syncPurchases();
  await Purchases.restorePurchases();
  final info = await Purchases.getCustomerInfo();
  final entitlements = info.entitlements.all;

  final hasBasic = entitlements['basic_access']?.isActive ?? false;
  final hasPremium = entitlements['premium_access']?.isActive ?? false;

  if (hasPremium) {
    return SubscriptionTier.SUBSCRIPTION_TIER_PREMIUM;
  } else if (hasBasic) {
    return SubscriptionTier.SUBSCRIPTION_TIER_BASIC;
  } else {
    return switch(genderCode) {
      GenderCode.GENDER_CODE_MALE => SubscriptionTier.SUBSCRIPTION_TIER_FREE,
      GenderCode.GENDER_CODE_FEMALE => SubscriptionTier.SUBSCRIPTION_TIER_BASIC,
      GenderCode() => SubscriptionTier.SUBSCRIPTION_TIER_FREE,
    };
  }
}


