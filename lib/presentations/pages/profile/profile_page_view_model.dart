import 'dart:async';

import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/ekyc_level.dart';
import 'package:econa_mobile_app/domains/entities/login_status.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart'
    as profile_entity;
import 'package:econa_mobile_app/domains/entities/profile_detail.dart';
import 'package:econa_mobile_app/domains/entities/requiring_review_profile_photo.dart'
    as entity;
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/blood_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/body_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_desire_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_situation_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/dating_preference_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/drinking_alcohol_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/educational_background_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/first_date_cost_preference_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/first_date_location_preference_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/holiday_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/house_work_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/language_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/marital_history_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/marriage_aspiration_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/occupation_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/personality_trait_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/roommate_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/salary_range_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/sibling_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/sixteen_personality_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/smoking_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/sociability_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/user_activity_tag.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/master/regions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/update_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/google/protobuf/timestamp.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_state.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:econa_mobile_app/presentations/util/age.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePageViewModel extends StateNotifier<ProfilePageState> {
  ProfilePageViewModel(this.ref) : super(const ProfilePageState()) {
    initialFetchData();
  }

  final Ref ref;
  bool _isRevalidating = false;

  /// 初回データロード
  Future<void> initialFetchData() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response = await ref.read(profileRepositoryProvider).getProfile(
            GetProfileRequest(),
          );

      final userStatusResponse =
          await ref.read(userRepositoryProvider).getUserStatus(
                GetUserStatusRequest(),
              );

      final profile = response.profile;
      final userStatus = userStatusResponse.userStatus;

      final urls = profile.requiringReviewProfilePhotos
          .map((p) {
        if (p.hasCurrentSignedImageUrls()) {
          return p.currentSignedImageUrls.largeThumbnailWebpUrl;
        }
        if (p.hasPendingSignedImageUrls()) {
          return p.pendingSignedImageUrls.largeThumbnailWebpUrl;
        }
        return '';
      })
          .where((u) => u.isNotEmpty)
          .toList();

      final images = resolveImagesFromUrls(
        urls: urls,
        genderCode: profile.genderCode,
        kind: PhotoUrlKind.largeThumbnailWebpUrl,
      );

      // プロフィール写真をエンティティに変換
      final requiringReviewProfilePhotos = profile.requiringReviewProfilePhotos
          .map(entity.RequiringReviewProfilePhoto.fromProtobuf)
          .toList();

      // ベスト画像のSignedImageUrlsエンティティを取得
      final bestImageUrls = requiringReviewProfilePhotos.getBestImageUrls();

      final myUserDetail = [
        UserDetail(
          profile: profile_entity.Profile(
            name: profile
                .updatableProfile.requiringReviewNickname.currentNickname,
            age: calculateAge(profile.updatableProfile.birthday),
            location: profile.updatableProfile.residenceRegion.name,
            images: images,
            bestImageUrls: bestImageUrls,
            userId: userStatus.userId,
            badgeType: null,
            certificateLevel: CertificateLevel.fromCertificateLevelCode(
                userStatus.certificateLevelCode),
            loginStatus: LoginStatus.fromUserActivityTag(
                UserActivityTag.USER_ACTIVITY_TAG_ONLINE),
            isFavorite: false,
          ),
          profileDetail: ProfileDetail.fromProfileResponse(response),
          matchingReason: null,
        ),
      ];

      state = state.copyWith(
        myUserDetail: myUserDetail,
        profile: profile,
        userStatus: userStatus,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.profileFetch,
      );
      state = state.copyWith(
        error: econaError,
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  // プロフィール取得
  Future<void> getProfile() async {
    try {
      if (state.isLoading) return;

      state = state.copyWith(
        isLoading: true,
        error: null,
      );

      final request = GetProfileRequest();
      final response =
          await ref.read(profileRepositoryProvider).getProfile(request);

      state = state.copyWith(
        profile: response.profile,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.profileFetch,
      );
      state = state.copyWith(
        error: econaError,
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  /// ローディングなしでプロフィール取得
  Future<void> getProfileNoLoading() async {
    try {
      state = state.copyWith(
        error: null,
      );

      final request = GetProfileRequest();
      final response =
          await ref.read(profileRepositoryProvider).getProfile(request);

      state = state.copyWith(
        profile: response.profile,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.profileFetch,
      );
      state = state.copyWith(
        error: econaError,
      );
    }
  }

  /// プロフィール更新の共通処理
  Future<void> _updateField({
    required UpdateProfileRequest Function(Profile? profile)
        updateProfileRequest,
  }) async {
    state = state.copyWith(
      isLoading: false, // ローディングは見せない
      error: null,
    );

    final previousState = state;

    try {
      final request = updateProfileRequest(previousState.profile);
      await ref.read(profileRepositoryProvider).updateProfile(request);

      // ロードをせずにプロフィールを更新
      await getProfileNoLoading();
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.profileUpdate,
      );
      state = state.copyWith(
        error: econaError,
      );

      /// 呼び出し元のbase_profile_○○に投げる
      rethrow;
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  //#region 自己紹介
  Future<void> updateIntroductory(String introductory) async {
    await _updateField(
      updateProfileRequest: (profile) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(
          requiringReviewIntroductory: RequiringReviewIntroductory(
            pendingIntroductory: introductory,
          ),
        ),
      ),
    );
  }
  //#endregion

  //#region 基本情報
  /// ニックネーム
  Future<void> updateNickname(String nickname) async {
    await _updateField(
      updateProfileRequest: (profile) {
        return UpdateProfileRequest(
          updatableProfile: UpdatableProfile(
            requiringReviewNickname: RequiringReviewNickname(
              pendingNickname: nickname,
            ),
          ),
        );
      },
    );
  }

  /// 年齢
  Future<void> updateBirthday(int year, int month, int day) async {
    final birthday = DateTime.utc(year, month, day);
    await _updateField(
      updateProfileRequest: (profile) {
        final birthdayTs = Timestamp.fromDateTime(birthday);
        final newProfile = profile?.updatableProfile;
        return UpdateProfileRequest(
          updatableProfile: UpdatableProfile(
            requiringReviewNickname: newProfile?.requiringReviewNickname,
            birthday: birthdayTs,
          ),
        );
      },
    );
  }

  /// 居住地
  Future<void> updateResidenceRegion(Region region) async {
    await _updateField(
      updateProfileRequest: (profile) {
        final newProfile = profile?.updatableProfile;
        return UpdateProfileRequest(
          updatableProfile: UpdatableProfile(
            requiringReviewNickname: newProfile?.requiringReviewNickname,
            residenceRegion: region,
          ),
        );
      },
    );
  }

  /// 血液型
  Future<void> updateBloodType(BloodTypeCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(bloodTypeCode: code),
      ),
    );
  }

  /// 出身地
  Future<void> updateBirthplaceRegion(Region region) async {
    await _updateField(
      updateProfileRequest: (profile) {
        return UpdateProfileRequest(
          optionalProfile: OptionalProfile(birthplaceRegion: region),
        );
      },
    );
  }
  //#endregion

  //#region  容姿
  /// 身長
  Future<void> updateHeight(int? height) async {
    await _updateField(
      updateProfileRequest: (profile) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(height: height),
      ),
    );
  }

  /// 体型
  Future<void> updateBodyType(BodyTypeCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(bodyTypeCode: code),
      ),
    );
  }
  //#endregion

  //#region 仕事・学歴
  /// 職業
  Future<void> updateOccupation(OccupationCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(occupationCode: code),
      ),
    );
  }

  /// 勤務地
  Future<void> updateWorkplaceRegion(Region region) async {
    await _updateField(
      updateProfileRequest: (profile) {
        return UpdateProfileRequest(
          optionalProfile: OptionalProfile(workplaceRegion: region),
        );
      },
    );
  }

  /// 年収
  Future<void> updateSalaryRange(SalaryRangeCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(salaryRangeCode: code),
      ),
    );
  }

  /// 学歴
  Future<void> updateEducationalBackground(
      EducationalBackgroundCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(educationalBackgroundCode: code),
      ),
    );
  }
  //#endregion

  //#region 生活・その他
  /// 兄弟姉妹
  Future<void> updateSibling(SiblingCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(siblingCode: code),
      ),
    );
  }

  /// 同居人
  Future<void> updateRoommate(RoommateCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(roommateCode: code),
      ),
    );
  }

  /// 結婚歴
  Future<void> updateMaritalHistory(MaritalHistoryCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(maritalHistoryCode: code),
      ),
    );
  }

  /// 子供の有無
  Future<void> updateChildSituation(ChildSituationCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(childSituationCode: code),
      ),
    );
  }

  /// 休日
  Future<void> updateHolidayType(HolidayTypeCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(holidayTypeCode: code),
      ),
    );
  }

  /// 話せる言語
  Future<void> updateUserLanguages(List<LanguageCode> codes) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(userLanguageCodes: codes),
      ),
    );
  }

  /// お酒
  Future<void> updateDrinkingAlcohol(DrinkingAlcoholCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(drinkingAlcoholCode: code),
      ),
    );
  }

  /// タバコ
  Future<void> updateSmoking(SmokingCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(smokingCode: code),
      ),
    );
  }

  /// 16タイプ診断
  Future<void> updateSixteenPersonality(SixteenPersonalityCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(sixteenPersonalityCode: code),
      ),
    );
  }
  //#endregion

  //#region 将来
  /// 結婚への意思
  Future<void> updateMarriageAspiration(MarriageAspirationCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(marriageAspirationCode: code),
      ),
    );
  }

  /// 子供がほしいか
  Future<void> updateChildDesire(ChildDesireCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(childDesireCode: code),
      ),
    );
  }

  /// 家事育児
  Future<void> updateHouseWork(HouseWorkCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(houseWorkCode: code),
      ),
    );
  }
  //#endregion

  //#region 初回デート
  /// 出会うまでの希望
  Future<void> updateDatingPreference(DatingPreferenceCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(datingPreferenceCode: code),
      ),
    );
  }

  /// 初回のデート費用
  Future<void> updateFirstDateCostPreference(
      FirstDateCostPreferenceCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(firstDateCostPreferenceCode: code),
      ),
    );
  }

  /// 初回デートするなら
  Future<void> updateFirstDateLocationPreference(
      FirstDateLocationPreferenceCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(firstDateLocationPreferenceCode: code),
      ),
    );
  }
  //#endregion

  //#region 未実装
  /// 社交性
  Future<void> updateSociability(SociabilityCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(sociabilityCode: code),
      ),
    );
  }

  /// 性格
  Future<void> updatePersonalityTrait(PersonalityTraitCode code) async {
    await _updateField(
      updateProfileRequest: (_) => UpdateProfileRequest(
        optionalProfile: OptionalProfile(personalityTraitCode: code),
      ),
    );
  }
  //#endregion

  /// SWR用: 画面のローディング/エラー状態を変えずに最新化のみ行う
  Future<void> revalidate() async {
    if (_isRevalidating) return;
    _isRevalidating = true;

    try {
      final request = GetProfileRequest();
      final response =
          await ref.read(profileRepositoryProvider).getProfile(request);

      final newProfile = response.profile;

      final oldProfile = state.profile;

      if (oldProfile != null && oldProfile == newProfile) {
        return;
      }

      state = state.copyWith(
        profile: newProfile,
      );
    } on Exception catch (_) {
      // バックグラウンド更新失敗は握りつぶす
    } finally {
      _isRevalidating = false;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final profilePageViewModelProvider =
    StateNotifierProvider<ProfilePageViewModel, ProfilePageState>(
  ProfilePageViewModel.new,
);
