import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/footprint.dart' as entity;

class FootprintPageState {
  const FootprintPageState({
    this.items = const [],
    this.cursorId,
    this.favoriteUserIds = const {},
    this.displayDates = const [],
    this.isLoading = false,
    this.error,
  });

  final List<entity.Footprint> items;
  final String? cursorId;
  final Set<String> favoriteUserIds;
  final List<String> displayDates;
  final bool isLoading;
  final EconaError? error;

  static const _unset = Object();

  FootprintPageState copyWith({
    List<entity.Footprint>? items,
    String? cursorId,
    Set<String>? favoriteUserIds,
    List<String>? displayDates,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return FootprintPageState(
      items: items ?? this.items,
      cursorId: cursorId ?? this.cursorId,
      favoriteUserIds: favoriteUserIds ?? this.favoriteUserIds,
      displayDates: displayDates ?? this.displayDates,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}


