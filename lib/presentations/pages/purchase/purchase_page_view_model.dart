import 'dart:async';

import 'package:econa_mobile_app/infrastructures/services/revenuecat_service.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/revenuecat_offerings.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_points.pb.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_page_state.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:flutter/services.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_messages.dart';
import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchase_page_view_model.g.dart';

/// 表示するパッケージの種類を定義するenum
enum PurchasePageType {
  lp,
  mp,
}

@riverpod
class PurchasePageViewModel extends _$PurchasePageViewModel {
  @override
  // 引数でLPかMPかを受け取る
  Future<PurchasePageState> build(PurchasePageType pageType) async {
    try {
      final offerings = await RevenueCatService.getOfferings();
      if (offerings == null) {
        return const PurchasePageState(error: 'プランの取得に失敗しました。');
      }

      final RevenueCatOfferingId offeringId =
          pageType == PurchasePageType.lp ? RevenueCatOfferingId.lpPackages : RevenueCatOfferingId.mpPackages;

      final Offering? offering = RevenueCatService.getOfferingById(offerings, offeringId);
      if (offering == null) {
        return PurchasePageState(
          error: '指定されたプランが見つかりませんでした: ${offeringId.id}',
        );
      }

      // ユーザー所持ポイントを取得
      final _UserPoints points = await _fetchUserPointsSafely();

      return PurchasePageState(
        offering: offering,
        lp: points.lp,
        mp: points.mp,
      );
    } catch (e) {
      return PurchasePageState(
        error: 'ページの読み込みに失敗しました: ${e.toString()}',
      );
    }
  }

  /// パッケージ購入を実行する
  Future<void> purchasePackage(Package packageToPurchase) async {
    final currentState = await future;
    state = AsyncData(currentState.copyWith(isPurchasing: true, error: null));

    try {
      final customerInfo = await RevenueCatService.purchasePackage(packageToPurchase);

      if (customerInfo != null) {
        // 成功: ポイントは非同期で更新（UIトーストはUI側で）
        unawaited(() async {
          final _UserPoints points = await _fetchUserPointsSafely();
          final updated = (await future).copyWith(lp: points.lp, mp: points.mp);
          state = AsyncData(updated);
        }());
        state = AsyncData(
          currentState.copyWith(
            isPurchasing: false,
            purchaseCompleted: true,
          ),
        );
      } else {
        state = AsyncData(
          currentState.copyWith(
            isPurchasing: false,
            error: '購入に失敗しました',
          ),
        );
      }
    } catch (e) {
      // キャンセルはエラーページにせず、トーストのみで通知できるようにメッセージ化
      String msg;
      if (e is PlatformException && isPurchaseCancelled(e)) {
        msg = '購入がキャンセルされました。';
      } else if (e is PlatformException) {
        msg = EconaError.fromPlatformException(
          e,
          operation: EconaErrorOperation.unknown,
        ).userMessage;
      } else {
        msg = EconaError.fromException(e, operation: EconaErrorOperation.unknown).userMessage;
      }
      state = AsyncData(currentState.copyWith(isPurchasing: false, error: msg));
    }
  }

  Future<void> restore() async {
    final currentState = await future;
    try {
      await RevenueCatService.restorePurchases();
      final _UserPoints points = await _fetchUserPointsSafely();
      state = AsyncData(currentState.copyWith(lp: points.lp, mp: points.mp));
    } catch (e) {
      state = AsyncData(currentState.copyWith(error: e.toString()));
    }
  }

  Future<_UserPoints> _fetchUserPointsSafely() async {
    try {
      final userRepo = ref.read(userRepositoryProvider);
      final res = await userRepo.getUserPoints(GetUserPointsRequest());
      return _UserPoints(
        lp: res.freeLavigationPoint + res.lavigationPoint,
        mp: res.freeMatchingPoint + res.matchingPoint,
      );
    } catch (_) {
      return const _UserPoints(lp: 0, mp: 0);
    }
  }
}

class _UserPoints {
  const _UserPoints({required this.lp, required this.mp});
  final int lp;
  final int mp;
}
