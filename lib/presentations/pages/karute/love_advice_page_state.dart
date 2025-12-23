import 'package:econa_mobile_app/domains/entities/approach_analysis.dart';
import 'package:econa_mobile_app/domains/entities/ideal.dart';
import 'package:econa_mobile_app/core/errors/econa_error.dart';

class LoveAdvicePageState {
  LoveAdvicePageState({
    this.idealAdvice,
    this.approachAnalysis,
    this.isLoading = false,
    this.error,
  });

  final IdealAdvice? idealAdvice;
  final ApproachAnalysis? approachAnalysis;
  final bool isLoading;
  final EconaError? error;

  LoveAdvicePageState copyWith({
    IdealAdvice? idealAdvice,
    ApproachAnalysis? approachAnalysis,
    bool? isLoading,
    EconaError? error,
  }) {
    return LoveAdvicePageState(
      idealAdvice: idealAdvice ?? this.idealAdvice,
      approachAnalysis: approachAnalysis ?? this.approachAnalysis,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
