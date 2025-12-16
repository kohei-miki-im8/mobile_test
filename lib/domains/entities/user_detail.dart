import 'package:econa_mobile_app/domains/entities/matching_reason.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/domains/entities/profile_detail.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user_tag.pb.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail.freezed.dart';

/// ユーザー詳細のエンティティ
@freezed
abstract class UserDetail with _$UserDetail {
  const factory UserDetail({
    /// プロフィール情報
    required Profile profile,

    /// プロフィール詳細
    required ProfileDetail? profileDetail,

    /// マッチング理由
    MatchingReason? matchingReason,
  }) = _UserDetail;

  const UserDetail._();

  /// GetProfileResponseからUserDetailエンティティを作成
  factory UserDetail.fromProfileResponse(
    GetProfileResponse response,
    String userId, {
    MatchingReason? matchingReason,
    List<UserTag>? tags,
  }) {
    return UserDetail(
      profile: Profile.fromProfileResponse(response, userId),
      profileDetail: ProfileDetail.fromProfileResponse(
        response,
        tags: tags,
      ),
      matchingReason: matchingReason,
    );
  }
}
