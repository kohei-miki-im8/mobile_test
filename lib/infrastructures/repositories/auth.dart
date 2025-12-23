// Dart SDK
import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
// App
import 'package:econa_mobile_app/infrastructures/services/login_log_service.dart';
import 'package:econa_mobile_app/presentations/env.dart';
// Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
// サードパーティ
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nonce/nonce.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

/// Firebase Authentication用のリポジトリ
class AuthRepository {
  AuthRepository() : _auth = FirebaseAuth.instance {
    // 認証状態変更を監視してトークンを自動更新
    _auth.authStateChanges().listen(_updateAuthToken);
  }

  final FirebaseAuth _auth;
  String? _cachedIdToken;
  DateTime? _tokenExpiry;
  String? _cachedUserId;
  String? _verificationId;

  // ==================== ユーザー状態の取得 ====================

  /// 現在のユーザーを取得
  User? get currentUser => _auth.currentUser;

  /// ユーザーがログインしているかどうかを確認
  bool get isSignedIn => _auth.currentUser != null;

  /// メールアドレスが確認済みかどうかを確認
  bool get isEmailVerified => _auth.currentUser?.emailVerified ?? false;

  /// 電話番号認証用のverificationId
  String? get verificationId => _verificationId;

  /// Authorizationを取得
  String? get authorizationToken => _cachedIdToken;

  /// サーバーのユーザーIDを取得
  String? get userId => _cachedUserId;

  // ==================== 認証状態の監視 ====================

  /// 認証状態の変更を監視
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// ユーザーの変更を監視
  Stream<User?> get userChanges => _auth.userChanges();

  // ==================== メールリンク認証 ====================

  /// メールリンクでサインイン
  Future<UserCredential> signInWithEmailLink({
    required String email,
    required String emailLink,
  }) async {
    try {
      final result = await _auth.signInWithEmailLink(
        email: email,
        emailLink: emailLink,
      );
      // ログイン成功を記録
      unawaited(
        LoginLogService.logLoginSuccess(
          method: 'email_link',
          content: email,
        ),
      );
      return result;
    } catch (e) {
      final message = 'メールリンクでのサインインに失敗しました: $e';
      unawaited(
        LoginLogService.logLoginFailure(
          method: 'email_link',
          content: email,
          detail: message,
        ),
      );
      throw Exception(message);
    }
  }

  /// メールリンクを送信
  Future<void> sendSignInLinkToEmail({required String email,}) async {
    try {
      final actionCodeSettings = ActionCodeSettings(
        url: 'https://econa-project-staging.firebaseapp.com/email-link-verify',
        handleCodeInApp: true,
        // TODO: 正規のパッケージ名に変更する
        androidPackageName: 'com.aimate.econa_mobile_app',
        androidInstallApp: true,
        androidMinimumVersion: '31',
        iOSBundleId: 'jp.co.ai-mate.lavi',
      );

      await _auth.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: actionCodeSettings,
      );
    } catch (e) {
      throw Exception('メールリンクの送信に失敗しました: $e');
    }
  }

  /// メールリンクが有効かどうかを確認
  bool isSignInWithEmailLink(String emailLink) {
    return _auth.isSignInWithEmailLink(emailLink);
  }

  // ==================== 電話番号認証 ====================

  /// 電話番号にSMSコードを送信
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required PhoneCodeSent onCodeSent,
    required PhoneVerificationCompleted onVerificationCompleted,
    required PhoneVerificationFailed onVerificationFailed,
    required PhoneCodeAutoRetrievalTimeout onCodeAutoRetrievalTimeout,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: onVerificationCompleted,
        verificationFailed: onVerificationFailed,
        codeSent: onCodeSent,
        codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
      );
    } catch (e) {
      throw Exception('電話番号認証の開始に失敗しました: $e');
    }
  }

  /// verificationIdを保存する
  void setVerificationId(String verificationId) {
    _verificationId = verificationId;
  }

  /// SMSコードでサインイン
  Future<UserCredential> signInWithSMSCode({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final result = await _auth.signInWithCredential(credential);

      // 認証成功時にverificationIdをクリア
      _verificationId = null;

      unawaited(
        LoginLogService.logLoginSuccess(
          method: 'phone_sms',
        ),
      );
      return result;
    } catch (e) {
      final message = 'SMSコードでのサインインに失敗しました: $e';
      unawaited(
        LoginLogService.logLoginFailure(
          method: 'phone_sms',
          detail: message,
        ),
      );
      throw Exception(message);
    }
  }

  /// SMSコードの自動検証によるサインイン
  Future<UserCredential> signInWithSMSAutoVerify({
    required AuthCredential credential,
  }) async {
    try {
      final result = await _auth.signInWithCredential(credential);
      unawaited(
        LoginLogService.logLoginSuccess(
          method: 'phone_sms_auto',
        ),
      );
      return result;
    } catch (e) {
      final message = 'SMSコードの自動検証によるサインインに失敗しました: $e';
      unawaited(
        LoginLogService.logLoginFailure(
          method: 'phone_sms_auto',
          detail: message,
        ),
      );
      throw Exception(message);
    }
  }

  // ==================== ソーシャル認証 ====================

  /// Googleでサインイン
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize();

      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();
      if (googleUser == null) {
        const message = 'Googleサインインがキャンセルされました';
        unawaited(
          LoginLogService.logLoginFailure(
            method: 'google',
            detail: message,
          ),
        );
        throw Exception(message);
      }

      // openidスコープを含めて認証
      final authorization = await googleUser.authorizationClient
          .authorizeScopes(['openid', 'email', 'profile']);

      final credential = GoogleAuthProvider.credential(
        accessToken: authorization.accessToken,
        idToken: googleUser.authentication.idToken,
      );

      final result = await _auth.signInWithCredential(credential);
      unawaited(
        LoginLogService.logLoginSuccess(
          method: 'google',
          content: googleUser.email,
        ),
      );
      return result;
    } catch (e) {
      final message = 'Googleサインインに失敗しました: $e';
      unawaited(
        LoginLogService.logLoginFailure(
          method: 'google',
          detail: message,
        ),
      );
      throw Exception(message);
    }
  }

  /// Appleでサインイン
  Future<UserCredential> signInWithApple() async {
    try {

      //final appleCredential = await SignInWithApple.getAppleIDCredential(
      //  scopes: [
      //    AppleIDAuthorizationScopes.email,
      //    AppleIDAuthorizationScopes.fullName,
      //  ],
      //);

      //final oauthCredential = OAuthProvider('apple.com').credential(
      //  idToken: appleCredential.identityToken,
      //  accessToken: appleCredential.authorizationCode,
      //);

      //return await _auth.signInWithCredential(oauthCredential);
      final appleProvider = AppleAuthProvider();
      final result = await _auth.signInWithProvider(appleProvider);
      unawaited(
        LoginLogService.logLoginSuccess(
          method: 'apple',
        ),
      );
      return result;
    } catch (e) {
      final message = 'Appleサインインに失敗しました: $e';
      unawaited(
        LoginLogService.logLoginFailure(
          method: 'apple',
          detail: message,
        ),
      );
      throw Exception(message);
    }
  }

  /// LINEでサインイン（OAuth）
  Future<UserCredential> signInWithLine() async {
    try {
      final nonce = Nonce.secure().toString();
      final hashedNonce = sha256.convert(utf8.encode(nonce)).toString();
      final loginOption = LoginOption(false, 'normal')
        ..idTokenNonce = hashedNonce;
      final resultLogin = await LineSDK.instance.login(
        scopes: ['openid',],
        option: loginOption,
      );

      final idToken = resultLogin.accessToken.idTokenRaw;
      final accessToken = resultLogin.accessToken.value;

      final provider = OAuthProvider(Env.lineOauthProviderId);

      final credential = provider.credential(
        idToken: idToken,
        accessToken: accessToken,
        rawNonce: nonce,
      );

      final result = await _auth.signInWithCredential(credential);
      unawaited(
        LoginLogService.logLoginSuccess(
          method: 'line',
        ),
      );
      return result;
    } catch (e) {
      final message = 'LINEサインインに失敗しました: $e';
      unawaited(
        LoginLogService.logLoginFailure(
          method: 'line',
          detail: e.toString(),
        ),
      );
      throw Exception(message);
    }
  }

  // ==================== その他の認証方法 ====================

  /// 既存の認証情報でサインイン
  Future<UserCredential> signInWithCredential({
    required AuthCredential credential,
  }) async {
    try {
      final result = await _auth.signInWithCredential(credential);
      unawaited(
        LoginLogService.logLoginSuccess(
          method: 'credential',
        ),
      );
      return result;
    } catch (e) {
      final message = '認証情報でのサインインに失敗しました: $e';
      unawaited(
        LoginLogService.logLoginFailure(
          method: 'credential',
          detail: message,
        ),
      );
      throw Exception(message);
    }
  }

  // ==================== サインアウト・アカウント削除 ====================

  /// サインアウト
  Future<void> signOut() async {
    try {
      await Purchases.logOut();
      await _auth.signOut();
    } catch (e) {
      throw Exception('サインアウトに失敗しました: $e');
    }
  }

  /// アカウントを削除
  Future<void> deleteAccount() async {
    try {
      await _auth.currentUser?.delete();
    } catch (e) {
      throw Exception('アカウントの削除に失敗しました: $e');
    }
  }

  /// 認証トークンを取得（新規追加）
  Future<String?> getIdToken({bool forceRefresh = false}) async {
    final user = _auth.currentUser;
    if (user == null) return null;

    try {
      return await user.getIdToken(forceRefresh);
    } catch (e) {
      throw Exception('IDトークンの取得に失敗しました: $e');
    }
  }

  // ==================== 認証トークン・ユーザーID管理 ====================

  /// 認証状態が変更された時にトークンを更新
  Future<void> _updateAuthToken(User? user) async {
    if (user == null) {
      _cachedIdToken = null;
      _tokenExpiry = null;
      _cachedUserId = null; // サーバー側ユーザーIDもクリア
      return;
    }

    try {
      final idToken = await user.getIdToken();
      _cachedIdToken = idToken;

      // Firebase IDトークンは通常1時間有効
      _tokenExpiry = DateTime.now().add(const Duration(minutes: 50)); // 10分前にリフレッシュ

    } catch (e) {
      _cachedIdToken = null;
      _tokenExpiry = null;
      // サーバー側ユーザーIDはクリアしない（変わることがないため）
    }
  }

  /// サーバー側のユーザーIDを手動でキャッシュ（外部から呼び出し）
  void cacheUserId(String userId) {
    _cachedUserId = userId;
  }

  /// トークンを強制的にリフレッシュ（必要時のみ使用）
  Future<void> refreshToken() async {
    final user = _auth.currentUser;
    if (user == null) return;

    try {
      final idToken = await user.getIdToken(true); // forceRefresh: true
      _cachedIdToken = idToken;
      _tokenExpiry = DateTime.now().add(const Duration(minutes: 50));

    } catch (e) {
      throw Exception('認証トークンのリフレッシュに失敗しました: $e');
    }
  }

  /// トークンの有効期限をチェック
  bool get isTokenExpired {
    if (_tokenExpiry == null) return true;
    return DateTime.now().isAfter(_tokenExpiry!);
  }
}

/// AuthRepositoryのプロバイダー（元の形を維持）
@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}
