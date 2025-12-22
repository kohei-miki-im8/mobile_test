//
//  Generated code. Do not modify.
//  source: econa/services/site/inquiry/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_user_inquiry.pb.dart" as econaservicessiteinquiryv1create_user_inquiry;
import "get_violation_categories.pb.dart" as econaservicessiteinquiryv1get_violation_categories;
import "respond_to_disciplinary_action.pb.dart" as econaservicessiteinquiryv1respond_to_disciplinary_action;

/// 通報・問い合わせサービス
abstract final class InquiryService {
  /// Fully-qualified name of the InquiryService service.
  static const name = 'econa.services.site.inquiry.v1.InquiryService';

  /// CreateUserInquiry:通報を作成する
  static const createUserInquiry = connect.Spec(
    '/$name/CreateUserInquiry',
    connect.StreamType.unary,
    econaservicessiteinquiryv1create_user_inquiry.CreateUserInquiryRequest.new,
    econaservicessiteinquiryv1create_user_inquiry.CreateUserInquiryResponse.new,
  );

  /// GetViolationCategories:違反カテゴリ一覧を取得する
  static const getViolationCategories = connect.Spec(
    '/$name/GetViolationCategories',
    connect.StreamType.unary,
    econaservicessiteinquiryv1get_violation_categories.GetViolationCategoriesRequest.new,
    econaservicessiteinquiryv1get_violation_categories.GetViolationCategoriesResponse.new,
  );

  /// RespondToDisciplinaryAction:懲戒処分に応答する（警告への同意/不同意）
  static const respondToDisciplinaryAction = connect.Spec(
    '/$name/RespondToDisciplinaryAction',
    connect.StreamType.unary,
    econaservicessiteinquiryv1respond_to_disciplinary_action.RespondToDisciplinaryActionRequest.new,
    econaservicessiteinquiryv1respond_to_disciplinary_action.RespondToDisciplinaryActionResponse.new,
  );
}
