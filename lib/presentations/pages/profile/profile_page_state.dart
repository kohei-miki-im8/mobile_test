import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user.pb.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/provider_interface.dart';

class ProfilePageState implements UserDetailsProvider {
  const ProfilePageState({
    this.profile,
    this.userStatus,
    this.myUserDetail = const [],
    this.birthday,
    this.residenceIndex,
    this.isLoading = false,
    this.error,
  });

  final Profile? profile;
  final UserStatus? userStatus;
  final List<UserDetail> myUserDetail;
  final DateTime? birthday;
  final int? residenceIndex;
  final bool isLoading;
  final EconaError? error;

  static const _unset = Object();

  @override
  List<UserDetail> get userDetails => myUserDetail;

  ProfilePageState copyWith({
    Profile? profile,
    UserStatus? userStatus,
    List<UserDetail>? myUserDetail,
    DateTime? birthday,
    int? residenceIndex,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset) ? this.error : error as EconaError?;

    return ProfilePageState(
      profile: profile ?? this.profile,
      userStatus: userStatus ?? this.userStatus,
      myUserDetail: myUserDetail?? this.myUserDetail,
      birthday: birthday ?? this.birthday,
      residenceIndex: residenceIndex ?? this.residenceIndex,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}


