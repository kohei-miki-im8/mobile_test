import 'dart:async';

import 'package:collection/collection.dart';
import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/certification.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/presentations/components/econa_banner.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/options_modal.dart';
import 'package:econa_mobile_app/presentations/components/options_modal_view_model.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/chat/chat_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/home/home_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/action_buttons.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/scroll_view.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/like/like_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/rashisa_match/rashisa_match_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// TODO: モーダルの表示を実装する
// らしさマッチ機能利用時のAIカウンセリング必須モーダル
//showDialog<void>(
//    context: context,
//    barrierDismissible: true,
//    builder: (context) => EconaModal(
//      message: 'らしさマッチをご利用いただくには、AIカウンセリングの利用が必要です',
//      buttonText: 'AIカウンセリングで\nあなたの価値観を診断する',
//      onButtonPressed: () {
//        Navigator.of(context).pop();
//        // TODO: AIカウンセリング画面への遷移など
//      },
//    ),
//  );

/// ユーザー詳細ページの表示タイプ
/// - home: ホーム画面からの遷移
/// - rashisaMatch: らしさマッチ画面からの遷移
enum DetailPageType {
  home,
  rashisaMatch,
  profile,
  chat,
  like,
}

/// ユーザーの詳細情報を表示するページ
class UserDetailPage extends HookConsumerWidget {
  const UserDetailPage({
    required this.userId,
    required this.pageType,
    this.chatRoomId,
    super.key,
  });

  /// 表示するユーザーのID
  final String userId;
  final DetailPageType pageType;
  final String? chatRoomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentPageState = switch (pageType) {
      DetailPageType.home => ref.watch(homePageViewModelProvider),
      DetailPageType.rashisaMatch =>
        ref.watch(rashisaMatchPageViewModelProvider),
      DetailPageType.profile => ref.watch(profilePageViewModelProvider),
      DetailPageType.chat => ref.watch(chatPageViewModelProvider(chatRoomId ?? '')),
      DetailPageType.like => ref.watch(likePageViewModelProvider), 
    };
    final detailPageState = ref.watch(userDetailPageViewModelProvider);
    final detailPageViewModel =
        ref.watch(userDetailPageViewModelProvider.notifier);
    final optionsModalState = ref.watch(optionsModalViewModelProvider);

    // フローティングアクションボタン（いいね、メッセージ、質問ボタン）を
    // 管理するためのOverlayEntry
    final overlayEntryRef = useRef<OverlayEntry?>(null);

    late final Future<void> Function() navigateToCertificates;

    // 画面下部に表示されるフローティングアクションボタン（いいね、メッセージ、質問）
    // を作成する関数
    void createOverlay() {
      // 既存のOverlayEntryがあれば削除して重複を防ぐ
      if (overlayEntryRef.value != null && context.mounted) {
        overlayEntryRef.value!.remove();
      }

      overlayEntryRef.value = OverlayEntry(
        builder: (context) {
          // 最新のユーザー詳細ページの状態を取得してボタンの状態を反映
          final currentDetailPageState =
          ref.read(userDetailPageViewModelProvider);
          return ActionButtons(
            currentDetailPageState: currentDetailPageState,
            onNavigateToCertificates: navigateToCertificates,
          );
        },
      );

      // フレーム描画後にOverlayEntryを画面に挿入
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;
        if (overlayEntryRef.value != null) {
          Overlay.of(context).insert(overlayEntryRef.value!);
        }
      });
    }

    // ここで navigateToCertificates の中身を代入する
    navigateToCertificates = () async {
      // 1. いったん Overlay を消す
      if (overlayEntryRef.value != null) {
        overlayEntryRef.value!.remove();
        overlayEntryRef.value = null;
      }

      // 2. Certificates へ遷移
      if (!context.mounted) {
        return;
      }
      await const CertificatesRouteData().push<void>(context);

      // 3. 戻ってきたら Overlay を作り直す
      if (!context.mounted) {
        return;
      }
      createOverlay();
    };

    // ページ初期化時にユーザー情報を設定とフローティングアクションボタンの作成をし、
    // ページ破棄時にクリーンアップする
    useEffect(
      () {
        // ユーザー情報の設定
        Future.microtask(() {
          final user = parentPageState.userDetails.firstWhereOrNull(
            (userDetail) => userDetail.profile.userId == userId,
          );
          if (user != null) {
            ref.read(userDetailPageViewModelProvider.notifier).setUser(user);
            AdjustEventTracker.trackProfileDetailView();
          }
        });
        if(pageType == DetailPageType.home) {
          // フローティングアクションボタンの作成
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!context.mounted) return;
            createOverlay();
          });
        }

        return () {
          // ページが破棄される際にOverlayEntryを削除してメモリリークを防ぐ
          if (overlayEntryRef.value != null) {
            overlayEntryRef.value!.remove();
          }
          // ページ破棄時に状態をリセット
          Future.microtask(detailPageViewModel.reset);
        };
      },
      const [],
    );

    // ユーザー詳細ページのエラーでメンテナンスモードを検知
    ref.listen(userDetailPageViewModelProvider, (previous, next) async {
      final error = next.error;
      if (error == null) {
        return;
      }

      await handleEconaError(context, error);
    });

    // いいねやメッセージ送信などのアクションボタンでエラーが発生した場合にバナーを表示
    useEffect(
      () {
        if (detailPageState.error != null &&
            isActionButtonError(detailPageState.error!)) {
          showErrorBanner(
            context,
            detailPageState.error!,
            detailPageViewModel.clearError,
          );
        }
        return null;
      },
      [detailPageState.error],
    );

    // オプションモーダルでエラーが発生した場合にバナーを表示
    useEffect(
      () {
        if (optionsModalState.error != null &&
            isOptionsModalError(optionsModalState.error!)) {
          showErrorBanner(
            context,
            optionsModalState.error!,
            ref.read(optionsModalViewModelProvider.notifier).clearError,
          );
        }
        return null;
      },
      [optionsModalState.error],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: switch (pageType) {
          DetailPageType.home => const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
          DetailPageType.rashisaMatch ||
          DetailPageType.profile ||
          DetailPageType.like ||
          DetailPageType.chat =>
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
        },
        scrolledUnderElevation: 0,
        elevation: 0,
        toolbarHeight: 52,
        leadingWidth: 56,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Assets.images.icons.closeWithBackground.image(
              height: 32,
              width: 36,
            ),
            iconSize: 36,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              }
            },
          ),
        ),
        actions: switch (pageType) {
          DetailPageType.like ||
          DetailPageType.home => [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      showOptionsModal(
                        context: context,
                        right: 20,
                        top: 40,
                        userId: detailPageState.userDetail?.profile.userId ?? '',
                        toUserNickname: detailPageState.userDetail?.profile.name ?? '',
                        myUserId: ref.read(profilePageViewModelProvider).userStatus?.userId ?? '',
                        isVerified: () {
                          final profileState = ref.read(profilePageViewModelProvider);
                          if (profileState.userStatus == null) return false;
                          return Certification.fromCode(
                            profileState.userStatus!.certificateLevelCode,
                          ).isIdentityVerified;
                        }(),
                      );
                    },
                    icon: Assets.images.icons.threeDots
                        .image(height: 32, width: 32),
                  ),
                ),
              ),
            ],
          DetailPageType.rashisaMatch ||
          DetailPageType.profile ||
          DetailPageType.chat => null,
        },
      ),
      body: detailPageState.isLoading
          ? const Center(
              child: EconaLoadingIndicator(),
            )
          : detailPageState.hasUser
              ? UserDetailScrollView(
                  userDetail: detailPageState.userDetail!,
                  pageType: pageType,
                )
              : const Center(
                  child: Text('ユーザープロフィールが見つかりません'),
                ),
    );
  }
}
