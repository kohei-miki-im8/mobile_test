import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/edit_profile_field.dart';
import 'package:econa_mobile_app/domains/entities/profile_label_keys.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/blood_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/body_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_desire_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_situation_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/dating_preference_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/drinking_alcohol_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/educational_background_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/first_date_cost_preference_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/first_date_location_preference_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
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
import 'package:econa_mobile_app/domains/repositories/gen/econa/master/regions.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/profile_base_picker.dart';
import 'package:econa_mobile_app/presentations/components/profile_base_selector.dart';
import 'package:econa_mobile_app/presentations/components/profile_base_tag.dart';
import 'package:econa_mobile_app/presentations/components/profile_base_tag_category.dart';
import 'package:econa_mobile_app/presentations/components/profile_base_text_input.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/helpers/label_localizer.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/shared/languages/languages.dart';
import 'package:econa_mobile_app/presentations/shared/regions/regions.dart';
import 'package:econa_mobile_app/presentations/shared/tags/view_models/tag_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef Label = String;

class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({
    required this.field,
    super.key,
  });

  final EditProfileField field;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profilePageViewModelProvider);

    if(state.isLoading) {
      return const EconaLoadingIndicator();
    }

    ref.listen(
      profilePageViewModelProvider,
      (oldState, newState) async {
        final error = newState.error;
        if (error == null) return;

        final handled = await handleEconaError(context, error);
        if (!handled) {
          // 更新系はここでは通知せずfetch系のみ通知する
          final operation = error.operation;
          const fetchOperation = {
            EconaErrorOperation.profileFetch,
          };
          if (fetchOperation.contains(operation)) {
            await EconaNotification.showTopToast(
              context,
              message: error.operationMessage,
              duration: const Duration(seconds: 2),
            );
          }
        }

        // どちらの場合も処理後はクリア
        ref.read(profilePageViewModelProvider.notifier).clearError();
      },
    );

    return _BuildBody(field: field);
  }
}

class _BuildBody extends HookConsumerWidget {
  const _BuildBody({
    required this.field,
  });

  final EditProfileField field;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profilePageViewModelProvider);
    final notifier = ref.read(profilePageViewModelProvider.notifier);

    late String title;
    late List<dynamic> item;
    late String Function(dynamic) itemBuilder;
    int? Function()? getInitialValue;
    late Future<void> Function(dynamic) onSave;
    dynamic Function(int)? valueConverter;
    late String successMessage;

    switch (field) {
      ///　自己紹介文
      case EditProfileField.introductory:
        //#region 自己紹介文
        return ProfileBaseTextInput(
          title: '自己紹介文',
          hintText: '趣味、休日の過ごし方、仕事内容などを   記載してあなたのことを伝えてみましょう',
          isMultiLine: true,
          height: 190,
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          getInitialValue: () {
            final introductory = state.profile?.optionalProfile.requiringReviewIntroductory;
            if (introductory == null) return '';
            // pending があれば pending を優先表示
            if (introductory.hasPendingIntroductory()
                && introductory.pendingIntroductory.trim().isNotEmpty) {
              return introductory.pendingIntroductory;
            }
            return introductory.currentIntroductory;
          },
          onSave: (introductory) async {
            await notifier.updateIntroductory(introductory);
            if(ref.read(profilePageViewModelProvider).error != null) {
              throw Exception(state.error);
            }
          },
          successMessage: '自己紹介文を保存しました',
          maxLength: 1000,
          keyboardType: TextInputType.multiline,
        );
        //#endregion
      /// 基本情報
      case EditProfileField.nickname:
        //#region ニックネーム
        return ProfileBaseTextInput(
          title: 'ニックネーム',
          hintText: 'ニックネーム',
          isMultiLine: false,
          getInitialValue: () => state.profile?.updatableProfile.requiringReviewNickname.currentNickname ?? '',
          validator: (text) => text.trim().isNotEmpty,
          onSave: (nickname) async {
            await notifier.updateNickname(nickname);
            if(ref.read(profilePageViewModelProvider).error != null) {
              throw Exception(state.error);
            }
          },
          successMessage: 'ニックネームを保存しました',
        );
        //#endregion
      case EditProfileField.residenceRegion:
        //#region 居住地
        return ProfileBaseSelector(
          title: '居住地',
          items: prefectureRegions,
          itemBuilder: (item) => (item as Region).name.toString(),
          getInitialValue: () {
            final region = state.profile?.updatableProfile.residenceRegion;
            if (region == null) return null;
            return indexOfRegionById(prefectureRegions, region.id);
          },
          valueConverter: (i) => prefectureRegions[i],
          onSave: (value) async {
            await notifier.updateResidenceRegion(value as Region);
            if(ref.read(profilePageViewModelProvider).error != null) {
              throw Exception(state.error);
            }
          },
          successMessage: '居住地を保存しました',
        );
        //#endregion
      case EditProfileField.bloodType:
        //#region 血液型
        title = '血液型';
        item = BloodTypeCode.values
            .where((e) => e != BloodTypeCode.BLOOD_TYPE_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as BloodTypeCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.bloodTypeCode;
          if (code == null) return null;
          return (item as List<BloodTypeCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<BloodTypeCode>)[i];
        onSave = (value) async {
          await notifier.updateBloodType(value as BloodTypeCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '血液型を保存しました';
        //#endregion
      case EditProfileField.birthplaceRegion:
        //#region 出身地
        return ProfileBaseSelector(
          title: '出身地',
          items: prefectureRegions,
          itemBuilder: (item) => (item as Region).name.toString(),
          getInitialValue: () {
            final region = state.profile?.optionalProfile.birthplaceRegion;
            if (region == null) return null;
            return indexOfRegionById(prefectureRegions, region.id);
          },
          valueConverter: (i) => prefectureRegions[i],
          onSave: (value) async {
            await notifier.updateBirthplaceRegion(value as Region);
            if(ref.read(profilePageViewModelProvider).error != null) {
              throw Exception(state.error);
            }
          },
          successMessage: '出身地を保存しました',
        );
        //#endregion
      /// 容姿
      case EditProfileField.height:
        //#region 身長
        return ProfileBasePicker<int?>(
          title: '身長',
          min: 130,
          max: 200,
          includeUnset: true,
          onSave: (int? value) async {
            // 未設定(null)の場合は0で更新
            await notifier.updateHeight(value ?? 0);
            if(ref.read(profilePageViewModelProvider).error != null) {
              throw Exception(state.error);
            }
          },
          successMessage: '身長を保存しました',
          getInitialValue: () => state.profile?.optionalProfile.height,
          displayFormatter: (int? v) => v == null ? '' : v.toString(),
          suffix: 'cm',
        );
        //#endregion
      case EditProfileField.bodyType:
        //#region 体型
        title = '体型';
        item = BodyTypeCode.values
            .where((e) => e != BodyTypeCode.BODY_TYPE_CODE_UNSPECIFIED)
            .toList();
        // 性別に応じて表示する項目を出し分け
        final gender = state.profile?.genderCode;
        if (gender == GenderCode.GENDER_CODE_MALE) {
          // 男性: 「グラマー」は非表示
          item = (item as List<BodyTypeCode>)
              .where((e) => e != BodyTypeCode.BODY_TYPE_CODE_GLAMOROUS)
              .toList();
        } else if (gender == GenderCode.GENDER_CODE_FEMALE) {
          // 女性: 「筋肉質」は非表示
          item = (item as List<BodyTypeCode>)
              .where((e) => e != BodyTypeCode.BODY_TYPE_CODE_MUSCULAR)
              .toList();
        }
        itemBuilder = (item) => localizeLabel((item as BodyTypeCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.bodyTypeCode;
          if (code == null) return null;
          final index = (item as List<BodyTypeCode>).indexOf(code);
          return index >= 0 ? index : null;
        };
        valueConverter = (i) => (item as List<BodyTypeCode>)[i];
        onSave = (value) async {
          await notifier.updateBodyType(value as BodyTypeCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '体型を保存しました';
        //#endregion
      /// 仕事・学歴
      case EditProfileField.occupation:
        //#region 職種
        title = '職種';
        item = OccupationCode.values
            .where((e) => e != OccupationCode.OCCUPATION_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as OccupationCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.occupationCode;
          if (code == null) return null;
          return (item as List<OccupationCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<OccupationCode>)[i];
        onSave = (value) async {
          await notifier.updateOccupation(value as OccupationCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '職種を保存しました';
        //#endregion
      case EditProfileField.workplaceRegion:
        //#region 勤務地
        return ProfileBaseSelector(
          title: '勤務地',
          items: prefectureRegions,
          itemBuilder: (item) => (item as Region).name.toString(),
          getInitialValue: () {
            final region = state.profile?.optionalProfile.workplaceRegion;
            if (region == null) return null;
            return indexOfRegionById(prefectureRegions, region.id);
          },
          valueConverter: (i) => prefectureRegions[i],
          onSave: (value) async {
            await notifier.updateWorkplaceRegion(value as Region);
            if(ref.read(profilePageViewModelProvider).error != null) {
              throw Exception(state.error);
            }
          },
          successMessage: '勤務地を保存しました',
        );
        //#endregion
      case EditProfileField.salaryRange:
        //#region 年収
        title = '年収';
        item = SalaryRangeCode.values
            .where((e) => e != SalaryRangeCode.SALARY_RANGE_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as SalaryRangeCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.salaryRangeCode;
          if (code == null) return null;
          return (item as List<SalaryRangeCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<SalaryRangeCode>)[i];
        onSave = (value) async {
          await notifier.updateSalaryRange(value as SalaryRangeCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '年収を保存しました';
       //#endregion
      case EditProfileField.educationalBackground:
        //#region 学歴
        title = '学歴';
        item = EducationalBackgroundCode.values
            .where((e) => e != EducationalBackgroundCode.EDUCATIONAL_BACKGROUND_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as EducationalBackgroundCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.educationalBackgroundCode;
          if (code == null) return null;
          return (item as List<EducationalBackgroundCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<EducationalBackgroundCode>)[i];
        onSave = (value) async {
          await notifier.updateEducationalBackground(value as EducationalBackgroundCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '学歴を保存しました';
      //#endregion
      /// 生活・その他
      case EditProfileField.sibling:
        //#region 兄弟姉妹
        title = '兄弟姉妹';
        item = SiblingCode.values
            .where((e) => e != SiblingCode.SIBLING_CODE_UNSPECIFIED)
            .toList();
        // 性別に応じて表示項目を出し分け
        final gender = state.profile?.genderCode;
        if (gender == GenderCode.GENDER_CODE_MALE) {
          item = <SiblingCode>[
            SiblingCode.SIBLING_CODE_ELDEST_SON,
            SiblingCode.SIBLING_CODE_SECOND_SON,
            SiblingCode.SIBLING_CODE_THIRD_SON,
            SiblingCode.SIBLING_CODE_ONLY_CHILD_MALE,
            SiblingCode.SIBLING_CODE_OTHER_MALE,
          ];
        } else if (gender == GenderCode.GENDER_CODE_FEMALE) {
          item = <SiblingCode>[
            SiblingCode.SIBLING_CODE_ELDEST_DAUGHTER,
            SiblingCode.SIBLING_CODE_SECOND_DAUGHTER,
            SiblingCode.SIBLING_CODE_THIRD_DAUGHTER,
            SiblingCode.SIBLING_CODE_ONLY_CHILD_FEMALE,
            SiblingCode.SIBLING_CODE_OTHER_FEMALE,
          ];
        }
        itemBuilder = (item) => localizeLabel((item as SiblingCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.siblingCode;
          if (code == null) return null;
          final index = (item as List<SiblingCode>).indexOf(code);
          return index >= 0 ? index : null;
        };
        valueConverter = (i) => (item as List<SiblingCode>)[i];
        onSave = (value) async {
          await notifier.updateSibling(value as SiblingCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '兄弟姉妹を保存しました';
        //#endregion
      case EditProfileField.roommate:
        //#region 同居人
        title = '同居人';
        item = RoommateCode.values
            .where((e) => e != RoommateCode.ROOMMATE_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as RoommateCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.roommateCode;
          if (code == null) return null;
          return (item as List<RoommateCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<RoommateCode>)[i];
        onSave = (value) async {
          await notifier.updateRoommate(value as RoommateCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '同居人を保存しました';
        //#endregion
      case EditProfileField.maritalHistory:
        //#region 結婚歴
        title = '結婚歴';
        item = MaritalHistoryCode.values
            .where((e) => e != MaritalHistoryCode.MARITAL_HISTORY_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as MaritalHistoryCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.maritalHistoryCode;
          if (code == null) return null;
          return (item as List<MaritalHistoryCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<MaritalHistoryCode>)[i];
        onSave = (value) async {
          await notifier.updateMaritalHistory(value as MaritalHistoryCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '結婚歴を保存しました';
        //#endregion
      case EditProfileField.childSituation:
        //#region 子供の有無
        title = '子供の有無';
        item = ChildSituationCode.values
            .where((e) => e != ChildSituationCode.CHILD_SITUATION_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as ChildSituationCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.childSituationCode;
          if (code == null) return null;
          return (item as List<ChildSituationCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<ChildSituationCode>)[i];
        onSave = (value) async {
          await notifier.updateChildSituation(value as ChildSituationCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '子供の有無を保存しました';
        //#endregion
      case EditProfileField.holidayType:
        //#region 休日
        title = '休日';
        item = HolidayTypeCode.values
            .where((e) => e != HolidayTypeCode.HOLIDAY_TYPE_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as HolidayTypeCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.holidayTypeCode;
          if (code == null) return null;
          return (item as List<HolidayTypeCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<HolidayTypeCode>)[i];
        onSave = (value) async {
          await notifier.updateHolidayType(value as HolidayTypeCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '休日を保存しました';
        //#endregion
      case EditProfileField.userLanguages:
        //#region 話せる言語
        return _UserLanguagesMultiSelect(
          initialCodes: state.profile?.optionalProfile.userLanguageCodes ?? const [],
          onSave: (codes) async {
            await notifier.updateUserLanguages(codes);
            if(ref.read(profilePageViewModelProvider).error != null) {
              throw Exception(state.error);
            }
          },
        );
        //#endregion
      case EditProfileField.drinkingAlcohol:
        //#region お酒
        title = 'お酒';
        item = DrinkingAlcoholCode.values
            .where((e) => e != DrinkingAlcoholCode.DRINKING_ALCOHOL_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as DrinkingAlcoholCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.drinkingAlcoholCode;
          if (code == null) return null;
          return (item as List<DrinkingAlcoholCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<DrinkingAlcoholCode>)[i];
        onSave = (value) async {
          await notifier.updateDrinkingAlcohol(value as DrinkingAlcoholCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = 'お酒を保存しました';
        //#endregion
      case EditProfileField.smoking:
        //#region タバコ
        title = 'タバコ';
        item = SmokingCode.values
            .where((e) => e != SmokingCode.SMOKING_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as SmokingCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.smokingCode;
          if (code == null) return null;
          return (item as List<SmokingCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<SmokingCode>)[i];
        onSave = (value) async {
          await notifier.updateSmoking(value as SmokingCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = 'タバコを保存しました';
        //#endregion
      case EditProfileField.sixteenPersonality:
        //#region 16タイプ診断
        title = '16タイプ診断';
        item = SixteenPersonalityCode.values
            .where((e) => e != SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as SixteenPersonalityCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.sixteenPersonalityCode;
          if (code == null) return null;
          return (item as List<SixteenPersonalityCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<SixteenPersonalityCode>)[i];
        onSave = (value) async {
          await notifier.updateSixteenPersonality(value as SixteenPersonalityCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '16タイプ診断を保存しました';
        //#endregion
      /// 将来
      case EditProfileField.marriageAspiration:
        //#region 結婚への意思
        title = '結婚への意思';
        item = MarriageAspirationCode.values
            .where((e) => e != MarriageAspirationCode.MARRIAGE_ASPIRATION_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as MarriageAspirationCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.marriageAspirationCode;
          if (code == null) return null;
          return (item as List<MarriageAspirationCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<MarriageAspirationCode>)[i];
        onSave = (value) async {
          await notifier.updateMarriageAspiration(value as MarriageAspirationCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '結婚への意思を保存しました';
        //#endregion
      case EditProfileField.childDesire:
        //#region 子どもがほしいか
        title = '子どもがほしいか';
        item = ChildDesireCode.values
            .where((e) => e != ChildDesireCode.CHILD_DESIRE_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as ChildDesireCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.childDesireCode;
          if (code == null) return null;
          return (item as List<ChildDesireCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<ChildDesireCode>)[i];
        onSave = (value) async {
          await notifier.updateChildDesire(value as ChildDesireCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '子どもがほしいかを保存しました';
        //#endregion
      case EditProfileField.houseWork:
        //#region 家事育児
        title = '家事育児';
        item = HouseWorkCode.values
            .where((e) => e != HouseWorkCode.HOUSE_WORK_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as HouseWorkCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.houseWorkCode;
          if (code == null) return null;
          return (item as List<HouseWorkCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<HouseWorkCode>)[i];
        onSave = (value) async {
          await notifier.updateHouseWork(value as HouseWorkCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '家事育児を保存しました';
        //#endregion
      /// 初回デート
      case EditProfileField.datingPreference:
        //#region 出会うまでの希望
        title = '出会うまでの希望';
        item = DatingPreferenceCode.values
            .where((e) => e != DatingPreferenceCode.DATING_PREFERENCE_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as DatingPreferenceCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.datingPreferenceCode;
          if (code == null) return null;
          return (item as List<DatingPreferenceCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<DatingPreferenceCode>)[i];
        onSave = (value) async {
          await notifier.updateDatingPreference(value as DatingPreferenceCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '出会うまでの希望を保存しました';
        //#endregion
      case EditProfileField.firstDateCostPreference:
        //#region 初回のデート費用
        title = '初回のデート費用';
        item = FirstDateCostPreferenceCode.values
            .where((e) => e != FirstDateCostPreferenceCode.FIRST_DATE_COST_PREFERENCE_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as FirstDateCostPreferenceCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.firstDateCostPreferenceCode;
          if (code == null) return null;
          return (item as List<FirstDateCostPreferenceCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<FirstDateCostPreferenceCode>)[i];
        onSave = (value) async {
          await notifier.updateFirstDateCostPreference(value as FirstDateCostPreferenceCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '初回のデート費用を保存しました';
        //#endregion
      case EditProfileField.firstDateLocationPreference:
        //#region 初回デートするなら
        title = '初回デートするなら';
        item = FirstDateLocationPreferenceCode.values
            .where((e) => e != FirstDateLocationPreferenceCode.FIRST_DATE_LOCATION_PREFERENCE_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => localizeLabel((item as FirstDateLocationPreferenceCode).labelKey);
        getInitialValue = () {
          final code = state.profile?.optionalProfile.firstDateLocationPreferenceCode;
          if (code == null) return null;
          return (item as List<FirstDateLocationPreferenceCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<FirstDateLocationPreferenceCode>)[i];
        onSave = (value) async {
          await notifier.updateFirstDateLocationPreference(value as FirstDateLocationPreferenceCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '初回デート場所を保存しました';
        //#endregion
      /// Likeタグ
      case EditProfileField.tagCategory:
        //#region タグ
        return ProfileBaseTagCategory(
          title: 'タグカテゴリー選択',
          description: '好きなもの、興味のあるものを1つ以上選んでください',
          buttonText: '1つ以上選んでください',
          buttonTextWithCount: '次へ',
          onNext: () async {
            await EditProfileRouteData(
              fieldName: EditProfileField.tags.name,
            ).push<void>(context);
          },
        );
        //#endregion
      case EditProfileField.tags:
        //#region タグ選択
        return ProfileBaseTag(
          title: 'タグ選択',
          description: 'プロフィールに記載するあなたの興味や好きなものを選びましょう。1つ以上選んでください。',
          buttonText: '1つ以上選んでください',
          buttonTextWithCount: '保存',
          noSelectionText: 'まずタグカテゴリを選択してください',
          onSave: () async {
            await ref.read(tagViewModelProvider.notifier).updateSelectedTags();
            if(ref.read(profilePageViewModelProvider).error != null) {
              throw Exception(state.error);
            }
          },
        );
        //#endregion
      /// 未使用（codeはあるので念のため）
      case EditProfileField.sociability:
        //#region 社交性
        title = '社交性';
        item = SociabilityCode.values
            .where((e) => e != SociabilityCode.SOCIABILITY_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => (item as SociabilityCode).name.toString();
        getInitialValue = () {
          final code = state.profile?.optionalProfile.sociabilityCode;
          if (code == null) return null;
          return (item as List<SociabilityCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<SociabilityCode>)[i];
        onSave = (value) async {
          await notifier.updateSociability(value as SociabilityCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = '社交性を保存しました';
        //#endregion
      case EditProfileField.personalityTrait:
        //#region よく言われる性格タイプ
        title = 'よく言われる性格タイプ';
        item = PersonalityTraitCode.values
            .where((e) => e != PersonalityTraitCode.PERSONALITY_TRAIT_CODE_UNSPECIFIED)
            .toList();
        itemBuilder = (item) => (item as PersonalityTraitCode).name.toString();
        getInitialValue = () {
          final code = state.profile?.optionalProfile.personalityTraitCode;
          if (code == null) return null;
          return (item as List<PersonalityTraitCode>).indexOf(code);
        };
        valueConverter = (i) => (item as List<PersonalityTraitCode>)[i];
        onSave = (value) async {
          await notifier.updatePersonalityTrait(value as PersonalityTraitCode);
          if(ref.read(profilePageViewModelProvider).error != null) {
            throw Exception(state.error);
          }
        };
        successMessage = 'よく言われる性格タイプを保存しました';
        //#endregion
      case EditProfileField.birthday:
      case EditProfileField.photo:
      case EditProfileField.photoPreview:
      case EditProfileField.photoUpload:
        // 入口が無いため入って来ることはないが、caseを網羅するため記載
        return const SizedBox.shrink();
    }

    // ProfileBaseSelectorを使うケース
    return ProfileBaseSelector(
      title: title,
      items: item,
      itemBuilder: itemBuilder,
      getInitialValue: getInitialValue,
      onSave: onSave,
      valueConverter: valueConverter,
      successMessage: successMessage,
    );
  }
}

class _UserLanguagesMultiSelect extends HookConsumerWidget {
  const _UserLanguagesMultiSelect({
    required this.initialCodes,
    required this.onSave,
  });

  final List<LanguageCode> initialCodes;
  final Future<void> Function(List<LanguageCode> codes) onSave;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState<Set<LanguageCode>>(initialCodes.toSet());

    Future<void> handleSave() async {
      try {
        await onSave(selected.value.toList());
        if (context.mounted) {
          await EconaNotification.showTopToast(
            context,
            message: '話せる言語を保存しました',
            duration: const Duration(seconds: 2),
          );
          context.pop();
        }
      } on Exception {
        if (context.mounted) {
          await EconaNotification.showTopToast(
            context,
            message: '保存に失敗しました',
            duration: const Duration(seconds: 2),
          );
        }
      }
    }

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '話せる言語',
        backgroundColor: EconaColor.background,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: EconaColor.background,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final code = languages[index];
                    final isSelected = selected.value.contains(code);
                    return ListTile(
                      title: Text(
                        languageName(code),
                        style: EconaTextStyle.regularMedium1160(
                          color: EconaColor.grayNormal,
                        ),
                      ),
                      selected: isSelected,
                      selectedTileColor: const Color(0x309090C0).withValues(alpha: 0.2),
                      onTap: () {
                        final next = Set<LanguageCode>.from(selected.value);
                        if (isSelected) {
                          next.remove(code);
                        } else {
                          next.add(code);
                        }
                        selected.value = next;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 120),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(40),
              child: EconaGradientButton(
                text: '保存する',
                onPressed: handleSave,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


