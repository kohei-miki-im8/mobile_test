import 'package:econa_mobile_app/presentations/pages/web_view_page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'web_view_page_view_model.g.dart';

const Set<String> _allowedSchemes = {'https'};
const Set<String> _allowedHosts = {
  'lavigation.com',
  'google.com',
  'apple.com',
};

@riverpod
class WebViewPageViewModel extends _$WebViewPageViewModel {
  @override
  WebViewPageState build() {
    return const WebViewPageState();
  }

  void openWebViewAllowedWhiteList({required String url}) {
    state = state.copyWith(isLoading: true);

    try {
      final uri = Uri.tryParse(url);
      if(uri == null) {
        state = state.copyWith(error: 'URLが不正です');
        return;
      };

      final isInitialAllowed = _isAllowedUri(uri);

      final controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onNavigationRequest: (NavigationRequest request) async {
              final requestUri = Uri.tryParse(request.url);
              if (requestUri == null) {
                return NavigationDecision.prevent;
              }

              // mailto:は許可する
              if (requestUri.scheme == 'mailto') {
                await launchUrl(requestUri);
                // WebView内では開かず、外部アプリに委譲
                return NavigationDecision.prevent;
              }

              // それ以外は今までのホワイトリスト判定
              if (_isAllowedUri(requestUri)) {
                return NavigationDecision.navigate;
              }

              return NavigationDecision.prevent;
            },
          ),
        );

      // 生成したcontrollerをstateに保持
      state = state.copyWith(controller: controller);

      // 初期ロード前にURLを検証
      if (isInitialAllowed) {
        state = state.copyWith(error: null);
        controller.loadRequest(uri);
      } else {
        state = state.copyWith(error: 'このページは表示できません');
      }

    } on Exception catch (e) {
      state = state.copyWith(error: 'このページは表示できません');
      debugPrint(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  bool _isAllowedUri(Uri uri) {
    if (!_allowedSchemes.contains(uri.scheme)) return false;
    final host = uri.host.toLowerCase();
    // 例: google.com を許可 → www.google.com, accounts.google.com も許可
    return _allowedHosts.any(
          (allowed) => host == allowed || host.endsWith('.$allowed'),
    );
  }

  Future<void> reload() async {
    final controller = state.controller;
    if (controller == null) return;

    state = state.copyWith(isLoading: true);
    try {
      await controller.reload();
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}