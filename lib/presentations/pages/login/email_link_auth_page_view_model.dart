import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

part 'email_link_auth_page_view_model.g.dart';

/// EmailLinkAuth の ViewModel（メールリンク認証の入力値を保持）
@Riverpod(keepAlive: true)
class EmailLinkAuthViewModel extends _$EmailLinkAuthViewModel {
  static const String _emailKey = 'email_link_auth_email';
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  @override
  AsyncValue<String?> build() {
    // セキュアストレージから初期値を読み込み
    loadSavedEmail();
    return const AsyncValue.data(null);
  }

  /// 保存済みメールアドレスを読み込み
  Future<void> loadSavedEmail() async {
    try {
      final savedEmail = await _secureStorage.read(key: _emailKey);
      if (savedEmail != null) {
        state = AsyncValue.data(savedEmail);
      }
    } catch (e) {
      throw Exception('セキュアストレージの読み込みに失敗しました');
    }
  }

  /// メールアドレスをセキュアストレージへ保存
  Future<void> _saveEmailToPref(String email) async {
    try {
      await _secureStorage.write(key: _emailKey, value: email);
    } catch (e) {
      throw Exception('セキュアストレージへの保存に失敗しました');
    }
  }

  /// セキュアストレージからメールアドレスを削除
  Future<void> _clearEmailFromPref() async {
    try {
      await _secureStorage.delete(key: _emailKey);
    } catch (e) {
      throw Exception('セキュアストレージからの削除に失敗しました');
    }
  }

  /// メール形式チェック
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  /// サインインリンク送信
  Future<void> sendSignInLinkToEmail(String email) async {
    final authRepository = ref.read(authRepositoryProvider);

    // メールリンクを送信
    await authRepository.sendSignInLinkToEmail(email: email);

    // 送信成功時、入力値をキャッシュ
    state = AsyncValue.data(email);
    await _saveEmailToPref(email);
  }

  /// 入力メールを保存
  Future<void> saveEmail(String email) async {
    state = AsyncValue.data(email);
    await _saveEmailToPref(email);
  }

  /// 保存済みメールを削除
  Future<void> clearEmail() async {
    state = const AsyncValue.data(null);
    await _clearEmailFromPref();
  }

  /// 現在のメールを取得
  String? getEmail() {
    return state.valueOrNull;
  }
}

