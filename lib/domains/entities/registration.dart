import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/body_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_desire_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_situation_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/holiday_type_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/marital_history_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/marriage_aspiration_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/occupation_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/salary_range_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/smoking_code.pbenum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/master/regions.pb.dart';

part 'registration.freezed.dart';

@freezed
abstract class RegistrationRequiredFields with _$RegistrationRequiredFields {
  const factory RegistrationRequiredFields({
    int? genderIndex,
    int? birthYear,
    int? birthMonth,
    int? birthDay,
    String? nickname,
    Region? residenceRegion,
  }) = _RegistrationRequiredFields;

  const RegistrationRequiredFields._();

  bool get isComplete =>
      genderIndex != null &&
      birthYear != null &&
      birthMonth != null &&
      birthDay != null &&
      (nickname?.trim().isNotEmpty ?? false) &&
      residenceRegion != null;
}

@freezed
abstract class RegistrationOptionalCodes with _$RegistrationOptionalCodes {
  const factory RegistrationOptionalCodes({
    int? height,
    BodyTypeCode? bodyTypeCode,
    OccupationCode? occupationCode,
    SalaryRangeCode? salaryRangeCode,
    MaritalHistoryCode? maritalHistoryCode,
    ChildSituationCode? childSituationCode,
    HolidayTypeCode? holidayTypeCode,
    SmokingCode? smokingCode,
    MarriageAspirationCode? marriageAspirationCode,
    ChildDesireCode? childDesireCode,
  }) = _RegistrationOptionalCodes;
}
