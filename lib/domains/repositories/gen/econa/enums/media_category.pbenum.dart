//
//  Generated code. Do not modify.
//  source: econa/enums/media_category.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 写真カテゴリ
class MediaCategory extends $pb.ProtobufEnum {
  static const MediaCategory MEDIA_CATEGORY_UNSPECIFIED = MediaCategory._(0, _omitEnumNames ? '' : 'MEDIA_CATEGORY_UNSPECIFIED');
  static const MediaCategory MEDIA_CATEGORY_PROFILE_PHOTO = MediaCategory._(1, _omitEnumNames ? '' : 'MEDIA_CATEGORY_PROFILE_PHOTO');
  static const MediaCategory MEDIA_CATEGORY_CHAT_PHOTO = MediaCategory._(2, _omitEnumNames ? '' : 'MEDIA_CATEGORY_CHAT_PHOTO');
  static const MediaCategory MEDIA_CATEGORY_IDENTITY_PHOTO = MediaCategory._(3, _omitEnumNames ? '' : 'MEDIA_CATEGORY_IDENTITY_PHOTO');
  static const MediaCategory MEDIA_CATEGORY_SINGLE_CERTIFICATE_PHOTO = MediaCategory._(4, _omitEnumNames ? '' : 'MEDIA_CATEGORY_SINGLE_CERTIFICATE_PHOTO');
  static const MediaCategory MEDIA_CATEGORY_INQUIRY_EVIDENCE_PHOTO = MediaCategory._(5, _omitEnumNames ? '' : 'MEDIA_CATEGORY_INQUIRY_EVIDENCE_PHOTO');
  static const MediaCategory MEDIA_CATEGORY_INTRODUCTORY_VOICE = MediaCategory._(6, _omitEnumNames ? '' : 'MEDIA_CATEGORY_INTRODUCTORY_VOICE');

  static const $core.List<MediaCategory> values = <MediaCategory> [
    MEDIA_CATEGORY_UNSPECIFIED,
    MEDIA_CATEGORY_PROFILE_PHOTO,
    MEDIA_CATEGORY_CHAT_PHOTO,
    MEDIA_CATEGORY_IDENTITY_PHOTO,
    MEDIA_CATEGORY_SINGLE_CERTIFICATE_PHOTO,
    MEDIA_CATEGORY_INQUIRY_EVIDENCE_PHOTO,
    MEDIA_CATEGORY_INTRODUCTORY_VOICE,
  ];

  static final $core.Map<$core.int, MediaCategory> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MediaCategory? valueOf($core.int value) => _byValue[value];

  const MediaCategory._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
