import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/body_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/certificate_level_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/salary_range_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/blood_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/holiday_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/marital_history_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_situation_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/drinking_alcohol_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/smoking_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/marriage_aspiration_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_desire_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/first_date_cost_preference_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/first_date_location_preference_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/occupation_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/educational_background_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/sibling_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/roommate_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/sixteen_personality_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/house_work_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/dating_preference_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/personality_trait_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/sociability_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/subscription_tier.pb.dart';

class LabelKey {
  const LabelKey(this.value);
  final String value;
}

extension BodyTypeCodeLabelKey on BodyTypeCode {
  LabelKey get labelKey {
    switch (this) {
      case BodyTypeCode.BODY_TYPE_CODE_SLIM:
        return const LabelKey('profile.bodyType.slim');
      case BodyTypeCode.BODY_TYPE_CODE_SLIGHTLY_SLIM:
        return const LabelKey('profile.bodyType.slightlySlim');
      case BodyTypeCode.BODY_TYPE_CODE_AVERAGE:
        return const LabelKey('profile.bodyType.average');
      case BodyTypeCode.BODY_TYPE_CODE_GLAMOROUS:
        return const LabelKey('profile.bodyType.glamorous');
      case BodyTypeCode.BODY_TYPE_CODE_MUSCULAR:
        return const LabelKey('profile.bodyType.muscular');
      case BodyTypeCode.BODY_TYPE_CODE_SLIGHTLY_CHUBBY:
        return const LabelKey('profile.bodyType.slightlyChubby');
      case BodyTypeCode.BODY_TYPE_CODE_CHUBBY:
        return const LabelKey('profile.bodyType.chubby');
      case BodyTypeCode.BODY_TYPE_CODE_UNSPECIFIED:
        return const LabelKey('profile.bodyType.unspecified');
    }
    return const LabelKey('common.hyphen');
  }
}

extension SalaryRangeCodeLabelKey on SalaryRangeCode {
  LabelKey get labelKey {
    switch (this) {
      case SalaryRangeCode.SALARY_RANGE_CODE_UNDER_2M:
        return const LabelKey('profile.salaryRange.under2m');
      case SalaryRangeCode.SALARY_RANGE_CODE_2M_TO_4M:
        return const LabelKey('profile.salaryRange.twoTo4m');
      case SalaryRangeCode.SALARY_RANGE_CODE_4M_TO_6M:
        return const LabelKey('profile.salaryRange.fourTo6m');
      case SalaryRangeCode.SALARY_RANGE_CODE_6M_TO_8M:
        return const LabelKey('profile.salaryRange.sixTo8m');
      case SalaryRangeCode.SALARY_RANGE_CODE_8M_TO_10M:
        return const LabelKey('profile.salaryRange.eightTo10m');
      case SalaryRangeCode.SALARY_RANGE_CODE_10M_TO_15M:
        return const LabelKey('profile.salaryRange.tenTo15m');
      case SalaryRangeCode.SALARY_RANGE_CODE_15M_TO_20M:
        return const LabelKey('profile.salaryRange.fifteenTo20m');
      case SalaryRangeCode.SALARY_RANGE_CODE_20M_TO_30M:
        return const LabelKey('profile.salaryRange.twentyTo30m');
      case SalaryRangeCode.SALARY_RANGE_CODE_OVER_30M:
        return const LabelKey('profile.salaryRange.over30m');
      case SalaryRangeCode.SALARY_RANGE_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension BloodTypeCodeLabelKey on BloodTypeCode {
  LabelKey get labelKey {
    switch (this) {
      case BloodTypeCode.BLOOD_TYPE_CODE_A:
        return const LabelKey('profile.bloodType.a');
      case BloodTypeCode.BLOOD_TYPE_CODE_B:
        return const LabelKey('profile.bloodType.b');
      case BloodTypeCode.BLOOD_TYPE_CODE_AB:
        return const LabelKey('profile.bloodType.ab');
      case BloodTypeCode.BLOOD_TYPE_CODE_O:
        return const LabelKey('profile.bloodType.o');
      case BloodTypeCode.BLOOD_TYPE_CODE_UNKNOWN:
        return const LabelKey('profile.bloodType.unknown');
      case BloodTypeCode.BLOOD_TYPE_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension HolidayTypeCodeLabelKey on HolidayTypeCode {
  LabelKey get labelKey {
    switch (this) {
      case HolidayTypeCode.HOLIDAY_TYPE_CODE_WEEKEND:
        return const LabelKey('profile.holiday.weekend');
      case HolidayTypeCode.HOLIDAY_TYPE_CODE_WEEKDAY:
        return const LabelKey('profile.holiday.weekday');
      case HolidayTypeCode.HOLIDAY_TYPE_CODE_IRREGULAR:
        return const LabelKey('profile.holiday.irregular');
      case HolidayTypeCode.HOLIDAY_TYPE_CODE_OTHER:
        return const LabelKey('profile.holiday.other');
      case HolidayTypeCode.HOLIDAY_TYPE_CODE_UNSPECIFIED:
        return const LabelKey('profile.holiday.unspecified');
    }
    return const LabelKey('common.hyphen');
  }
}

extension MaritalHistoryCodeLabelKey on MaritalHistoryCode {
  LabelKey get labelKey {
    switch (this) {
      case MaritalHistoryCode.MARITAL_HISTORY_CODE_NEVER_MARRIED:
        return const LabelKey('profile.maritalHistory.neverMarried');
      case MaritalHistoryCode.MARITAL_HISTORY_CODE_DIVORCED:
        return const LabelKey('profile.maritalHistory.divorced');
      case MaritalHistoryCode.MARITAL_HISTORY_CODE_WIDOWED:
        return const LabelKey('profile.maritalHistory.widowed');
      case MaritalHistoryCode.MARITAL_HISTORY_CODE_OTHER:
        return const LabelKey('profile.maritalHistory.other');
      case MaritalHistoryCode.MARITAL_HISTORY_CODE_UNSPECIFIED:
        return const LabelKey('profile.maritalHistory.unspecified');
    }
    return const LabelKey('common.hyphen');
  }
}

extension ChildSituationCodeLabelKey on ChildSituationCode {
  LabelKey get labelKey {
    switch (this) {
      case ChildSituationCode.CHILD_SITUATION_CODE_NO_CHILDREN:
        return const LabelKey('profile.childSituation.none');
      case ChildSituationCode.CHILD_SITUATION_CODE_LIVING_TOGETHER:
        return const LabelKey('profile.childSituation.livingTogether');
      case ChildSituationCode.CHILD_SITUATION_CODE_LIVING_APART:
        return const LabelKey('profile.childSituation.livingApart');
      case ChildSituationCode.CHILD_SITUATION_CODE_UNSPECIFIED:
        return const LabelKey('profile.childSituation.unspecified');
    }
    return const LabelKey('common.hyphen');
  }
}

extension DrinkingAlcoholCodeLabelKey on DrinkingAlcoholCode {
  LabelKey get labelKey {
    switch (this) {
      case DrinkingAlcoholCode.DRINKING_ALCOHOL_CODE_NON_DRINKER:
        return const LabelKey('profile.drinkingAlcohol.nonDrinker');
      case DrinkingAlcoholCode.DRINKING_ALCOHOL_CODE_REGULAR_DRINKER:
        return const LabelKey('profile.drinkingAlcohol.regularDrinker');
      case DrinkingAlcoholCode.DRINKING_ALCOHOL_CODE_OCCASIONAL_DRINKER:
        return const LabelKey('profile.drinkingAlcohol.occasionalDrinker');
      case DrinkingAlcoholCode.DRINKING_ALCOHOL_CODE_SOCIAL_DRINKER:
        return const LabelKey('profile.drinkingAlcohol.socialDrinker');
      case DrinkingAlcoholCode.DRINKING_ALCOHOL_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension SmokingCodeLabelKey on SmokingCode {
  LabelKey get labelKey {
    switch (this) {
      case SmokingCode.SMOKING_CODE_NON_SMOKER:
        return const LabelKey('profile.smoking.nonSmoker');
      case SmokingCode.SMOKING_CODE_SMOKER:
        return const LabelKey('profile.smoking.smoker');
      case SmokingCode.SMOKING_CODE_E_CIGARETTE_SMOKER:
        return const LabelKey('profile.smoking.eCigaretteSmoker');
      case SmokingCode.SMOKING_CODE_CONSIDERATE_SMOKER:
        return const LabelKey('profile.smoking.considerateSmoker');
      case SmokingCode.SMOKING_CODE_FLEXIBLE_SMOKER:
        return const LabelKey('profile.smoking.flexibleSmoker');
      case SmokingCode.SMOKING_CODE_OCCASIONAL_SMOKER:
        return const LabelKey('profile.smoking.occasionalSmoker');
      case SmokingCode.SMOKING_CODE_UNSPECIFIED:
        return const LabelKey('profile.smoking.unspecified');
    }
    return const LabelKey('common.hyphen');
  }
}

extension MarriageAspirationCodeLabelKey on MarriageAspirationCode {
  LabelKey get labelKey {
    switch (this) {
      case MarriageAspirationCode.MARRIAGE_ASPIRATION_CODE_ASAP:
        return const LabelKey('profile.marriageAspiration.asap');
      case MarriageAspirationCode.MARRIAGE_ASPIRATION_CODE_WITHIN_2_3_YEARS:
        return const LabelKey('profile.marriageAspiration.twoToThreeYears');
      case MarriageAspirationCode.MARRIAGE_ASPIRATION_CODE_IF_RIGHT_PERSON:
        return const LabelKey('profile.marriageAspiration.ifRightPerson');
      case MarriageAspirationCode.MARRIAGE_ASPIRATION_CODE_DISCUSS_WITH_PARTNER:
        return const LabelKey('profile.marriageAspiration.discussWithPartner');
      case MarriageAspirationCode.MARRIAGE_ASPIRATION_CODE_UNSURE:
        return const LabelKey('profile.marriageAspiration.unsure');
      case MarriageAspirationCode.MARRIAGE_ASPIRATION_CODE_UNSPECIFIED:
        return const LabelKey('profile.marriageAspiration.unspecified');
    }
    return const LabelKey('common.hyphen');
  }
}

extension ChildDesireCodeLabelKey on ChildDesireCode {
  LabelKey get labelKey {
    switch (this) {
      case ChildDesireCode.CHILD_DESIRE_CODE_WANT_CHILDREN:
        return const LabelKey('profile.childDesire.wantChildren');
      case ChildDesireCode.CHILD_DESIRE_CODE_NO_CHILDREN:
        return const LabelKey('profile.childDesire.noChildren');
      case ChildDesireCode.CHILD_DESIRE_CODE_DISCUSS_WITH_PARTNER:
        return const LabelKey('profile.childDesire.discussWithPartner');
      case ChildDesireCode.CHILD_DESIRE_CODE_UNSURE:
        return const LabelKey('profile.childDesire.unsure');
      case ChildDesireCode.CHILD_DESIRE_CODE_UNSPECIFIED:
        return const LabelKey('profile.childDesire.unspecified');
    }
    return const LabelKey('common.hyphen');
  }
}

extension FirstDateCostPreferenceCodeLabelKey on FirstDateCostPreferenceCode {
  LabelKey get labelKey {
    switch (this) {
      case FirstDateCostPreferenceCode
            .FIRST_DATE_COST_PREFERENCE_CODE_DISCUSS_WITH_PARTNER:
        return const LabelKey(
            'profile.firstDatePreference.cost.discussWithPartner');
      case FirstDateCostPreferenceCode
            .FIRST_DATE_COST_PREFERENCE_CODE_I_PAY_ALL:
        return const LabelKey('profile.firstDatePreference.cost.iPayAll');
      case FirstDateCostPreferenceCode
            .FIRST_DATE_COST_PREFERENCE_CODE_I_PAY_MORE:
        return const LabelKey('profile.firstDatePreference.cost.iPayMore');
      case FirstDateCostPreferenceCode
            .FIRST_DATE_COST_PREFERENCE_CODE_SPLIT_EQUALLY:
        return const LabelKey('profile.firstDatePreference.cost.splitEqually');
      case FirstDateCostPreferenceCode
            .FIRST_DATE_COST_PREFERENCE_CODE_PARTNER_PAY_ALL:
        return const LabelKey('profile.firstDatePreference.cost.partnerPayAll');
      case FirstDateCostPreferenceCode
            .FIRST_DATE_COST_PREFERENCE_CODE_PARTNER_PAY_MORE:
        return const LabelKey(
            'profile.firstDatePreference.cost.partnerPayMore');
      case FirstDateCostPreferenceCode
            .FIRST_DATE_COST_PREFERENCE_CODE_WEALTHIER_PAYS:
        return const LabelKey('profile.firstDatePreference.cost.wealthierPays');
      case FirstDateCostPreferenceCode
            .FIRST_DATE_COST_PREFERENCE_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension FirstDateLocationPreferenceCodeLabelKey
    on FirstDateLocationPreferenceCode {
  LabelKey get labelKey {
    switch (this) {
      case FirstDateLocationPreferenceCode
            .FIRST_DATE_LOCATION_PREFERENCE_CODE_PARK:
        return const LabelKey('profile.firstDatePreference.place.park');
      case FirstDateLocationPreferenceCode
            .FIRST_DATE_LOCATION_PREFERENCE_CODE_CAFE:
        return const LabelKey('profile.firstDatePreference.place.cafe');
      case FirstDateLocationPreferenceCode
            .FIRST_DATE_LOCATION_PREFERENCE_CODE_RESTAURANT:
        return const LabelKey('profile.firstDatePreference.place.restaurant');
      case FirstDateLocationPreferenceCode
            .FIRST_DATE_LOCATION_PREFERENCE_CODE_MOVIE_THEATER:
        return const LabelKey('profile.firstDatePreference.place.movieTheater');
      case FirstDateLocationPreferenceCode
            .FIRST_DATE_LOCATION_PREFERENCE_CODE_AMUSEMENT_PARK:
        return const LabelKey(
            'profile.firstDatePreference.place.amusementPark');
      case FirstDateLocationPreferenceCode
            .FIRST_DATE_LOCATION_PREFERENCE_CODE_MUSEUM:
        return const LabelKey('profile.firstDatePreference.place.museum');
      case FirstDateLocationPreferenceCode
            .FIRST_DATE_LOCATION_PREFERENCE_CODE_PARTNERS_CHOICE:
        return const LabelKey(
            'profile.firstDatePreference.place.partnersChoice');
      case FirstDateLocationPreferenceCode
            .FIRST_DATE_LOCATION_PREFERENCE_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension OccupationCodeLabelKey on OccupationCode {
  LabelKey get labelKey {
    switch (this) {
      case OccupationCode.OCCUPATION_CODE_LISTED_COMPANY:
        return const LabelKey('profile.occupation.listedCompany');
      case OccupationCode.OCCUPATION_CODE_BUSINESS_OWNER:
        return const LabelKey('profile.occupation.businessOwner');
      case OccupationCode.OCCUPATION_CODE_PUBLIC_OFFICER:
        return const LabelKey('profile.occupation.publicOfficer');
      case OccupationCode.OCCUPATION_CODE_CLERK:
        return const LabelKey('profile.occupation.clerk');
      case OccupationCode.OCCUPATION_CODE_SECRETARY:
        return const LabelKey('profile.occupation.secretary');
      case OccupationCode.OCCUPATION_CODE_CONSULTANT:
        return const LabelKey('profile.occupation.consultant');
      case OccupationCode.OCCUPATION_CODE_FOREIGN_FINANCE:
        return const LabelKey('profile.occupation.foreignFinance');
      case OccupationCode.OCCUPATION_CODE_STUDENT:
        return const LabelKey('profile.occupation.student');
      case OccupationCode.OCCUPATION_CODE_APPAREL_SHOP:
        return const LabelKey('profile.occupation.apparelShop');
      case OccupationCode.OCCUPATION_CODE_SALES_PERSON:
        return const LabelKey('profile.occupation.salesPerson');
      case OccupationCode.OCCUPATION_CODE_FOOD_INDUSTRY:
        return const LabelKey('profile.occupation.foodIndustry');
      case OccupationCode.OCCUPATION_CODE_COOK_NUTRITIONIST:
        return const LabelKey('profile.occupation.cookNutritionist');
      case OccupationCode.OCCUPATION_CODE_NUTRITIONIST:
        return const LabelKey('profile.occupation.nutritionist');
      case OccupationCode.OCCUPATION_CODE_CUSTOMER_SERVICE:
        return const LabelKey('profile.occupation.customerService');
      case OccupationCode.OCCUPATION_CODE_BEAUTY_INDUSTRY:
        return const LabelKey('profile.occupation.beautyIndustry');
      case OccupationCode.OCCUPATION_CODE_BEAUTICIAN:
        return const LabelKey('profile.occupation.beautician');
      case OccupationCode.OCCUPATION_CODE_ESTHETICIAN:
        return const LabelKey('profile.occupation.esthetician');
      case OccupationCode.OCCUPATION_CODE_BEAUTY_STAFF:
        return const LabelKey('profile.occupation.beautyStaff');
      case OccupationCode.OCCUPATION_CODE_LAWYER:
        return const LabelKey('profile.occupation.lawyer');
      case OccupationCode.OCCUPATION_CODE_NOTARY:
        return const LabelKey('profile.occupation.notary');
      case OccupationCode.OCCUPATION_CODE_ADMINISTRATIVE_NOTARY:
        return const LabelKey('profile.occupation.administrativeNotary');
      case OccupationCode.OCCUPATION_CODE_TAX_ACCOUNTANT:
        return const LabelKey('profile.occupation.taxAccountant');
      case OccupationCode.OCCUPATION_CODE_SOCIAL_INSURANCE_LABOR_LAWYER:
        return const LabelKey('profile.occupation.socialInsuranceLaborLawyer');
      case OccupationCode.OCCUPATION_CODE_PUBLIC_ACCOUNTANT:
        return const LabelKey('profile.occupation.publicAccountant');
      case OccupationCode.OCCUPATION_CODE_MEDICAL_RELATED:
        return const LabelKey('profile.occupation.medicalRelated');
      case OccupationCode.OCCUPATION_CODE_NURSE:
        return const LabelKey('profile.occupation.nurse');
      case OccupationCode.OCCUPATION_CODE_DOCTOR:
        return const LabelKey('profile.occupation.doctor');
      case OccupationCode.OCCUPATION_CODE_DENTIST:
        return const LabelKey('profile.occupation.dentist');
      case OccupationCode.OCCUPATION_CODE_PHARMACIST:
        return const LabelKey('profile.occupation.pharmacist');
      case OccupationCode.OCCUPATION_CODE_DENTAL_HYGIENIST:
        return const LabelKey('profile.occupation.dentalHygienist');
      case OccupationCode.OCCUPATION_CODE_PHARMACEUTICAL_RELATED:
        return const LabelKey('profile.occupation.pharmaceuticalRelated');
      case OccupationCode.OCCUPATION_CODE_ARCHITECTURAL_RELATED:
        return const LabelKey('profile.occupation.architecturalRelated');
      case OccupationCode.OCCUPATION_CODE_ARCHITECT:
        return const LabelKey('profile.occupation.architect');
      case OccupationCode.OCCUPATION_CODE_INTERIOR_DESIGNER:
        return const LabelKey('profile.occupation.interiorDesigner');
      case OccupationCode.OCCUPATION_CODE_INTERIOR_COORDINATOR:
        return const LabelKey('profile.occupation.interiorCoordinator');
      case OccupationCode.OCCUPATION_CODE_REAL_ESTATE_RELATED:
        return const LabelKey('profile.occupation.realEstateRelated');
      case OccupationCode.OCCUPATION_CODE_ENTERTAINMENT_RELATED:
        return const LabelKey('profile.occupation.entertainmentRelated');
      case OccupationCode.OCCUPATION_CODE_CELEBRITY_MODEL:
        return const LabelKey('profile.occupation.celebrityModel');
      case OccupationCode.OCCUPATION_CODE_ARTIST:
        return const LabelKey('profile.occupation.artist');
      case OccupationCode.OCCUPATION_CODE_EVENT_COMPANION:
        return const LabelKey('profile.occupation.eventCompanion');
      case OccupationCode.OCCUPATION_CODE_SPORTS_PLAYER:
        return const LabelKey('profile.occupation.sportsPlayer');
      case OccupationCode.OCCUPATION_CODE_CHILDCARE:
        return const LabelKey('profile.occupation.childcare');
      case OccupationCode.OCCUPATION_CODE_TRANSPORTATION_RELATED:
        return const LabelKey('profile.occupation.transportationRelated');
      case OccupationCode.OCCUPATION_CODE_PILOT:
        return const LabelKey('profile.occupation.pilot');
      case OccupationCode.OCCUPATION_CODE_DRIVER:
        return const LabelKey('profile.occupation.driver');
      case OccupationCode.OCCUPATION_CODE_CABIN_ATTENDANT:
        return const LabelKey('profile.occupation.cabinAttendant');
      case OccupationCode.OCCUPATION_CODE_MECHANIC:
        return const LabelKey('profile.occupation.mechanic');
      case OccupationCode.OCCUPATION_CODE_ADVERTISING_RELATED:
        return const LabelKey('profile.occupation.advertisingRelated');
      case OccupationCode.OCCUPATION_CODE_DESIGNER:
        return const LabelKey('profile.occupation.designer');
      case OccupationCode.OCCUPATION_CODE_CREATOR:
        return const LabelKey('profile.occupation.creator');
      case OccupationCode.OCCUPATION_CODE_TRADING_COMPANY:
        return const LabelKey('profile.occupation.tradingCompany');
      case OccupationCode.OCCUPATION_CODE_INSURANCE:
        return const LabelKey('profile.occupation.insurance');
      case OccupationCode.OCCUPATION_CODE_REAL_ESTATE:
        return const LabelKey('profile.occupation.realEstate');
      case OccupationCode.OCCUPATION_CODE_TELECOMMUNICATION:
        return const LabelKey('profile.occupation.telecommunication');
      case OccupationCode.OCCUPATION_CODE_ENGINEER:
        return const LabelKey('profile.occupation.engineer');
      case OccupationCode.OCCUPATION_CODE_FINANCE:
        return const LabelKey('profile.occupation.finance');
      case OccupationCode.OCCUPATION_CODE_DISTRIBUTION:
        return const LabelKey('profile.occupation.distribution');
      case OccupationCode.OCCUPATION_CODE_TRAVEL_RELATED:
        return const LabelKey('profile.occupation.travelRelated');
      case OccupationCode.OCCUPATION_CODE_MASS_MEDIA:
        return const LabelKey('profile.occupation.massMedia');
      case OccupationCode.OCCUPATION_CODE_WELFARE_CARE:
        return const LabelKey('profile.occupation.welfareCare');
      case OccupationCode.OCCUPATION_CODE_BRIDAL:
        return const LabelKey('profile.occupation.bridal');
      case OccupationCode.OCCUPATION_CODE_EDUCATION:
        return const LabelKey('profile.occupation.education');
      case OccupationCode.OCCUPATION_CODE_FACTORY_ENGINEER:
        return const LabelKey('profile.occupation.factoryEngineer');
      case OccupationCode.OCCUPATION_CODE_ILLUSTRATOR:
        return const LabelKey('profile.occupation.illustrator');
      case OccupationCode.OCCUPATION_CODE_INFLUENCER:
        return const LabelKey('profile.occupation.influencer');
      case OccupationCode.OCCUPATION_CODE_AGRICULTURE:
        return const LabelKey('profile.occupation.agriculture');
      case OccupationCode.OCCUPATION_CODE_FISHERY:
        return const LabelKey('profile.occupation.fishery');
      case OccupationCode.OCCUPATION_CODE_OTHER:
        return const LabelKey('profile.occupation.other');
      case OccupationCode.OCCUPATION_CODE_UNSPECIFIED:
        return const LabelKey('profile.occupation.unspecified');
    }
    return const LabelKey('common.hyphen');
  }
}

extension EducationalBackgroundCodeLabelKey on EducationalBackgroundCode {
  LabelKey get labelKey {
    switch (this) {
      case EducationalBackgroundCode.EDUCATIONAL_BACKGROUND_CODE_HIGH_SCHOOL:
        return const LabelKey('profile.educationalBackground.highSchool');
      case EducationalBackgroundCode.EDUCATIONAL_BACKGROUND_CODE_JUNIOR_COLLEGE:
        return const LabelKey('profile.educationalBackground.juniorCollege');
      case EducationalBackgroundCode
            .EDUCATIONAL_BACKGROUND_CODE_VOCATIONAL_SCHOOL:
        return const LabelKey('profile.educationalBackground.vocationalSchool');
      case EducationalBackgroundCode
            .EDUCATIONAL_BACKGROUND_CODE_TECHNICAL_COLLEGE:
        return const LabelKey('profile.educationalBackground.technicalCollege');
      case EducationalBackgroundCode.EDUCATIONAL_BACKGROUND_CODE_UNIVERSITY:
        return const LabelKey('profile.educationalBackground.university');
      case EducationalBackgroundCode
            .EDUCATIONAL_BACKGROUND_CODE_GRADUATE_SCHOOL:
        return const LabelKey('profile.educationalBackground.graduateSchool');
      case EducationalBackgroundCode.EDUCATIONAL_BACKGROUND_CODE_OTHER:
        return const LabelKey('profile.educationalBackground.other');
      case EducationalBackgroundCode.EDUCATIONAL_BACKGROUND_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension SiblingCodeLabelKey on SiblingCode {
  LabelKey get labelKey {
    switch (this) {
      case SiblingCode.SIBLING_CODE_ELDEST_SON:
        return const LabelKey('profile.sibling.eldestSon');
      case SiblingCode.SIBLING_CODE_ELDEST_DAUGHTER:
        return const LabelKey('profile.sibling.eldestDaughter');
      case SiblingCode.SIBLING_CODE_SECOND_SON:
        return const LabelKey('profile.sibling.secondSon');
      case SiblingCode.SIBLING_CODE_SECOND_DAUGHTER:
        return const LabelKey('profile.sibling.secondDaughter');
      case SiblingCode.SIBLING_CODE_THIRD_SON:
        return const LabelKey('profile.sibling.thirdSon');
      case SiblingCode.SIBLING_CODE_THIRD_DAUGHTER:
        return const LabelKey('profile.sibling.thirdDaughter');
      case SiblingCode.SIBLING_CODE_ONLY_CHILD_MALE:
      case SiblingCode.SIBLING_CODE_ONLY_CHILD_FEMALE:
        return const LabelKey('profile.sibling.onlyChild');
      case SiblingCode.SIBLING_CODE_OTHER_MALE:
      case SiblingCode.SIBLING_CODE_OTHER_FEMALE:
        return const LabelKey('profile.sibling.other');
      case SiblingCode.SIBLING_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension RoommateCodeLabelKey on RoommateCode {
  LabelKey get labelKey {
    switch (this) {
      case RoommateCode.ROOMMATE_CODE_LIVING_ALONE:
        return const LabelKey('profile.roommate.livingAlone');
      case RoommateCode.ROOMMATE_CODE_LIVING_WITH_PARENTS_AND_BROTHERS:
        return const LabelKey('profile.roommate.livingWithParentsAndBrothers');
      case RoommateCode.ROOMMATE_CODE_LIVING_WITH_FRIENDS:
        return const LabelKey('profile.roommate.livingWithFriends');
      case RoommateCode.ROOMMATE_CODE_LIVING_WITH_PETS_DOG:
        return const LabelKey('profile.roommate.livingWithPetsDog');
      case RoommateCode.ROOMMATE_CODE_LIVING_WITH_PETS_CAT:
        return const LabelKey('profile.roommate.livingWithPetsCat');
      case RoommateCode.ROOMMATE_CODE_LIVING_WITH_PETS_OTHER:
        return const LabelKey('profile.roommate.livingWithPetsOther');
      case RoommateCode.ROOMMATE_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension SixteenPersonalityCodeLabelKey on SixteenPersonalityCode {
  LabelKey get labelKey {
    switch (this) {
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_ISTJ:
        return const LabelKey('profile.sixteen.istj');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_ISFJ:
        return const LabelKey('profile.sixteen.isfj');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_INFJ:
        return const LabelKey('profile.sixteen.infj');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_INTJ:
        return const LabelKey('profile.sixteen.intj');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_ISTP:
        return const LabelKey('profile.sixteen.istp');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_ISFP:
        return const LabelKey('profile.sixteen.isfp');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_INFP:
        return const LabelKey('profile.sixteen.infp');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_INTP:
        return const LabelKey('profile.sixteen.intp');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_ESTP:
        return const LabelKey('profile.sixteen.estp');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_ESFP:
        return const LabelKey('profile.sixteen.esfp');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_ENFP:
        return const LabelKey('profile.sixteen.enfp');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_ENTP:
        return const LabelKey('profile.sixteen.entp');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_ESTJ:
        return const LabelKey('profile.sixteen.estj');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_ESFJ:
        return const LabelKey('profile.sixteen.esfj');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_ENFJ:
        return const LabelKey('profile.sixteen.enfj');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_ENTJ:
        return const LabelKey('profile.sixteen.entj');
      case SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension HouseWorkCodeLabelKey on HouseWorkCode {
  LabelKey get labelKey {
    switch (this) {
      case HouseWorkCode.HOUSE_WORK_CODE_ACTIVELY_PARTICIPATE:
        return const LabelKey('profile.houseWork.activelyParticipate');
      case HouseWorkCode.HOUSE_WORK_CODE_WILLING_TO_PARTICIPATE:
        return const LabelKey('profile.houseWork.willingToParticipate');
      case HouseWorkCode.HOUSE_WORK_CODE_SHARE_EQUALLY:
        return const LabelKey('profile.houseWork.shareEqually');
      case HouseWorkCode.HOUSE_WORK_CODE_PREFER_PARTNER_HANDLE:
        return const LabelKey('profile.houseWork.preferPartnerHandle');
      case HouseWorkCode.HOUSE_WORK_CODE_PARTNER_HANDLE:
        return const LabelKey('profile.houseWork.partnerHandle');
      case HouseWorkCode.HOUSE_WORK_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension DatingPreferenceCodeLabelKey on DatingPreferenceCode {
  LabelKey get labelKey {
    switch (this) {
      case DatingPreferenceCode.DATING_PREFERENCE_CODE_DATE_SOON:
        return const LabelKey('profile.datingPreference.dateSoon');
      case DatingPreferenceCode.DATING_PREFERENCE_CODE_DATE_IF_COMPATIBLE:
        return const LabelKey('profile.datingPreference.dateIfCompatible');
      case DatingPreferenceCode.DATING_PREFERENCE_CODE_MESSAGE_BEFORE_DATE:
        return const LabelKey('profile.datingPreference.messageBeforeDate');
      case DatingPreferenceCode.DATING_PREFERENCE_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension CertificateLevelCodeLabelKey on CertificateLevelCode {
  LabelKey get labelKey {
    switch (this) {
      case CertificateLevelCode.CERTIFICATE_LEVEL_CODE_UNVERIFIED:
        return const LabelKey('certificateLevel.unverified');
      case CertificateLevelCode.CERTIFICATE_LEVEL_CODE_VERIFIED:
        return const LabelKey('certificateLevel.verified');
      case CertificateLevelCode.CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED:
        return const LabelKey('certificateLevel.singleCertified');
      case CertificateLevelCode.CERTIFICATE_LEVEL_CODE_UNSPECIFIED:
        return const LabelKey('common.hyphen');
    }
    return const LabelKey('common.hyphen');
  }
}

extension SociabilityCodeLabelKey on SociabilityCode {
  LabelKey get labelKey {
    switch (this) {
      case SociabilityCode.SOCIABILITY_CODE_QUICK_FRIENDSHIP:
        return const LabelKey('profile.sociability.quickFriendship');
      case SociabilityCode.SOCIABILITY_CODE_GRADUAL_FRIENDSHIP:
        return const LabelKey('profile.sociability.gradualFriendship');
      case SociabilityCode.SOCIABILITY_CODE_SLOW_FRIENDSHIP:
        return const LabelKey('profile.sociability.slowFriendship');
      case SociabilityCode.SOCIABILITY_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension PersonalityTraitCodeLabelKey on PersonalityTraitCode {
  LabelKey get labelKey {
    switch (this) {
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_KIND:
        return const LabelKey('profile.personalityTrait.kind');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_HONEST:
        return const LabelKey('profile.personalityTrait.honest');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_DECISIVE:
        return const LabelKey('profile.personalityTrait.decisive');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_CALM:
        return const LabelKey('profile.personalityTrait.calm');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_FRIENDLY:
        return const LabelKey('profile.personalityTrait.friendly');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_CHEERFUL:
        return const LabelKey('profile.personalityTrait.cheerful');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_INDOOR:
        return const LabelKey('profile.personalityTrait.indoor');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_OUTDOOR:
        return const LabelKey('profile.personalityTrait.outdoor');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_SERIOUS:
        return const LabelKey('profile.personalityTrait.serious');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_INTELLIGENT:
        return const LabelKey('profile.personalityTrait.intelligent');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_SINCERE:
        return const LabelKey('profile.personalityTrait.sincere');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_METICULOUS:
        return const LabelKey('profile.personalityTrait.meticulous');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_OPTIMISTIC:
        return const LabelKey('profile.personalityTrait.optimistic');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_SHY:
        return const LabelKey('profile.personalityTrait.shy');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_ALWAYS_SMILING:
        return const LabelKey('profile.personalityTrait.alwaysSmiling');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_ELEGANT:
        return const LabelKey('profile.personalityTrait.elegant');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_COMPOSED:
        return const LabelKey('profile.personalityTrait.composed');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_HUMBLE:
        return const LabelKey('profile.personalityTrait.humble');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_STRICT:
        return const LabelKey('profile.personalityTrait.strict');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_CARING:
        return const LabelKey('profile.personalityTrait.caring');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_LONESOME:
        return const LabelKey('profile.personalityTrait.lonesome');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_SOCIABLE:
        return const LabelKey('profile.personalityTrait.sociable');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_COOL_HEADED:
        return const LabelKey('profile.personalityTrait.coolHeaded');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_CURIOUS:
        return const LabelKey('profile.personalityTrait.curious');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_HOMELY:
        return const LabelKey('profile.personalityTrait.homely');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_WORKAHOLIC:
        return const LabelKey('profile.personalityTrait.workaholic');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_RESPONSIBLE:
        return const LabelKey('profile.personalityTrait.responsible');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_CARING_FOR_OTHERS:
        return const LabelKey('profile.personalityTrait.caringForOthers');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_GOOD_SPEAKER:
        return const LabelKey('profile.personalityTrait.goodSpeaker');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_GOOD_LISTENER:
        return const LabelKey('profile.personalityTrait.goodListener');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_REFRESHING:
        return const LabelKey('profile.personalityTrait.refreshing');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_ACTIVE:
        return const LabelKey('profile.personalityTrait.active');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_RATIONAL:
        return const LabelKey('profile.personalityTrait.rational');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_COMPETITIVE:
        return const LabelKey('profile.personalityTrait.competitive');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_FUNNY:
        return const LabelKey('profile.personalityTrait.funny');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_PASSIONATE:
        return const LabelKey('profile.personalityTrait.passionate');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_CONSIDERATE:
        return const LabelKey('profile.personalityTrait.considerate');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_DILIGENT:
        return const LabelKey('profile.personalityTrait.diligent');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_BOLD:
        return const LabelKey('profile.personalityTrait.bold');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_TOLERANT:
        return const LabelKey('profile.personalityTrait.tolerant');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_GENEROUS:
        return const LabelKey('profile.personalityTrait.generous');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_NATURAL:
        return const LabelKey('profile.personalityTrait.natural');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_GENUINE:
        return const LabelKey('profile.personalityTrait.genuine');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_OWN_PACE:
        return const LabelKey('profile.personalityTrait.ownPace');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_SHY_WITH_OPPOSITE_SEX:
        return const LabelKey('profile.personalityTrait.shyWithOppositeSex');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_MOODY:
        return const LabelKey('profile.personalityTrait.moody');
      case PersonalityTraitCode.PERSONALITY_TRAIT_CODE_UNSPECIFIED:
    }
    return const LabelKey('common.hyphen');
  }
}

extension SubscribtionTierLabelKey on SubscriptionTier {
  LabelKey get labelKey {
    switch (this) {
      case SubscriptionTier.SUBSCRIPTION_TIER_FREE:
        return const LabelKey('subscription.free');
      case SubscriptionTier.SUBSCRIPTION_TIER_BASIC:
        return const LabelKey('subscription.basic');
      case SubscriptionTier.SUBSCRIPTION_TIER_PREMIUM:
        return const LabelKey('subscription.premium');
      case SubscriptionTier.SUBSCRIPTION_TIER_UNSPECIFIED:
        return const LabelKey('common.hyphen');
    }
    return const LabelKey('common.hyphen');
  }
}
