import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// チュートリアル表示の初回フラグを管理するプロバイダー
final tutorialFirstVisitProvider = AsyncNotifierProvider.autoDispose<
    RashisaMatchTutorialFirstVisitNotifier, bool>(
  RashisaMatchTutorialFirstVisitNotifier.new,
);

class RashisaMatchTutorialFirstVisitNotifier
    extends AutoDisposeAsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    return _loadFirstVisitFlag();
  }

  static const String _key = 'rashisa_match_tutorial_first_visit';

  /// 初回表示フラグを読み込む
  Future<bool> _loadFirstVisitFlag() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstVisit = prefs.getBool(_key) ?? true; // デフォルトはtrue（初回表示）
    return isFirstVisit;
  }

  /// 初回表示フラグをfalseに設定（チュートリアル表示済み）
  Future<void> markTutorialAsShown() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, false);
    ref.invalidateSelf();
  }

  /// 初回表示フラグをリセット（テスト用）
  Future<void> resetTutorialFlag() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
    ref.invalidateSelf();
  }
}
