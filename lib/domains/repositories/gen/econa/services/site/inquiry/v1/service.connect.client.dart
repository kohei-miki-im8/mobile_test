//
//  Generated code. Do not modify.
//  source: econa/services/site/inquiry/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_user_inquiry.pb.dart" as econaservicessiteinquiryv1create_user_inquiry;
import "service.connect.spec.dart" as specs;
import "get_violation_categories.pb.dart" as econaservicessiteinquiryv1get_violation_categories;
import "respond_to_disciplinary_action.pb.dart" as econaservicessiteinquiryv1respond_to_disciplinary_action;

/// 通報・問い合わせサービス
extension type InquiryServiceClient (connect.Transport _transport) {
  /// CreateUserInquiry:通報を作成する
  Future<econaservicessiteinquiryv1create_user_inquiry.CreateUserInquiryResponse> createUserInquiry(
    econaservicessiteinquiryv1create_user_inquiry.CreateUserInquiryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.InquiryService.createUserInquiry,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetViolationCategories:違反カテゴリ一覧を取得する
  Future<econaservicessiteinquiryv1get_violation_categories.GetViolationCategoriesResponse> getViolationCategories(
    econaservicessiteinquiryv1get_violation_categories.GetViolationCategoriesRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.InquiryService.getViolationCategories,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// RespondToDisciplinaryAction:懲戒処分に応答する（警告への同意/不同意）
  Future<econaservicessiteinquiryv1respond_to_disciplinary_action.RespondToDisciplinaryActionResponse> respondToDisciplinaryAction(
    econaservicessiteinquiryv1respond_to_disciplinary_action.RespondToDisciplinaryActionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.InquiryService.respondToDisciplinaryAction,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
