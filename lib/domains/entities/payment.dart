import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart' as rc;

part 'payment.freezed.dart';

/// 支払い用オファリング Entity
@freezed
abstract class PaymentOffering with _$PaymentOffering {
  const factory PaymentOffering({
    required String identifier,
    required List<PaymentPackage> packages,
  }) = _PaymentOffering;

  static PaymentOffering fromRevenueCat(rc.Offering offering) => PaymentOffering(
        identifier: offering.identifier,
        packages: offering.availablePackages
            .map(PaymentPackage.fromRevenueCat)
            .toList(),
      );
}

/// RevenueCatのPackageをアプリ内Entityへ正規化
@freezed
abstract class PaymentPackage with _$PaymentPackage {
  const factory PaymentPackage({
    required String identifier,
    required String title,
    required String description,
    required String priceString,
    required String packageType,
    required bool hasFreeTrial,
  }) = _PaymentPackage;

  static PaymentPackage fromRevenueCat(rc.Package pkg) => PaymentPackage(
        identifier: pkg.identifier,
        title: pkg.storeProduct.title,
        description: pkg.storeProduct.description,
        priceString: pkg.storeProduct.priceString,
        packageType: pkg.packageType.name,
        hasFreeTrial: pkg.storeProduct.introductoryPrice != null,
      );
}


