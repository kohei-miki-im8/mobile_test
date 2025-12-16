import 'dart:io';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

const String ekycBackUrl = 'https://api.lavigation.com/';

class EkycWebView extends StatefulHookConsumerWidget {
  const EkycWebView({
    required this.url,
    super.key,
  });

  final String url;

  @override
  ConsumerState<EkycWebView> createState() => _EkycWebViewState();
}

class _EkycWebViewState extends ConsumerState<EkycWebView> {
  InAppWebViewController? _webViewController;
  final GlobalKey _webViewKey = GlobalKey();
  bool _isLoading = false;
  static const MethodChannel _safariChannel = MethodChannel('app.safari_view');

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      _safariChannel.setMethodCallHandler(_handleSafariMethodCall);
      _openWebView();
    }
  }

  Future<void> _openWebView() async {
    try {
      await _safariChannel.invokeMethod('openSafariViewController', {
        'url': widget.url,
        'backUrl': ekycBackUrl,
      });
    } on PlatformException catch (e) {
      debugPrint('Error opening WebView: ${e.message}');
      if (mounted) {
        // 通知はグローバルに任せる
        MyPageRouteData().go(context);
      }
    }
  }

  Future<dynamic> _handleSafariMethodCall(MethodCall call) async {
    if (call.method == 'onEkycBackUrlDetected') {
      // 戻りURLが検知された場合
      if (mounted) {
        AdjustEventTracker.trackIdentityVerification();
        // 通知はグローバルに任せる
        MyPageRouteData().go(context);
      }
    } else if (call.method == 'onEkycWebViewError') {
      // エラーが発生した場合
      if (mounted) {
        // 通知はグローバルに任せる
        MyPageRouteData().go(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final targetUrl = widget.url;

    // iOSの場合はWKWebViewを使用（initStateで開く）
    if (Platform.isIOS) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('本人確認'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (context.mounted) {
                context.pop();
              }
            },
          ),
        ),
        body: const Center(
          child: EconaLoadingIndicator(),
        ),
      );
    }

    // Androidの場合は既存のInAppWebViewを使用
    return Scaffold(
      appBar: AppBar(
        title: const Text('本人確認'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            if (_webViewController != null && await _webViewController!.canGoBack()) {
              await _webViewController!.goBack();
            } else {
              if (context.mounted) {
                context.pop();
              }
            }
          },
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            key: _webViewKey,
            initialUrlRequest: URLRequest(url: WebUri(targetUrl)),
            initialSettings: InAppWebViewSettings(
              cacheEnabled: false,
              javaScriptEnabled: true,
              mediaPlaybackRequiresUserGesture: false,
              useHybridComposition: true,
            ),
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onLoadStart: (controller, url) {
              setState(() {
                _isLoading = true;
              });
              if (url != null) {
                final stringUrl = url.toString();
                if (stringUrl.startsWith(ekycBackUrl)) {
                  controller.stopLoading();
                  if (context.mounted) {
                    AdjustEventTracker.trackIdentityVerification();
                    // 通知はグローバルに任せる
                    MyPageRouteData().go(context);
                  }
                }
              }
            },
            onLoadStop: (controller, url) {
              setState(() {
                _isLoading = false;
              });
            },
            onReceivedError: (controller, request, error) {
              debugPrint('eKYC WebView error: ${error.type} - ${error.description}');
              if (context.mounted) {
                // 通知はグローバルに任せる
                MyPageRouteData().go(context);
              }
            },
            onProgressChanged: (controller, progress) {
              if (progress == 100) {
                setState(() {
                  _isLoading = false;
                });
              }
            },
            onPermissionRequest: (controller, request) async {
              final result = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('カメラの許可'),
                  content: Text('本人確認のため、${request.resources.map((r) => r.toString()).join(', ')}へのアクセスを許可しますか？'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('拒否'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('許可'),
                    ),
                  ],
                ),
              );
              return PermissionResponse(
                resources: request.resources,
                action: (result ?? false)
                    ? PermissionResponseAction.GRANT
                    : PermissionResponseAction.DENY,
              );
            },
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              var uri = navigationAction.request.url;

              if (uri != null && uri.scheme != 'http' && uri.scheme != 'https') {
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                  return NavigationActionPolicy.CANCEL;
                }
              }
              return NavigationActionPolicy.ALLOW;
            },
          ),
          if (_isLoading)
            const Center(
              child: EconaLoadingIndicator(),
            ),
        ],
      ),
    );
  }
}