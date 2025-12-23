import 'package:econa_mobile_app/domains/repositories/gen/google/protobuf/timestamp.pb.dart';

/// 生年月日から年齢（数値）を返す
int calculateAge(Timestamp birthday) {
  final birthDate = birthday.toDateTime();
  final today = DateTime.now();
  var years = today.year - birthDate.year;
  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    years--;
  }
  return years;
}

/// 年齢表示（日本語, 例: 28歳）を返す
String calculateAgeJp(Timestamp birthday) {
  final years = calculateAge(birthday);
  return '$years歳';
}
