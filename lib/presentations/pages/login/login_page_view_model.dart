import 'package:econa_mobile_app/domains/entities/sign_in_outcome.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/presentations/pages/login/login_page_state.dart';
import 'package:econa_mobile_app/presentations/shared/users/user_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_page_view_model.g.dart';

@riverpod
class LoginPageViewModel extends _$LoginPageViewModel {
  @override
  Future<LoginPageState> build() async {
    return const LoginPageState();
  }

  Future<void> _cacheUserIdAfterSignIn() async {
    final userViewModelNotifier = ref.read(userViewModelProvider.notifier);
    final userStatus = await userViewModelNotifier.getUserStatus(GetUserStatusRequest());
    final userId = userStatus?.userId;
    if (userId != null) {
      ref.read(authRepositoryProvider).cacheUserId(userId);
    }
  }

  Future<SignInOutcome?> signInWithLine() async {
    state = const AsyncData(LoginPageState(isLoading: true));
    try {
      final auth = ref.read(authRepositoryProvider);
      final credential = await auth.signInWithLine();
      final user = credential.user;
      if (user == null) {
        state = const AsyncData(LoginPageState(error: 'LINEサインインに失敗しました'));
        await auth.signOut();
        return null;
      }
      await _cacheUserIdAfterSignIn();
      final isNew = credential.additionalUserInfo?.isNewUser ?? false;
      state = const AsyncData(LoginPageState());
      return SignInOutcome(userId: user.uid, isNewUser: isNew);
    } on FirebaseAuthException catch (e) {
      state = AsyncData(LoginPageState(error: 'LINEサインイン失敗: ${e.code}'));
      return null;
    } on Exception catch (e) {
      state = AsyncData(LoginPageState(error: 'LINEサインイン失敗: $e'));
      return null;
    }
  }

  Future<SignInOutcome?> signInWithGoogle() async {
    state = const AsyncData(LoginPageState(isLoading: true));
    try {
      final auth = ref.read(authRepositoryProvider);
      final credential = await auth.signInWithGoogle();
      final user = credential.user;
      if (user == null) {
        state = const AsyncData(LoginPageState(error: 'Googleサインインに失敗しました'));
        return null;
      }
      await _cacheUserIdAfterSignIn();
      final isNew = credential.additionalUserInfo?.isNewUser ?? false;
      state = const AsyncData(LoginPageState());
      return SignInOutcome(userId: user.uid, isNewUser: isNew);
    } on FirebaseAuthException catch (e) {
      state = AsyncData(LoginPageState(error: 'Googleサインイン失敗: ${e.code}'));
      return null;
    } on Exception catch (e) {
      state = AsyncData(LoginPageState(error: 'Googleサインイン失敗: $e'));
      return null;
    }
  }

  Future<SignInOutcome?> signInWithApple() async {
    state = const AsyncData(LoginPageState(isLoading: true));
    try {
      final auth = ref.read(authRepositoryProvider);
      final credential = await auth.signInWithApple();
      final user = credential.user;
      if (user == null) {
        state = const AsyncData(LoginPageState(error: 'Appleサインインに失敗しました'));
        return null;
      }
      await _cacheUserIdAfterSignIn();
      final isNew = credential.additionalUserInfo?.isNewUser ?? false;
      state = const AsyncData(LoginPageState());
      return SignInOutcome(userId: user.uid, isNewUser: isNew);
    } on FirebaseAuthException catch (e) {
      state = AsyncData(LoginPageState(error: 'Appleサインイン失敗: ${e.code}'));
      return null;
    } on Exception catch (e) {
      state = AsyncData(LoginPageState(error: 'Appleサインイン失敗: $e'));
      return null;
    }
  }
}


