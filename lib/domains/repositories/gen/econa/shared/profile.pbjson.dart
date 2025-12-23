//
//  Generated code. Do not modify.
//  source: econa/shared/profile.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use profileDescriptor instead')
const Profile$json = {
  '1': 'Profile',
  '2': [
    {'1': 'gender_code', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.GenderCode', '10': 'genderCode'},
    {'1': 'updatable_profile', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.UpdatableProfile', '10': 'updatableProfile'},
    {'1': 'optional_profile', '3': 3, '4': 1, '5': 11, '6': '.econa.shared.OptionalProfile', '10': 'optionalProfile'},
    {'1': 'requiring_review_profile_photos', '3': 4, '4': 3, '5': 11, '6': '.econa.shared.RequiringReviewProfilePhoto', '10': 'requiringReviewProfilePhotos'},
    {'1': 'profile_input_rate', '3': 5, '4': 1, '5': 5, '10': 'profileInputRate'},
  ],
};

/// Descriptor for `Profile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profileDescriptor = $convert.base64Decode(
    'CgdQcm9maWxlEjgKC2dlbmRlcl9jb2RlGAEgASgOMhcuZWNvbmEuZW51bXMuR2VuZGVyQ29kZV'
    'IKZ2VuZGVyQ29kZRJLChF1cGRhdGFibGVfcHJvZmlsZRgCIAEoCzIeLmVjb25hLnNoYXJlZC5V'
    'cGRhdGFibGVQcm9maWxlUhB1cGRhdGFibGVQcm9maWxlEkgKEG9wdGlvbmFsX3Byb2ZpbGUYAy'
    'ABKAsyHS5lY29uYS5zaGFyZWQuT3B0aW9uYWxQcm9maWxlUg9vcHRpb25hbFByb2ZpbGUScAof'
    'cmVxdWlyaW5nX3Jldmlld19wcm9maWxlX3Bob3RvcxgEIAMoCzIpLmVjb25hLnNoYXJlZC5SZX'
    'F1aXJpbmdSZXZpZXdQcm9maWxlUGhvdG9SHHJlcXVpcmluZ1Jldmlld1Byb2ZpbGVQaG90b3MS'
    'LAoScHJvZmlsZV9pbnB1dF9yYXRlGAUgASgFUhBwcm9maWxlSW5wdXRSYXRl');

@$core.Deprecated('Use updatableProfileDescriptor instead')
const UpdatableProfile$json = {
  '1': 'UpdatableProfile',
  '2': [
    {'1': 'requiring_review_nickname', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.RequiringReviewNickname', '10': 'requiringReviewNickname'},
    {'1': 'birthday', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'birthday'},
    {'1': 'residence_region', '3': 3, '4': 1, '5': 11, '6': '.econa.master.Region', '10': 'residenceRegion'},
  ],
};

/// Descriptor for `UpdatableProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatableProfileDescriptor = $convert.base64Decode(
    'ChBVcGRhdGFibGVQcm9maWxlEmEKGXJlcXVpcmluZ19yZXZpZXdfbmlja25hbWUYASABKAsyJS'
    '5lY29uYS5zaGFyZWQuUmVxdWlyaW5nUmV2aWV3Tmlja25hbWVSF3JlcXVpcmluZ1Jldmlld05p'
    'Y2tuYW1lEqUCCghiaXJ0aGRheRgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBC7A'
    'G6SOgBugHkAQobcGVyc29uLmJpcnRoX2RhdGUuYWdlX3JhbmdlEj3lubTpvaLjga8xOOats+S7'
    'peS4ijUw5q2z5pyq5rqA44Gn44GC44KL5b+F6KaB44GM44GC44KK44G+44GZGoUBdGhpcyAhPS'
    'BudWxsICYmIGR1cmF0aW9uKG5vdyAtIHRoaXMpLmdldFNlY29uZHMoKSA+PSAxOCAqIDM2NSAq'
    'IDI0ICogMzYwMCAmJiBkdXJhdGlvbihub3cgLSB0aGlzKS5nZXRTZWNvbmRzKCkgPCA1MCAqID'
    'M2NSAqIDI0ICogMzYwMFIIYmlydGhkYXkSPwoQcmVzaWRlbmNlX3JlZ2lvbhgDIAEoCzIULmVj'
    'b25hLm1hc3Rlci5SZWdpb25SD3Jlc2lkZW5jZVJlZ2lvbg==');

@$core.Deprecated('Use optionalProfileDescriptor instead')
const OptionalProfile$json = {
  '1': 'OptionalProfile',
  '2': [
    {'1': 'requiring_review_introductory', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.RequiringReviewIntroductory', '10': 'requiringReviewIntroductory'},
    {'1': 'blood_type_code', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.BloodTypeCode', '10': 'bloodTypeCode'},
    {'1': 'birthplace_region', '3': 3, '4': 1, '5': 11, '6': '.econa.master.Region', '10': 'birthplaceRegion'},
    {'1': 'height', '3': 4, '4': 1, '5': 5, '8': {}, '10': 'height'},
    {'1': 'body_type_code', '3': 5, '4': 1, '5': 14, '6': '.econa.enums.BodyTypeCode', '10': 'bodyTypeCode'},
    {'1': 'sociability_code', '3': 6, '4': 1, '5': 14, '6': '.econa.enums.SociabilityCode', '10': 'sociabilityCode'},
    {'1': 'personality_trait_code', '3': 8, '4': 1, '5': 14, '6': '.econa.enums.PersonalityTraitCode', '10': 'personalityTraitCode'},
    {'1': 'sixteen_personality_code', '3': 9, '4': 1, '5': 14, '6': '.econa.enums.SixteenPersonalityCode', '10': 'sixteenPersonalityCode'},
    {'1': 'occupation_code', '3': 10, '4': 1, '5': 14, '6': '.econa.enums.OccupationCode', '10': 'occupationCode'},
    {'1': 'workplace_region', '3': 11, '4': 1, '5': 11, '6': '.econa.master.Region', '10': 'workplaceRegion'},
    {'1': 'salary_range_code', '3': 12, '4': 1, '5': 14, '6': '.econa.enums.SalaryRangeCode', '10': 'salaryRangeCode'},
    {'1': 'educational_background_code', '3': 13, '4': 1, '5': 14, '6': '.econa.enums.EducationalBackgroundCode', '10': 'educationalBackgroundCode'},
    {'1': 'sibling_code', '3': 14, '4': 1, '5': 14, '6': '.econa.enums.SiblingCode', '10': 'siblingCode'},
    {'1': 'roommate_code', '3': 15, '4': 1, '5': 14, '6': '.econa.enums.RoommateCode', '10': 'roommateCode'},
    {'1': 'marital_history_code', '3': 16, '4': 1, '5': 14, '6': '.econa.enums.MaritalHistoryCode', '10': 'maritalHistoryCode'},
    {'1': 'child_situation_code', '3': 17, '4': 1, '5': 14, '6': '.econa.enums.ChildSituationCode', '10': 'childSituationCode'},
    {'1': 'holiday_type_code', '3': 18, '4': 1, '5': 14, '6': '.econa.enums.HolidayTypeCode', '10': 'holidayTypeCode'},
    {'1': 'user_language_codes', '3': 19, '4': 3, '5': 14, '6': '.econa.enums.LanguageCode', '8': {}, '10': 'userLanguageCodes'},
    {'1': 'drinking_alcohol_code', '3': 20, '4': 1, '5': 14, '6': '.econa.enums.DrinkingAlcoholCode', '10': 'drinkingAlcoholCode'},
    {'1': 'smoking_code', '3': 21, '4': 1, '5': 14, '6': '.econa.enums.SmokingCode', '10': 'smokingCode'},
    {'1': 'marriage_aspiration_code', '3': 22, '4': 1, '5': 14, '6': '.econa.enums.MarriageAspirationCode', '10': 'marriageAspirationCode'},
    {'1': 'child_desire_code', '3': 23, '4': 1, '5': 14, '6': '.econa.enums.ChildDesireCode', '10': 'childDesireCode'},
    {'1': 'house_work_code', '3': 24, '4': 1, '5': 14, '6': '.econa.enums.HouseWorkCode', '10': 'houseWorkCode'},
    {'1': 'dating_preference_code', '3': 25, '4': 1, '5': 14, '6': '.econa.enums.DatingPreferenceCode', '10': 'datingPreferenceCode'},
    {'1': 'first_date_cost_preference_code', '3': 26, '4': 1, '5': 14, '6': '.econa.enums.FirstDateCostPreferenceCode', '10': 'firstDateCostPreferenceCode'},
    {'1': 'first_date_location_preference_code', '3': 27, '4': 1, '5': 14, '6': '.econa.enums.FirstDateLocationPreferenceCode', '10': 'firstDateLocationPreferenceCode'},
    {'1': 'photo_bonus_granted', '3': 28, '4': 1, '5': 8, '10': 'photoBonusGranted'},
    {'1': 'intro_bonus_granted', '3': 29, '4': 1, '5': 8, '10': 'introBonusGranted'},
    {'1': 'blood_type_label', '3': 30, '4': 1, '5': 9, '10': 'bloodTypeLabel'},
    {'1': 'body_type_label', '3': 31, '4': 1, '5': 9, '10': 'bodyTypeLabel'},
    {'1': 'sociability_label', '3': 32, '4': 1, '5': 9, '10': 'sociabilityLabel'},
    {'1': 'group_behavior_label', '3': 33, '4': 1, '5': 9, '10': 'groupBehaviorLabel'},
    {'1': 'personality_trait_label', '3': 34, '4': 1, '5': 9, '10': 'personalityTraitLabel'},
    {'1': 'sixteen_personality_label', '3': 35, '4': 1, '5': 9, '10': 'sixteenPersonalityLabel'},
    {'1': 'occupation_label', '3': 36, '4': 1, '5': 9, '10': 'occupationLabel'},
    {'1': 'salary_range_label', '3': 37, '4': 1, '5': 9, '10': 'salaryRangeLabel'},
    {'1': 'educational_background_label', '3': 38, '4': 1, '5': 9, '10': 'educationalBackgroundLabel'},
    {'1': 'sibling_label', '3': 39, '4': 1, '5': 9, '10': 'siblingLabel'},
    {'1': 'roommate_label', '3': 40, '4': 1, '5': 9, '10': 'roommateLabel'},
    {'1': 'marital_history_label', '3': 41, '4': 1, '5': 9, '10': 'maritalHistoryLabel'},
    {'1': 'child_situation_label', '3': 42, '4': 1, '5': 9, '10': 'childSituationLabel'},
    {'1': 'holiday_type_label', '3': 43, '4': 1, '5': 9, '10': 'holidayTypeLabel'},
    {'1': 'drinking_alcohol_label', '3': 44, '4': 1, '5': 9, '10': 'drinkingAlcoholLabel'},
    {'1': 'smoking_label', '3': 45, '4': 1, '5': 9, '10': 'smokingLabel'},
    {'1': 'marriage_aspiration_label', '3': 46, '4': 1, '5': 9, '10': 'marriageAspirationLabel'},
    {'1': 'child_desire_label', '3': 47, '4': 1, '5': 9, '10': 'childDesireLabel'},
    {'1': 'house_work_label', '3': 48, '4': 1, '5': 9, '10': 'houseWorkLabel'},
    {'1': 'dating_preference_label', '3': 49, '4': 1, '5': 9, '10': 'datingPreferenceLabel'},
    {'1': 'first_date_cost_preference_label', '3': 50, '4': 1, '5': 9, '10': 'firstDateCostPreferenceLabel'},
    {'1': 'first_date_location_preference_label', '3': 51, '4': 1, '5': 9, '10': 'firstDateLocationPreferenceLabel'},
  ],
  '9': [
    {'1': 7, '2': 8},
  ],
  '10': ['group_behavior_code'],
};

/// Descriptor for `OptionalProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List optionalProfileDescriptor = $convert.base64Decode(
    'Cg9PcHRpb25hbFByb2ZpbGUSbQodcmVxdWlyaW5nX3Jldmlld19pbnRyb2R1Y3RvcnkYASABKA'
    'syKS5lY29uYS5zaGFyZWQuUmVxdWlyaW5nUmV2aWV3SW50cm9kdWN0b3J5UhtyZXF1aXJpbmdS'
    'ZXZpZXdJbnRyb2R1Y3RvcnkSQgoPYmxvb2RfdHlwZV9jb2RlGAIgASgOMhouZWNvbmEuZW51bX'
    'MuQmxvb2RUeXBlQ29kZVINYmxvb2RUeXBlQ29kZRJBChFiaXJ0aHBsYWNlX3JlZ2lvbhgDIAEo'
    'CzIULmVjb25hLm1hc3Rlci5SZWdpb25SEGJpcnRocGxhY2VSZWdpb24SHwoGaGVpZ2h0GAQgAS'
    'gFQge6SAQaAigAUgZoZWlnaHQSPwoOYm9keV90eXBlX2NvZGUYBSABKA4yGS5lY29uYS5lbnVt'
    'cy5Cb2R5VHlwZUNvZGVSDGJvZHlUeXBlQ29kZRJHChBzb2NpYWJpbGl0eV9jb2RlGAYgASgOMh'
    'wuZWNvbmEuZW51bXMuU29jaWFiaWxpdHlDb2RlUg9zb2NpYWJpbGl0eUNvZGUSVwoWcGVyc29u'
    'YWxpdHlfdHJhaXRfY29kZRgIIAEoDjIhLmVjb25hLmVudW1zLlBlcnNvbmFsaXR5VHJhaXRDb2'
    'RlUhRwZXJzb25hbGl0eVRyYWl0Q29kZRJdChhzaXh0ZWVuX3BlcnNvbmFsaXR5X2NvZGUYCSAB'
    'KA4yIy5lY29uYS5lbnVtcy5TaXh0ZWVuUGVyc29uYWxpdHlDb2RlUhZzaXh0ZWVuUGVyc29uYW'
    'xpdHlDb2RlEkQKD29jY3VwYXRpb25fY29kZRgKIAEoDjIbLmVjb25hLmVudW1zLk9jY3VwYXRp'
    'b25Db2RlUg5vY2N1cGF0aW9uQ29kZRI/ChB3b3JrcGxhY2VfcmVnaW9uGAsgASgLMhQuZWNvbm'
    'EubWFzdGVyLlJlZ2lvblIPd29ya3BsYWNlUmVnaW9uEkgKEXNhbGFyeV9yYW5nZV9jb2RlGAwg'
    'ASgOMhwuZWNvbmEuZW51bXMuU2FsYXJ5UmFuZ2VDb2RlUg9zYWxhcnlSYW5nZUNvZGUSZgobZW'
    'R1Y2F0aW9uYWxfYmFja2dyb3VuZF9jb2RlGA0gASgOMiYuZWNvbmEuZW51bXMuRWR1Y2F0aW9u'
    'YWxCYWNrZ3JvdW5kQ29kZVIZZWR1Y2F0aW9uYWxCYWNrZ3JvdW5kQ29kZRI7CgxzaWJsaW5nX2'
    'NvZGUYDiABKA4yGC5lY29uYS5lbnVtcy5TaWJsaW5nQ29kZVILc2libGluZ0NvZGUSPgoNcm9v'
    'bW1hdGVfY29kZRgPIAEoDjIZLmVjb25hLmVudW1zLlJvb21tYXRlQ29kZVIMcm9vbW1hdGVDb2'
    'RlElEKFG1hcml0YWxfaGlzdG9yeV9jb2RlGBAgASgOMh8uZWNvbmEuZW51bXMuTWFyaXRhbEhp'
    'c3RvcnlDb2RlUhJtYXJpdGFsSGlzdG9yeUNvZGUSUQoUY2hpbGRfc2l0dWF0aW9uX2NvZGUYES'
    'ABKA4yHy5lY29uYS5lbnVtcy5DaGlsZFNpdHVhdGlvbkNvZGVSEmNoaWxkU2l0dWF0aW9uQ29k'
    'ZRJIChFob2xpZGF5X3R5cGVfY29kZRgSIAEoDjIcLmVjb25hLmVudW1zLkhvbGlkYXlUeXBlQ2'
    '9kZVIPaG9saWRheVR5cGVDb2RlElgKE3VzZXJfbGFuZ3VhZ2VfY29kZXMYEyADKA4yGS5lY29u'
    'YS5lbnVtcy5MYW5ndWFnZUNvZGVCDbpICpIBByIFggECEAFSEXVzZXJMYW5ndWFnZUNvZGVzEl'
    'QKFWRyaW5raW5nX2FsY29ob2xfY29kZRgUIAEoDjIgLmVjb25hLmVudW1zLkRyaW5raW5nQWxj'
    'b2hvbENvZGVSE2RyaW5raW5nQWxjb2hvbENvZGUSOwoMc21va2luZ19jb2RlGBUgASgOMhguZW'
    'NvbmEuZW51bXMuU21va2luZ0NvZGVSC3Ntb2tpbmdDb2RlEl0KGG1hcnJpYWdlX2FzcGlyYXRp'
    'b25fY29kZRgWIAEoDjIjLmVjb25hLmVudW1zLk1hcnJpYWdlQXNwaXJhdGlvbkNvZGVSFm1hcn'
    'JpYWdlQXNwaXJhdGlvbkNvZGUSSAoRY2hpbGRfZGVzaXJlX2NvZGUYFyABKA4yHC5lY29uYS5l'
    'bnVtcy5DaGlsZERlc2lyZUNvZGVSD2NoaWxkRGVzaXJlQ29kZRJCCg9ob3VzZV93b3JrX2NvZG'
    'UYGCABKA4yGi5lY29uYS5lbnVtcy5Ib3VzZVdvcmtDb2RlUg1ob3VzZVdvcmtDb2RlElcKFmRh'
    'dGluZ19wcmVmZXJlbmNlX2NvZGUYGSABKA4yIS5lY29uYS5lbnVtcy5EYXRpbmdQcmVmZXJlbm'
    'NlQ29kZVIUZGF0aW5nUHJlZmVyZW5jZUNvZGUSbgofZmlyc3RfZGF0ZV9jb3N0X3ByZWZlcmVu'
    'Y2VfY29kZRgaIAEoDjIoLmVjb25hLmVudW1zLkZpcnN0RGF0ZUNvc3RQcmVmZXJlbmNlQ29kZV'
    'IbZmlyc3REYXRlQ29zdFByZWZlcmVuY2VDb2RlEnoKI2ZpcnN0X2RhdGVfbG9jYXRpb25fcHJl'
    'ZmVyZW5jZV9jb2RlGBsgASgOMiwuZWNvbmEuZW51bXMuRmlyc3REYXRlTG9jYXRpb25QcmVmZX'
    'JlbmNlQ29kZVIfZmlyc3REYXRlTG9jYXRpb25QcmVmZXJlbmNlQ29kZRIuChNwaG90b19ib251'
    'c19ncmFudGVkGBwgASgIUhFwaG90b0JvbnVzR3JhbnRlZBIuChNpbnRyb19ib251c19ncmFudG'
    'VkGB0gASgIUhFpbnRyb0JvbnVzR3JhbnRlZBIoChBibG9vZF90eXBlX2xhYmVsGB4gASgJUg5i'
    'bG9vZFR5cGVMYWJlbBImCg9ib2R5X3R5cGVfbGFiZWwYHyABKAlSDWJvZHlUeXBlTGFiZWwSKw'
    'oRc29jaWFiaWxpdHlfbGFiZWwYICABKAlSEHNvY2lhYmlsaXR5TGFiZWwSMAoUZ3JvdXBfYmVo'
    'YXZpb3JfbGFiZWwYISABKAlSEmdyb3VwQmVoYXZpb3JMYWJlbBI2ChdwZXJzb25hbGl0eV90cm'
    'FpdF9sYWJlbBgiIAEoCVIVcGVyc29uYWxpdHlUcmFpdExhYmVsEjoKGXNpeHRlZW5fcGVyc29u'
    'YWxpdHlfbGFiZWwYIyABKAlSF3NpeHRlZW5QZXJzb25hbGl0eUxhYmVsEikKEG9jY3VwYXRpb2'
    '5fbGFiZWwYJCABKAlSD29jY3VwYXRpb25MYWJlbBIsChJzYWxhcnlfcmFuZ2VfbGFiZWwYJSAB'
    'KAlSEHNhbGFyeVJhbmdlTGFiZWwSQAocZWR1Y2F0aW9uYWxfYmFja2dyb3VuZF9sYWJlbBgmIA'
    'EoCVIaZWR1Y2F0aW9uYWxCYWNrZ3JvdW5kTGFiZWwSIwoNc2libGluZ19sYWJlbBgnIAEoCVIM'
    'c2libGluZ0xhYmVsEiUKDnJvb21tYXRlX2xhYmVsGCggASgJUg1yb29tbWF0ZUxhYmVsEjIKFW'
    '1hcml0YWxfaGlzdG9yeV9sYWJlbBgpIAEoCVITbWFyaXRhbEhpc3RvcnlMYWJlbBIyChVjaGls'
    'ZF9zaXR1YXRpb25fbGFiZWwYKiABKAlSE2NoaWxkU2l0dWF0aW9uTGFiZWwSLAoSaG9saWRheV'
    '90eXBlX2xhYmVsGCsgASgJUhBob2xpZGF5VHlwZUxhYmVsEjQKFmRyaW5raW5nX2FsY29ob2xf'
    'bGFiZWwYLCABKAlSFGRyaW5raW5nQWxjb2hvbExhYmVsEiMKDXNtb2tpbmdfbGFiZWwYLSABKA'
    'lSDHNtb2tpbmdMYWJlbBI6ChltYXJyaWFnZV9hc3BpcmF0aW9uX2xhYmVsGC4gASgJUhdtYXJy'
    'aWFnZUFzcGlyYXRpb25MYWJlbBIsChJjaGlsZF9kZXNpcmVfbGFiZWwYLyABKAlSEGNoaWxkRG'
    'VzaXJlTGFiZWwSKAoQaG91c2Vfd29ya19sYWJlbBgwIAEoCVIOaG91c2VXb3JrTGFiZWwSNgoX'
    'ZGF0aW5nX3ByZWZlcmVuY2VfbGFiZWwYMSABKAlSFWRhdGluZ1ByZWZlcmVuY2VMYWJlbBJGCi'
    'BmaXJzdF9kYXRlX2Nvc3RfcHJlZmVyZW5jZV9sYWJlbBgyIAEoCVIcZmlyc3REYXRlQ29zdFBy'
    'ZWZlcmVuY2VMYWJlbBJOCiRmaXJzdF9kYXRlX2xvY2F0aW9uX3ByZWZlcmVuY2VfbGFiZWwYMy'
    'ABKAlSIGZpcnN0RGF0ZUxvY2F0aW9uUHJlZmVyZW5jZUxhYmVsSgQIBxAIUhNncm91cF9iZWhh'
    'dmlvcl9jb2Rl');

@$core.Deprecated('Use requiringReviewNicknameDescriptor instead')
const RequiringReviewNickname$json = {
  '1': 'RequiringReviewNickname',
  '2': [
    {'1': 'current_nickname', '3': 1, '4': 1, '5': 9, '10': 'currentNickname'},
    {'1': 'pending_nickname', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'pendingNickname'},
  ],
};

/// Descriptor for `RequiringReviewNickname`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requiringReviewNicknameDescriptor = $convert.base64Decode(
    'ChdSZXF1aXJpbmdSZXZpZXdOaWNrbmFtZRIpChBjdXJyZW50X25pY2tuYW1lGAEgASgJUg9jdX'
    'JyZW50Tmlja25hbWUSTwoQcGVuZGluZ19uaWNrbmFtZRgCIAEoCUIkukghch8QARgUMhleW1xw'
    'e0x9XHB7Tn1ccHtafVxwe1B9XSskUg9wZW5kaW5nTmlja25hbWU=');

@$core.Deprecated('Use requiringReviewIntroductoryDescriptor instead')
const RequiringReviewIntroductory$json = {
  '1': 'RequiringReviewIntroductory',
  '2': [
    {'1': 'current_introductory', '3': 1, '4': 1, '5': 9, '10': 'currentIntroductory'},
    {'1': 'pending_introductory', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'pendingIntroductory'},
  ],
};

/// Descriptor for `RequiringReviewIntroductory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requiringReviewIntroductoryDescriptor = $convert.base64Decode(
    'ChtSZXF1aXJpbmdSZXZpZXdJbnRyb2R1Y3RvcnkSMQoUY3VycmVudF9pbnRyb2R1Y3RvcnkYAS'
    'ABKAlSE2N1cnJlbnRJbnRyb2R1Y3RvcnkSOwoUcGVuZGluZ19pbnRyb2R1Y3RvcnkYAiABKAlC'
    'CLpIBXIDGOgHUhNwZW5kaW5nSW50cm9kdWN0b3J5');

@$core.Deprecated('Use requiringReviewProfilePhotoDescriptor instead')
const RequiringReviewProfilePhoto$json = {
  '1': 'RequiringReviewProfilePhoto',
  '2': [
    {'1': 'user_profile_photo_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userProfilePhotoId'},
    {
      '1': 'signed_image_urls',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.econa.shared.SignedImageUrls',
      '8': {'3': true},
      '10': 'signedImageUrls',
    },
    {'1': 'is_best_photo', '3': 3, '4': 1, '5': 8, '10': 'isBestPhoto'},
    {'1': 'already_skipped', '3': 4, '4': 1, '5': 8, '10': 'alreadySkipped'},
    {'1': 'current_display_order', '3': 5, '4': 1, '5': 5, '8': {}, '10': 'currentDisplayOrder'},
    {
      '1': 'is_pending',
      '3': 6,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'isPending',
    },
    {'1': 'current_signed_image_urls', '3': 7, '4': 1, '5': 11, '6': '.econa.shared.SignedImageUrls', '10': 'currentSignedImageUrls'},
    {'1': 'pending_signed_image_urls', '3': 8, '4': 1, '5': 11, '6': '.econa.shared.SignedImageUrls', '10': 'pendingSignedImageUrls'},
  ],
};

/// Descriptor for `RequiringReviewProfilePhoto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requiringReviewProfilePhotoDescriptor = $convert.base64Decode(
    'ChtSZXF1aXJpbmdSZXZpZXdQcm9maWxlUGhvdG8SOwoVdXNlcl9wcm9maWxlX3Bob3RvX2lkGA'
    'EgASgJQgi6SAVyA7ABAVISdXNlclByb2ZpbGVQaG90b0lkEk0KEXNpZ25lZF9pbWFnZV91cmxz'
    'GAIgASgLMh0uZWNvbmEuc2hhcmVkLlNpZ25lZEltYWdlVXJsc0ICGAFSD3NpZ25lZEltYWdlVX'
    'JscxIiCg1pc19iZXN0X3Bob3RvGAMgASgIUgtpc0Jlc3RQaG90bxInCg9hbHJlYWR5X3NraXBw'
    'ZWQYBCABKAhSDmFscmVhZHlTa2lwcGVkEj0KFWN1cnJlbnRfZGlzcGxheV9vcmRlchgFIAEoBU'
    'IJukgGGgQYCSgBUhNjdXJyZW50RGlzcGxheU9yZGVyEiEKCmlzX3BlbmRpbmcYBiABKAhCAhgB'
    'Uglpc1BlbmRpbmcSWAoZY3VycmVudF9zaWduZWRfaW1hZ2VfdXJscxgHIAEoCzIdLmVjb25hLn'
    'NoYXJlZC5TaWduZWRJbWFnZVVybHNSFmN1cnJlbnRTaWduZWRJbWFnZVVybHMSWAoZcGVuZGlu'
    'Z19zaWduZWRfaW1hZ2VfdXJscxgIIAEoCzIdLmVjb25hLnNoYXJlZC5TaWduZWRJbWFnZVVybH'
    'NSFnBlbmRpbmdTaWduZWRJbWFnZVVybHM=');

