//
//  Generated code. Do not modify.
//  source: econa/enums/ai_agent_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// AIエージェントコード
class AiAgentCode extends $pb.ProtobufEnum {
  static const AiAgentCode AI_AGENT_CODE_UNSPECIFIED = AiAgentCode._(0, _omitEnumNames ? '' : 'AI_AGENT_CODE_UNSPECIFIED');
  static const AiAgentCode AI_AGENT_CODE_QUESTION_CHECKER = AiAgentCode._(1, _omitEnumNames ? '' : 'AI_AGENT_CODE_QUESTION_CHECKER');
  static const AiAgentCode AI_AGENT_CODE_AI_COUNSELOR = AiAgentCode._(2, _omitEnumNames ? '' : 'AI_AGENT_CODE_AI_COUNSELOR');
  static const AiAgentCode AI_AGENT_CODE_CHAT_SIMULATOR = AiAgentCode._(3, _omitEnumNames ? '' : 'AI_AGENT_CODE_CHAT_SIMULATOR');
  static const AiAgentCode AI_AGENT_CODE_AFFINITY_RECOMMENDER = AiAgentCode._(4, _omitEnumNames ? '' : 'AI_AGENT_CODE_AFFINITY_RECOMMENDER');
  static const AiAgentCode AI_AGENT_CODE_PERSONA_GREETING = AiAgentCode._(5, _omitEnumNames ? '' : 'AI_AGENT_CODE_PERSONA_GREETING');
  static const AiAgentCode AI_AGENT_CODE_PERSONA_REPLY = AiAgentCode._(6, _omitEnumNames ? '' : 'AI_AGENT_CODE_PERSONA_REPLY');
  static const AiAgentCode AI_AGENT_CODE_IDEAL_ADVISER = AiAgentCode._(7, _omitEnumNames ? '' : 'AI_AGENT_CODE_IDEAL_ADVISER');
  static const AiAgentCode AI_AGENT_CODE_APPROACH_ADVISER = AiAgentCode._(8, _omitEnumNames ? '' : 'AI_AGENT_CODE_APPROACH_ADVISER');
  static const AiAgentCode AI_AGENT_CODE_DATE_SUGGESTER = AiAgentCode._(9, _omitEnumNames ? '' : 'AI_AGENT_CODE_DATE_SUGGESTER');
  static const AiAgentCode AI_AGENT_CODE_PERSONA_SUMMARIZER = AiAgentCode._(10, _omitEnumNames ? '' : 'AI_AGENT_CODE_PERSONA_SUMMARIZER');
  static const AiAgentCode AI_AGENT_CODE_TONE_SUMMARIZER = AiAgentCode._(11, _omitEnumNames ? '' : 'AI_AGENT_CODE_TONE_SUMMARIZER');
  static const AiAgentCode AI_AGENT_CODE_MESSAGE_MODERATOR = AiAgentCode._(12, _omitEnumNames ? '' : 'AI_AGENT_CODE_MESSAGE_MODERATOR');
  static const AiAgentCode AI_AGENT_CODE_IMAGE_ANNOTATOR = AiAgentCode._(13, _omitEnumNames ? '' : 'AI_AGENT_CODE_IMAGE_ANNOTATOR');
  static const AiAgentCode AI_AGENT_CODE_TOPIC_GENERATOR = AiAgentCode._(14, _omitEnumNames ? '' : 'AI_AGENT_CODE_TOPIC_GENERATOR');

  static const $core.List<AiAgentCode> values = <AiAgentCode> [
    AI_AGENT_CODE_UNSPECIFIED,
    AI_AGENT_CODE_QUESTION_CHECKER,
    AI_AGENT_CODE_AI_COUNSELOR,
    AI_AGENT_CODE_CHAT_SIMULATOR,
    AI_AGENT_CODE_AFFINITY_RECOMMENDER,
    AI_AGENT_CODE_PERSONA_GREETING,
    AI_AGENT_CODE_PERSONA_REPLY,
    AI_AGENT_CODE_IDEAL_ADVISER,
    AI_AGENT_CODE_APPROACH_ADVISER,
    AI_AGENT_CODE_DATE_SUGGESTER,
    AI_AGENT_CODE_PERSONA_SUMMARIZER,
    AI_AGENT_CODE_TONE_SUMMARIZER,
    AI_AGENT_CODE_MESSAGE_MODERATOR,
    AI_AGENT_CODE_IMAGE_ANNOTATOR,
    AI_AGENT_CODE_TOPIC_GENERATOR,
  ];

  static final $core.Map<$core.int, AiAgentCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AiAgentCode? valueOf($core.int value) => _byValue[value];

  const AiAgentCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
