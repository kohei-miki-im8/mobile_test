import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/provider_interface.dart';
import 'package:flutter/foundation.dart';

@immutable
class RashisaMatchPageState implements UserDetailsProvider {
  const RashisaMatchPageState({
    this.rashisaMatchUsers = const [],
    this.isLoading = false,
    this.error,
  });
  final List<UserDetail> rashisaMatchUsers;
  final bool isLoading;
  final EconaError? error;

  @override
  List<UserDetail> get userDetails => rashisaMatchUsers;

  RashisaMatchPageState copyWith({
    List<UserDetail>? rashisaMatchUsers,
    bool? isLoading,
    EconaError? error,
  }) {
    return RashisaMatchPageState(
      rashisaMatchUsers: rashisaMatchUsers ?? this.rashisaMatchUsers,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
