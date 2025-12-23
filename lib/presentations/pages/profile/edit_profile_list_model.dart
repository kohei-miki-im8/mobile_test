import 'package:econa_mobile_app/domains/entities/edit_profile_field.dart';

final List<EditProfileListModel> basicProfileItems = [
  EditProfileListModel(
    name: 'ニックネーム',
    fieldName: EditProfileField.nickname.name,
    sort: 0,
  ),
  EditProfileListModel(
    name: '居住地',
    fieldName: EditProfileField.residenceRegion.name,
    sort: 1,
  ),
  EditProfileListModel(
    name: '血液型',
    fieldName: EditProfileField.bloodType.name,
    sort: 2,
  ),
  EditProfileListModel(
    name: '出身地',
    fieldName: EditProfileField.birthplaceRegion.name,
    sort: 3,
  ),
];

final List<EditProfileListModel> introductoryItems = [
  EditProfileListModel(
    fieldName: EditProfileField.introductory.name,
    sort: 0,
  ),
];

final List<EditProfileListModel> appearanceItems = [
  EditProfileListModel(
    name: '身長',
    fieldName: EditProfileField.height.name,
    sort: 0,
  ),
  EditProfileListModel(
    name: '体型',
    fieldName: EditProfileField.bodyType.name,
    sort: 1,
  ),
];

final List<EditProfileListModel> personalityLItems = [
  EditProfileListModel(
    name: '社交性',
    fieldName: EditProfileField.sociability.name,
    sort: 0,
  ),
  EditProfileListModel(
    name: 'よく言われる性格タイプ',
    fieldName: EditProfileField.personalityTrait.name,
    sort: 1,
  ),

];

final List<EditProfileListModel> workEducationItems = [
  EditProfileListModel(
    name: '職種',
    fieldName: EditProfileField.occupation.name,
    sort: 0,
  ),
  EditProfileListModel(
    name: '勤務地',
    fieldName: EditProfileField.workplaceRegion.name,
    sort: 1,
  ),
  EditProfileListModel(
    name: '年収',
    fieldName: EditProfileField.salaryRange.name,
    sort: 2,
  ),
  EditProfileListModel(
    name: '学歴',
    fieldName: EditProfileField.educationalBackground.name,
    sort: 3,
  ),
];

final List<EditProfileListModel> lifestyleOtherItems = [
  EditProfileListModel(
    name: '兄弟姉妹',
    fieldName: EditProfileField.sibling.name,
    sort: 0,
  ),
  EditProfileListModel(
    name: '同居人',
    fieldName: EditProfileField.roommate.name,
    sort: 1,
  ),
  EditProfileListModel(
    name: '結婚歴',
    fieldName: EditProfileField.maritalHistory.name,
    sort: 2,
  ),
  EditProfileListModel(
    name: '子供の有無',
    fieldName: EditProfileField.childSituation.name,
    sort: 3,
  ),
  EditProfileListModel(
    name: '休日',
    fieldName: EditProfileField.holidayType.name,
    sort: 4,
  ),
  EditProfileListModel(
    name: '話せる言語',
    fieldName: EditProfileField.userLanguages.name,
    sort: 5,
  ),
  EditProfileListModel(
    name: 'お酒',
    fieldName: EditProfileField.drinkingAlcohol.name,
    sort: 6,
  ),
  EditProfileListModel(
    name: 'タバコ',
    fieldName: EditProfileField.smoking.name,
    sort: 7,
  ),
  EditProfileListModel(
    name: '16タイプ診断',
    fieldName: EditProfileField.sixteenPersonality.name,
    sort: 8,
  ),
];

final List<EditProfileListModel> futureItems = [
  EditProfileListModel(
    name: '結婚への意思',
    fieldName: EditProfileField.marriageAspiration.name,
    sort: 0,
  ),
  EditProfileListModel(
    name: '子どもがほしいか',
    fieldName: EditProfileField.childDesire.name,
    sort: 1,
  ),
  EditProfileListModel(
    name: '家事育児',
    fieldName: EditProfileField.houseWork.name,
    sort: 2,
  ),
];

final List<EditProfileListModel> firstDateItems = [
  EditProfileListModel(
    name: '出会うまでの希望',
    fieldName: EditProfileField.datingPreference.name,
    sort: 0,
  ),
  EditProfileListModel(
    name: '初回のデート費用',
    fieldName: EditProfileField.firstDateCostPreference.name,
    sort: 1,
  ),
  EditProfileListModel(
    name: '初回デートするなら',
    fieldName: EditProfileField.firstDateLocationPreference.name,
    sort: 2,
  ),
];

final List<EditProfileListModel> tagsItems = [
  EditProfileListModel(
    name: 'タグ',
    fieldName: EditProfileField.tagCategory.name,
    sort: 0,
  ),
];

// 編集するプロフィールのデータを管理するモデルクラス
class EditProfileListModel {
  EditProfileListModel({
    required this.fieldName,
    required this.sort,
    this.name,
  });

  final String? name;
  final String fieldName;
  final int sort;
}

