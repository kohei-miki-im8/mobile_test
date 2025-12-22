//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_points.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;

/// ユーザーポイント取得リクエスト
class GetUserPointsRequest extends $pb.GeneratedMessage {
  factory GetUserPointsRequest() => create();
  GetUserPointsRequest._() : super();
  factory GetUserPointsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserPointsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserPointsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserPointsRequest clone() => GetUserPointsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserPointsRequest copyWith(void Function(GetUserPointsRequest) updates) => super.copyWith((message) => updates(message as GetUserPointsRequest)) as GetUserPointsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserPointsRequest create() => GetUserPointsRequest._();
  GetUserPointsRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserPointsRequest> createRepeated() => $pb.PbList<GetUserPointsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserPointsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserPointsRequest>(create);
  static GetUserPointsRequest? _defaultInstance;
}

/// ユーザーポイント取得レスポンス
class GetUserPointsResponse extends $pb.GeneratedMessage {
  factory GetUserPointsResponse({
    $core.int? freeLikePoint,
    $core.int? freeMatchingPoint,
    $core.int? freeLavigationPoint,
    $core.int? likePoint,
    $core.int? matchingPoint,
    $core.int? lavigationPoint,
    $109.Timestamp? nextBenefitGrantDate,
  }) {
    final $result = create();
    if (freeLikePoint != null) {
      $result.freeLikePoint = freeLikePoint;
    }
    if (freeMatchingPoint != null) {
      $result.freeMatchingPoint = freeMatchingPoint;
    }
    if (freeLavigationPoint != null) {
      $result.freeLavigationPoint = freeLavigationPoint;
    }
    if (likePoint != null) {
      $result.likePoint = likePoint;
    }
    if (matchingPoint != null) {
      $result.matchingPoint = matchingPoint;
    }
    if (lavigationPoint != null) {
      $result.lavigationPoint = lavigationPoint;
    }
    if (nextBenefitGrantDate != null) {
      $result.nextBenefitGrantDate = nextBenefitGrantDate;
    }
    return $result;
  }
  GetUserPointsResponse._() : super();
  factory GetUserPointsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserPointsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserPointsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'freeLikePoint', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'freeMatchingPoint', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'freeLavigationPoint', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'likePoint', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'matchingPoint', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'lavigationPoint', $pb.PbFieldType.O3)
    ..aOM<$109.Timestamp>(7, _omitFieldNames ? '' : 'nextBenefitGrantDate', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserPointsResponse clone() => GetUserPointsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserPointsResponse copyWith(void Function(GetUserPointsResponse) updates) => super.copyWith((message) => updates(message as GetUserPointsResponse)) as GetUserPointsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserPointsResponse create() => GetUserPointsResponse._();
  GetUserPointsResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserPointsResponse> createRepeated() => $pb.PbList<GetUserPointsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserPointsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserPointsResponse>(create);
  static GetUserPointsResponse? _defaultInstance;

  /// イイネポイント(無料分)
  @$pb.TagNumber(1)
  $core.int get freeLikePoint => $_getIZ(0);
  @$pb.TagNumber(1)
  set freeLikePoint($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFreeLikePoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearFreeLikePoint() => clearField(1);

  /// マッチングポイント(無料分)
  @$pb.TagNumber(2)
  $core.int get freeMatchingPoint => $_getIZ(1);
  @$pb.TagNumber(2)
  set freeMatchingPoint($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFreeMatchingPoint() => $_has(1);
  @$pb.TagNumber(2)
  void clearFreeMatchingPoint() => clearField(2);

  /// ラヴィゲーションポイント(無料分)
  @$pb.TagNumber(3)
  $core.int get freeLavigationPoint => $_getIZ(2);
  @$pb.TagNumber(3)
  set freeLavigationPoint($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFreeLavigationPoint() => $_has(2);
  @$pb.TagNumber(3)
  void clearFreeLavigationPoint() => clearField(3);

  /// イイネポイント
  @$pb.TagNumber(4)
  $core.int get likePoint => $_getIZ(3);
  @$pb.TagNumber(4)
  set likePoint($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLikePoint() => $_has(3);
  @$pb.TagNumber(4)
  void clearLikePoint() => clearField(4);

  /// マッチングポイント
  @$pb.TagNumber(5)
  $core.int get matchingPoint => $_getIZ(4);
  @$pb.TagNumber(5)
  set matchingPoint($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMatchingPoint() => $_has(4);
  @$pb.TagNumber(5)
  void clearMatchingPoint() => clearField(5);

  /// ラヴィゲーションポイント
  @$pb.TagNumber(6)
  $core.int get lavigationPoint => $_getIZ(5);
  @$pb.TagNumber(6)
  set lavigationPoint($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLavigationPoint() => $_has(5);
  @$pb.TagNumber(6)
  void clearLavigationPoint() => clearField(6);

  /// 次回ベネフィット付与日
  /// - サブスクリプション契約中: 次回の月次ポイント付与予定日
  /// - 最終回付与後: null
  /// - サブスクリプション期限切れ: null
  /// - Freeユーザー: アカウント作成日基準の次回付与日
  @$pb.TagNumber(7)
  $109.Timestamp get nextBenefitGrantDate => $_getN(6);
  @$pb.TagNumber(7)
  set nextBenefitGrantDate($109.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasNextBenefitGrantDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearNextBenefitGrantDate() => clearField(7);
  @$pb.TagNumber(7)
  $109.Timestamp ensureNextBenefitGrantDate() => $_ensure(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
