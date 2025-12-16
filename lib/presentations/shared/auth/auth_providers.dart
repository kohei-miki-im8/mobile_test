import 'dart:async';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/login_log_service.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

/// 現在のユーザーIDを提供するProvider
///
/// キャッシュを確認し、なければAPIから取得してキャッシュする。
@Riverpod(keepAlive: true)
Future<String> currentUserId(Ref ref) async {
  final authRepository = ref.watch(authRepositoryProvider);
  final userRepo = ref.watch(userRepositoryProvider);

  // 1. まずキャッシュからユーザーIDを試みる
  final cachedUserId = authRepository.userId;
  if (cachedUserId != null && cachedUserId.isNotEmpty) {
    return cachedUserId;
  }

  // 2. サーバ（DB）から現在ユーザーのUserStatusを取得し、userId（UUID）を返す
  final resp = await userRepo.getUserStatus(GetUserStatusRequest());
  final dbUserId = resp.userStatus.userId;
  if (dbUserId.isEmpty) {
    throw Exception('サーバーからユーザーIDを取得できませんでした');
  }
  authRepository.cacheUserId(dbUserId);
  return dbUserId;
}

/// テストユーザーでサインインし、ユーザーIDをキャッシュする
Future<void> signInWithTestUser(
  WidgetRef ref, {
  required BuildContext context,
  required String email,
  required String password,
  String? navigateTo,
}) async {
  try {
    // 1. Firebase Authでサインイン
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // ログイン成功ログ（テストユーザー用）
    unawaited(
      LoginLogService.logLoginSuccess(
        method: 'email_password_test',
        content: email,
      ),
    );

    // 2. ログイン成功後、currentUserIdProviderを再実行させて
    //    ユーザーIDの取得とキャッシュを自動的に行わせる
    // refresh の Future 自体は使用しないため、fire-and-forget でよい
    unawaited(ref.refresh(currentUserIdProvider.future));

    if (navigateTo != null && context.mounted) {
      context
        ..pop()
        ..go(navigateTo);
    }
  } on FirebaseAuthException catch (e) {
    String errorMessage = 'ログインに失敗しました';
    if (e.code == 'user-not-found') {
      errorMessage = 'ユーザーが見つかりません';
    } else if (e.code == 'wrong-password') {
      errorMessage = 'パスワードが間違っています';
    }

    unawaited(
      LoginLogService.logLoginFailure(
        method: 'email_password_test',
        content: email,
        detail: 'FirebaseAuthException(${e.code}): $errorMessage',
      ),
    );

    if (context.mounted) {
      await EconaNotification.showTopToast(
        context,
        message: errorMessage,
        duration: Duration(seconds: 2),
      );
    }
  }
}

