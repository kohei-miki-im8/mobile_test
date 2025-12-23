import 'package:econa_mobile_app/domains/entities/registration.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/registration_step.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/master/regions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/google/protobuf/timestamp.pb.dart';

class RegistrationPageState {
  const RegistrationPageState({
    this.registrationStep,
    this.required = const RegistrationRequiredFields(),
    this.optional = const RegistrationOptionalCodes(),
    this.residenceRegion,
    this.tagCategories,
    this.tags,
    this.introductory,
    this.error,
  });

  final RegistrationStep? registrationStep;
  final RegistrationRequiredFields required;
  final RegistrationOptionalCodes optional;
  final Region? residenceRegion;
  final Set<int>? tagCategories;
  final Set<String>? tags;
  final String? introductory;
  final String? error;

  RegistrationPageState copyWith({
    RegistrationStep? registrationStep,
    RegistrationRequiredFields? required,
    RegistrationOptionalCodes? optional,
    Region? residenceRegion,
    Set<int>? tagCategories,
    Set<String>? tags,
    String? introductory,
    String? error,
  }) {
    return RegistrationPageState(
      registrationStep: registrationStep ?? this.registrationStep,
      required: required ?? this.required,
      optional: optional ?? this.optional,
      residenceRegion: residenceRegion ?? this.residenceRegion,
      tagCategories: tagCategories ?? this.tagCategories,
      tags: tags ?? this.tags,
      introductory: introductory ?? this.introductory,
      error: error,
    );
  }

  bool get isComplete => required.isComplete && residenceRegion != null;

  DateTime? get birthdayDateTime {
    final y = required.birthYear, m = required.birthMonth, d = required.birthDay;
    if (y == null || m == null || d == null) return null;
    return DateTime(y, m, d);
  }

  Timestamp? get birthdayTimestamp {
    final dateTime = birthdayDateTime;
    if (dateTime == null) return null;
    return Timestamp.fromDateTime(dateTime);
  }

  GenderCode? get genderCodeAsEnum {
    final index = required.genderIndex;
    if (index == null) return null;
    return GenderCode.values.elementAtOrNull(index) ?? GenderCode.GENDER_CODE_UNSPECIFIED;
  }
}



