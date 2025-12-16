import 'dart:async';

import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/infrastructures/services/remote_config_service.dart';
import 'package:econa_mobile_app/presentations/pages/maintenance_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// 共通エラーハンドリング
/// true を返した場合は「ここで処理済み」（呼び出し元では追加処理しない）
Future<bool> handleEconaError(
  BuildContext context,
  EconaError error,
) async {
  // まず最新のRemote Configを取得してメンテナンスフラグを確認
  try {
    await RemoteConfigService.fetchAndActivate();
  } catch (_) {
    // Remote Config取得に失敗した場合は通常のエラーハンドリングに委譲
    return false;
  }

  if (!RemoteConfigService.isMaintenanceMode) {
    // メンテナンスモードでなければ何もしない
    return false;
  }

  if (!context.mounted) {
    return true;
  }

  // フレーム描画後にナビゲーション操作を実行してNavigatorのロックエラーを回避
  final completer = Completer<void>();
  SchedulerBinding.instance.addPostFrameCallback((_) {
    completer.complete();
  });
  await completer.future;

  if (!context.mounted) {
    return true;
  }

  await Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
    MaterialPageRoute<void>(
      builder: (_) => MaintenancePage(
        message: RemoteConfigService.maintenanceMessage,
      ),
    ),
    (_) => false,
  );

  return true;
}