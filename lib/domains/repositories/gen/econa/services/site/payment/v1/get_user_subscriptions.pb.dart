//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/get_user_subscriptions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/stripe.pb.dart' as $168;

/// 契約中のサブスクリプション取得リクエスト
class GetUserSubscriptionsRequest extends $pb.GeneratedMessage {
  factory GetUserSubscriptionsRequest() => create();
  GetUserSubscriptionsRequest._() : super();
  factory GetUserSubscriptionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserSubscriptionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserSubscriptionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserSubscriptionsRequest clone() => GetUserSubscriptionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserSubscriptionsRequest copyWith(void Function(GetUserSubscriptionsRequest) updates) => super.copyWith((message) => updates(message as GetUserSubscriptionsRequest)) as GetUserSubscriptionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserSubscriptionsRequest create() => GetUserSubscriptionsRequest._();
  GetUserSubscriptionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserSubscriptionsRequest> createRepeated() => $pb.PbList<GetUserSubscriptionsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserSubscriptionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserSubscriptionsRequest>(create);
  static GetUserSubscriptionsRequest? _defaultInstance;
}

/// 契約中のサブスクリプション取得レスポンス
class GetUserSubscriptionsResponse extends $pb.GeneratedMessage {
  factory GetUserSubscriptionsResponse({
    $core.Iterable<$168.StripeSubscription>? subscriptions,
  }) {
    final $result = create();
    if (subscriptions != null) {
      $result.subscriptions.addAll(subscriptions);
    }
    return $result;
  }
  GetUserSubscriptionsResponse._() : super();
  factory GetUserSubscriptionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserSubscriptionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserSubscriptionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.payment.v1'), createEmptyInstance: create)
    ..pc<$168.StripeSubscription>(1, _omitFieldNames ? '' : 'subscriptions', $pb.PbFieldType.PM, subBuilder: $168.StripeSubscription.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserSubscriptionsResponse clone() => GetUserSubscriptionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserSubscriptionsResponse copyWith(void Function(GetUserSubscriptionsResponse) updates) => super.copyWith((message) => updates(message as GetUserSubscriptionsResponse)) as GetUserSubscriptionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserSubscriptionsResponse create() => GetUserSubscriptionsResponse._();
  GetUserSubscriptionsResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserSubscriptionsResponse> createRepeated() => $pb.PbList<GetUserSubscriptionsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserSubscriptionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserSubscriptionsResponse>(create);
  static GetUserSubscriptionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$168.StripeSubscription> get subscriptions => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
