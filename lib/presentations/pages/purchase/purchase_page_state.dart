import 'package:purchases_flutter/purchases_flutter.dart';

class PurchasePageState {
  const PurchasePageState({
    this.offering,
    this.isPurchasing = false,
    this.purchaseCompleted = false,
    this.lp = 0,
    this.mp = 0,
    this.error,
  });

  final Offering? offering;
  final bool isPurchasing;
  final bool purchaseCompleted;
  final int lp;
  final int mp;
  final String? error;

  PurchasePageState copyWith({
    Offering? offering,
    bool? isPurchasing,
    bool? purchaseCompleted,
    int? lp,
    int? mp,
    String? error,
  }) {
    return PurchasePageState(
      offering: offering ?? this.offering,
      isPurchasing: isPurchasing ?? this.isPurchasing,
      purchaseCompleted: purchaseCompleted ?? this.purchaseCompleted,
      lp: lp ?? this.lp,
      mp: mp ?? this.mp,
      error: error,
    );
  }
}