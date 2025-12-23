import 'dart:async';

import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/karte/v1/get_karte.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/karte.dart';
import 'package:econa_mobile_app/presentations/pages/karute/karute_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KarutePageViewModel extends AutoDisposeNotifier<KarutePageState> {
  @override
  KarutePageState build() {
    // 初期化処理を非同期で実行
    Future.microtask(fetchKarte);
    return KarutePageState();
  }

  Future<void> fetchKarte() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final karte = await ref.read(karteRepositoryProvider).getKarte(
            GetKarteRequest(
              cursor: PagerRequestCursor(
                cursorId: null,
                limit: 7,
              ),
            ),
          );

      state = state.copyWith(
        karte: karte,
        isLoading: false,
        error: null,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.karteFetch,
      );
      state = state.copyWith(
        isLoading: false,
        error: econaError,
      );
    }
  }

  Future<void> refreshKarte() async {
    await fetchKarte();
  }
}

final karutePageViewModelProvider =
    AutoDisposeNotifierProvider<KarutePageViewModel, KarutePageState>(
  KarutePageViewModel.new,
);
