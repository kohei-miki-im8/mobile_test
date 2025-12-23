//
//  Generated code. Do not modify.
//  source: econa/enums/image_data_access_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 画像データアクセス種別
class ImageDataAccessType extends $pb.ProtobufEnum {
  static const ImageDataAccessType IMAGE_DATA_ACCESS_TYPE_UNSPECIFIED = ImageDataAccessType._(0, _omitEnumNames ? '' : 'IMAGE_DATA_ACCESS_TYPE_UNSPECIFIED');
  static const ImageDataAccessType IMAGE_DATA_ACCESS_TYPE_SIGNED_URL = ImageDataAccessType._(1, _omitEnumNames ? '' : 'IMAGE_DATA_ACCESS_TYPE_SIGNED_URL');
  static const ImageDataAccessType IMAGE_DATA_ACCESS_TYPE_PRIVATE_GCS_BUCKET = ImageDataAccessType._(2, _omitEnumNames ? '' : 'IMAGE_DATA_ACCESS_TYPE_PRIVATE_GCS_BUCKET');

  static const $core.List<ImageDataAccessType> values = <ImageDataAccessType> [
    IMAGE_DATA_ACCESS_TYPE_UNSPECIFIED,
    IMAGE_DATA_ACCESS_TYPE_SIGNED_URL,
    IMAGE_DATA_ACCESS_TYPE_PRIVATE_GCS_BUCKET,
  ];

  static final $core.Map<$core.int, ImageDataAccessType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ImageDataAccessType? valueOf($core.int value) => _byValue[value];

  const ImageDataAccessType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
