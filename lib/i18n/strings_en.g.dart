///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsGenderEn gender = TranslationsGenderEn._(_root);
	late final TranslationsProfileEn profile = TranslationsProfileEn._(_root);
	late final TranslationsCertificateLevelEn certificateLevel = TranslationsCertificateLevelEn._(_root);
	late final TranslationsSubscriptionTierEn subscriptionTier = TranslationsSubscriptionTierEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '-'
	String get hyphen => '-';
}

// Path: gender
class TranslationsGenderEn {
	TranslationsGenderEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Male'
	String get male => 'Male';

	/// en: 'Female'
	String get female => 'Female';
}

// Path: profile
class TranslationsProfileEn {
	TranslationsProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsProfileBodyTypeEn bodyType = TranslationsProfileBodyTypeEn._(_root);
	late final TranslationsProfileSalaryRangeEn salaryRange = TranslationsProfileSalaryRangeEn._(_root);
	late final TranslationsProfileBloodTypeEn bloodType = TranslationsProfileBloodTypeEn._(_root);
	late final TranslationsProfileEducationalBackgroundEn educationalBackground = TranslationsProfileEducationalBackgroundEn._(_root);
	late final TranslationsProfileHolidayEn holiday = TranslationsProfileHolidayEn._(_root);
	late final TranslationsProfileMaritalHistoryEn maritalHistory = TranslationsProfileMaritalHistoryEn._(_root);
	late final TranslationsProfileChildSituationEn childSituation = TranslationsProfileChildSituationEn._(_root);
	late final TranslationsProfileSmokingEn smoking = TranslationsProfileSmokingEn._(_root);
	late final TranslationsProfileDrinkingAlcoholEn drinkingAlcohol = TranslationsProfileDrinkingAlcoholEn._(_root);
	late final TranslationsProfileMarriageAspirationEn marriageAspiration = TranslationsProfileMarriageAspirationEn._(_root);
	late final TranslationsProfileChildDesireEn childDesire = TranslationsProfileChildDesireEn._(_root);
	late final TranslationsProfileFirstDatePreferenceEn firstDatePreference = TranslationsProfileFirstDatePreferenceEn._(_root);
	late final TranslationsProfileSiblingEn sibling = TranslationsProfileSiblingEn._(_root);
	late final TranslationsProfileRoommateEn roommate = TranslationsProfileRoommateEn._(_root);
	late final TranslationsProfileSixteenEn sixteen = TranslationsProfileSixteenEn._(_root);
	late final TranslationsProfileHouseWorkEn houseWork = TranslationsProfileHouseWorkEn._(_root);
	late final TranslationsProfileDatingPreferenceEn datingPreference = TranslationsProfileDatingPreferenceEn._(_root);
	late final TranslationsProfileSociabilityEn sociability = TranslationsProfileSociabilityEn._(_root);
	late final TranslationsProfilePersonalityTraitEn personalityTrait = TranslationsProfilePersonalityTraitEn._(_root);
	late final TranslationsProfileOccupationEn occupation = TranslationsProfileOccupationEn._(_root);
}

// Path: certificateLevel
class TranslationsCertificateLevelEn {
	TranslationsCertificateLevelEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unverified'
	String get unverified => 'Unverified';

	/// en: 'Identity Verified'
	String get verified => 'Identity Verified';

	/// en: 'Single Certificated'
	String get singleCertified => 'Single Certificated';
}

// Path: subscriptionTier
class TranslationsSubscriptionTierEn {
	TranslationsSubscriptionTierEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'free'
	String get free => 'free';

	/// en: 'basic'
	String get basic => 'basic';

	/// en: 'premium'
	String get premium => 'premium';
}

// Path: profile.bodyType
class TranslationsProfileBodyTypeEn {
	TranslationsProfileBodyTypeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Slim'
	String get slim => 'Slim';

	/// en: 'Slightly slim'
	String get slightlySlim => 'Slightly slim';

	/// en: 'Average'
	String get average => 'Average';

	/// en: 'Muscular'
	String get muscular => 'Muscular';

	/// en: 'Glamorous'
	String get glamorous => 'Glamorous';

	/// en: 'Slightly chubby'
	String get slightlyChubby => 'Slightly chubby';

	/// en: 'Chubby'
	String get chubby => 'Chubby';

	/// en: '-'
	String get unspecified => '-';
}

// Path: profile.salaryRange
class TranslationsProfileSalaryRangeEn {
	TranslationsProfileSalaryRangeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '-'
	String get unspecified => '-';

	/// en: 'Up to 2M JPY'
	String get under2m => 'Up to 2M JPY';

	/// en: '2–4M JPY'
	String get twoTo4m => '2–4M JPY';

	/// en: '4–6M JPY'
	String get fourTo6m => '4–6M JPY';

	/// en: '6–8M JPY'
	String get sixTo8m => '6–8M JPY';

	/// en: '8–10M JPY'
	String get eightTo10m => '8–10M JPY';

	/// en: '10–15M JPY'
	String get tenTo15m => '10–15M JPY';

	/// en: '15–20M JPY'
	String get fifteenTo20m => '15–20M JPY';

	/// en: '20–30M JPY'
	String get twentyTo30m => '20–30M JPY';

	/// en: '30M JPY or more'
	String get over30m => '30M JPY or more';
}

// Path: profile.bloodType
class TranslationsProfileBloodTypeEn {
	TranslationsProfileBloodTypeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Type A'
	String get a => 'Type A';

	/// en: 'Type B'
	String get b => 'Type B';

	/// en: 'Type AB'
	String get ab => 'Type AB';

	/// en: 'Type O'
	String get o => 'Type O';

	/// en: 'unknown'
	String get unknown => 'unknown';
}

// Path: profile.educationalBackground
class TranslationsProfileEducationalBackgroundEn {
	TranslationsProfileEducationalBackgroundEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'High school'
	String get highSchool => 'High school';

	/// en: 'Junior college'
	String get juniorCollege => 'Junior college';

	/// en: 'Vocational school'
	String get vocationalSchool => 'Vocational school';

	/// en: 'Technical college'
	String get technicalCollege => 'Technical college';

	/// en: 'University'
	String get university => 'University';

	/// en: 'Graduate school'
	String get graduateSchool => 'Graduate school';

	/// en: 'Other'
	String get other => 'Other';
}

// Path: profile.holiday
class TranslationsProfileHolidayEn {
	TranslationsProfileHolidayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Weekends'
	String get weekend => 'Weekends';

	/// en: 'Weekdays'
	String get weekday => 'Weekdays';

	/// en: 'Irregular'
	String get irregular => 'Irregular';

	/// en: 'Other'
	String get other => 'Other';

	/// en: '-'
	String get unspecified => '-';
}

// Path: profile.maritalHistory
class TranslationsProfileMaritalHistoryEn {
	TranslationsProfileMaritalHistoryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Never married'
	String get neverMarried => 'Never married';

	/// en: 'Divorced'
	String get divorced => 'Divorced';

	/// en: 'Widowed'
	String get widowed => 'Widowed';

	/// en: 'Other'
	String get other => 'Other';

	/// en: '-'
	String get unspecified => '-';
}

// Path: profile.childSituation
class TranslationsProfileChildSituationEn {
	TranslationsProfileChildSituationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'None'
	String get none => 'None';

	/// en: 'Living together'
	String get livingTogether => 'Living together';

	/// en: 'Living apart'
	String get livingApart => 'Living apart';

	/// en: '-'
	String get unspecified => '-';
}

// Path: profile.smoking
class TranslationsProfileSmokingEn {
	TranslationsProfileSmokingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Non-smoker'
	String get nonSmoker => 'Non-smoker';

	/// en: 'Smoker'
	String get smoker => 'Smoker';

	/// en: 'E-cigarette smoker'
	String get eCigaretteSmoker => 'E-cigarette smoker';

	/// en: 'Does not smoke in front of non-smokers'
	String get considerateSmoker => 'Does not smoke in front of non-smokers';

	/// en: 'Will quit if partner dislikes'
	String get flexibleSmoker => 'Will quit if partner dislikes';

	/// en: 'Occasional smoker'
	String get occasionalSmoker => 'Occasional smoker';

	/// en: '-'
	String get unspecified => '-';
}

// Path: profile.drinkingAlcohol
class TranslationsProfileDrinkingAlcoholEn {
	TranslationsProfileDrinkingAlcoholEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Non-drinker'
	String get nonDrinker => 'Non-drinker';

	/// en: 'Drinks'
	String get regularDrinker => 'Drinks';

	/// en: 'Sometimes drinks'
	String get occasionalDrinker => 'Sometimes drinks';

	/// en: 'Only in social settings'
	String get socialDrinker => 'Only in social settings';
}

// Path: profile.marriageAspiration
class TranslationsProfileMarriageAspirationEn {
	TranslationsProfileMarriageAspirationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'As soon as possible'
	String get asap => 'As soon as possible';

	/// en: 'Within 2–3 years'
	String get twoToThreeYears => 'Within 2–3 years';

	/// en: 'If I find the right person'
	String get ifRightPerson => 'If I find the right person';

	/// en: 'Would like to discuss with partner'
	String get discussWithPartner => 'Would like to discuss with partner';

	/// en: 'Not sure'
	String get unsure => 'Not sure';

	/// en: '-'
	String get unspecified => '-';
}

// Path: profile.childDesire
class TranslationsProfileChildDesireEn {
	TranslationsProfileChildDesireEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Want children'
	String get wantChildren => 'Want children';

	/// en: 'Do not want children'
	String get noChildren => 'Do not want children';

	/// en: 'Would like to discuss with partner'
	String get discussWithPartner => 'Would like to discuss with partner';

	/// en: 'Not sure'
	String get unsure => 'Not sure';

	/// en: '-'
	String get unspecified => '-';
}

// Path: profile.firstDatePreference
class TranslationsProfileFirstDatePreferenceEn {
	TranslationsProfileFirstDatePreferenceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsProfileFirstDatePreferenceCostEn cost = TranslationsProfileFirstDatePreferenceCostEn._(_root);
	late final TranslationsProfileFirstDatePreferencePlaceEn place = TranslationsProfileFirstDatePreferencePlaceEn._(_root);
}

// Path: profile.sibling
class TranslationsProfileSiblingEn {
	TranslationsProfileSiblingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Eldest son'
	String get eldestSon => 'Eldest son';

	/// en: 'Eldest daughter'
	String get eldestDaughter => 'Eldest daughter';

	/// en: 'Second son'
	String get secondSon => 'Second son';

	/// en: 'Second daughter'
	String get secondDaughter => 'Second daughter';

	/// en: 'Third son'
	String get thirdSon => 'Third son';

	/// en: 'Third daughter'
	String get thirdDaughter => 'Third daughter';

	/// en: 'Only child'
	String get onlyChild => 'Only child';

	/// en: 'Other'
	String get other => 'Other';
}

// Path: profile.roommate
class TranslationsProfileRoommateEn {
	TranslationsProfileRoommateEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Living alone'
	String get livingAlone => 'Living alone';

	/// en: 'With parents and siblings'
	String get livingWithParentsAndBrothers => 'With parents and siblings';

	/// en: 'With friends/acquaintances'
	String get livingWithFriends => 'With friends/acquaintances';

	/// en: 'With a pet dog'
	String get livingWithPetsDog => 'With a pet dog';

	/// en: 'With a pet cat'
	String get livingWithPetsCat => 'With a pet cat';

	/// en: 'With other pets'
	String get livingWithPetsOther => 'With other pets';
}

// Path: profile.sixteen
class TranslationsProfileSixteenEn {
	TranslationsProfileSixteenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ISTJ'
	String get istj => 'ISTJ';

	/// en: 'ISFJ'
	String get isfj => 'ISFJ';

	/// en: 'INFJ'
	String get infj => 'INFJ';

	/// en: 'INTJ'
	String get intj => 'INTJ';

	/// en: 'ISTP'
	String get istp => 'ISTP';

	/// en: 'ISFP'
	String get isfp => 'ISFP';

	/// en: 'INFP'
	String get infp => 'INFP';

	/// en: 'INTP'
	String get intp => 'INTP';

	/// en: 'ESTP'
	String get estp => 'ESTP';

	/// en: 'ESFP'
	String get esfp => 'ESFP';

	/// en: 'ENFP'
	String get enfp => 'ENFP';

	/// en: 'ENTP'
	String get entp => 'ENTP';

	/// en: 'ESTJ'
	String get estj => 'ESTJ';

	/// en: 'ESFJ'
	String get esfj => 'ESFJ';

	/// en: 'ENFJ'
	String get enfj => 'ENFJ';

	/// en: 'ENTJ'
	String get entj => 'ENTJ';
}

// Path: profile.houseWork
class TranslationsProfileHouseWorkEn {
	TranslationsProfileHouseWorkEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Actively participate'
	String get activelyParticipate => 'Actively participate';

	/// en: 'Try to participate'
	String get willingToParticipate => 'Try to participate';

	/// en: 'Want to share with partner'
	String get shareEqually => 'Want to share with partner';

	/// en: 'Prefer partner to do more'
	String get preferPartnerHandle => 'Prefer partner to do more';

	/// en: 'Want partner to handle'
	String get partnerHandle => 'Want partner to handle';
}

// Path: profile.datingPreference
class TranslationsProfileDatingPreferenceEn {
	TranslationsProfileDatingPreferenceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Want to meet soon after matching'
	String get dateSoon => 'Want to meet soon after matching';

	/// en: 'Want to meet if we get along in messages'
	String get dateIfCompatible => 'Want to meet if we get along in messages';

	/// en: 'Want to meet after exchanging messages'
	String get messageBeforeDate => 'Want to meet after exchanging messages';
}

// Path: profile.sociability
class TranslationsProfileSociabilityEn {
	TranslationsProfileSociabilityEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Quick to make friends'
	String get quickFriendship => 'Quick to make friends';

	/// en: 'Gradual to make friends'
	String get gradualFriendship => 'Gradual to make friends';

	/// en: 'Slow to make friends'
	String get slowFriendship => 'Slow to make friends';
}

// Path: profile.personalityTrait
class TranslationsProfilePersonalityTraitEn {
	TranslationsProfilePersonalityTraitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Kind'
	String get kind => 'Kind';

	/// en: 'Honest'
	String get honest => 'Honest';

	/// en: 'Decisive'
	String get decisive => 'Decisive';

	/// en: 'Calm'
	String get calm => 'Calm';

	/// en: 'Friendly'
	String get friendly => 'Friendly';

	/// en: 'Cheerful'
	String get cheerful => 'Cheerful';

	/// en: 'Indoor'
	String get indoor => 'Indoor';

	/// en: 'Outdoor'
	String get outdoor => 'Outdoor';

	/// en: 'Serious'
	String get serious => 'Serious';

	/// en: 'Intelligent'
	String get intelligent => 'Intelligent';

	/// en: 'Sincere'
	String get sincere => 'Sincere';

	/// en: 'Meticulous'
	String get meticulous => 'Meticulous';

	/// en: 'Optimistic'
	String get optimistic => 'Optimistic';

	/// en: 'Shy'
	String get shy => 'Shy';

	/// en: 'Always smiling'
	String get alwaysSmiling => 'Always smiling';

	/// en: 'Elegant'
	String get elegant => 'Elegant';

	/// en: 'Composed'
	String get composed => 'Composed';

	/// en: 'Humble'
	String get humble => 'Humble';

	/// en: 'Strict'
	String get strict => 'Strict';

	/// en: 'Caring'
	String get caring => 'Caring';

	/// en: 'Lonesome'
	String get lonesome => 'Lonesome';

	/// en: 'Sociable'
	String get sociable => 'Sociable';

	/// en: 'Cool-headed'
	String get coolHeaded => 'Cool-headed';

	/// en: 'Curious'
	String get curious => 'Curious';

	/// en: 'Homely'
	String get homely => 'Homely';

	/// en: 'Workaholic'
	String get workaholic => 'Workaholic';

	/// en: 'Responsible'
	String get responsible => 'Responsible';

	/// en: 'Caring for others'
	String get caringForOthers => 'Caring for others';

	/// en: 'Good speaker'
	String get goodSpeaker => 'Good speaker';

	/// en: 'Good listener'
	String get goodListener => 'Good listener';

	/// en: 'Refreshing'
	String get refreshing => 'Refreshing';

	/// en: 'Active'
	String get active => 'Active';

	/// en: 'Rational'
	String get rational => 'Rational';

	/// en: 'Competitive'
	String get competitive => 'Competitive';

	/// en: 'Funny'
	String get funny => 'Funny';

	/// en: 'Passionate'
	String get passionate => 'Passionate';

	/// en: 'Considerate'
	String get considerate => 'Considerate';

	/// en: 'Diligent'
	String get diligent => 'Diligent';

	/// en: 'Bold'
	String get bold => 'Bold';

	/// en: 'Tolerant'
	String get tolerant => 'Tolerant';

	/// en: 'Generous'
	String get generous => 'Generous';

	/// en: 'Natural'
	String get natural => 'Natural';

	/// en: 'Genuine'
	String get genuine => 'Genuine';

	/// en: 'Own pace'
	String get ownPace => 'Own pace';

	/// en: 'Shy with opposite gender'
	String get shyWithOppositeSex => 'Shy with opposite gender';

	/// en: 'Moody'
	String get moody => 'Moody';
}

// Path: profile.occupation
class TranslationsProfileOccupationEn {
	TranslationsProfileOccupationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Listed company'
	String get listedCompany => 'Listed company';

	/// en: 'Business owner'
	String get businessOwner => 'Business owner';

	/// en: 'Public officer'
	String get publicOfficer => 'Public officer';

	/// en: 'Clerk'
	String get clerk => 'Clerk';

	/// en: 'Secretary'
	String get secretary => 'Secretary';

	/// en: 'Consultant'
	String get consultant => 'Consultant';

	/// en: 'Foreign finance'
	String get foreignFinance => 'Foreign finance';

	/// en: 'Student'
	String get student => 'Student';

	/// en: 'Apparel'
	String get apparelShop => 'Apparel';

	/// en: 'Sales'
	String get salesPerson => 'Sales';

	/// en: 'Food industry'
	String get foodIndustry => 'Food industry';

	/// en: 'Cook / Nutritionist'
	String get cookNutritionist => 'Cook / Nutritionist';

	/// en: 'Nutritionist'
	String get nutritionist => 'Nutritionist';

	/// en: 'Customer service'
	String get customerService => 'Customer service';

	/// en: 'Beauty industry'
	String get beautyIndustry => 'Beauty industry';

	/// en: 'Beautician'
	String get beautician => 'Beautician';

	/// en: 'Esthetician'
	String get esthetician => 'Esthetician';

	/// en: 'Beauty staff'
	String get beautyStaff => 'Beauty staff';

	/// en: 'Lawyer'
	String get lawyer => 'Lawyer';

	/// en: 'Notary'
	String get notary => 'Notary';

	/// en: 'Administrative scrivener'
	String get administrativeNotary => 'Administrative scrivener';

	/// en: 'Tax accountant'
	String get taxAccountant => 'Tax accountant';

	/// en: 'Labor and social security attorney'
	String get socialInsuranceLaborLawyer => 'Labor and social security attorney';

	/// en: 'Certified public accountant'
	String get publicAccountant => 'Certified public accountant';

	/// en: 'Medical related'
	String get medicalRelated => 'Medical related';

	/// en: 'Nurse'
	String get nurse => 'Nurse';

	/// en: 'Doctor'
	String get doctor => 'Doctor';

	/// en: 'Dentist'
	String get dentist => 'Dentist';

	/// en: 'Pharmacist'
	String get pharmacist => 'Pharmacist';

	/// en: 'Dental hygienist'
	String get dentalHygienist => 'Dental hygienist';

	/// en: 'Pharmaceutical related'
	String get pharmaceuticalRelated => 'Pharmaceutical related';

	/// en: 'Architectural related'
	String get architecturalRelated => 'Architectural related';

	/// en: 'Architect'
	String get architect => 'Architect';

	/// en: 'Interior designer'
	String get interiorDesigner => 'Interior designer';

	/// en: 'Interior coordinator'
	String get interiorCoordinator => 'Interior coordinator';

	/// en: 'Real estate related'
	String get realEstateRelated => 'Real estate related';

	/// en: 'Entertainment related'
	String get entertainmentRelated => 'Entertainment related';

	/// en: 'Celebrity / Model'
	String get celebrityModel => 'Celebrity / Model';

	/// en: 'Artist'
	String get artist => 'Artist';

	/// en: 'Event companion'
	String get eventCompanion => 'Event companion';

	/// en: 'Sports player'
	String get sportsPlayer => 'Sports player';

	/// en: 'Childcare'
	String get childcare => 'Childcare';

	/// en: 'Transportation related'
	String get transportationRelated => 'Transportation related';

	/// en: 'Pilot'
	String get pilot => 'Pilot';

	/// en: 'Driver'
	String get driver => 'Driver';

	/// en: 'Cabin attendant'
	String get cabinAttendant => 'Cabin attendant';

	/// en: 'Mechanic'
	String get mechanic => 'Mechanic';

	/// en: 'Advertising related'
	String get advertisingRelated => 'Advertising related';

	/// en: 'Designer'
	String get designer => 'Designer';

	/// en: 'Creator'
	String get creator => 'Creator';

	/// en: 'Trading company'
	String get tradingCompany => 'Trading company';

	/// en: 'Insurance'
	String get insurance => 'Insurance';

	/// en: 'Real estate'
	String get realEstate => 'Real estate';

	/// en: 'Telecommunication'
	String get telecommunication => 'Telecommunication';

	/// en: 'Engineer'
	String get engineer => 'Engineer';

	/// en: 'Finance'
	String get finance => 'Finance';

	/// en: 'Distribution'
	String get distribution => 'Distribution';

	/// en: 'Travel related'
	String get travelRelated => 'Travel related';

	/// en: 'Mass media'
	String get massMedia => 'Mass media';

	/// en: 'Welfare / Care'
	String get welfareCare => 'Welfare / Care';

	/// en: 'Bridal'
	String get bridal => 'Bridal';

	/// en: 'Education'
	String get education => 'Education';

	/// en: 'Factory engineer'
	String get factoryEngineer => 'Factory engineer';

	/// en: 'Illustrator'
	String get illustrator => 'Illustrator';

	/// en: 'Influencer'
	String get influencer => 'Influencer';

	/// en: 'Agriculture'
	String get agriculture => 'Agriculture';

	/// en: 'Fishery'
	String get fishery => 'Fishery';

	/// en: 'Other'
	String get other => 'Other';

	/// en: '-'
	String get unspecified => '-';
}

// Path: profile.firstDatePreference.cost
class TranslationsProfileFirstDatePreferenceCostEn {
	TranslationsProfileFirstDatePreferenceCostEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Decide after discussion'
	String get discussWithPartner => 'Decide after discussion';

	/// en: 'I pay all'
	String get iPayAll => 'I pay all';

	/// en: 'I pay more'
	String get iPayMore => 'I pay more';

	/// en: 'Split the bill equally'
	String get splitEqually => 'Split the bill equally';

	/// en: 'Partner pays all'
	String get partnerPayAll => 'Partner pays all';

	/// en: 'Partner pays more'
	String get partnerPayMore => 'Partner pays more';

	/// en: 'Wealthier person pays'
	String get wealthierPays => 'Wealthier person pays';
}

// Path: profile.firstDatePreference.place
class TranslationsProfileFirstDatePreferencePlaceEn {
	TranslationsProfileFirstDatePreferencePlaceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Park'
	String get park => 'Park';

	/// en: 'Cafe'
	String get cafe => 'Cafe';

	/// en: 'Restaurant'
	String get restaurant => 'Restaurant';

	/// en: 'Movie theater'
	String get movieTheater => 'Movie theater';

	/// en: 'Amusement park'
	String get amusementPark => 'Amusement park';

	/// en: 'Museum / Art museum'
	String get museum => 'Museum / Art museum';

	/// en: 'Lunch'
	String get lunch => 'Lunch';

	/// en: 'Izakaya'
	String get izakaya => 'Izakaya';

	/// en: 'Drive'
	String get drive => 'Drive';

	/// en: 'Karaoke'
	String get karaoke => 'Karaoke';

	/// en: 'Partner's choice'
	String get partnersChoice => 'Partner\'s choice';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.hyphen' => '-',
			'gender.male' => 'Male',
			'gender.female' => 'Female',
			'profile.bodyType.slim' => 'Slim',
			'profile.bodyType.slightlySlim' => 'Slightly slim',
			'profile.bodyType.average' => 'Average',
			'profile.bodyType.muscular' => 'Muscular',
			'profile.bodyType.glamorous' => 'Glamorous',
			'profile.bodyType.slightlyChubby' => 'Slightly chubby',
			'profile.bodyType.chubby' => 'Chubby',
			'profile.bodyType.unspecified' => '-',
			'profile.salaryRange.unspecified' => '-',
			'profile.salaryRange.under2m' => 'Up to 2M JPY',
			'profile.salaryRange.twoTo4m' => '2–4M JPY',
			'profile.salaryRange.fourTo6m' => '4–6M JPY',
			'profile.salaryRange.sixTo8m' => '6–8M JPY',
			'profile.salaryRange.eightTo10m' => '8–10M JPY',
			'profile.salaryRange.tenTo15m' => '10–15M JPY',
			'profile.salaryRange.fifteenTo20m' => '15–20M JPY',
			'profile.salaryRange.twentyTo30m' => '20–30M JPY',
			'profile.salaryRange.over30m' => '30M JPY or more',
			'profile.bloodType.a' => 'Type A',
			'profile.bloodType.b' => 'Type B',
			'profile.bloodType.ab' => 'Type AB',
			'profile.bloodType.o' => 'Type O',
			'profile.bloodType.unknown' => 'unknown',
			'profile.educationalBackground.highSchool' => 'High school',
			'profile.educationalBackground.juniorCollege' => 'Junior college',
			'profile.educationalBackground.vocationalSchool' => 'Vocational school',
			'profile.educationalBackground.technicalCollege' => 'Technical college',
			'profile.educationalBackground.university' => 'University',
			'profile.educationalBackground.graduateSchool' => 'Graduate school',
			'profile.educationalBackground.other' => 'Other',
			'profile.holiday.weekend' => 'Weekends',
			'profile.holiday.weekday' => 'Weekdays',
			'profile.holiday.irregular' => 'Irregular',
			'profile.holiday.other' => 'Other',
			'profile.holiday.unspecified' => '-',
			'profile.maritalHistory.neverMarried' => 'Never married',
			'profile.maritalHistory.divorced' => 'Divorced',
			'profile.maritalHistory.widowed' => 'Widowed',
			'profile.maritalHistory.other' => 'Other',
			'profile.maritalHistory.unspecified' => '-',
			'profile.childSituation.none' => 'None',
			'profile.childSituation.livingTogether' => 'Living together',
			'profile.childSituation.livingApart' => 'Living apart',
			'profile.childSituation.unspecified' => '-',
			'profile.smoking.nonSmoker' => 'Non-smoker',
			'profile.smoking.smoker' => 'Smoker',
			'profile.smoking.eCigaretteSmoker' => 'E-cigarette smoker',
			'profile.smoking.considerateSmoker' => 'Does not smoke in front of non-smokers',
			'profile.smoking.flexibleSmoker' => 'Will quit if partner dislikes',
			'profile.smoking.occasionalSmoker' => 'Occasional smoker',
			'profile.smoking.unspecified' => '-',
			'profile.drinkingAlcohol.nonDrinker' => 'Non-drinker',
			'profile.drinkingAlcohol.regularDrinker' => 'Drinks',
			'profile.drinkingAlcohol.occasionalDrinker' => 'Sometimes drinks',
			'profile.drinkingAlcohol.socialDrinker' => 'Only in social settings',
			'profile.marriageAspiration.asap' => 'As soon as possible',
			'profile.marriageAspiration.twoToThreeYears' => 'Within 2–3 years',
			'profile.marriageAspiration.ifRightPerson' => 'If I find the right person',
			'profile.marriageAspiration.discussWithPartner' => 'Would like to discuss with partner',
			'profile.marriageAspiration.unsure' => 'Not sure',
			'profile.marriageAspiration.unspecified' => '-',
			'profile.childDesire.wantChildren' => 'Want children',
			'profile.childDesire.noChildren' => 'Do not want children',
			'profile.childDesire.discussWithPartner' => 'Would like to discuss with partner',
			'profile.childDesire.unsure' => 'Not sure',
			'profile.childDesire.unspecified' => '-',
			'profile.firstDatePreference.cost.discussWithPartner' => 'Decide after discussion',
			'profile.firstDatePreference.cost.iPayAll' => 'I pay all',
			'profile.firstDatePreference.cost.iPayMore' => 'I pay more',
			'profile.firstDatePreference.cost.splitEqually' => 'Split the bill equally',
			'profile.firstDatePreference.cost.partnerPayAll' => 'Partner pays all',
			'profile.firstDatePreference.cost.partnerPayMore' => 'Partner pays more',
			'profile.firstDatePreference.cost.wealthierPays' => 'Wealthier person pays',
			'profile.firstDatePreference.place.park' => 'Park',
			'profile.firstDatePreference.place.cafe' => 'Cafe',
			'profile.firstDatePreference.place.restaurant' => 'Restaurant',
			'profile.firstDatePreference.place.movieTheater' => 'Movie theater',
			'profile.firstDatePreference.place.amusementPark' => 'Amusement park',
			'profile.firstDatePreference.place.museum' => 'Museum / Art museum',
			'profile.firstDatePreference.place.lunch' => 'Lunch',
			'profile.firstDatePreference.place.izakaya' => 'Izakaya',
			'profile.firstDatePreference.place.drive' => 'Drive',
			'profile.firstDatePreference.place.karaoke' => 'Karaoke',
			'profile.firstDatePreference.place.partnersChoice' => 'Partner\'s choice',
			'profile.sibling.eldestSon' => 'Eldest son',
			'profile.sibling.eldestDaughter' => 'Eldest daughter',
			'profile.sibling.secondSon' => 'Second son',
			'profile.sibling.secondDaughter' => 'Second daughter',
			'profile.sibling.thirdSon' => 'Third son',
			'profile.sibling.thirdDaughter' => 'Third daughter',
			'profile.sibling.onlyChild' => 'Only child',
			'profile.sibling.other' => 'Other',
			'profile.roommate.livingAlone' => 'Living alone',
			'profile.roommate.livingWithParentsAndBrothers' => 'With parents and siblings',
			'profile.roommate.livingWithFriends' => 'With friends/acquaintances',
			'profile.roommate.livingWithPetsDog' => 'With a pet dog',
			'profile.roommate.livingWithPetsCat' => 'With a pet cat',
			'profile.roommate.livingWithPetsOther' => 'With other pets',
			'profile.sixteen.istj' => 'ISTJ',
			'profile.sixteen.isfj' => 'ISFJ',
			'profile.sixteen.infj' => 'INFJ',
			'profile.sixteen.intj' => 'INTJ',
			'profile.sixteen.istp' => 'ISTP',
			'profile.sixteen.isfp' => 'ISFP',
			'profile.sixteen.infp' => 'INFP',
			'profile.sixteen.intp' => 'INTP',
			'profile.sixteen.estp' => 'ESTP',
			'profile.sixteen.esfp' => 'ESFP',
			'profile.sixteen.enfp' => 'ENFP',
			'profile.sixteen.entp' => 'ENTP',
			'profile.sixteen.estj' => 'ESTJ',
			'profile.sixteen.esfj' => 'ESFJ',
			'profile.sixteen.enfj' => 'ENFJ',
			'profile.sixteen.entj' => 'ENTJ',
			'profile.houseWork.activelyParticipate' => 'Actively participate',
			'profile.houseWork.willingToParticipate' => 'Try to participate',
			'profile.houseWork.shareEqually' => 'Want to share with partner',
			'profile.houseWork.preferPartnerHandle' => 'Prefer partner to do more',
			'profile.houseWork.partnerHandle' => 'Want partner to handle',
			'profile.datingPreference.dateSoon' => 'Want to meet soon after matching',
			'profile.datingPreference.dateIfCompatible' => 'Want to meet if we get along in messages',
			'profile.datingPreference.messageBeforeDate' => 'Want to meet after exchanging messages',
			'profile.sociability.quickFriendship' => 'Quick to make friends',
			'profile.sociability.gradualFriendship' => 'Gradual to make friends',
			'profile.sociability.slowFriendship' => 'Slow to make friends',
			'profile.personalityTrait.kind' => 'Kind',
			'profile.personalityTrait.honest' => 'Honest',
			'profile.personalityTrait.decisive' => 'Decisive',
			'profile.personalityTrait.calm' => 'Calm',
			'profile.personalityTrait.friendly' => 'Friendly',
			'profile.personalityTrait.cheerful' => 'Cheerful',
			'profile.personalityTrait.indoor' => 'Indoor',
			'profile.personalityTrait.outdoor' => 'Outdoor',
			'profile.personalityTrait.serious' => 'Serious',
			'profile.personalityTrait.intelligent' => 'Intelligent',
			'profile.personalityTrait.sincere' => 'Sincere',
			'profile.personalityTrait.meticulous' => 'Meticulous',
			'profile.personalityTrait.optimistic' => 'Optimistic',
			'profile.personalityTrait.shy' => 'Shy',
			'profile.personalityTrait.alwaysSmiling' => 'Always smiling',
			'profile.personalityTrait.elegant' => 'Elegant',
			'profile.personalityTrait.composed' => 'Composed',
			'profile.personalityTrait.humble' => 'Humble',
			'profile.personalityTrait.strict' => 'Strict',
			'profile.personalityTrait.caring' => 'Caring',
			'profile.personalityTrait.lonesome' => 'Lonesome',
			'profile.personalityTrait.sociable' => 'Sociable',
			'profile.personalityTrait.coolHeaded' => 'Cool-headed',
			'profile.personalityTrait.curious' => 'Curious',
			'profile.personalityTrait.homely' => 'Homely',
			'profile.personalityTrait.workaholic' => 'Workaholic',
			'profile.personalityTrait.responsible' => 'Responsible',
			'profile.personalityTrait.caringForOthers' => 'Caring for others',
			'profile.personalityTrait.goodSpeaker' => 'Good speaker',
			'profile.personalityTrait.goodListener' => 'Good listener',
			'profile.personalityTrait.refreshing' => 'Refreshing',
			'profile.personalityTrait.active' => 'Active',
			'profile.personalityTrait.rational' => 'Rational',
			'profile.personalityTrait.competitive' => 'Competitive',
			'profile.personalityTrait.funny' => 'Funny',
			'profile.personalityTrait.passionate' => 'Passionate',
			'profile.personalityTrait.considerate' => 'Considerate',
			'profile.personalityTrait.diligent' => 'Diligent',
			'profile.personalityTrait.bold' => 'Bold',
			'profile.personalityTrait.tolerant' => 'Tolerant',
			'profile.personalityTrait.generous' => 'Generous',
			'profile.personalityTrait.natural' => 'Natural',
			'profile.personalityTrait.genuine' => 'Genuine',
			'profile.personalityTrait.ownPace' => 'Own pace',
			'profile.personalityTrait.shyWithOppositeSex' => 'Shy with opposite gender',
			'profile.personalityTrait.moody' => 'Moody',
			'profile.occupation.listedCompany' => 'Listed company',
			'profile.occupation.businessOwner' => 'Business owner',
			'profile.occupation.publicOfficer' => 'Public officer',
			'profile.occupation.clerk' => 'Clerk',
			'profile.occupation.secretary' => 'Secretary',
			'profile.occupation.consultant' => 'Consultant',
			'profile.occupation.foreignFinance' => 'Foreign finance',
			'profile.occupation.student' => 'Student',
			'profile.occupation.apparelShop' => 'Apparel',
			'profile.occupation.salesPerson' => 'Sales',
			'profile.occupation.foodIndustry' => 'Food industry',
			'profile.occupation.cookNutritionist' => 'Cook / Nutritionist',
			'profile.occupation.nutritionist' => 'Nutritionist',
			'profile.occupation.customerService' => 'Customer service',
			'profile.occupation.beautyIndustry' => 'Beauty industry',
			'profile.occupation.beautician' => 'Beautician',
			'profile.occupation.esthetician' => 'Esthetician',
			'profile.occupation.beautyStaff' => 'Beauty staff',
			'profile.occupation.lawyer' => 'Lawyer',
			'profile.occupation.notary' => 'Notary',
			'profile.occupation.administrativeNotary' => 'Administrative scrivener',
			'profile.occupation.taxAccountant' => 'Tax accountant',
			'profile.occupation.socialInsuranceLaborLawyer' => 'Labor and social security attorney',
			'profile.occupation.publicAccountant' => 'Certified public accountant',
			'profile.occupation.medicalRelated' => 'Medical related',
			'profile.occupation.nurse' => 'Nurse',
			'profile.occupation.doctor' => 'Doctor',
			'profile.occupation.dentist' => 'Dentist',
			'profile.occupation.pharmacist' => 'Pharmacist',
			'profile.occupation.dentalHygienist' => 'Dental hygienist',
			'profile.occupation.pharmaceuticalRelated' => 'Pharmaceutical related',
			'profile.occupation.architecturalRelated' => 'Architectural related',
			'profile.occupation.architect' => 'Architect',
			'profile.occupation.interiorDesigner' => 'Interior designer',
			'profile.occupation.interiorCoordinator' => 'Interior coordinator',
			'profile.occupation.realEstateRelated' => 'Real estate related',
			'profile.occupation.entertainmentRelated' => 'Entertainment related',
			'profile.occupation.celebrityModel' => 'Celebrity / Model',
			'profile.occupation.artist' => 'Artist',
			'profile.occupation.eventCompanion' => 'Event companion',
			'profile.occupation.sportsPlayer' => 'Sports player',
			'profile.occupation.childcare' => 'Childcare',
			'profile.occupation.transportationRelated' => 'Transportation related',
			'profile.occupation.pilot' => 'Pilot',
			'profile.occupation.driver' => 'Driver',
			'profile.occupation.cabinAttendant' => 'Cabin attendant',
			'profile.occupation.mechanic' => 'Mechanic',
			'profile.occupation.advertisingRelated' => 'Advertising related',
			'profile.occupation.designer' => 'Designer',
			'profile.occupation.creator' => 'Creator',
			'profile.occupation.tradingCompany' => 'Trading company',
			'profile.occupation.insurance' => 'Insurance',
			'profile.occupation.realEstate' => 'Real estate',
			'profile.occupation.telecommunication' => 'Telecommunication',
			'profile.occupation.engineer' => 'Engineer',
			'profile.occupation.finance' => 'Finance',
			'profile.occupation.distribution' => 'Distribution',
			'profile.occupation.travelRelated' => 'Travel related',
			'profile.occupation.massMedia' => 'Mass media',
			'profile.occupation.welfareCare' => 'Welfare / Care',
			'profile.occupation.bridal' => 'Bridal',
			'profile.occupation.education' => 'Education',
			'profile.occupation.factoryEngineer' => 'Factory engineer',
			'profile.occupation.illustrator' => 'Illustrator',
			'profile.occupation.influencer' => 'Influencer',
			'profile.occupation.agriculture' => 'Agriculture',
			'profile.occupation.fishery' => 'Fishery',
			'profile.occupation.other' => 'Other',
			'profile.occupation.unspecified' => '-',
			'certificateLevel.unverified' => 'Unverified',
			'certificateLevel.verified' => 'Identity Verified',
			'certificateLevel.singleCertified' => 'Single Certificated',
			'subscriptionTier.free' => 'free',
			'subscriptionTier.basic' => 'basic',
			'subscriptionTier.premium' => 'premium',
			_ => null,
		};
	}
}
