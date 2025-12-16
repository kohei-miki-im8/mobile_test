import 'package:econa_mobile_app/domains/entities/profile_label_keys.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart'
    as pb;
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user_tag.pb.dart';
import 'package:econa_mobile_app/presentations/shared/languages/languages.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_detail.freezed.dart';

@freezed
abstract class ProfileDetail with _$ProfileDetail {
  const factory ProfileDetail({
    // 自己紹介
    required String introductory,

    // 基本情報
    required String nickname,
    required String ageText,
    required String residence,
    required LabelKey bloodType,
    required String birthplace,

    // 容姿
    required String heightText,
    required LabelKey bodyType,

    // 性格
    required LabelKey sociability,
    required LabelKey commonlySaidPersonality,
    required LabelKey sixteenPersonality,

    // 仕事・学歴
    required LabelKey occupation,
    required String workplace,
    required LabelKey salaryRange,
    required LabelKey educationalBackground,

    // 生活・その他
    required LabelKey sibling,
    required LabelKey roommate,
    required LabelKey maritalHistory,
    required LabelKey childSituation,
    required LabelKey holidayType,
    required String languages,
    required LabelKey drinkingAlcohol,
    required LabelKey smoking,

    // 将来
    required LabelKey marriageAspiration,
    required LabelKey childDesire,
    required LabelKey houseWork,

    // 初回デート
    required LabelKey datingPreference,
    required LabelKey firstDateCostPreference,
    required LabelKey firstDateLocationPreference,

    // タグ
    required List<UserTag>? tags,
  }) = _ProfileDetail;

  const ProfileDetail._();

  factory ProfileDetail.fromProfileResponse(
    GetProfileResponse response, {
    List<UserTag>? tags,
  }) {
    final profile = response.profile;

    // Updatable
    final nickname = _getNickname(profile);
    final ageText = _getAgeText(profile);
    final residence = _getResidence(profile);

    // Optional
    final optional =
        profile.hasOptionalProfile() ? profile.optionalProfile : null;

    String labelOrUnset(String? v) => (v == null || v.isEmpty) ? '-' : v;

    const defaultLabelKey = LabelKey('common.hyphen');

    final introductory = _getIntroductory(profile);

    final bloodType = (optional?.hasBloodTypeCode() ?? false)
        ? optional!.bloodTypeCode.labelKey
        : defaultLabelKey;
    final birthplace = (optional?.hasBirthplaceRegion() ?? false)
        ? optional!.birthplaceRegion.name
        : '-';
    final heightText =
        (optional?.hasHeight() ?? false) ? '${optional!.height}cm' : '-';
    final bodyType = (optional?.hasBodyTypeCode() ?? false)
        ? optional!.bodyTypeCode.labelKey
        : defaultLabelKey;
    final sociability = (optional?.hasSociabilityCode() ?? false)
        ? optional!.sociabilityCode.labelKey
        : defaultLabelKey;
    final commonlySaidPersonality =
        (optional?.hasPersonalityTraitCode() ?? false)
            ? optional!.personalityTraitCode.labelKey
            : defaultLabelKey;
    final sixteenPersonality = (optional?.hasSixteenPersonalityCode() ?? false)
        ? optional!.sixteenPersonalityCode.labelKey
        : defaultLabelKey;
    final occupation = (optional?.hasOccupationCode() ?? false)
        ? optional!.occupationCode.labelKey
        : defaultLabelKey;
    final workplace = (optional?.hasWorkplaceRegion() ?? false)
        ? optional!.workplaceRegion.name
        : '-';
    final salaryRange = (optional?.hasSalaryRangeCode() ?? false)
        ? optional!.salaryRangeCode.labelKey
        : defaultLabelKey;
    final educationalBackground =
        (optional?.hasEducationalBackgroundCode() ?? false)
            ? optional!.educationalBackgroundCode.labelKey
            : defaultLabelKey;
    final sibling = (optional?.hasSiblingCode() ?? false)
        ? optional!.siblingCode.labelKey
        : defaultLabelKey;
    final roommate = (optional?.hasRoommateCode() ?? false)
        ? optional!.roommateCode.labelKey
        : defaultLabelKey;
    final maritalHistory = (optional?.hasMaritalHistoryCode() ?? false)
        ? optional!.maritalHistoryCode.labelKey
        : defaultLabelKey;
    final childSituation = (optional?.hasChildSituationCode() ?? false)
        ? optional!.childSituationCode.labelKey
        : defaultLabelKey;
    final holidayType = (optional?.hasHolidayTypeCode() ?? false)
        ? optional!.holidayTypeCode.labelKey
        : defaultLabelKey;
    final languages = _getLanguages(optional);
    final drinkingAlcohol = (optional?.hasDrinkingAlcoholCode() ?? false)
        ? optional!.drinkingAlcoholCode.labelKey
        : defaultLabelKey;
    final smoking = (optional?.hasSmokingCode() ?? false)
        ? optional!.smokingCode.labelKey
        : defaultLabelKey;
    final marriageAspiration = (optional?.hasMarriageAspirationCode() ?? false)
        ? optional!.marriageAspirationCode.labelKey
        : defaultLabelKey;
    final childDesire = (optional?.hasChildDesireCode() ?? false)
        ? optional!.childDesireCode.labelKey
        : defaultLabelKey;
    final houseWork = (optional?.hasHouseWorkCode() ?? false)
        ? optional!.houseWorkCode.labelKey
        : defaultLabelKey;
    final datingPreference = (optional?.hasDatingPreferenceCode() ?? false)
        ? optional!.datingPreferenceCode.labelKey
        : defaultLabelKey;
    final firstDateCostPreference =
        (optional?.hasFirstDateCostPreferenceCode() ?? false)
            ? optional!.firstDateCostPreferenceCode.labelKey
            : defaultLabelKey;
    final firstDateLocationPreference =
        (optional?.hasFirstDateLocationPreferenceCode() ?? false)
            ? optional!.firstDateLocationPreferenceCode.labelKey
            : defaultLabelKey;

    return ProfileDetail(
      nickname: labelOrUnset(nickname),
      ageText: labelOrUnset(ageText),
      residence: labelOrUnset(residence),
      introductory: labelOrUnset(introductory),
      bloodType: bloodType,
      birthplace: labelOrUnset(birthplace),
      heightText: labelOrUnset(heightText),
      bodyType: bodyType,
      sociability: sociability,
      commonlySaidPersonality: commonlySaidPersonality,
      sixteenPersonality: sixteenPersonality,
      occupation: occupation,
      workplace: labelOrUnset(workplace),
      salaryRange: salaryRange,
      educationalBackground: educationalBackground,
      sibling: sibling,
      roommate: roommate,
      maritalHistory: maritalHistory,
      childSituation: childSituation,
      holidayType: holidayType,
      languages: labelOrUnset(languages),
      drinkingAlcohol: drinkingAlcohol,
      smoking: smoking,
      marriageAspiration: marriageAspiration,
      childDesire: childDesire,
      houseWork: houseWork,
      datingPreference: datingPreference,
      firstDateCostPreference: firstDateCostPreference,
      firstDateLocationPreference: firstDateLocationPreference,
      tags: tags,
    );
  }

  static String _getNickname(pb.Profile profile) {
    if (!profile.hasUpdatableProfile()) return '-';
    final u = profile.updatableProfile;
    if (!u.hasRequiringReviewNickname()) return '-';
    if (!u.requiringReviewNickname.hasCurrentNickname()) return '-';
    return u.requiringReviewNickname.currentNickname;
  }

  static String _getIntroductory(pb.Profile profile) {
    if (!profile.hasOptionalProfile()) return '-';
    final op = profile.optionalProfile;
    if (!op.hasRequiringReviewIntroductory()) return '-';
    if (!op.requiringReviewIntroductory.hasCurrentIntroductory()) return '-';
    return op.requiringReviewIntroductory.currentIntroductory;
  }

  // TODO: Ageエンティティを作成して年齢取得ロジックを統一する
  static String _getAgeText(pb.Profile profile) {
    if (!profile.hasUpdatableProfile()) return '-';
    final u = profile.updatableProfile;
    if (!u.hasBirthday()) return '-';
    final birthday = u.birthday;
    final now = DateTime.now();
    final birthDate =
        DateTime.fromMillisecondsSinceEpoch(birthday.seconds.toInt() * 1000);
    var years = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      years -= 1;
    }
    if (years < 0 || years > 150) return '-';
    return '$years歳';
  }

  static String _getResidence(pb.Profile profile) {
    if (!profile.hasUpdatableProfile()) return '-';
    final u = profile.updatableProfile;
    if (!u.hasResidenceRegion()) return '-';
    return u.residenceRegion.name;
  }

  static String _getLanguages(pb.OptionalProfile? optional) {
    if (optional == null) return '-';
    if (optional.userLanguageCodes.isEmpty) return '-';
    return optional.userLanguageCodes.map(languageName).join(', ');
  }
}
