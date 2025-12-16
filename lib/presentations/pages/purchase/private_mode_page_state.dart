import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/upsert_user_private_mode.pb.dart';

class PrivateModePageState {
  const PrivateModePageState({
    this.response,
  });

  final UpsertUserPrivateModeResponse? response;

  PrivateModePageState copyWith({
    UpsertUserPrivateModeResponse? response,
    bool resetResponse = false,
  }) {
    return PrivateModePageState(
      response: resetResponse ? null : response ?? this.response,
    );
  }
}


