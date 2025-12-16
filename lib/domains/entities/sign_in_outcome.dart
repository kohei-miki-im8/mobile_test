import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_outcome.freezed.dart';

/// サインイン結果を表すドメインエンティティ
@freezed
abstract class SignInOutcome with _$SignInOutcome {
  const factory SignInOutcome({
    required String userId,
    required bool isNewUser,
  }) = _SignInOutcome;
}


