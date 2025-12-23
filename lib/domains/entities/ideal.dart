import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/blood_type_code.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/body_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/salary_range_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/advice/v1/get_ideal.pb.dart'
    as proto;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ideal.freezed.dart';

@freezed
abstract class IdealUserPersonality with _$IdealUserPersonality {
  const factory IdealUserPersonality({
    required int medianAge,
    required int medianHeight,
    required BodyTypeCode? bodyTypeCode,
    required SalaryRangeCode? salaryRangeCode,
  }) = _IdealUserPersonality;

  factory IdealUserPersonality.fromProto(
          proto.GetIdealResponse_UserSimplifiedPersonality p,) =>
      IdealUserPersonality(
        medianAge: p.medianAge,
        medianHeight: p.medianHeight,
        bodyTypeCode: p.hasBodyType() ? p.bodyType : null,
        salaryRangeCode: p.hasSalaryRange() ? p.salaryRange : null,
      );
}

@freezed
abstract class IdealAdvice with _$IdealAdvice {
  const factory IdealAdvice({
    required String adviceMessage,
    required IdealUserPersonality? userSimplifiedPersonality,
    required IdealUserPersonality? toUserSimplifiedPersonality,
    required IdealUserPersonality? sameGenderSameGenerationIdealPersonality,
  }) = _IdealAdvice;

  factory IdealAdvice.fromProto(proto.GetIdealResponse p) => IdealAdvice(
        adviceMessage: p.adviceMessage,
        userSimplifiedPersonality: p.hasUserSimplifiedPersonality()
            ? IdealUserPersonality.fromProto(p.userSimplifiedPersonality)
            : null,
        toUserSimplifiedPersonality: p.hasToUserSimplifiedPersonality()
            ? IdealUserPersonality.fromProto(p.toUserSimplifiedPersonality)
            : null,
        sameGenderSameGenerationIdealPersonality:
            p.hasSameGenderSameGenerationIdealPersonality()
                ? IdealUserPersonality.fromProto(
                    p.sameGenderSameGenerationIdealPersonality,)
                : null,
      );
}
