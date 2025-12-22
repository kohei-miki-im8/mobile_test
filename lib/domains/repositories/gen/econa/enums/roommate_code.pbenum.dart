//
//  Generated code. Do not modify.
//  source: econa/enums/roommate_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 同居人数コード
class RoommateCode extends $pb.ProtobufEnum {
  static const RoommateCode ROOMMATE_CODE_UNSPECIFIED = RoommateCode._(0, _omitEnumNames ? '' : 'ROOMMATE_CODE_UNSPECIFIED');
  static const RoommateCode ROOMMATE_CODE_LIVING_ALONE = RoommateCode._(1, _omitEnumNames ? '' : 'ROOMMATE_CODE_LIVING_ALONE');
  static const RoommateCode ROOMMATE_CODE_LIVING_WITH_PARENTS_AND_BROTHERS = RoommateCode._(2, _omitEnumNames ? '' : 'ROOMMATE_CODE_LIVING_WITH_PARENTS_AND_BROTHERS');
  static const RoommateCode ROOMMATE_CODE_LIVING_WITH_FRIENDS = RoommateCode._(3, _omitEnumNames ? '' : 'ROOMMATE_CODE_LIVING_WITH_FRIENDS');
  static const RoommateCode ROOMMATE_CODE_LIVING_WITH_PETS_DOG = RoommateCode._(4, _omitEnumNames ? '' : 'ROOMMATE_CODE_LIVING_WITH_PETS_DOG');
  static const RoommateCode ROOMMATE_CODE_LIVING_WITH_PETS_CAT = RoommateCode._(5, _omitEnumNames ? '' : 'ROOMMATE_CODE_LIVING_WITH_PETS_CAT');
  static const RoommateCode ROOMMATE_CODE_LIVING_WITH_PETS_OTHER = RoommateCode._(6, _omitEnumNames ? '' : 'ROOMMATE_CODE_LIVING_WITH_PETS_OTHER');

  static const $core.List<RoommateCode> values = <RoommateCode> [
    ROOMMATE_CODE_UNSPECIFIED,
    ROOMMATE_CODE_LIVING_ALONE,
    ROOMMATE_CODE_LIVING_WITH_PARENTS_AND_BROTHERS,
    ROOMMATE_CODE_LIVING_WITH_FRIENDS,
    ROOMMATE_CODE_LIVING_WITH_PETS_DOG,
    ROOMMATE_CODE_LIVING_WITH_PETS_CAT,
    ROOMMATE_CODE_LIVING_WITH_PETS_OTHER,
  ];

  static final $core.Map<$core.int, RoommateCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RoommateCode? valueOf($core.int value) => _byValue[value];

  const RoommateCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
