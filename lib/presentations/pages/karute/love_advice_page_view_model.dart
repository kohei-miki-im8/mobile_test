import 'dart:async';

import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/advice/v1/get_approach_analysis.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/advice/v1/get_ideal.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/advice.dart';
import 'package:econa_mobile_app/presentations/pages/karute/love_advice_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoveAdvicePageViewModel extends AutoDisposeNotifier<LoveAdvicePageState> {
  @override
  LoveAdvicePageState build() {
    // 初期化処理を非同期で実行
    Future.microtask(fetchAll);
    return LoveAdvicePageState();
  }

  Future<void> fetchAll() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final idealAdvice =
          await ref.read(adviceRepositoryProvider).getIdeal(GetIdealRequest());
      final approachAnalysis = await ref
          .read(adviceRepositoryProvider)
          .getApproachAnalysis(GetApproachAnalysisRequest());

      state = state.copyWith(
        idealAdvice: idealAdvice,
        approachAnalysis: approachAnalysis,
        isLoading: false,
        error: null,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.loveAdviceFetch,
      );
      state = state.copyWith(
        isLoading: false,
        error: econaError,
      );
    }
  }

  Future<void> getIdealAdvice() async {
    try {
      final idealAdvice =
          await ref.read(adviceRepositoryProvider).getIdeal(GetIdealRequest());
      state = state.copyWith(idealAdvice: idealAdvice);
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.idealAdviceFetch,
      );
      state = state.copyWith(error: econaError);
    }
  }

  Future<void> getApproachAnalysis() async {
    try {
      final approachAnalysis = await ref
          .read(adviceRepositoryProvider)
          .getApproachAnalysis(GetApproachAnalysisRequest());
      state = state.copyWith(approachAnalysis: approachAnalysis);
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.approachAnalysisFetch,
      );
      state = state.copyWith(error: econaError);
    }
  }
}

final loveAdvicePageViewModelProvider =
    AutoDisposeNotifierProvider<LoveAdvicePageViewModel, LoveAdvicePageState>(
  LoveAdvicePageViewModel.new,
);
