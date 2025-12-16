import 'dart:io';

import 'package:econa_mobile_app/domains/entities/registration_field.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/account_status_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/body_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_desire_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_situation_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/holiday_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/marital_history_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/marriage_aspiration_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/media_category.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/occupation_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/registration_step.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/salary_range_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/smoking_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/user_agreement_type.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/master/regions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/create_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/create_registration_step_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/get_latest_registration_step.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_user_agreement_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_agreement_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/photo_crop_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/media.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/infrastructures/repositories/registration.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/media_upload_service.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_state.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registration_page_view_model.g.dart';

/* 重複していたRegistrationPageState定義は外部ファイルを使用するため削除 */

/// 登録ページのメインViewModel（同期的）
@riverpod
class RegistrationPageViewModel extends _$RegistrationPageViewModel {
  @override
  RegistrationPageState build() {
    // 同期的に初期状態を返す
    ref.keepAlive();
    return const RegistrationPageState();
  }

  /// 最新の登録ステップを取得（APIが必要な場合に呼び出し）
  Future<RegistrationStep?> getLatestRegistrationStep() async {
    try {
      final response = await ref.read(registrationRepositoryProvider)
          .getLatestRegistrationStep(GetLatestRegistrationStepRequest());

      state = state.copyWith(
        registrationStep: response.registrationStep,
      );

      return response.registrationStep;
    } catch (e) {
      state = state.copyWith(
        error: '登録ステップの取得に失敗しました: ${e.toString()}',
      );
      return null;
    }
  }

  /// 登録ステップログを作成
  Future<void> createRegistrationStepLog(CreateRegistrationStepLogRequest request) async {
    try {
      await ref.read(registrationRepositoryProvider).createRegistrationStepLog(request);

      state = state.copyWith(
        registrationStep: request.registrationStep,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        error: '登録ステップの保存に失敗しました: ${e.toString()}',
      );
    }
  }

  /// ユーザー同意ログを作成
  Future<void> createUserAgreementLog(CreateUserAgreementLogRequest request) async {
    try {
      await ref.read(userRepositoryProvider).createUserAgreementLog(request);
    } catch (e) {
      state = state.copyWith(
        error: 'ユーザー同意の保存に失敗しました: ${e.toString()}',
      );
    }
  }

  Future<String> getNextRegistrationStepPathAsync(RegistrationStep? step) async {
    if (step == null) {
      try {
        // 利用規約同意ログを取得
        final userAgreementLogResponse = await ref.read(userRepositoryProvider).getUserAgreementLog(
          GetUserAgreementLogRequest(
            agreementType: UserAgreementType.USER_AGREEMENT_TYPE_TERMS_OF_SERVICE,
          ),
        );

        // 同意ログがあればメインプロフィールオンボーディングへ、なければユーザー同意へ
        if (userAgreementLogResponse.hasAgreed) {
          return EconaPath.mainProfileOnboarding;
        } else {
          return EconaPath.userAgreement;
        }
      } on Exception catch (e) {
        // エラーが発生した場合はlogin画面へ
        return EconaPath.login;
      }
    }

    // stepがnullでない場合はstepから判断
    return getNextRegistrationStepPath(step);
  }

  /// 登録ステップに応じた遷移先パスを取得
  String getNextRegistrationStepPath(RegistrationStep step) {
    switch (step) {
      case RegistrationStep.REGISTRATION_STEP_UNSPECIFIED:
        return EconaPath.userAgreement;
      case RegistrationStep.REGISTRATION_STEP_1_01:
        return EconaPath.photoOnboarding;
      case RegistrationStep.REGISTRATION_STEP_2_01:
        return EconaPath.subProfileOnboarding;
      case RegistrationStep.REGISTRATION_STEP_3_01:
        return RegistrationProfileFieldRouteData(field: RegistrationField.bodyType.name).location;
      case RegistrationStep.REGISTRATION_STEP_3_02:
        return RegistrationProfileFieldRouteData(field: RegistrationField.occupation.name).location;
      case RegistrationStep.REGISTRATION_STEP_3_03:
        return RegistrationProfileFieldRouteData(field: RegistrationField.salaryRange.name).location;
      case RegistrationStep.REGISTRATION_STEP_3_04:
        return RegistrationProfileFieldRouteData(field: RegistrationField.maritalHistory.name).location;
      case RegistrationStep.REGISTRATION_STEP_3_05:
        return RegistrationProfileFieldRouteData(field: RegistrationField.childSituation.name).location;
      case RegistrationStep.REGISTRATION_STEP_3_06:
        return RegistrationProfileFieldRouteData(field: RegistrationField.holidayType.name).location;
      case RegistrationStep.REGISTRATION_STEP_3_07:
        return RegistrationProfileFieldRouteData(field: RegistrationField.smoking.name).location;
      case RegistrationStep.REGISTRATION_STEP_3_08:
        return RegistrationProfileFieldRouteData(field: RegistrationField.marriageAspiration.name).location;
      case RegistrationStep.REGISTRATION_STEP_3_09:
        return RegistrationProfileFieldRouteData(field: RegistrationField.childDesire.name).location;
      case RegistrationStep.REGISTRATION_STEP_3_10:
        return EconaPath.tagOnboarding;
      case RegistrationStep.REGISTRATION_STEP_4_01:
      // return EconaPath.counselingOnboarding;
        return EconaPath.registrationFinish;
      case RegistrationStep.REGISTRATION_STEP_5_01:
        return EconaPath.registrationFinish;
      case RegistrationStep.REGISTRATION_STEP_5_02:
        return EconaPath.home;
    }

    return EconaPath.userAgreement;
  }

  /// サインイン後のユーザー遷移先を決定
  Future<String> determineUserRouteAfterSignIn() async {
    try {
      final response = await ref.read(userRepositoryProvider)
          .getUserStatus(GetUserStatusRequest());

      final accountStatus = response.userStatus.accountStatusCode;

      // アカウントステータスで遷移先を判定
      switch (accountStatus) {
        case AccountStatusCode.ACCOUNT_STATUS_CODE_REGISTERING:
        case AccountStatusCode.ACCOUNT_STATUS_CODE_LIMITED:
        // 登録中の場合、登録ステップに応じて遷移
          final registrationStep = await getLatestRegistrationStep();
          return await getNextRegistrationStepPathAsync(registrationStep);

      // 登録済みユーザーの場合、ホーム画面へ
        case AccountStatusCode.ACCOUNT_STATUS_CODE_ACTIVE:
          return EconaPath.home;

        case AccountStatusCode.ACCOUNT_STATUS_CODE_BANNED:
        case AccountStatusCode.ACCOUNT_STATUS_CODE_REMOVED:
        case AccountStatusCode.ACCOUNT_STATUS_CODE_UNSPECIFIED:
        // BAN・削除されたユーザーはログイン画面へ
          return EconaPath.login;
      }
      return EconaPath.login;
    } on Exception catch (e) {
      return EconaPath.login;
    }
  }

  /// 性別を設定
  void setGender(int genderIndex) {
    state = state.copyWith(
      required: state.required.copyWith(genderIndex: genderIndex),
    );
  }

  /// 生年月日を設定
  void setBirthday(int year, int month, int day) {
    state = state.copyWith(
      required: state.required.copyWith(
        birthYear: year,
        birthMonth: month,
        birthDay: day,
      ),
    );
  }

  /// ニックネームを設定
  void setNickname(String nickname) {
    state = state.copyWith(
      required: state.required.copyWith(nickname: nickname),
    );
  }

  /// 居住地を設定
  void setResidenceRegion(Region residenceRegion) {
    state = state.copyWith(
      residenceRegion: residenceRegion,
      required: state.required.copyWith(residenceRegion: residenceRegion),
    );
  }

  /// 身長を設定
  void setHeight(int? height) {
    state = state.copyWith(
      optional: state.optional.copyWith(height: height),
    );
  }

  /// 体型を設定
  void setBodyType(int bodyTypeIndex) {
    state = state.copyWith(
      optional: state.optional.copyWith(
        bodyTypeCode: BodyTypeCode.values.elementAtOrNull(bodyTypeIndex),
      ),
    );
  }

  /// 職業を設定
  void setOccupation(int occupationIndex) {
    state = state.copyWith(
      optional: state.optional.copyWith(
        occupationCode: OccupationCode.values.elementAtOrNull(occupationIndex),
      ),
    );
  }

  /// 年収を設定
  void setSalaryRange(int salaryRangeIndex) {
    state = state.copyWith(
      optional: state.optional.copyWith(
        salaryRangeCode: SalaryRangeCode.values.elementAtOrNull(salaryRangeIndex),
      ),
    );
  }

  /// 結婚歴を設定
  void setMaritalHistory(int maritalHistoryIndex) {
    state = state.copyWith(
      optional: state.optional.copyWith(
        maritalHistoryCode: MaritalHistoryCode.values.elementAtOrNull(maritalHistoryIndex),
      ),
    );
  }

  /// 結婚願望を設定
  void setMarriageAspiration(int marriageAspirationIndex) {
    state = state.copyWith(
      optional: state.optional.copyWith(
        marriageAspirationCode: MarriageAspirationCode.values.elementAtOrNull(marriageAspirationIndex),
      ),
    );
  }

  /// 子供の希望を設定
  void setChildDesire(int childDesireIndex) {
    state = state.copyWith(
      optional: state.optional.copyWith(
        childDesireCode: ChildDesireCode.values.elementAtOrNull(childDesireIndex),
      ),
    );
  }

  /// 子供の状況を設定
  void setChildSituation(int childSituationIndex) {
    state = state.copyWith(
      optional: state.optional.copyWith(
        childSituationCode: ChildSituationCode.values.elementAtOrNull(childSituationIndex),
      ),
    );
  }

  /// 休日を設定
  void setHolidayType(int holidayIndex) {
    state = state.copyWith(
      optional: state.optional.copyWith(
        holidayTypeCode: HolidayTypeCode.values.elementAtOrNull(holidayIndex),
      ),
    );
  }

  /// 喫煙を設定
  void setSmoking(int smokingIndex) {
    state = state.copyWith(
      optional: state.optional.copyWith(
        smokingCode: SmokingCode.values.elementAtOrNull(smokingIndex),
      ),
    );
  }

  /// 自己紹介を設定
  void setIntroductory(String? introductory) {
    state = state.copyWith(introductory: introductory);
  }

  /// 選択されたタグカテゴリを設定
  void setSelectedTagCategories(Set<int>? selectedTagCategories) {
    state = state.copyWith(tagCategories: selectedTagCategories);
  }

  /// 選択されたタグを設定
  void setSelectedTags(Set<String>? selectedTags) {
    state = state.copyWith(tags: selectedTags);
  }

  /// フォームデータをクリア
  void clearForm() {
    state = const RegistrationPageState();
  }

  /// エラーをクリア
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// プロフィールを作成
  Future<void> createProfile() async {
    try {
      final genderCode = state.genderCodeAsEnum;
      final nickname = state.required.nickname;
      final birthdayTimestamp = state.birthdayTimestamp;
      final residenceRegion = state.residenceRegion;

      if (genderCode == null || genderCode == GenderCode.GENDER_CODE_UNSPECIFIED || nickname == null || nickname.trim().isEmpty || birthdayTimestamp == null || residenceRegion == null) {
        throw Exception('必要な情報が不足しています');
      }

      final updatableProfile = UpdatableProfile(
        requiringReviewNickname: RequiringReviewNickname(pendingNickname: nickname),
        birthday: birthdayTimestamp,
        residenceRegion: residenceRegion,
      );

      final request = CreateProfileRequest(
        genderCode: genderCode,
        updatableProfile: updatableProfile,
      );

      await ref.read(profileRepositoryProvider).createProfile(request);

    } catch (e) {
      state = state.copyWith(
        error: 'プロフィールの作成に失敗しました: ${e.toString()}',
      );
      rethrow;
    }
  }

  Future<void> uploadPhotoAndSaveCaption(File imageFile, String caption, PhotoCropSettings? cropSettings) async {
    try {
      final uploadService = ref.read(mediaUploadServiceProvider);

      final stream = uploadService.buildStreamFromFile(
        filePath: imageFile.path,
        fileName: imageFile.uri.pathSegments.isNotEmpty ? imageFile.uri.pathSegments.last : 'photo.jpg',
        category: MediaCategory.MEDIA_CATEGORY_PROFILE_PHOTO,
        profilePhotoPriority: 1,
        photoCropSettings: cropSettings,
      );

      await ref.read(mediaRepositoryProvider).chunkedMediaUpload(stream);

    } catch (e) {
      state = state.copyWith(
        error: '写真のアップロードに失敗しました: ${e.toString()}',
      );
      rethrow;
    }
  }
} 