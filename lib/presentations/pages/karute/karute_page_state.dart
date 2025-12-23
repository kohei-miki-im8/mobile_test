import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/karte.dart';

class KarutePageState {
  KarutePageState({
    this.karte,
    this.isLoading = false,
    this.error,
  });

  final Karte? karte;
  final bool isLoading;
  final EconaError? error;

  KarutePageState copyWith({
    Karte? karte,
    bool? isLoading,
    EconaError? error,
  }) {
    return KarutePageState(
      karte: karte ?? this.karte,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
