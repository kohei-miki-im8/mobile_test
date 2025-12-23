//
//  Generated code. Do not modify.
//  source: econa/shared/admin/single_certificate_statistics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// SingleCertificateStatistics 審査統計
class SingleCertificateStatistics extends $pb.GeneratedMessage {
  factory SingleCertificateStatistics({
    $core.int? totalReviewed,
    $core.int? approvedCount,
    $core.int? rejectedCount,
    $core.double? approvalRate,
    $core.Map<$core.String, $core.int>? rejectionReasons,
  }) {
    final $result = create();
    if (totalReviewed != null) {
      $result.totalReviewed = totalReviewed;
    }
    if (approvedCount != null) {
      $result.approvedCount = approvedCount;
    }
    if (rejectedCount != null) {
      $result.rejectedCount = rejectedCount;
    }
    if (approvalRate != null) {
      $result.approvalRate = approvalRate;
    }
    if (rejectionReasons != null) {
      $result.rejectionReasons.addAll(rejectionReasons);
    }
    return $result;
  }
  SingleCertificateStatistics._() : super();
  factory SingleCertificateStatistics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SingleCertificateStatistics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SingleCertificateStatistics', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared.admin'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'totalReviewed', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'approvedCount', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'rejectedCount', $pb.PbFieldType.O3)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'approvalRate', $pb.PbFieldType.OD)
    ..m<$core.String, $core.int>(5, _omitFieldNames ? '' : 'rejectionReasons', entryClassName: 'SingleCertificateStatistics.RejectionReasonsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O3, packageName: const $pb.PackageName('econa.shared.admin'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SingleCertificateStatistics clone() => SingleCertificateStatistics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SingleCertificateStatistics copyWith(void Function(SingleCertificateStatistics) updates) => super.copyWith((message) => updates(message as SingleCertificateStatistics)) as SingleCertificateStatistics;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SingleCertificateStatistics create() => SingleCertificateStatistics._();
  SingleCertificateStatistics createEmptyInstance() => create();
  static $pb.PbList<SingleCertificateStatistics> createRepeated() => $pb.PbList<SingleCertificateStatistics>();
  @$core.pragma('dart2js:noInline')
  static SingleCertificateStatistics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SingleCertificateStatistics>(create);
  static SingleCertificateStatistics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalReviewed => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalReviewed($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalReviewed() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalReviewed() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get approvedCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set approvedCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApprovedCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearApprovedCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rejectedCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set rejectedCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRejectedCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearRejectedCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get approvalRate => $_getN(3);
  @$pb.TagNumber(4)
  set approvalRate($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasApprovalRate() => $_has(3);
  @$pb.TagNumber(4)
  void clearApprovalRate() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.int> get rejectionReasons => $_getMap(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
