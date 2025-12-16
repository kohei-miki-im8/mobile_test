import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user.pb.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SubscriptionPageState {
  const SubscriptionPageState({
    this.userStatus,
    this.offering,
    this.discountOffering,
    this.genderCode,
    this.isSingleDiscountOffering,
    this.error,
  });

  final UserStatus? userStatus;
  final Offering? offering;
  final Offering? discountOffering;
  final GenderCode? genderCode;
  final bool? isSingleDiscountOffering;
  final String? error;

  SubscriptionPageState copyWith({
    UserStatus? userStatus,
    Offering? offering,
    Offering? discountOffering,
    GenderCode? genderCode,
    bool? isSingleDiscountOffering,
    String? error,
  }) {
    return SubscriptionPageState(
      userStatus: userStatus ?? this.userStatus,
      offering: offering ?? this.offering,
      discountOffering: discountOffering ?? this.discountOffering,
      genderCode: genderCode ?? this.genderCode,
      isSingleDiscountOffering:
          isSingleDiscountOffering ?? this.isSingleDiscountOffering,
      error: error,
    );
  }
}