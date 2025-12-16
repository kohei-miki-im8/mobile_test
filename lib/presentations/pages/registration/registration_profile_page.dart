import 'package:econa_mobile_app/domains/entities/registration_field.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/body_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/occupation_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/salary_range_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/marital_history_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_situation_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/holiday_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/smoking_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/marriage_aspiration_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_desire_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/i18n/strings.g.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/profile_base_birthday_picker.dart';
import 'package:econa_mobile_app/presentations/components/profile_base_picker.dart';
import 'package:econa_mobile_app/presentations/components/profile_base_selector.dart';
import 'package:econa_mobile_app/presentations/components/profile_base_text_input.dart';
import 'package:econa_mobile_app/presentations/helpers/label_localizer.dart';
import 'package:econa_mobile_app/domains/entities/profile_label_keys.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_view_model.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/update_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_skip_modal.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/shared/regions/regions.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/master/regions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/create_registration_step_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/registration_step.pb.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegistrationProfilePage extends HookConsumerWidget {
  const RegistrationProfilePage({
    required this.field,
    super.key,
  });

  final RegistrationField field;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(registrationPageViewModelProvider);
    final notifier = ref.read(registrationPageViewModelProvider.notifier);

    late String selTitle;
    late List<Widget> actions;
    late List<dynamic> selItems;
    late String Function(dynamic) selItemBuilder;
    int? Function()? selGetInitialValue;
    late Future<void> Function(dynamic) selOnSave;
    late String selSuccessMessage;
    Future<void> Function()? selOnRegistrationSuccess;
    dynamic Function(int)? selValueConverter;

    switch (field) {
      case RegistrationField.gender:
        return ProfileBaseSelector(
          title: '性別',
          items: GenderCode.values
              .where((e) => e != GenderCode.GENDER_CODE_UNSPECIFIED)
              .toList(),
          itemBuilder: (item) {
            final code = item as GenderCode;
            switch (code) {
              case GenderCode.GENDER_CODE_MALE:
                return t.gender.male;
              case GenderCode.GENDER_CODE_FEMALE:
                return t.gender.female;
              case GenderCode.GENDER_CODE_UNSPECIFIED:
                return t.common.hyphen;
            }
            return t.common.hyphen;
          },
          valueConverter: (i) {
            final filtered = GenderCode.values
                .where((e) => e != GenderCode.GENDER_CODE_UNSPECIFIED)
                .toList();
            final code = filtered[i];
            return GenderCode.values.indexOf(code);
          },
          isRegistrationFlow: true,
          getInitialValue: () {
            final gi = vm.required.genderIndex;
            if (gi == null) return null;
            final code = GenderCode.values.elementAtOrNull(gi);
            if (code == null || code == GenderCode.GENDER_CODE_UNSPECIFIED) return null;
            final filtered = GenderCode.values
                .where((e) => e != GenderCode.GENDER_CODE_UNSPECIFIED)
                .toList();
            final idx = filtered.indexOf(code);
            return idx < 0 ? null : idx;
          },
          onSave: (index) async {
            notifier.setGender(index as int);
          },
          onRegistrationSuccess: () async {
            await RegistrationProfileFieldRouteData(field: RegistrationField.birthday.name).push<void>(context);
          },
          successMessage: '性別を保存しました',
          onBackPressed: () => context.pop(),
        );
      case RegistrationField.nickname:
        return ProfileBaseTextInput(
          title: 'ニックネーム',
          hintText: 'ニックネーム',
          isMultiLine: false,
          isRegistrationFlow: true,
          getInitialValue: () => vm.required.nickname ?? '',
          validator: (text) => text.trim().isNotEmpty,
          onTextChanged: (text, ref) => notifier.setNickname(text.trim()),
          onSave: (_) async {},
          onRegistrationSuccess: () async {
            await RegistrationProfileFieldRouteData(field: RegistrationField.residenceRegion.name).push<void>(context);
          },
          successMessage: 'ニックネームを保存しました',
          onBackPressed: () => context.pop(),
        );

      case RegistrationField.birthday:
        return ProfileBaseBirthdayPicker(
          title: '誕生日',
          successMessage: '誕生日を保存しました',
          isRegistrationFlow: true,
          getInitialValue: () => vm.birthdayDateTime,
          onSave: (y, m, d) async {
            notifier.setBirthday(y, m, d);
          },
          onRegistrationSuccess: () async {
            await RegistrationProfileFieldRouteData(field: RegistrationField.nickname.name).push<void>(context);
          },
        );

      case RegistrationField.height:
        return ProfileBasePicker<int?>(
          title: '身長',
          min: 130,
          max: 200,
          includeUnset: true,
          isRegistrationFlow: true,
          onSave: (value) async {
            notifier.setHeight(value);
            await ref.read(profileRepositoryProvider).updateProfile(
              UpdateProfileRequest(
                optionalProfile: OptionalProfile(height: value),
              ),
            );
          },
          successMessage: '身長を保存しました',
          getInitialValue: () => vm.optional.height,
          displayFormatter: (v) => v == null ? '' : v.toString(),
          suffix: 'cm',
          onRegistrationSuccess: () async {
            // ステップを体型のステップへ更新し、体型選択へ遷移
            await notifier.createRegistrationStepLog(
              CreateRegistrationStepLogRequest(
                registrationStep: RegistrationStep.REGISTRATION_STEP_3_01,
              ),
            );
            await RegistrationProfileFieldRouteData(field: RegistrationField.bodyType.name)
                .push<void>(context);
          },
        );

      case RegistrationField.bodyType:
      // プロフィールAPIから性別を取得
        final profileFuture = ref.read(profileRepositoryProvider).getProfile(
          GetProfileRequest(),
        );
        final profileSnapshot = useFuture(profileFuture);

        selTitle = '体型';
        selItems = BodyTypeCode.values
            .where((e) => e != BodyTypeCode.BODY_TYPE_CODE_UNSPECIFIED)
            .toList();
        // 性別に応じて表示する項目を出し分け
        if (profileSnapshot.hasData) {
          final gender = profileSnapshot.data!.profile.genderCode;
          if (gender == GenderCode.GENDER_CODE_MALE) {
            // 男性: 「グラマー」は非表示
            selItems = (selItems as List<BodyTypeCode>)
                .where((e) => e != BodyTypeCode.BODY_TYPE_CODE_GLAMOROUS)
                .toList();
          } else if (gender == GenderCode.GENDER_CODE_FEMALE) {
            // 女性: 「筋肉質」は非表示
            selItems = (selItems as List<BodyTypeCode>)
                .where((e) => e != BodyTypeCode.BODY_TYPE_CODE_MUSCULAR)
                .toList();
          }
        }

        selItemBuilder = (item) => localizeLabel((item as BodyTypeCode).labelKey);
        selGetInitialValue = () {
          final code = vm.optional.bodyTypeCode;
          if (code == null) return null;
          final idx = (selItems as List<BodyTypeCode>).indexOf(code);
          return idx < 0 ? null : idx;
        };
        selOnSave = (value) async {
          final index = value as int; // BodyTypeCode.values 上のインデックス
          notifier.setBodyType(index);
          await ref.read(profileRepositoryProvider).updateProfile(
            UpdateProfileRequest(
              optionalProfile: OptionalProfile(
                bodyTypeCode: BodyTypeCode.values.elementAtOrNull(index),
              ),
            ),
          );
        };
        selValueConverter = (i) {
          final code = (selItems as List<BodyTypeCode>)[i];
          return BodyTypeCode.values.indexOf(code);
        };
        selSuccessMessage = '体型を保存しました';
        selOnRegistrationSuccess = () async {
          await notifier.createRegistrationStepLog(
            CreateRegistrationStepLogRequest(
              registrationStep: RegistrationStep.REGISTRATION_STEP_3_02,
            ),
          );
          await RegistrationProfileFieldRouteData(field: RegistrationField.occupation.name).push<void>(context);
        };
        break;

      case RegistrationField.occupation:
        selTitle = '職種';
        selItems = OccupationCode.values
            .where((e) => e != OccupationCode.OCCUPATION_CODE_UNSPECIFIED)
            .toList();
        selItemBuilder = (item) => localizeLabel((item as OccupationCode).labelKey);
        selGetInitialValue = () {
          final code = vm.optional.occupationCode;
          if (code == null) return null;
          final idx = selItems.indexOf(code);
          return idx < 0 ? null : idx;
        };
        selOnSave = (value) async {
          notifier.setOccupation(value as int);
          await ref.read(profileRepositoryProvider).updateProfile(
            UpdateProfileRequest(
              optionalProfile: OptionalProfile(
                occupationCode: OccupationCode.values.elementAtOrNull(value as int),
              ),
            ),
          );
        };
        selValueConverter = (i) {
          final code = selItems[i] as OccupationCode;
          return OccupationCode.values.indexOf(code);
        };
        selSuccessMessage = '職種を保存しました';
        selOnRegistrationSuccess = () async {
          await notifier.createRegistrationStepLog(
            CreateRegistrationStepLogRequest(
              registrationStep: RegistrationStep.REGISTRATION_STEP_3_03,
            ),
          );
          await RegistrationProfileFieldRouteData(field: RegistrationField.salaryRange.name).push<void>(context);
        };
      case RegistrationField.salaryRange:
        selTitle = '年収';
        selItems = SalaryRangeCode.values
            .where((e) => e != SalaryRangeCode.SALARY_RANGE_CODE_UNSPECIFIED)
            .toList();
        selItemBuilder = (item) => localizeLabel((item as SalaryRangeCode).labelKey);
        selGetInitialValue = () {
          final code = vm.optional.salaryRangeCode;
          if (code == null) return null;
          final idx = selItems.indexOf(code);
          return idx < 0 ? null : idx;
        };
        selOnSave = (value) async {
          notifier.setSalaryRange(value as int);
          await ref.read(profileRepositoryProvider).updateProfile(
            UpdateProfileRequest(
              optionalProfile: OptionalProfile(
                salaryRangeCode: SalaryRangeCode.values.elementAtOrNull(value as int),
              ),
            ),
          );
        };
        selValueConverter = (i) {
          final code = selItems[i] as SalaryRangeCode;
          return SalaryRangeCode.values.indexOf(code);
        };
        selSuccessMessage = '年収を保存しました';
        selOnRegistrationSuccess = () async {
          await notifier.createRegistrationStepLog(
            CreateRegistrationStepLogRequest(
              registrationStep: RegistrationStep.REGISTRATION_STEP_3_04,
            ),
          );
          await RegistrationProfileFieldRouteData(field: RegistrationField.maritalHistory.name).push<void>(context);
        };
        break;

      case RegistrationField.maritalHistory:
        selTitle = '結婚歴';
        selItems = MaritalHistoryCode.values
            .where((e) => e != MaritalHistoryCode.MARITAL_HISTORY_CODE_UNSPECIFIED)
            .toList();
        selItemBuilder = (item) => localizeLabel((item as MaritalHistoryCode).labelKey);
        selGetInitialValue = () {
          final code = vm.optional.maritalHistoryCode;
          if (code == null) return null;
          final idx = selItems.indexOf(code);
          return idx < 0 ? null : idx;
        };
        selOnSave = (value) async {
          notifier.setMaritalHistory(value as int);
          await ref.read(profileRepositoryProvider).updateProfile(
            UpdateProfileRequest(
              optionalProfile: OptionalProfile(
                maritalHistoryCode: MaritalHistoryCode.values.elementAtOrNull(value as int),
              ),
            ),
          );
        };
        selValueConverter = (i) {
          final code = selItems[i] as MaritalHistoryCode;
          return MaritalHistoryCode.values.indexOf(code);
        };
        selSuccessMessage = '結婚歴を保存しました';
        selOnRegistrationSuccess = () async {
          await notifier.createRegistrationStepLog(
            CreateRegistrationStepLogRequest(
              registrationStep: RegistrationStep.REGISTRATION_STEP_3_05,
            ),
          );
          await RegistrationProfileFieldRouteData(field: RegistrationField.childSituation.name).push<void>(context);
        };
        break;

      case RegistrationField.childSituation:
        selTitle = '子供の有無';
        selItems = ChildSituationCode.values
            .where((e) => e != ChildSituationCode.CHILD_SITUATION_CODE_UNSPECIFIED)
            .toList();
        selItemBuilder = (item) => localizeLabel((item as ChildSituationCode).labelKey);
        selGetInitialValue = () {
          final code = vm.optional.childSituationCode;
          if (code == null) return null;
          final idx = selItems.indexOf(code);
          return idx < 0 ? null : idx;
        };
        selOnSave = (value) async {
          notifier.setChildSituation(value as int);
          await ref.read(profileRepositoryProvider).updateProfile(
            UpdateProfileRequest(
              optionalProfile: OptionalProfile(
                childSituationCode: ChildSituationCode.values.elementAtOrNull(value as int),
              ),
            ),
          );
        };
        selValueConverter = (i) {
          final code = selItems[i] as ChildSituationCode;
          return ChildSituationCode.values.indexOf(code);
        };
        selSuccessMessage = '子供の有無を保存しました';
        selOnRegistrationSuccess = () async {
          await notifier.createRegistrationStepLog(
            CreateRegistrationStepLogRequest(
              registrationStep: RegistrationStep.REGISTRATION_STEP_3_06,
            ),
          );
          await RegistrationProfileFieldRouteData(field: RegistrationField.holidayType.name).push<void>(context);
        };
        break;

      case RegistrationField.holidayType:
        selTitle = '休日';
        selItems = HolidayTypeCode.values
            .where((e) => e != HolidayTypeCode.HOLIDAY_TYPE_CODE_UNSPECIFIED)
            .toList();
        selItemBuilder = (item) => localizeLabel((item as HolidayTypeCode).labelKey);
        selGetInitialValue = () {
          final code = vm.optional.holidayTypeCode;
          if (code == null) return null;
          final idx = selItems.indexOf(code);
          return idx < 0 ? null : idx;
        };
        selOnSave = (value) async {
          notifier.setHolidayType(value as int);
          await ref.read(profileRepositoryProvider).updateProfile(
            UpdateProfileRequest(
              optionalProfile: OptionalProfile(
                holidayTypeCode: HolidayTypeCode.values.elementAtOrNull(value as int),
              ),
            ),
          );
        };
        selValueConverter = (i) {
          final code = selItems[i] as HolidayTypeCode;
          return HolidayTypeCode.values.indexOf(code);
        };
        selSuccessMessage = '休日を保存しました';
        selOnRegistrationSuccess = () async {
          await notifier.createRegistrationStepLog(
            CreateRegistrationStepLogRequest(
              registrationStep: RegistrationStep.REGISTRATION_STEP_3_07,
            ),
          );
          await RegistrationProfileFieldRouteData(field: RegistrationField.smoking.name).push<void>(context);
        };
        break;

      case RegistrationField.smoking:
        selTitle = 'タバコ';
        selItems = SmokingCode.values
            .where((e) => e != SmokingCode.SMOKING_CODE_UNSPECIFIED)
            .toList();
        selItemBuilder = (item) => localizeLabel((item as SmokingCode).labelKey);
        selGetInitialValue = () {
          final code = vm.optional.smokingCode;
          if (code == null) return null;
          final idx = selItems.indexOf(code);
          return idx < 0 ? null : idx;
        };
        selOnSave = (value) async {
          notifier.setSmoking(value as int);
          await ref.read(profileRepositoryProvider).updateProfile(
            UpdateProfileRequest(
              optionalProfile: OptionalProfile(
                smokingCode: SmokingCode.values.elementAtOrNull(value as int),
              ),
            ),
          );
        };
        selValueConverter = (i) {
          final code = selItems[i] as SmokingCode;
          return SmokingCode.values.indexOf(code);
        };
        selSuccessMessage = 'タバコを保存しました';
        selOnRegistrationSuccess = () async {
          await notifier.createRegistrationStepLog(
            CreateRegistrationStepLogRequest(
              registrationStep: RegistrationStep.REGISTRATION_STEP_3_08,
            ),
          );
          await RegistrationProfileFieldRouteData(field: RegistrationField.marriageAspiration.name).push<void>(context);
        };
        break;

      case RegistrationField.marriageAspiration:
        selTitle = '結婚への意思';
        selItems = MarriageAspirationCode.values
            .where((e) => e != MarriageAspirationCode.MARRIAGE_ASPIRATION_CODE_UNSPECIFIED)
            .toList();
        selItemBuilder = (item) => localizeLabel((item as MarriageAspirationCode).labelKey);
        selGetInitialValue = () {
          final code = vm.optional.marriageAspirationCode;
          if (code == null) return null;
          final idx = selItems.indexOf(code);
          return idx < 0 ? null : idx;
        };
        selOnSave = (value) async {
          notifier.setMarriageAspiration(value as int);
          await ref.read(profileRepositoryProvider).updateProfile(
            UpdateProfileRequest(
              optionalProfile: OptionalProfile(
                marriageAspirationCode: MarriageAspirationCode.values.elementAtOrNull(value as int),
              ),
            ),
          );
        };
        selValueConverter = (i) {
          final code = selItems[i] as MarriageAspirationCode;
          return MarriageAspirationCode.values.indexOf(code);
        };
        selSuccessMessage = '結婚への意思を保存しました';
        selOnRegistrationSuccess = () async {
          await notifier.createRegistrationStepLog(
            CreateRegistrationStepLogRequest(
              registrationStep: RegistrationStep.REGISTRATION_STEP_3_09,
            ),
          );
          await RegistrationProfileFieldRouteData(field: RegistrationField.childDesire.name).push<void>(context);
        };
        break;

      case RegistrationField.childDesire:
        selTitle = '子どもがほしいか';
        selItems = ChildDesireCode.values
            .where((e) => e != ChildDesireCode.CHILD_DESIRE_CODE_UNSPECIFIED)
            .toList();
        selItemBuilder = (item) => localizeLabel((item as ChildDesireCode).labelKey);
        selGetInitialValue = () {
          final code = vm.optional.childDesireCode;
          if (code == null) return null;
          final idx = selItems.indexOf(code);
          return idx < 0 ? null : idx;
        };
        selOnSave = (value) async {
          notifier.setChildDesire(value as int);
          await ref.read(profileRepositoryProvider).updateProfile(
            UpdateProfileRequest(
              optionalProfile: OptionalProfile(
                childDesireCode: ChildDesireCode.values.elementAtOrNull(value as int),
              ),
            ),
          );
        };
        selValueConverter = (i) {
          final code = selItems[i] as ChildDesireCode;
          return ChildDesireCode.values.indexOf(code);
        };
        selSuccessMessage = '子どもがほしいかを保存しました';
        selOnRegistrationSuccess = () async {
          await notifier.createRegistrationStepLog(
            CreateRegistrationStepLogRequest(
              registrationStep: RegistrationStep.REGISTRATION_STEP_3_10,
            ),
          );
          await const TagOnboardingRouteData().push<void>(context);
        };
        break;

      case RegistrationField.residenceRegion:
        return ProfileBaseSelector(
          title: '居住地',
          items: prefectureRegions,
          itemBuilder: (item) => (item as Region).name.toString(),
          isRegistrationFlow: true,
          getInitialValue: () {
            final region = vm.residenceRegion;
            if (region == null) return null;
            return indexOfRegionById(prefectureRegions, region.id);
          },
          valueConverter: (i) => prefectureRegions[i],
          onSave: (value) async {
            notifier.setResidenceRegion(value as Region);
          },
          onRegistrationSuccess: () async {
            // プロフィール作成とステップログ記録（旧ページと同等）
            await notifier.createProfile();
            await notifier.createRegistrationStepLog(
              CreateRegistrationStepLogRequest(
                registrationStep: RegistrationStep.REGISTRATION_STEP_1_01,
              ),
            );
            if (context.mounted) context.go(EconaPath.photoOnboarding);
          },
          successMessage: '居住地を保存しました',
        );

      case RegistrationField.introductory:
        return ProfileBaseTextInput(
          title: '自己紹介文',
          hintText: '自己紹介文を入力',
          isMultiLine: true,
          isRegistrationFlow: true,
          getInitialValue: () => vm.introductory ?? '',
          onTextChanged: (text, ref) => notifier.setIntroductory(text.trim()),
          onSave: (_) async {},
          successMessage: '自己紹介文を保存しました',
          onBackPressed: () => context.pop(),
        );
    }

    return ProfileBaseSelector(
      title: selTitle,
      actions: [
        TextButton(
          onPressed: () async {
            await SubProfileSkipModal.show(context);
          },
          child: InnerShadowText(
            text: 'スキップ',
            textStyle: EconaTextStyle.labelMedium1140(
              color: EconaColor.gray200,
              shadows: EconaShadow.headlineShadows,
            ),
            innerShadowTextStyles: [
              EconaTextStyle.labelMedium1140(
                foreground: EconaShadow().headlineInnerShadow,
              ),
            ],
          ),
        ),
      ],
      items: selItems,
      itemBuilder: selItemBuilder,
      getInitialValue: selGetInitialValue,
      onSave: selOnSave,
      successMessage: selSuccessMessage,
      isRegistrationFlow: true,
      onRegistrationSuccess: selOnRegistrationSuccess,
      valueConverter: selValueConverter,
    );
  }
}