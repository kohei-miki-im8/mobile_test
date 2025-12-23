//
//  Generated code. Do not modify.
//  source: econa/enums/ekyc_trail_image_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// eKYC証跡画像種別
class EKYCTrailImageType extends $pb.ProtobufEnum {
  static const EKYCTrailImageType EKYC_TRAIL_IMAGE_TYPE_UNSPECIFIED = EKYCTrailImageType._(0, _omitEnumNames ? '' : 'EKYC_TRAIL_IMAGE_TYPE_UNSPECIFIED');
  static const EKYCTrailImageType EKYC_TRAIL_IMAGE_TYPE_FACE = EKYCTrailImageType._(1, _omitEnumNames ? '' : 'EKYC_TRAIL_IMAGE_TYPE_FACE');
  static const EKYCTrailImageType EKYC_TRAIL_IMAGE_TYPE_CARD_FRONT = EKYCTrailImageType._(2, _omitEnumNames ? '' : 'EKYC_TRAIL_IMAGE_TYPE_CARD_FRONT');
  static const EKYCTrailImageType EKYC_TRAIL_IMAGE_TYPE_CARD_BACK = EKYCTrailImageType._(3, _omitEnumNames ? '' : 'EKYC_TRAIL_IMAGE_TYPE_CARD_BACK');
  static const EKYCTrailImageType EKYC_TRAIL_IMAGE_TYPE_CARD_THICKNESS = EKYCTrailImageType._(4, _omitEnumNames ? '' : 'EKYC_TRAIL_IMAGE_TYPE_CARD_THICKNESS');

  static const $core.List<EKYCTrailImageType> values = <EKYCTrailImageType> [
    EKYC_TRAIL_IMAGE_TYPE_UNSPECIFIED,
    EKYC_TRAIL_IMAGE_TYPE_FACE,
    EKYC_TRAIL_IMAGE_TYPE_CARD_FRONT,
    EKYC_TRAIL_IMAGE_TYPE_CARD_BACK,
    EKYC_TRAIL_IMAGE_TYPE_CARD_THICKNESS,
  ];

  static final $core.Map<$core.int, EKYCTrailImageType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EKYCTrailImageType? valueOf($core.int value) => _byValue[value];

  const EKYCTrailImageType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
