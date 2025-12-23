import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_point_history.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_points.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchase_history_page_view_model.g.dart';

@riverpod
class PurchaseHistoryPageViewModel extends _$PurchaseHistoryPageViewModel {
  @override
  Future<GetUserPointHistoryResponse> build() async {
    final userRepository = ref.read(userRepositoryProvider);

    final response = await userRepository.getUserPointHistory(
      GetUserPointHistoryRequest(
        cursor: PagerRequestCursor(
          limit: 50,
        )
      ),
    );

    return response;
  }
}

@riverpod
Future<GetUserPointsResponse> purchaseHistoryPoints(Ref ref) async {
  final userRepository = ref.read(userRepositoryProvider);
  return userRepository.getUserPoints(GetUserPointsRequest());
}