//
//  Generated code. Do not modify.
//  source: econa/enums/first_date_location_preference_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 初デート場所コード
class FirstDateLocationPreferenceCode extends $pb.ProtobufEnum {
  static const FirstDateLocationPreferenceCode FIRST_DATE_LOCATION_PREFERENCE_CODE_UNSPECIFIED = FirstDateLocationPreferenceCode._(0, _omitEnumNames ? '' : 'FIRST_DATE_LOCATION_PREFERENCE_CODE_UNSPECIFIED');
  static const FirstDateLocationPreferenceCode FIRST_DATE_LOCATION_PREFERENCE_CODE_PARK = FirstDateLocationPreferenceCode._(1, _omitEnumNames ? '' : 'FIRST_DATE_LOCATION_PREFERENCE_CODE_PARK');
  static const FirstDateLocationPreferenceCode FIRST_DATE_LOCATION_PREFERENCE_CODE_CAFE = FirstDateLocationPreferenceCode._(2, _omitEnumNames ? '' : 'FIRST_DATE_LOCATION_PREFERENCE_CODE_CAFE');
  static const FirstDateLocationPreferenceCode FIRST_DATE_LOCATION_PREFERENCE_CODE_RESTAURANT = FirstDateLocationPreferenceCode._(3, _omitEnumNames ? '' : 'FIRST_DATE_LOCATION_PREFERENCE_CODE_RESTAURANT');
  static const FirstDateLocationPreferenceCode FIRST_DATE_LOCATION_PREFERENCE_CODE_MOVIE_THEATER = FirstDateLocationPreferenceCode._(4, _omitEnumNames ? '' : 'FIRST_DATE_LOCATION_PREFERENCE_CODE_MOVIE_THEATER');
  static const FirstDateLocationPreferenceCode FIRST_DATE_LOCATION_PREFERENCE_CODE_AMUSEMENT_PARK = FirstDateLocationPreferenceCode._(5, _omitEnumNames ? '' : 'FIRST_DATE_LOCATION_PREFERENCE_CODE_AMUSEMENT_PARK');
  static const FirstDateLocationPreferenceCode FIRST_DATE_LOCATION_PREFERENCE_CODE_MUSEUM = FirstDateLocationPreferenceCode._(6, _omitEnumNames ? '' : 'FIRST_DATE_LOCATION_PREFERENCE_CODE_MUSEUM');
  static const FirstDateLocationPreferenceCode FIRST_DATE_LOCATION_PREFERENCE_CODE_PARTNERS_CHOICE = FirstDateLocationPreferenceCode._(7, _omitEnumNames ? '' : 'FIRST_DATE_LOCATION_PREFERENCE_CODE_PARTNERS_CHOICE');

  static const $core.List<FirstDateLocationPreferenceCode> values = <FirstDateLocationPreferenceCode> [
    FIRST_DATE_LOCATION_PREFERENCE_CODE_UNSPECIFIED,
    FIRST_DATE_LOCATION_PREFERENCE_CODE_PARK,
    FIRST_DATE_LOCATION_PREFERENCE_CODE_CAFE,
    FIRST_DATE_LOCATION_PREFERENCE_CODE_RESTAURANT,
    FIRST_DATE_LOCATION_PREFERENCE_CODE_MOVIE_THEATER,
    FIRST_DATE_LOCATION_PREFERENCE_CODE_AMUSEMENT_PARK,
    FIRST_DATE_LOCATION_PREFERENCE_CODE_MUSEUM,
    FIRST_DATE_LOCATION_PREFERENCE_CODE_PARTNERS_CHOICE,
  ];

  static final $core.Map<$core.int, FirstDateLocationPreferenceCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FirstDateLocationPreferenceCode? valueOf($core.int value) => _byValue[value];

  const FirstDateLocationPreferenceCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
