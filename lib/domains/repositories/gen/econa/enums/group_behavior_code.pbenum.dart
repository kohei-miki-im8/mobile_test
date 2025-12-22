//
//  Generated code. Do not modify.
//  source: econa/enums/group_behavior_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// グループ行動コード
class GroupBehaviorCode extends $pb.ProtobufEnum {
  static const GroupBehaviorCode GROUP_BEHAVIOR_CODE_UNSPECIFIED = GroupBehaviorCode._(0, _omitEnumNames ? '' : 'GROUP_BEHAVIOR_CODE_UNSPECIFIED');
  static const GroupBehaviorCode GROUP_BEHAVIOR_CODE_LARGE_GROUPS = GroupBehaviorCode._(1, _omitEnumNames ? '' : 'GROUP_BEHAVIOR_CODE_LARGE_GROUPS');
  static const GroupBehaviorCode GROUP_BEHAVIOR_CODE_SMALL_GROUPS = GroupBehaviorCode._(2, _omitEnumNames ? '' : 'GROUP_BEHAVIOR_CODE_SMALL_GROUPS');
  static const GroupBehaviorCode GROUP_BEHAVIOR_CODE_ONE_PERSON = GroupBehaviorCode._(3, _omitEnumNames ? '' : 'GROUP_BEHAVIOR_CODE_ONE_PERSON');

  static const $core.List<GroupBehaviorCode> values = <GroupBehaviorCode> [
    GROUP_BEHAVIOR_CODE_UNSPECIFIED,
    GROUP_BEHAVIOR_CODE_LARGE_GROUPS,
    GROUP_BEHAVIOR_CODE_SMALL_GROUPS,
    GROUP_BEHAVIOR_CODE_ONE_PERSON,
  ];

  static final $core.Map<$core.int, GroupBehaviorCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GroupBehaviorCode? valueOf($core.int value) => _byValue[value];

  const GroupBehaviorCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
