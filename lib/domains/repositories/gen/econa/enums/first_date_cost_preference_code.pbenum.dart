//
//  Generated code. Do not modify.
//  source: econa/enums/first_date_cost_preference_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 初回デート費用負担の希望
class FirstDateCostPreferenceCode extends $pb.ProtobufEnum {
  static const FirstDateCostPreferenceCode FIRST_DATE_COST_PREFERENCE_CODE_UNSPECIFIED = FirstDateCostPreferenceCode._(0, _omitEnumNames ? '' : 'FIRST_DATE_COST_PREFERENCE_CODE_UNSPECIFIED');
  static const FirstDateCostPreferenceCode FIRST_DATE_COST_PREFERENCE_CODE_SPLIT_EQUALLY = FirstDateCostPreferenceCode._(1, _omitEnumNames ? '' : 'FIRST_DATE_COST_PREFERENCE_CODE_SPLIT_EQUALLY');
  static const FirstDateCostPreferenceCode FIRST_DATE_COST_PREFERENCE_CODE_I_PAY_ALL = FirstDateCostPreferenceCode._(2, _omitEnumNames ? '' : 'FIRST_DATE_COST_PREFERENCE_CODE_I_PAY_ALL');
  static const FirstDateCostPreferenceCode FIRST_DATE_COST_PREFERENCE_CODE_I_PAY_MORE = FirstDateCostPreferenceCode._(3, _omitEnumNames ? '' : 'FIRST_DATE_COST_PREFERENCE_CODE_I_PAY_MORE');
  static const FirstDateCostPreferenceCode FIRST_DATE_COST_PREFERENCE_CODE_PARTNER_PAY_ALL = FirstDateCostPreferenceCode._(4, _omitEnumNames ? '' : 'FIRST_DATE_COST_PREFERENCE_CODE_PARTNER_PAY_ALL');
  static const FirstDateCostPreferenceCode FIRST_DATE_COST_PREFERENCE_CODE_PARTNER_PAY_MORE = FirstDateCostPreferenceCode._(5, _omitEnumNames ? '' : 'FIRST_DATE_COST_PREFERENCE_CODE_PARTNER_PAY_MORE');
  static const FirstDateCostPreferenceCode FIRST_DATE_COST_PREFERENCE_CODE_WEALTHIER_PAYS = FirstDateCostPreferenceCode._(6, _omitEnumNames ? '' : 'FIRST_DATE_COST_PREFERENCE_CODE_WEALTHIER_PAYS');
  static const FirstDateCostPreferenceCode FIRST_DATE_COST_PREFERENCE_CODE_DISCUSS_WITH_PARTNER = FirstDateCostPreferenceCode._(7, _omitEnumNames ? '' : 'FIRST_DATE_COST_PREFERENCE_CODE_DISCUSS_WITH_PARTNER');

  static const $core.List<FirstDateCostPreferenceCode> values = <FirstDateCostPreferenceCode> [
    FIRST_DATE_COST_PREFERENCE_CODE_UNSPECIFIED,
    FIRST_DATE_COST_PREFERENCE_CODE_SPLIT_EQUALLY,
    FIRST_DATE_COST_PREFERENCE_CODE_I_PAY_ALL,
    FIRST_DATE_COST_PREFERENCE_CODE_I_PAY_MORE,
    FIRST_DATE_COST_PREFERENCE_CODE_PARTNER_PAY_ALL,
    FIRST_DATE_COST_PREFERENCE_CODE_PARTNER_PAY_MORE,
    FIRST_DATE_COST_PREFERENCE_CODE_WEALTHIER_PAYS,
    FIRST_DATE_COST_PREFERENCE_CODE_DISCUSS_WITH_PARTNER,
  ];

  static final $core.Map<$core.int, FirstDateCostPreferenceCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FirstDateCostPreferenceCode? valueOf($core.int value) => _byValue[value];

  const FirstDateCostPreferenceCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
