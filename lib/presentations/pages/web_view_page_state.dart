import 'package:webview_flutter/webview_flutter.dart';

class WebViewPageState {
  const WebViewPageState({
    this.controller,
    this.isLoading = false,
    this.error,
  });

  final WebViewController? controller;
  final bool isLoading;
  final String? error;

  static const _unset = Object();

  WebViewPageState copyWith({
    Object? controller = _unset,
    bool? isLoading,
    Object? error = _unset,
  }) {
    return WebViewPageState(
      controller: identical(controller, _unset)
          ? this.controller
          : controller as WebViewController?,
      isLoading: isLoading ?? this.isLoading,
      error: identical(error, _unset)
          ? this.error
          : error as String?,
    );
  }
}