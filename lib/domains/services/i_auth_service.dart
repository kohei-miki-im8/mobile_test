import 'package:firebase_auth/firebase_auth.dart';

/// 認証サービスのインターフェース
abstract class IAuthService {
  /// 認証状態の変更を監視
  Stream<User?> get authStateChanges;
  
  /// 現在のユーザー
  User? get currentUser;
  
  /// メールアドレスとパスワードでサインイン
  Future<UserCredential> signInWithEmailAndPassword({
    required String email, 
    required String password
  });
  
  /// Googleサインイン
  Future<UserCredential?> signInWithGoogle();
  
  /// Appleサインイン
  Future<UserCredential?> signInWithApple();
  
  /// LINEサインイン
  Future<UserCredential?> signInWithLine();
  
  /// サインアウト
  Future<void> signOut();
  
  /// IDトークン取得
  Future<String?> getIdToken({bool forceRefresh = false});
} 