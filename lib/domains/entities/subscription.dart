import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart' as rc;

part 'subscription.freezed.dart';

/// サブスクリプション用オファリング Entity
@freezed
abstract class SubscriptionOffering with _$SubscriptionOffering {
  const factory SubscriptionOffering({
    required String identifier,
    required List<SubscriptionPackage> packages,
  }) = _SubscriptionOffering;

  static SubscriptionOffering fromRevenueCat(rc.Offering offering) =>
      SubscriptionOffering(
        identifier: offering.identifier,
        packages: offering.availablePackages
            .map(SubscriptionPackage.fromRevenueCat)
            .toList(),
      );
}

@freezed
abstract class SubscriptionPackage with _$SubscriptionPackage {
  const factory SubscriptionPackage({
    required String identifier,
    required String title,
    required String description,
    required String priceString,
    required String packageType,
    required bool hasFreeTrial,
  }) = _SubscriptionPackage;

  static SubscriptionPackage fromRevenueCat(rc.Package pkg) =>
      SubscriptionPackage(
        identifier: pkg.identifier,
        title: pkg.storeProduct.title,
        description: pkg.storeProduct.description,
        priceString: pkg.storeProduct.priceString,
        packageType: pkg.packageType.name,
        hasFreeTrial: pkg.storeProduct.introductoryPrice != null,
      );
}


