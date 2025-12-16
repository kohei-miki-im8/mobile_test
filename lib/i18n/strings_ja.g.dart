///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsJa with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsJa _root = this; // ignore: unused_field

	@override 
	TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonJa common = _TranslationsCommonJa._(_root);
	@override late final _TranslationsGenderJa gender = _TranslationsGenderJa._(_root);
	@override late final _TranslationsProfileJa profile = _TranslationsProfileJa._(_root);
	@override late final _TranslationsCertificateLevelJa certificateLevel = _TranslationsCertificateLevelJa._(_root);
	@override late final _TranslationsSubscriptionTierJa subscriptionTier = _TranslationsSubscriptionTierJa._(_root);
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
	_TranslationsCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get hyphen => '-';
}

// Path: gender
class _TranslationsGenderJa implements TranslationsGenderEn {
	_TranslationsGenderJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get male => '男性';
	@override String get female => '女性';
}

// Path: profile
class _TranslationsProfileJa implements TranslationsProfileEn {
	_TranslationsProfileJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsProfileBodyTypeJa bodyType = _TranslationsProfileBodyTypeJa._(_root);
	@override late final _TranslationsProfileSalaryRangeJa salaryRange = _TranslationsProfileSalaryRangeJa._(_root);
	@override late final _TranslationsProfileBloodTypeJa bloodType = _TranslationsProfileBloodTypeJa._(_root);
	@override late final _TranslationsProfileEducationalBackgroundJa educationalBackground = _TranslationsProfileEducationalBackgroundJa._(_root);
	@override late final _TranslationsProfileHolidayJa holiday = _TranslationsProfileHolidayJa._(_root);
	@override late final _TranslationsProfileMaritalHistoryJa maritalHistory = _TranslationsProfileMaritalHistoryJa._(_root);
	@override late final _TranslationsProfileChildSituationJa childSituation = _TranslationsProfileChildSituationJa._(_root);
	@override late final _TranslationsProfileSmokingJa smoking = _TranslationsProfileSmokingJa._(_root);
	@override late final _TranslationsProfileDrinkingAlcoholJa drinkingAlcohol = _TranslationsProfileDrinkingAlcoholJa._(_root);
	@override late final _TranslationsProfileMarriageAspirationJa marriageAspiration = _TranslationsProfileMarriageAspirationJa._(_root);
	@override late final _TranslationsProfileChildDesireJa childDesire = _TranslationsProfileChildDesireJa._(_root);
	@override late final _TranslationsProfileFirstDatePreferenceJa firstDatePreference = _TranslationsProfileFirstDatePreferenceJa._(_root);
	@override late final _TranslationsProfileSiblingJa sibling = _TranslationsProfileSiblingJa._(_root);
	@override late final _TranslationsProfileRoommateJa roommate = _TranslationsProfileRoommateJa._(_root);
	@override late final _TranslationsProfileSixteenJa sixteen = _TranslationsProfileSixteenJa._(_root);
	@override late final _TranslationsProfileHouseWorkJa houseWork = _TranslationsProfileHouseWorkJa._(_root);
	@override late final _TranslationsProfileDatingPreferenceJa datingPreference = _TranslationsProfileDatingPreferenceJa._(_root);
	@override late final _TranslationsProfileSociabilityJa sociability = _TranslationsProfileSociabilityJa._(_root);
	@override late final _TranslationsProfilePersonalityTraitJa personalityTrait = _TranslationsProfilePersonalityTraitJa._(_root);
	@override late final _TranslationsProfileOccupationJa occupation = _TranslationsProfileOccupationJa._(_root);
}

// Path: certificateLevel
class _TranslationsCertificateLevelJa implements TranslationsCertificateLevelEn {
	_TranslationsCertificateLevelJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get unverified => '未認証';
	@override String get verified => '本人確認済';
	@override String get singleCertified => '独身証明済';
}

// Path: subscriptionTier
class _TranslationsSubscriptionTierJa implements TranslationsSubscriptionTierEn {
	_TranslationsSubscriptionTierJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get free => 'フリープラン';
	@override String get basic => 'ベーシックプラン';
	@override String get premium => 'プレミアムプラン';
}

// Path: profile.bodyType
class _TranslationsProfileBodyTypeJa implements TranslationsProfileBodyTypeEn {
	_TranslationsProfileBodyTypeJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get slim => 'スリム';
	@override String get slightlySlim => 'やや細い';
	@override String get average => '標準';
	@override String get muscular => '筋肉質';
	@override String get glamorous => 'グラマー';
	@override String get slightlyChubby => 'ややぽっちゃり';
	@override String get chubby => 'ぽっちゃり';
	@override String get unspecified => '未設定';
}

// Path: profile.salaryRange
class _TranslationsProfileSalaryRangeJa implements TranslationsProfileSalaryRangeEn {
	_TranslationsProfileSalaryRangeJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get unspecified => '-';
	@override String get under2m => '～200万円';
	@override String get twoTo4m => '200～400万円';
	@override String get fourTo6m => '400～600万円';
	@override String get sixTo8m => '600～800万円';
	@override String get eightTo10m => '800～1000万円';
	@override String get tenTo15m => '1000～1500万円';
	@override String get fifteenTo20m => '1500～2000万円';
	@override String get twentyTo30m => '2000～3000万円';
	@override String get over30m => '3000万円～';
}

// Path: profile.bloodType
class _TranslationsProfileBloodTypeJa implements TranslationsProfileBloodTypeEn {
	_TranslationsProfileBloodTypeJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get a => 'A型';
	@override String get b => 'B型';
	@override String get ab => 'AB型';
	@override String get o => 'O型';
	@override String get unknown => '分からない';
}

// Path: profile.educationalBackground
class _TranslationsProfileEducationalBackgroundJa implements TranslationsProfileEducationalBackgroundEn {
	_TranslationsProfileEducationalBackgroundJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get highSchool => '高校卒';
	@override String get juniorCollege => '短大卒';
	@override String get vocationalSchool => '専門学校卒';
	@override String get technicalCollege => '高専卒';
	@override String get university => '大学卒';
	@override String get graduateSchool => '大学院卒';
	@override String get other => 'その他';
}

// Path: profile.holiday
class _TranslationsProfileHolidayJa implements TranslationsProfileHolidayEn {
	_TranslationsProfileHolidayJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get weekend => '土日';
	@override String get weekday => '平日';
	@override String get irregular => '不定期';
	@override String get other => 'その他';
	@override String get unspecified => '未設定';
}

// Path: profile.maritalHistory
class _TranslationsProfileMaritalHistoryJa implements TranslationsProfileMaritalHistoryEn {
	_TranslationsProfileMaritalHistoryJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get neverMarried => '未婚';
	@override String get divorced => '独身（離婚）';
	@override String get widowed => '独身（死別）';
	@override String get other => 'その他';
	@override String get unspecified => '未設定';
}

// Path: profile.childSituation
class _TranslationsProfileChildSituationJa implements TranslationsProfileChildSituationEn {
	_TranslationsProfileChildSituationJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get none => 'いない';
	@override String get livingTogether => '同居中';
	@override String get livingApart => '別居中';
	@override String get unspecified => '未設定';
}

// Path: profile.smoking
class _TranslationsProfileSmokingJa implements TranslationsProfileSmokingEn {
	_TranslationsProfileSmokingJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get nonSmoker => '吸わない';
	@override String get smoker => '紙タバコを吸う';
	@override String get eCigaretteSmoker => '電子タバコを吸う';
	@override String get considerateSmoker => '非喫煙者の前では吸わない';
	@override String get flexibleSmoker => '相手が嫌なら禁煙する';
	@override String get occasionalSmoker => 'ときどき吸う';
	@override String get unspecified => '未設定';
}

// Path: profile.drinkingAlcohol
class _TranslationsProfileDrinkingAlcoholJa implements TranslationsProfileDrinkingAlcoholEn {
	_TranslationsProfileDrinkingAlcoholJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get nonDrinker => '飲まない';
	@override String get regularDrinker => '飲む';
	@override String get occasionalDrinker => 'ときどき飲む';
	@override String get socialDrinker => '社交の場では飲む';
}

// Path: profile.marriageAspiration
class _TranslationsProfileMarriageAspirationJa implements TranslationsProfileMarriageAspirationEn {
	_TranslationsProfileMarriageAspirationJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get asap => 'すぐにでもしたい';
	@override String get twoToThreeYears => '2～3年のうちにしたい';
	@override String get ifRightPerson => '良い人がいたらしたい';
	@override String get discussWithPartner => 'お相手と相談したい';
	@override String get unsure => 'わからない';
	@override String get unspecified => '未設定';
}

// Path: profile.childDesire
class _TranslationsProfileChildDesireJa implements TranslationsProfileChildDesireEn {
	_TranslationsProfileChildDesireJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get wantChildren => '欲しい';
	@override String get noChildren => '欲しくない';
	@override String get discussWithPartner => 'お相手と相談したい';
	@override String get unsure => 'わからない';
	@override String get unspecified => '未設定';
}

// Path: profile.firstDatePreference
class _TranslationsProfileFirstDatePreferenceJa implements TranslationsProfileFirstDatePreferenceEn {
	_TranslationsProfileFirstDatePreferenceJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsProfileFirstDatePreferenceCostJa cost = _TranslationsProfileFirstDatePreferenceCostJa._(_root);
	@override late final _TranslationsProfileFirstDatePreferencePlaceJa place = _TranslationsProfileFirstDatePreferencePlaceJa._(_root);
}

// Path: profile.sibling
class _TranslationsProfileSiblingJa implements TranslationsProfileSiblingEn {
	_TranslationsProfileSiblingJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get eldestSon => '長男';
	@override String get secondSon => '次男';
	@override String get thirdSon => '三男';
	@override String get onlyChild => '一人っ子';
	@override String get eldestDaughter => '長女';
	@override String get secondDaughter => '次女';
	@override String get thirdDaughter => '三女';
	@override String get other => 'その他';
}

// Path: profile.roommate
class _TranslationsProfileRoommateJa implements TranslationsProfileRoommateEn {
	_TranslationsProfileRoommateJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get livingAlone => '一人暮らし';
	@override String get livingWithParentsAndBrothers => '両親、兄弟';
	@override String get livingWithFriends => '友人、知人';
	@override String get livingWithPetsDog => 'ペットの犬';
	@override String get livingWithPetsCat => 'ペットの猫';
	@override String get livingWithPetsOther => 'その他ペット';
}

// Path: profile.sixteen
class _TranslationsProfileSixteenJa implements TranslationsProfileSixteenEn {
	_TranslationsProfileSixteenJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get istj => 'ISTJ';
	@override String get isfj => 'ISFJ';
	@override String get infj => 'INFJ';
	@override String get intj => 'INTJ';
	@override String get istp => 'ISTP';
	@override String get isfp => 'ISFP';
	@override String get infp => 'INFP';
	@override String get intp => 'INTP';
	@override String get estp => 'ESTP';
	@override String get esfp => 'ESFP';
	@override String get enfp => 'ENFP';
	@override String get entp => 'ENTP';
	@override String get estj => 'ESTJ';
	@override String get esfj => 'ESFJ';
	@override String get enfj => 'ENFJ';
	@override String get entj => 'ENTJ';
}

// Path: profile.houseWork
class _TranslationsProfileHouseWorkJa implements TranslationsProfileHouseWorkEn {
	_TranslationsProfileHouseWorkJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get activelyParticipate => '積極的に参加する';
	@override String get willingToParticipate => 'なるべく参加する';
	@override String get shareEqually => 'お相手と分担したい';
	@override String get preferPartnerHandle => 'なるべくお相手に任せたい';
	@override String get partnerHandle => 'お相手に任せたい';
}

// Path: profile.datingPreference
class _TranslationsProfileDatingPreferenceJa implements TranslationsProfileDatingPreferenceEn {
	_TranslationsProfileDatingPreferenceJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get dateSoon => 'マッチングしたら早めに会ってみたい';
	@override String get dateIfCompatible => 'やりとりして気が合えば会いたい';
	@override String get messageBeforeDate => 'やりとりを重ねてから会いたい';
}

// Path: profile.sociability
class _TranslationsProfileSociabilityJa implements TranslationsProfileSociabilityEn {
	_TranslationsProfileSociabilityJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get quickFriendship => 'すぐに仲良くなる';
	@override String get gradualFriendship => '徐々に仲良くなる';
	@override String get slowFriendship => 'ゆっくりと仲良くなる';
}

// Path: profile.personalityTrait
class _TranslationsProfilePersonalityTraitJa implements TranslationsProfilePersonalityTraitEn {
	_TranslationsProfilePersonalityTraitJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get kind => '優しい';
	@override String get honest => '素直';
	@override String get decisive => '決断力がある';
	@override String get calm => '穏やか';
	@override String get friendly => '親しみやすい';
	@override String get cheerful => '明るい';
	@override String get indoor => 'インドア';
	@override String get outdoor => 'アウトドア';
	@override String get serious => '真面目';
	@override String get intelligent => '知的';
	@override String get sincere => '誠実';
	@override String get meticulous => '几帳面';
	@override String get optimistic => '楽観的';
	@override String get shy => '照れ屋';
	@override String get alwaysSmiling => 'いつも笑顔';
	@override String get elegant => '上品';
	@override String get composed => '落ち着いている';
	@override String get humble => '謙虚';
	@override String get strict => '厳格';
	@override String get caring => '思いやりがある';
	@override String get lonesome => '寂しがり';
	@override String get sociable => '社交的';
	@override String get coolHeaded => '冷静沈着';
	@override String get curious => '好奇心旺盛';
	@override String get homely => '家庭的';
	@override String get workaholic => '仕事好き';
	@override String get responsible => '責任感がある';
	@override String get caringForOthers => '面倒見が良い';
	@override String get goodSpeaker => '話し上手';
	@override String get goodListener => '聞き上手';
	@override String get refreshing => 'さわやか';
	@override String get active => '行動的';
	@override String get rational => '合理的';
	@override String get competitive => '負けず嫌い';
	@override String get funny => '面白い';
	@override String get passionate => '熱い';
	@override String get considerate => '気が利く';
	@override String get diligent => 'マメ';
	@override String get bold => '大胆';
	@override String get tolerant => '寛容';
	@override String get generous => '気前が良い';
	@override String get natural => '天然と言われる';
	@override String get genuine => '裏表がない';
	@override String get ownPace => 'マイペース';
	@override String get shyWithOppositeSex => '奥手';
	@override String get moody => '気分屋';
}

// Path: profile.occupation
class _TranslationsProfileOccupationJa implements TranslationsProfileOccupationEn {
	_TranslationsProfileOccupationJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get listedCompany => '会社員';
	@override String get businessOwner => '経営者・役員';
	@override String get publicOfficer => '公務員';
	@override String get clerk => '事務員';
	@override String get secretary => '秘書';
	@override String get consultant => 'コンサルタント';
	@override String get foreignFinance => '外資系';
	@override String get student => '学生';
	@override String get apparelShop => 'アパレル・ショップ';
	@override String get salesPerson => '販売員';
	@override String get foodIndustry => '飲食・食品関連';
	@override String get cookNutritionist => '調理師';
	@override String get nutritionist => '栄養士';
	@override String get customerService => '接客業';
	@override String get beautyIndustry => '美容関係';
	@override String get beautician => '美容師';
	@override String get esthetician => 'エステティシャン';
	@override String get beautyStaff => '美容部員';
	@override String get lawyer => '弁護士';
	@override String get notary => '司法書士';
	@override String get administrativeNotary => '行政書士';
	@override String get taxAccountant => '税理士';
	@override String get socialInsuranceLaborLawyer => '社会保険労務士';
	@override String get publicAccountant => '公認会計士';
	@override String get medicalRelated => '医療関連';
	@override String get nurse => '看護師';
	@override String get doctor => '医師';
	@override String get dentist => '歯科医師';
	@override String get pharmacist => '薬剤師';
	@override String get dentalHygienist => '歯科衛生士';
	@override String get pharmaceuticalRelated => '製薬関連';
	@override String get architecturalRelated => '建築関連';
	@override String get architect => '建築士';
	@override String get interiorDesigner => 'インテリアデザイナー';
	@override String get interiorCoordinator => 'インテリアコーディネーター';
	@override String get realEstateRelated => '不動産関連';
	@override String get entertainmentRelated => 'エンターテインメント関連';
	@override String get celebrityModel => '芸能・モデル';
	@override String get artist => 'アーティスト';
	@override String get eventCompanion => 'イベントコンパニオン';
	@override String get sportsPlayer => 'スポーツ選手';
	@override String get childcare => '保育士';
	@override String get transportationRelated => '交通関連';
	@override String get pilot => 'パイロット';
	@override String get driver => '運転手・ドライバー';
	@override String get cabinAttendant => '客室乗務員';
	@override String get mechanic => '整備士';
	@override String get advertisingRelated => '広告関連';
	@override String get designer => 'デザイナー';
	@override String get creator => 'クリエイター';
	@override String get tradingCompany => '商社';
	@override String get insurance => '保険';
	@override String get realEstate => '不動産';
	@override String get telecommunication => '通信関連';
	@override String get engineer => 'エンジニア';
	@override String get finance => '金融関連';
	@override String get distribution => '物流関連';
	@override String get travelRelated => '旅行関連';
	@override String get massMedia => 'マスコミ関連';
	@override String get welfareCare => '福祉・介護関連';
	@override String get bridal => 'ブライダル関連';
	@override String get education => '教育関連';
	@override String get factoryEngineer => '工場・技師';
	@override String get illustrator => 'イラストレーター';
	@override String get influencer => 'インフルエンサー';
	@override String get agriculture => '農林関連';
	@override String get fishery => '水産関連';
	@override String get other => 'その他';
	@override String get unspecified => '未設定';
}

// Path: profile.firstDatePreference.cost
class _TranslationsProfileFirstDatePreferenceCostJa implements TranslationsProfileFirstDatePreferenceCostEn {
	_TranslationsProfileFirstDatePreferenceCostJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get discussWithPartner => 'お相手と相談して決める';
	@override String get iPayAll => '自分が全て払う';
	@override String get iPayMore => '自分が多めに払う';
	@override String get splitEqually => '割り勘';
	@override String get partnerPayAll => 'お相手に全て払ってもらいたい';
	@override String get partnerPayMore => 'お相手に多めに払ってもらいたい';
	@override String get wealthierPays => '収入が高い方が払う';
}

// Path: profile.firstDatePreference.place
class _TranslationsProfileFirstDatePreferencePlaceJa implements TranslationsProfileFirstDatePreferencePlaceEn {
	_TranslationsProfileFirstDatePreferencePlaceJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get park => '公園';
	@override String get cafe => 'カフェ';
	@override String get restaurant => 'レストラン';
	@override String get movieTheater => '映画館';
	@override String get amusementPark => '遊園地';
	@override String get museum => '美術館・博物館';
	@override String get lunch => 'ランチ';
	@override String get izakaya => '居酒屋';
	@override String get drive => 'ドライブ';
	@override String get karaoke => 'カラオケ';
	@override String get partnersChoice => 'お相手の希望の場所';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.hyphen' => '-',
			'gender.male' => '男性',
			'gender.female' => '女性',
			'profile.bodyType.slim' => 'スリム',
			'profile.bodyType.slightlySlim' => 'やや細い',
			'profile.bodyType.average' => '標準',
			'profile.bodyType.muscular' => '筋肉質',
			'profile.bodyType.glamorous' => 'グラマー',
			'profile.bodyType.slightlyChubby' => 'ややぽっちゃり',
			'profile.bodyType.chubby' => 'ぽっちゃり',
			'profile.bodyType.unspecified' => '未設定',
			'profile.salaryRange.unspecified' => '-',
			'profile.salaryRange.under2m' => '～200万円',
			'profile.salaryRange.twoTo4m' => '200～400万円',
			'profile.salaryRange.fourTo6m' => '400～600万円',
			'profile.salaryRange.sixTo8m' => '600～800万円',
			'profile.salaryRange.eightTo10m' => '800～1000万円',
			'profile.salaryRange.tenTo15m' => '1000～1500万円',
			'profile.salaryRange.fifteenTo20m' => '1500～2000万円',
			'profile.salaryRange.twentyTo30m' => '2000～3000万円',
			'profile.salaryRange.over30m' => '3000万円～',
			'profile.bloodType.a' => 'A型',
			'profile.bloodType.b' => 'B型',
			'profile.bloodType.ab' => 'AB型',
			'profile.bloodType.o' => 'O型',
			'profile.bloodType.unknown' => '分からない',
			'profile.educationalBackground.highSchool' => '高校卒',
			'profile.educationalBackground.juniorCollege' => '短大卒',
			'profile.educationalBackground.vocationalSchool' => '専門学校卒',
			'profile.educationalBackground.technicalCollege' => '高専卒',
			'profile.educationalBackground.university' => '大学卒',
			'profile.educationalBackground.graduateSchool' => '大学院卒',
			'profile.educationalBackground.other' => 'その他',
			'profile.holiday.weekend' => '土日',
			'profile.holiday.weekday' => '平日',
			'profile.holiday.irregular' => '不定期',
			'profile.holiday.other' => 'その他',
			'profile.holiday.unspecified' => '未設定',
			'profile.maritalHistory.neverMarried' => '未婚',
			'profile.maritalHistory.divorced' => '独身（離婚）',
			'profile.maritalHistory.widowed' => '独身（死別）',
			'profile.maritalHistory.other' => 'その他',
			'profile.maritalHistory.unspecified' => '未設定',
			'profile.childSituation.none' => 'いない',
			'profile.childSituation.livingTogether' => '同居中',
			'profile.childSituation.livingApart' => '別居中',
			'profile.childSituation.unspecified' => '未設定',
			'profile.smoking.nonSmoker' => '吸わない',
			'profile.smoking.smoker' => '紙タバコを吸う',
			'profile.smoking.eCigaretteSmoker' => '電子タバコを吸う',
			'profile.smoking.considerateSmoker' => '非喫煙者の前では吸わない',
			'profile.smoking.flexibleSmoker' => '相手が嫌なら禁煙する',
			'profile.smoking.occasionalSmoker' => 'ときどき吸う',
			'profile.smoking.unspecified' => '未設定',
			'profile.drinkingAlcohol.nonDrinker' => '飲まない',
			'profile.drinkingAlcohol.regularDrinker' => '飲む',
			'profile.drinkingAlcohol.occasionalDrinker' => 'ときどき飲む',
			'profile.drinkingAlcohol.socialDrinker' => '社交の場では飲む',
			'profile.marriageAspiration.asap' => 'すぐにでもしたい',
			'profile.marriageAspiration.twoToThreeYears' => '2～3年のうちにしたい',
			'profile.marriageAspiration.ifRightPerson' => '良い人がいたらしたい',
			'profile.marriageAspiration.discussWithPartner' => 'お相手と相談したい',
			'profile.marriageAspiration.unsure' => 'わからない',
			'profile.marriageAspiration.unspecified' => '未設定',
			'profile.childDesire.wantChildren' => '欲しい',
			'profile.childDesire.noChildren' => '欲しくない',
			'profile.childDesire.discussWithPartner' => 'お相手と相談したい',
			'profile.childDesire.unsure' => 'わからない',
			'profile.childDesire.unspecified' => '未設定',
			'profile.firstDatePreference.cost.discussWithPartner' => 'お相手と相談して決める',
			'profile.firstDatePreference.cost.iPayAll' => '自分が全て払う',
			'profile.firstDatePreference.cost.iPayMore' => '自分が多めに払う',
			'profile.firstDatePreference.cost.splitEqually' => '割り勘',
			'profile.firstDatePreference.cost.partnerPayAll' => 'お相手に全て払ってもらいたい',
			'profile.firstDatePreference.cost.partnerPayMore' => 'お相手に多めに払ってもらいたい',
			'profile.firstDatePreference.cost.wealthierPays' => '収入が高い方が払う',
			'profile.firstDatePreference.place.park' => '公園',
			'profile.firstDatePreference.place.cafe' => 'カフェ',
			'profile.firstDatePreference.place.restaurant' => 'レストラン',
			'profile.firstDatePreference.place.movieTheater' => '映画館',
			'profile.firstDatePreference.place.amusementPark' => '遊園地',
			'profile.firstDatePreference.place.museum' => '美術館・博物館',
			'profile.firstDatePreference.place.lunch' => 'ランチ',
			'profile.firstDatePreference.place.izakaya' => '居酒屋',
			'profile.firstDatePreference.place.drive' => 'ドライブ',
			'profile.firstDatePreference.place.karaoke' => 'カラオケ',
			'profile.firstDatePreference.place.partnersChoice' => 'お相手の希望の場所',
			'profile.sibling.eldestSon' => '長男',
			'profile.sibling.secondSon' => '次男',
			'profile.sibling.thirdSon' => '三男',
			'profile.sibling.onlyChild' => '一人っ子',
			'profile.sibling.eldestDaughter' => '長女',
			'profile.sibling.secondDaughter' => '次女',
			'profile.sibling.thirdDaughter' => '三女',
			'profile.sibling.other' => 'その他',
			'profile.roommate.livingAlone' => '一人暮らし',
			'profile.roommate.livingWithParentsAndBrothers' => '両親、兄弟',
			'profile.roommate.livingWithFriends' => '友人、知人',
			'profile.roommate.livingWithPetsDog' => 'ペットの犬',
			'profile.roommate.livingWithPetsCat' => 'ペットの猫',
			'profile.roommate.livingWithPetsOther' => 'その他ペット',
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
			'profile.houseWork.activelyParticipate' => '積極的に参加する',
			'profile.houseWork.willingToParticipate' => 'なるべく参加する',
			'profile.houseWork.shareEqually' => 'お相手と分担したい',
			'profile.houseWork.preferPartnerHandle' => 'なるべくお相手に任せたい',
			'profile.houseWork.partnerHandle' => 'お相手に任せたい',
			'profile.datingPreference.dateSoon' => 'マッチングしたら早めに会ってみたい',
			'profile.datingPreference.dateIfCompatible' => 'やりとりして気が合えば会いたい',
			'profile.datingPreference.messageBeforeDate' => 'やりとりを重ねてから会いたい',
			'profile.sociability.quickFriendship' => 'すぐに仲良くなる',
			'profile.sociability.gradualFriendship' => '徐々に仲良くなる',
			'profile.sociability.slowFriendship' => 'ゆっくりと仲良くなる',
			'profile.personalityTrait.kind' => '優しい',
			'profile.personalityTrait.honest' => '素直',
			'profile.personalityTrait.decisive' => '決断力がある',
			'profile.personalityTrait.calm' => '穏やか',
			'profile.personalityTrait.friendly' => '親しみやすい',
			'profile.personalityTrait.cheerful' => '明るい',
			'profile.personalityTrait.indoor' => 'インドア',
			'profile.personalityTrait.outdoor' => 'アウトドア',
			'profile.personalityTrait.serious' => '真面目',
			'profile.personalityTrait.intelligent' => '知的',
			'profile.personalityTrait.sincere' => '誠実',
			'profile.personalityTrait.meticulous' => '几帳面',
			'profile.personalityTrait.optimistic' => '楽観的',
			'profile.personalityTrait.shy' => '照れ屋',
			'profile.personalityTrait.alwaysSmiling' => 'いつも笑顔',
			'profile.personalityTrait.elegant' => '上品',
			'profile.personalityTrait.composed' => '落ち着いている',
			'profile.personalityTrait.humble' => '謙虚',
			'profile.personalityTrait.strict' => '厳格',
			'profile.personalityTrait.caring' => '思いやりがある',
			'profile.personalityTrait.lonesome' => '寂しがり',
			'profile.personalityTrait.sociable' => '社交的',
			'profile.personalityTrait.coolHeaded' => '冷静沈着',
			'profile.personalityTrait.curious' => '好奇心旺盛',
			'profile.personalityTrait.homely' => '家庭的',
			'profile.personalityTrait.workaholic' => '仕事好き',
			'profile.personalityTrait.responsible' => '責任感がある',
			'profile.personalityTrait.caringForOthers' => '面倒見が良い',
			'profile.personalityTrait.goodSpeaker' => '話し上手',
			'profile.personalityTrait.goodListener' => '聞き上手',
			'profile.personalityTrait.refreshing' => 'さわやか',
			'profile.personalityTrait.active' => '行動的',
			'profile.personalityTrait.rational' => '合理的',
			'profile.personalityTrait.competitive' => '負けず嫌い',
			'profile.personalityTrait.funny' => '面白い',
			'profile.personalityTrait.passionate' => '熱い',
			'profile.personalityTrait.considerate' => '気が利く',
			'profile.personalityTrait.diligent' => 'マメ',
			'profile.personalityTrait.bold' => '大胆',
			'profile.personalityTrait.tolerant' => '寛容',
			'profile.personalityTrait.generous' => '気前が良い',
			'profile.personalityTrait.natural' => '天然と言われる',
			'profile.personalityTrait.genuine' => '裏表がない',
			'profile.personalityTrait.ownPace' => 'マイペース',
			'profile.personalityTrait.shyWithOppositeSex' => '奥手',
			'profile.personalityTrait.moody' => '気分屋',
			'profile.occupation.listedCompany' => '会社員',
			'profile.occupation.businessOwner' => '経営者・役員',
			'profile.occupation.publicOfficer' => '公務員',
			'profile.occupation.clerk' => '事務員',
			'profile.occupation.secretary' => '秘書',
			'profile.occupation.consultant' => 'コンサルタント',
			'profile.occupation.foreignFinance' => '外資系',
			'profile.occupation.student' => '学生',
			'profile.occupation.apparelShop' => 'アパレル・ショップ',
			'profile.occupation.salesPerson' => '販売員',
			'profile.occupation.foodIndustry' => '飲食・食品関連',
			'profile.occupation.cookNutritionist' => '調理師',
			'profile.occupation.nutritionist' => '栄養士',
			'profile.occupation.customerService' => '接客業',
			'profile.occupation.beautyIndustry' => '美容関係',
			'profile.occupation.beautician' => '美容師',
			'profile.occupation.esthetician' => 'エステティシャン',
			'profile.occupation.beautyStaff' => '美容部員',
			'profile.occupation.lawyer' => '弁護士',
			'profile.occupation.notary' => '司法書士',
			'profile.occupation.administrativeNotary' => '行政書士',
			'profile.occupation.taxAccountant' => '税理士',
			'profile.occupation.socialInsuranceLaborLawyer' => '社会保険労務士',
			'profile.occupation.publicAccountant' => '公認会計士',
			'profile.occupation.medicalRelated' => '医療関連',
			'profile.occupation.nurse' => '看護師',
			'profile.occupation.doctor' => '医師',
			'profile.occupation.dentist' => '歯科医師',
			'profile.occupation.pharmacist' => '薬剤師',
			'profile.occupation.dentalHygienist' => '歯科衛生士',
			'profile.occupation.pharmaceuticalRelated' => '製薬関連',
			'profile.occupation.architecturalRelated' => '建築関連',
			'profile.occupation.architect' => '建築士',
			'profile.occupation.interiorDesigner' => 'インテリアデザイナー',
			'profile.occupation.interiorCoordinator' => 'インテリアコーディネーター',
			'profile.occupation.realEstateRelated' => '不動産関連',
			'profile.occupation.entertainmentRelated' => 'エンターテインメント関連',
			'profile.occupation.celebrityModel' => '芸能・モデル',
			'profile.occupation.artist' => 'アーティスト',
			'profile.occupation.eventCompanion' => 'イベントコンパニオン',
			'profile.occupation.sportsPlayer' => 'スポーツ選手',
			'profile.occupation.childcare' => '保育士',
			'profile.occupation.transportationRelated' => '交通関連',
			'profile.occupation.pilot' => 'パイロット',
			'profile.occupation.driver' => '運転手・ドライバー',
			'profile.occupation.cabinAttendant' => '客室乗務員',
			'profile.occupation.mechanic' => '整備士',
			'profile.occupation.advertisingRelated' => '広告関連',
			'profile.occupation.designer' => 'デザイナー',
			'profile.occupation.creator' => 'クリエイター',
			'profile.occupation.tradingCompany' => '商社',
			'profile.occupation.insurance' => '保険',
			'profile.occupation.realEstate' => '不動産',
			'profile.occupation.telecommunication' => '通信関連',
			'profile.occupation.engineer' => 'エンジニア',
			'profile.occupation.finance' => '金融関連',
			'profile.occupation.distribution' => '物流関連',
			'profile.occupation.travelRelated' => '旅行関連',
			'profile.occupation.massMedia' => 'マスコミ関連',
			'profile.occupation.welfareCare' => '福祉・介護関連',
			'profile.occupation.bridal' => 'ブライダル関連',
			'profile.occupation.education' => '教育関連',
			'profile.occupation.factoryEngineer' => '工場・技師',
			'profile.occupation.illustrator' => 'イラストレーター',
			'profile.occupation.influencer' => 'インフルエンサー',
			'profile.occupation.agriculture' => '農林関連',
			'profile.occupation.fishery' => '水産関連',
			'profile.occupation.other' => 'その他',
			'profile.occupation.unspecified' => '未設定',
			'certificateLevel.unverified' => '未認証',
			'certificateLevel.verified' => '本人確認済',
			'certificateLevel.singleCertified' => '独身証明済',
			'subscriptionTier.free' => 'フリープラン',
			'subscriptionTier.basic' => 'ベーシックプラン',
			'subscriptionTier.premium' => 'プレミアムプラン',
			_ => null,
		};
	}
}
