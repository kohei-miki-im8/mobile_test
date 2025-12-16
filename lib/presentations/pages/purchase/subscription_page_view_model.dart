import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/certificate_level_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/revenuecat_service.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/subscription_page_state.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subscription_page_view_model.g.dart';

/// 表示するサブスクリプションプランの種類を定義するenum
enum SubscriptionPageType {
  basic,
  premium,
}

@riverpod
class SubscriptionPageViewModel extends _$SubscriptionPageViewModel {
  @override
  Future<SubscriptionPageState> build(SubscriptionPageType type) async {
    try {
      // プロフィールとユーザーステータスを取得
      final profileRepository = ref.read(profileRepositoryProvider);
      final userRepository = ref.read(userRepositoryProvider);

      final results = await Future.wait([
        profileRepository.getProfile(GetProfileRequest()),
        userRepository.getUserStatus(GetUserStatusRequest()),
      ]);

      final profile = (results[0] as GetProfileResponse).profile;
      final userStatusResponse = results[1] as GetUserStatusResponse;

      final isSingleCertified =
          userStatusResponse.userStatus.certificateLevelCode ==
              CertificateLevelCode.CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED;

      final bool isMale = profile.genderCode == GenderCode.GENDER_CODE_MALE;
      final bool isFemale = profile.genderCode == GenderCode.GENDER_CODE_FEMALE;
      final bool isBasicPlan = type == SubscriptionPageType.basic;

      final ids = _mapOfferingIds(
        isMale: isMale,
        isFemale: isFemale,
        isBasicPlan: isBasicPlan,
      );
      if (ids.error != null) {
        return SubscriptionPageState(
          userStatus: userStatusResponse.userStatus,
          genderCode: profile.genderCode,
          error: ids.error,
        );
      }

      final offerings = await RevenueCatService.getOfferings();
      if (offerings == null) {
        return SubscriptionPageState(
          userStatus: userStatusResponse.userStatus,
          genderCode: profile.genderCode,
          error: 'プランの取得に失敗しました。',
        );
      }

      final defaultOffering = offerings.getOffering(ids.defaultOfferingId!);
      final singleDiscountOffering = offerings.getOffering(ids.discountOfferingId!);

      if (isSingleCertified) {
        // 独身証明済み: 割引オファリングをそのまま表示（なければデフォルトにフォールバック）
        final selected = singleDiscountOffering ?? defaultOffering;
        if (selected == null) {
          return SubscriptionPageState(
            userStatus: userStatusResponse.userStatus,
            genderCode: profile.genderCode,
            error: '指定されたプランが見つかりませんでした: ${ids.discountOfferingId}',
          );
        }
        return SubscriptionPageState(
          userStatus: userStatusResponse.userStatus,
          offering: selected,
          genderCode: profile.genderCode,
          isSingleDiscountOffering: selected == singleDiscountOffering,
          discountOffering: null,
        );
      }

      // 未証明: Convexに通常価格、Concaveに割引価格を並べる
      if (defaultOffering == null) {
        return SubscriptionPageState(
          userStatus: userStatusResponse.userStatus,
          genderCode: profile.genderCode,
          error: '指定されたプランが見つかりませんでした: ${ids.defaultOfferingId}',
        );
      }
      return SubscriptionPageState(
        userStatus: userStatusResponse.userStatus,
        offering: defaultOffering,
        genderCode: profile.genderCode,
        isSingleDiscountOffering: false,
        discountOffering: singleDiscountOffering,
      );
    } catch (e) {
      return SubscriptionPageState(
        error: 'ページの読み込みに失敗しました: ${e.toString()}',
      );
    }
  }

  /// 状態を再取得（復元）するメソッド
  Future<bool> restore() async {
    final previous = state.valueOrNull; // 失敗時に戻す用（なくてもOK）

    try {
      await RevenueCatService.restorePurchases();
      state = await AsyncValue.guard(() => build(type));
      return true;
    } catch (_) {
      if(previous != null) {
        state = AsyncData(
          previous.copyWith(
            error: '購入情報の復元に失敗しました',
          ),
        );
      }
      return false;
    }
  }

  Future<void> purchase(Package package) async {
    try {
      final customerInfo = await RevenueCatService.purchasePackage(package);
      if (customerInfo != null) {
        state = await AsyncValue.guard(() => build(this.type));
      }
    } catch (_) {}
  }

  // state更新メソッド
  Future<void> reload() async {
    state = await AsyncValue.guard(() => build(type));
  }

}

class _OfferingIds {
  const _OfferingIds({this.defaultOfferingId, this.discountOfferingId, this.error});
  final String? defaultOfferingId;
  final String? discountOfferingId;
  final String? error;
}

_OfferingIds _mapOfferingIds({
  required bool isMale,
  required bool isFemale,
  required bool isBasicPlan,
}) {
  if (isMale) {
    return isBasicPlan
        ? const _OfferingIds(defaultOfferingId: 'male_basic_default', discountOfferingId: 'male_basic_single_discount')
        : const _OfferingIds(defaultOfferingId: 'male_premium_default', discountOfferingId: 'male_premium_single_discount');
  }
  if (isFemale) {
    if (isBasicPlan) {
      return const _OfferingIds(error: '女性にベーシックプランはありません');
    }
    return const _OfferingIds(defaultOfferingId: 'female_premium_default', discountOfferingId: 'female_premium_single_discount');
  }
  return const _OfferingIds(error: '性別情報が不正です');
}