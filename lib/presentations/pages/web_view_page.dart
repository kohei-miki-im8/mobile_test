import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/pages/web_view_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/web_view_page_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends HookConsumerWidget {
  const WebViewPage({
    required this.url,
    required this.title,
    super.key,
  });

  final String url;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(webViewPageViewModelProvider.notifier);
    final state = ref.watch(webViewPageViewModelProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifier.openWebViewAllowedWhiteList(url: url);
      });
      return null;
    }, [url]);

    final controller = state.controller;
    final isLoading = state.isLoading;
    final error = state.error;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              await notifier.reload();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          if (controller != null)...[
            WebViewWidget(controller: controller),
          ],
          if (isLoading)...[
            ColoredBox(
              color: Colors.black.withValues(alpha: 0.3),
              child: const Center(
                child: EconaLoadingIndicator(),
              ),
            ),
          ],
          if(error != null)...[
            ColoredBox(
              color: Colors.white,
              child: Center(
                child: Text(
                  'このページは表示できません',
                  style: EconaTextStyle.labelMedium2140(
                    color: EconaColor.grayDarkActive,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
