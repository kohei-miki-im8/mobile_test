import 'dart:async';

import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/service_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/upsert_user_private_mode.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/private_mode_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'private_mode_page_view_model.g.dart';

@riverpod
class PrivateModePageViewModel extends _$PrivateModePageViewModel {
  @override
  FutureOr<PrivateModePageState> build() {
    return const PrivateModePageState();
  }

  Future<void> enablePrivateMode(ServiceCode serviceCode) async {
    state = const AsyncLoading();
    try {
      final response = await ref.read(userRepositoryProvider).upsertUserPrivateMode(
        UpsertUserPrivateModeRequest(serviceCode: serviceCode),
      );

      state = AsyncData(PrivateModePageState(response: response));
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      rethrow;
    }
  }
}
