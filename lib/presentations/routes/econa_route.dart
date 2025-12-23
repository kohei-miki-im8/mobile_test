import 'package:econa_mobile_app/domains/entities/edit_profile_field.dart';
import 'package:econa_mobile_app/domains/entities/registration_field.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';
import 'package:econa_mobile_app/infrastructures/services/security_integrity_service.dart';
import 'package:econa_mobile_app/presentations/components/econa_scaffold.dart';
import 'package:econa_mobile_app/presentations/pages/certificate/certificates_confirm_page.dart';
import 'package:econa_mobile_app/presentations/pages/certificate/certificates_page.dart';
import 'package:econa_mobile_app/presentations/pages/certificate/ekyc_web_view.dart';
import 'package:econa_mobile_app/presentations/pages/certificate/single_certificate_page.dart';
import 'package:econa_mobile_app/presentations/pages/chat/chat_page.dart';
import 'package:econa_mobile_app/presentations/pages/chat_room/chat_room_page.dart';
import 'package:econa_mobile_app/presentations/pages/counseling/counseling_page.dart';
import 'package:econa_mobile_app/presentations/pages/favorite/favorite_page.dart';
import 'package:econa_mobile_app/presentations/pages/footprint/footprint_page.dart';
import 'package:econa_mobile_app/presentations/pages/home/home_page.dart';
import 'package:econa_mobile_app/presentations/pages/home/matching_page.dart';
import 'package:econa_mobile_app/presentations/pages/home/matching_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/home/question_page.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page.dart';
import 'package:econa_mobile_app/presentations/pages/karute/karute_love_advice_page.dart';
import 'package:econa_mobile_app/presentations/pages/lavigation/lavigation_page.dart';
import 'package:econa_mobile_app/presentations/pages/like/like_page.dart';
import 'package:econa_mobile_app/presentations/pages/login/email_link_auth_page.dart';
import 'package:econa_mobile_app/presentations/pages/login/email_link_verify_page.dart';
import 'package:econa_mobile_app/presentations/pages/login/email_not_received_page.dart';
import 'package:econa_mobile_app/presentations/pages/login/login_page.dart';
import 'package:econa_mobile_app/presentations/pages/login/splash_page.dart';
import 'package:econa_mobile_app/presentations/pages/login/phone_number_auth_page.dart';
import 'package:econa_mobile_app/presentations/pages/login/phone_number_verify_page.dart';
import 'package:econa_mobile_app/presentations/pages/my_page/my_page.dart';
import 'package:econa_mobile_app/presentations/pages/profile/edit_profile_page.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/current_plan_page.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/private_mode_page.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_history_page.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_page.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/subscription_page.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/subscription_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/rashisa_match/rashisa_match_page.dart';
import 'package:econa_mobile_app/presentations/pages/registration/onboarding_screens.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_finish.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_flow_page.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_photo.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_photo_preview.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_photo_upload.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_profile_page.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_tag_category_page.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_tag_page.dart';
import 'package:econa_mobile_app/presentations/pages/registration/user_agreement.dart';
import 'package:econa_mobile_app/presentations/pages/settings/auto_matching_setting_page.dart';
import 'package:econa_mobile_app/presentations/pages/settings/block_user_setting_page.dart';
import 'package:econa_mobile_app/presentations/pages/settings/email_address_setting_page.dart';
import 'package:econa_mobile_app/presentations/pages/settings/first_message_setting_page.dart';
import 'package:econa_mobile_app/presentations/pages/settings/footprint_setting_page.dart';
import 'package:econa_mobile_app/presentations/pages/settings/hide_chat_rooms_setting_page.dart';
import 'package:econa_mobile_app/presentations/pages/settings/hide_user_setting_page.dart';
import 'package:econa_mobile_app/presentations/pages/settings/like_receive_setting_page.dart';
import 'package:econa_mobile_app/presentations/pages/settings/notification_setting_page.dart';
import 'package:econa_mobile_app/presentations/pages/settings/offline_setting_page.dart';
import 'package:econa_mobile_app/presentations/pages/settings/private_mode_setting_page.dart';
import 'package:econa_mobile_app/presentations/pages/settings/settings_page.dart';
import 'package:econa_mobile_app/presentations/pages/simulation/simulation_chat_page.dart';
import 'package:econa_mobile_app/presentations/pages/simulation/simulation_choose_partner_page.dart';
import 'package:econa_mobile_app/presentations/pages/simulation/simulation_top_page.dart';
import 'package:econa_mobile_app/presentations/pages/simulation/simulation_tutorial_page.dart';
import 'package:econa_mobile_app/presentations/pages/web_view_page.dart';
import 'package:econa_mobile_app/presentations/pages/withdrawal/withdrawal_complete_page.dart';
import 'package:econa_mobile_app/presentations/pages/withdrawal/withdrawal_page.dart';
import 'package:econa_mobile_app/presentations/pages/withdrawal/withdrawal_reason_page.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'econa_route.g.dart';

/// 右から左へのトランジションを作成
Page<T> createSlideTransitionPage<T>({
  required LocalKey key,
  required Widget child,
  Duration transitionDuration = const Duration(milliseconds: 200),
  Offset beginOffset = const Offset(1, 0), // 右から左
}) {
  return CustomTransitionPage<T>(
    key: key,
    child: child,
    transitionDuration: transitionDuration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      );
      return SlideTransition(
        position: Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).animate(curved),
        child: child,
      );
    },
  );
}

/// 左から右へのトランジションを作成（戻る方向）
Page<T> createReverseSlideTransitionPage<T>({
  required LocalKey key,
  required Widget child,
  Duration transitionDuration = const Duration(milliseconds: 200),
}) {
  return createSlideTransitionPage<T>(
    key: key,
    child: child,
    transitionDuration: transitionDuration,
    beginOffset: const Offset(-1, 0), // 左から右
  );
}

class EconaRouter {
  static String? resolveEmailLinkRedirect(Uri uri) {
    if (uri.path != '/__/auth/links') {
      return null;
    }

    final encodedLink = uri.queryParameters['link'];
    if (encodedLink == null) {
      return EconaPath.emailLinkVerify;
    }

    String decodedLink;
    try {
      decodedLink = Uri.decodeFull(encodedLink);
    } on FormatException {
      return EconaPath.emailLinkVerify;
    }

    final linkUri = Uri.tryParse(decodedLink);
    if (linkUri == null ||
        linkUri.scheme != 'https' ||
        linkUri.host != uri.host) {
      return EconaPath.emailLinkVerify;
    }

    final continueUrl = linkUri.queryParameters['continueUrl'];
    if (continueUrl == null) {
      return EconaPath.emailLinkVerify;
    }

    final continueUri = Uri.tryParse(continueUrl);
    if (continueUri == null ||
        continueUri.scheme != 'https' ||
        continueUri.host != uri.host ||
        continueUri.path != EconaPath.emailLinkVerify) {
      return EconaPath.emailLinkVerify;
    }

    final apiKey = linkUri.queryParameters['apiKey'];
    final oobCode = linkUri.queryParameters['oobCode'];
    final mode = linkUri.queryParameters['mode'];
    final lang = linkUri.queryParameters['lang'];

    if (apiKey == null || oobCode == null || mode == null) {
      return EconaPath.emailLinkVerify;
    }

    final redirectUri = Uri(
      path: EconaPath.emailLinkVerify,
      queryParameters: <String, String>{
        'apiKey': apiKey,
        'oobCode': oobCode,
        'mode': mode,
        if (lang != null && lang.isNotEmpty) 'lang': lang,
      },
    );

    return redirectUri.toString();
  }

  static final router = GoRouter(
    initialLocation: EconaPath.splash,
    routes: $appRoutes,
    redirect: (context, state) async {
      // Optional kill-switch via --dart-define=DISABLE_INTEGRITY_CHECK=true
      const disabled =
          bool.fromEnvironment('DISABLE_INTEGRITY_CHECK', defaultValue: false);
      if (disabled) {
        return null;
      }

      // Global integrity gate: if compromised device, force login with error flag.
      final compromised = await SecurityIntegrityService.isDeviceCompromised();
      if (compromised && state.matchedLocation != EconaPath.login) {
        final uri = Uri.parse(EconaPath.login).replace(
          queryParameters: {
            ...state.uri.queryParameters,
            'integrity': '1',
          },
        );
        return uri.toString();
      }

      // メールリンク認証のリダイレクト処理
      final emailLinkRedirect = resolveEmailLinkRedirect(state.uri);
      if (emailLinkRedirect != null) {
        return emailLinkRedirect;
      }

      // iOS電話番号認証のreCAPTCHA検証終了時のリダイレクト処理
      if (state.uri.toString().contains('firebaseauth/link') &&
          state.uri.toString().contains('deep_link_id')) {
        // deep_link_idパラメータを取得
        final deepLinkId = state.uri.queryParameters['deep_link_id'];
        if (deepLinkId != null) {
          final decodedDeepLink = Uri.decodeFull(deepLinkId);

          // Firebase Auth callback URLを解析
          final callbackUri = Uri.parse(decodedDeepLink);
          if (callbackUri.path.contains('/__/auth/callback') &&
              callbackUri.queryParameters['authType'] == 'verifyApp') {
            // 電話番号認証の認証例ページにリダイレクト
            return EconaPath.phoneNumberVerify;
          }
        }
      }

      return null;
    },
  );
}

@TypedStatefulShellRoute<EconaStatefulShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<BranchHomeData>(
      routes: [
        TypedGoRoute<HomeRouteData>(
          path: EconaPath.home,
          routes: [
            TypedGoRoute<HomeUserDetailRouteData>(
              path: EconaPath.homeUserDetail,
            ),
            TypedGoRoute<QuestionRouteData>(
              path: EconaPath.question,
            ),
            TypedGoRoute<WebViewRouteData>(path: EconaPath.webview),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<BranchLikeData>(
      routes: [
        TypedGoRoute<LikeRouteData>(
          path: EconaPath.like,
          routes: [],
        ),
      ],
    ),
    TypedStatefulShellBranch<BranchLavigationData>(
      routes: [
        TypedGoRoute<LavigationRouteData>(
          path: EconaPath.lavigation,
          routes: [
            TypedGoRoute<KaruteRouteData>(path: EconaPath.karute),
            TypedGoRoute<LoveAdviceRouteData>(path: EconaPath.loveAdvice),
            TypedGoRoute<CounselingRouteData>(path: EconaPath.counseling),
            TypedGoRoute<SimulationRouteData>(
              path: EconaPath.simulation,
              routes: [
                TypedGoRoute<SimulationTopRouteData>(
                  path: EconaPath.simulationTop,
                ),
                TypedGoRoute<SimulationTutorialRouteData>(
                  path: EconaPath.simulationTutorial,
                ),
                TypedGoRoute<SimulationChoosePartnerRouteData>(
                  path: EconaPath.simulationChoose,
                ),
                TypedGoRoute<SimulationChatRouteData>(
                  path: EconaPath.simulationChat,
                ),
              ],
            ),
            TypedGoRoute<RashisaMatchRouteData>(
              path: EconaPath.rashisaMatch,
              routes: [
                TypedGoRoute<RashisaMatchDetailRouteData>(
                  path: EconaPath.rashisaMatchDetail,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<BranchChatRoomData>(
      routes: [
        TypedGoRoute<ChatRoomRouteData>(
          path: EconaPath.chatroom,
          routes: [
            TypedGoRoute<ChatRouteData>(path: EconaPath.chat),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<BranchMyPageData>(
      routes: [
        TypedGoRoute<MyPageRouteData>(
          path: EconaPath.myPage,
          routes: [
            TypedGoRoute<SettingsRouteData>(
              path: EconaPath.settings,
              routes: [
                TypedGoRoute<NotificationSettingRouteData>(
                  path: EconaPath.notificationSetting,
                  routes: [
                    TypedGoRoute<EmailAddressSettingRouteData>(
                      path: EconaPath.emailAddressSetting,
                    ),
                  ],
                ),
                TypedGoRoute<LikeReceiveSettingRouteData>(
                  path: EconaPath.likeReceiveSetting,
                ),
                TypedGoRoute<FootprintSettingRouteData>(
                  path: EconaPath.footprintSetting,
                ),
                TypedGoRoute<FirstMessageSettingRouteData>(
                  path: EconaPath.firstMessageSetting,
                ),
                TypedGoRoute<OfflineSettingRouteData>(
                  path: EconaPath.offlineSetting,
                ),
                TypedGoRoute<PrivateModeSettingRouteData>(
                  path: EconaPath.privateModeSetting,
                ),
                TypedGoRoute<PrivateModeRouteData>(
                  path: EconaPath.privateModePurchase,
                ),
                TypedGoRoute<AutoMatchingSettingRouteData>(
                  path: EconaPath.autoMatchingSetting,
                ),
                TypedGoRoute<HideUserSettingRouteData>(
                  path: EconaPath.hideUserSetting,
                ),
                TypedGoRoute<HideChatRoomsSettingRouteData>(
                  path: EconaPath.hideChatRoomsSetting,
                ),
                TypedGoRoute<BlockUserSettingRouteData>(
                  path: EconaPath.blockUserSetting,
                ),
                TypedGoRoute<WithdrawalRouteData>(
                  path: EconaPath.withdrawal,
                ),
                TypedGoRoute<WithdrawalReasonRouteData>(
                  path: EconaPath.withdrawalReason,
                ),
                TypedGoRoute<WithdrawalCompleteRouteData>(
                  path: EconaPath.withdrawalComplete,
                ),
              ],
            ),
            TypedGoRoute<ProfileRouteData>(
              path: EconaPath.profile,
              routes: [
                TypedGoRoute<EditProfileRouteData>(path: EconaPath.editProfile),
              ],
            ),
            TypedGoRoute<CurrentPlanRouteData>(
              path: EconaPath.currentPlan,
              routes: [
                TypedGoRoute<SubscriptionRouteData>(
                  path: EconaPath.subscription,
                ),
              ],
            ),
            TypedGoRoute<CertificatesRouteData>(
              path: EconaPath.certificates,
              routes: [
                TypedGoRoute<SingleCertificateRouteData>(
                  path: EconaPath.singleCertificate,
                  routes: [
                    TypedGoRoute<ConfirmSingleRouteData>(
                      path: EconaPath.confirmSingle,
                    ),
                    TypedGoRoute<ConfirmFamilyRegisterRouteData>(
                      path: EconaPath.confirmFamilyRegister,
                    ),
                    TypedGoRoute<ConfirmFamilyRegisterExtractRouteData>(
                      path: EconaPath.confirmFamilyRegisterExtract,
                    ),
                  ],
                ),
                TypedGoRoute<EkycWebViewRouteData>(
                  path: EconaPath.ekycWebView,
                ),
              ],
            ),
            TypedGoRoute<PurchaseRouteData>(
              path: EconaPath.purchase,
              routes: [
                TypedGoRoute<PurchaseHistoryRouteData>(
                  path: EconaPath.purchaseHistory,
                ),
              ],
            ),
            TypedGoRoute<FootprintRouteData>(
              path: EconaPath.footprint,
            ),
            TypedGoRoute<FavoriteRouteData>(
              path: EconaPath.favorite,
            ),
          ],
        ),
      ],
    ),
  ],
)
class EconaStatefulShellRouteData extends StatefulShellRouteData {
  const EconaStatefulShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      ScaffoldWithNavigationBar(
        state: state,
        navigationShell: navigationShell,
      );
}

// Branch Data
class BranchHomeData extends StatefulShellBranchData {
  const BranchHomeData();
}

class BranchLikeData extends StatefulShellBranchData {
  const BranchLikeData();
}

class BranchLavigationData extends StatefulShellBranchData {
  const BranchLavigationData();
}

class BranchChatRoomData extends StatefulShellBranchData {
  const BranchChatRoomData();
}

class BranchMyPageData extends StatefulShellBranchData {
  const BranchMyPageData();
}

// Route Data
//=============[ Splash / Login ]===============//
/// スプラッシュページ
@TypedGoRoute<SplashRouteData>(path: EconaPath.splash)
class SplashRouteData extends GoRouteData with _$SplashRouteData {
  const SplashRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashPage();
}

/// ログインページ
@TypedGoRoute<LoginRouteData>(path: EconaPath.login)
class LoginRouteData extends GoRouteData with _$LoginRouteData {
  const LoginRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

/// メールリンク認証
@TypedGoRoute<EmailLinkAuthRouteData>(path: EconaPath.emailLinkAuth)
class EmailLinkAuthRouteData extends GoRouteData with _$EmailLinkAuthRouteData {
  const EmailLinkAuthRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const EmailLinkAuthPage(),
    );
  }
}

/// メールリンク認証確認
@TypedGoRoute<EmailLinkVerifyRouteData>(path: EconaPath.emailLinkVerify)
class EmailLinkVerifyRouteData extends GoRouteData
    with _$EmailLinkVerifyRouteData {
  const EmailLinkVerifyRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final qpUri = state.uri.queryParameters['uri'];
    final uri = qpUri != null ? Uri.parse(qpUri) : state.uri;
    return createSlideTransitionPage(
      key: state.pageKey,
      child: EmailLinkVerifyPage(uri: uri),
    );
  }
}

/// メールが届かない場合
@TypedGoRoute<EmailNotReceivedRouteData>(path: EconaPath.emailNotReceived)
class EmailNotReceivedRouteData extends GoRouteData
    with _$EmailNotReceivedRouteData {
  const EmailNotReceivedRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const EmailNotReceivedPage(),
    );
  }
}

/// 電話番号認証
@TypedGoRoute<PhoneNumberAuthRouteData>(path: EconaPath.phoneNumberAuth)
class PhoneNumberAuthRouteData extends GoRouteData
    with _$PhoneNumberAuthRouteData {
  const PhoneNumberAuthRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const PhoneNumberAuthPage(),
    );
  }
}

/// 電話番号認証確認
@TypedGoRoute<PhoneNumberVerifyRouteData>(path: EconaPath.phoneNumberVerify)
class PhoneNumberVerifyRouteData extends GoRouteData
    with _$PhoneNumberVerifyRouteData {
  const PhoneNumberVerifyRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const PhoneNumberVerifyPage(),
    );
  }
}

//=============[ Registration ]===============//
/// 同意画面
@TypedGoRoute<UserAgreementRouteData>(path: EconaPath.userAgreement)
class UserAgreementRouteData extends GoRouteData with _$UserAgreementRouteData {
  const UserAgreementRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const UserAgreement(),
    );
  }
}

/// 登録フロー画面
@TypedGoRoute<RegistrationFlowRouteData>(path: EconaPath.registrationFlow)
class RegistrationFlowRouteData extends GoRouteData
    with _$RegistrationFlowRouteData {
  const RegistrationFlowRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const RegistrationFlowPage(),
    );
  }
}

/// プロフィール登録画面
@TypedGoRoute<RegistrationProfileFieldRouteData>(
  path: EconaPath.registrationProfileField,
)
class RegistrationProfileFieldRouteData extends GoRouteData
    with _$RegistrationProfileFieldRouteData {
  const RegistrationProfileFieldRouteData({
    required this.field,
  });

  final String field;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    RegistrationField? resolve(String name) {
      for (final f in RegistrationField.values) {
        if (f.name == name) return f;
      }
      return null;
    }

    final resolved = resolve(field);
    return createSlideTransitionPage(
      key: state.pageKey,
      child: resolved == null
          ? const OnboardingSubProfile()
          : RegistrationProfilePage(field: resolved),
    );
  }
}

/// メインプロフィールオンボーディング
@TypedGoRoute<MainProfileOnboardingRouteData>(
  path: EconaPath.mainProfileOnboarding,
)
class MainProfileOnboardingRouteData extends GoRouteData
    with _$MainProfileOnboardingRouteData {
  const MainProfileOnboardingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const OnboardingMainProfile(),
    );
  }
}

/// 写真オンボーディング
@TypedGoRoute<PhotoOnboardingRouteData>(path: EconaPath.photoOnboarding)
class PhotoOnboardingRouteData extends GoRouteData
    with _$PhotoOnboardingRouteData {
  const PhotoOnboardingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const OnboardingPhoto(),
    );
  }
}

/// 写真選択
@TypedGoRoute<RegistrationPhotoRouteData>(path: EconaPath.registrationPhoto)
class RegistrationPhotoRouteData extends GoRouteData
    with _$RegistrationPhotoRouteData {
  const RegistrationPhotoRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const RegistrationPhoto(),
    );
  }
}

/// 写真プレビュー
@TypedGoRoute<RegistrationPhotoPreviewRouteData>(
  path: EconaPath.registrationPhotoPreview,
)
class RegistrationPhotoPreviewRouteData extends GoRouteData
    with _$RegistrationPhotoPreviewRouteData {
  const RegistrationPhotoPreviewRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const RegistrationPhotoPreview(),
    );
  }
}

/// 写真登録
@TypedGoRoute<RegistrationPhotoUploadRouteData>(
  path: EconaPath.registrationPhotoUpload,
)
class RegistrationPhotoUploadRouteData extends GoRouteData
    with _$RegistrationPhotoUploadRouteData {
  const RegistrationPhotoUploadRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const RegistrationPhotoUpload(),
    );
  }
}

/// サブプロフィールオンボーディング
@TypedGoRoute<SubProfileOnboardingRouteData>(
  path: EconaPath.subProfileOnboarding,
)
class SubProfileOnboardingRouteData extends GoRouteData
    with _$SubProfileOnboardingRouteData {
  const SubProfileOnboardingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const OnboardingSubProfile(),
    );
  }
}

/// タグオンボーディング
@TypedGoRoute<TagOnboardingRouteData>(path: EconaPath.tagOnboarding)
class TagOnboardingRouteData extends GoRouteData with _$TagOnboardingRouteData {
  const TagOnboardingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const OnboardingTag(),
    );
  }
}

/// カウンセリングオンボーディング1
@TypedGoRoute<CounselingOnboardingRouteData>(
  path: EconaPath.counselingOnboarding,
)
class CounselingOnboardingRouteData extends GoRouteData
    with _$CounselingOnboardingRouteData {
  const CounselingOnboardingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const OnboardingCounseling(),
    );
  }
}

/// カウンセリングオンボーディング2
@TypedGoRoute<CounselingOnboarding2RouteData>(
  path: EconaPath.counselingOnboarding2,
)
class CounselingOnboarding2RouteData extends GoRouteData
    with _$CounselingOnboarding2RouteData {
  const CounselingOnboarding2RouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const OnboardingCounseling2(),
    );
  }
}

/// タグカテゴリー
@TypedGoRoute<RegistrationTagCategoryRouteData>(
  path: EconaPath.registrationTagCategory,
)
class RegistrationTagCategoryRouteData extends GoRouteData
    with _$RegistrationTagCategoryRouteData {
  const RegistrationTagCategoryRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const RegistrationTagCategoryPage(),
    );
  }
}

/// タグ
@TypedGoRoute<RegistrationTagRouteData>(path: EconaPath.registrationTag)
class RegistrationTagRouteData extends GoRouteData
    with _$RegistrationTagRouteData {
  const RegistrationTagRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const RegistrationTagPage(),
    );
  }
}

/// 登録完了
@TypedGoRoute<RegistrationFinishRouteData>(path: EconaPath.registrationFinish)
class RegistrationFinishRouteData extends GoRouteData
    with _$RegistrationFinishRouteData {
  const RegistrationFinishRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const RegistrationFinish(),
    );
  }
}

//=============[ Matching ]===============//
@TypedGoRoute<MatchingRouteData>(path: EconaPath.matching)
class MatchingRouteData extends GoRouteData with _$MatchingRouteData {
  const MatchingRouteData();

  /// MatchingPageに遷移する（extraパラメータ付き）
  @override
  Future<T?> push<T>(BuildContext context, {Object? extra}) {
    return context.push<T>(location, extra: extra);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra;
    if (extra is! Matching) {
      // extraがnullまたはMatching型でない場合は、戻れるならpop、戻れないならホームへ
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;
        if (context.canPop()) {
          context.pop();
        } else {
          context.go('/home');
        }
      });
      return const SizedBox.shrink();
    }

    return MatchingPage(
      matching: extra,
    );
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: build(context, state),
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        );
      },
    );
  }
}

//=============[ Home ]===============//
/// Homeページ
class HomeRouteData extends GoRouteData with _$HomeRouteData {
  const HomeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

/// ユーザー詳細
class HomeUserDetailRouteData extends GoRouteData
    with _$HomeUserDetailRouteData {
  const HomeUserDetailRouteData({
    required this.userId,
    this.pageType = DetailPageType.home,
    this.chatRoomId,
  });

  final String userId;
  final DetailPageType pageType;
  final String? chatRoomId;

  @override
  String get location {
    final buffer = StringBuffer()
      ..write('/home/detail/$userId?type=${pageType.name}');
    if (chatRoomId != null && chatRoomId!.isNotEmpty) {
      buffer.write('&chatRoomId=$chatRoomId');
    }
    return GoRouteData.$location(buffer.toString());
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final param = state.uri.queryParameters['type'];
    final type = DetailPageType.values.firstWhere(
      (e) => e.name == param,
      orElse: () => pageType,
    );

    final chatRoomIdParam = state.uri.queryParameters['chatRoomId'];

    return CustomTransitionPage(
      key: state.pageKey,
      child: UserDetailPage(
        userId: userId,
        pageType: type,
        chatRoomId: chatRoomIdParam ?? chatRoomId,
      ),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        );
      },
    );
  }
}

/// しつもんページ
class QuestionRouteData extends GoRouteData with _$QuestionRouteData {
  const QuestionRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const QuestionPage();
}

//=============[ Like ]===============//
/// LIKEページ
class LikeRouteData extends GoRouteData with _$LikeRouteData {
  const LikeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LikePage();
}

//=============[ Lavigation ]===============//
/// Lavigationページ
class LavigationRouteData extends GoRouteData with _$LavigationRouteData {
  const LavigationRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LavigationPage();
}

/// カルテページ
class KaruteRouteData extends GoRouteData with _$KaruteRouteData {
  const KaruteRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      KaruteLoveAdvicePage(pageType: PageType.karute);
}

/// 恋愛アドバイスページ
class LoveAdviceRouteData extends GoRouteData with _$LoveAdviceRouteData {
  const LoveAdviceRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      KaruteLoveAdvicePage(pageType: PageType.loveAdvice);
}

/// らしさマッチページ
class RashisaMatchRouteData extends GoRouteData with _$RashisaMatchRouteData {
  const RashisaMatchRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const RashisaMatchPage(),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        );
      },
    );
  }
}

/// らしさマッチ詳細
class RashisaMatchDetailRouteData extends GoRouteData
    with _$RashisaMatchDetailRouteData {
  const RashisaMatchDetailRouteData({
    required this.userId,
  });

  final String userId;

  @override
  String get location => GoRouteData.$location(
        '/lavigation/rashisa-match/detail/$userId',
      );

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: UserDetailPage(
        userId: userId,
        pageType: DetailPageType.rashisaMatch,
      ),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        );
      },
    );
  }
}

/// シミュレーション
class SimulationRouteData extends GoRouteData with _$SimulationRouteData {
  const SimulationRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SimulationTopPage();
}

/// シミュレーションTopページ
class SimulationTopRouteData extends GoRouteData with _$SimulationTopRouteData {
  const SimulationTopRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SimulationTopPage();
}

/// シミュレーションチュートリアル
class SimulationTutorialRouteData extends GoRouteData with _$SimulationTutorialRouteData {
  const SimulationTutorialRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SimulationTutorialPage();
}

/// シミュレーション相手選択
class SimulationChoosePartnerRouteData extends GoRouteData
    with _$SimulationChoosePartnerRouteData {
  const SimulationChoosePartnerRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SimulationChoosePartnerPage();
}

/// シミュレーションチャット
class SimulationChatRouteData extends GoRouteData
    with _$SimulationChatRouteData {
  const SimulationChatRouteData({required this.chatRoomId});

  final String chatRoomId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final extra = state.extra;
    final room = extra is SimulatorChatRoom ? extra : null;
    return CustomTransitionPage(
      key: state.pageKey,
      child:
          SimulationChatPage(chatRoomId: chatRoomId, selectedChatRoom: room!),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved =
            CurvedAnimation(parent: animation, curve: Curves.easeOut);
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(curved),
          child: child,
        );
      },
    );
  }
}

/// カウンセリング
class CounselingRouteData extends GoRouteData with _$CounselingRouteData {
  const CounselingRouteData({this.isRegistrationFlow = false});

  final bool isRegistrationFlow;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: CounselingPage(isRegistrationFlow: isRegistrationFlow),
    );
  }
}

//=============[ Chat ]===============//
/// チャットルームページ
class ChatRoomRouteData extends GoRouteData with _$ChatRoomRouteData {
  const ChatRoomRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ChatRoomPage();
}

/// チャットページ
class ChatRouteData extends GoRouteData with _$ChatRouteData {
  const ChatRouteData({
    required this.chatRoomId,
    this.isForceReadPurchased,
  });

  final String chatRoomId;
  final bool? isForceReadPurchased;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>?;
    final toUser = extra?['toUser'] as ThumbnailUser?;
    final isForceReadPurchased = extra?['isForceReadPurchased'] as bool?;

    return ChatPage(
      chatRoomId: chatRoomId,
      toUser: toUser!,
      isForceReadPurchased: isForceReadPurchased,
    );
  }
}
//=============[ MyPage ]===============//
/// マイページ
class MyPageRouteData extends GoRouteData with _$MyPageRouteData {
  MyPageRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MyPage();
  }
}

/// プロフィール
class ProfileRouteData extends GoRouteData with _$ProfileRouteData {
  const ProfileRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const ProfilePage(),
    );
  }
}

/// プロフィール編集
class EditProfileRouteData extends GoRouteData with _$EditProfileRouteData {
  const EditProfileRouteData({
    required this.fieldName,
  });

  final String fieldName;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final field = EditProfileField.values.byName(fieldName);
    return createSlideTransitionPage(
      key: state.pageKey,
      child: EditProfilePage(field: field),
    );
  }
}

/// 現在のサブスクリプションプラン
class CurrentPlanRouteData extends GoRouteData with _$CurrentPlanRouteData {
  const CurrentPlanRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const CurrentPlanPage(),
    );
  }
}

/// 認証状況
class CertificatesRouteData extends GoRouteData with _$CertificatesRouteData {
  const CertificatesRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const CertificatesPage(),
    );
  }
}

/// 独身証明
class SingleCertificateRouteData extends GoRouteData
    with _$SingleCertificateRouteData {
  const SingleCertificateRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const SingleCertificatePage(),
    );
  }
}

/// 独身証明の確認
class ConfirmSingleRouteData extends GoRouteData with _$ConfirmSingleRouteData {
  const ConfirmSingleRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const ConfirmSinglePage(),
    );
  }
}

/// 戸籍謄本の確認
class ConfirmFamilyRegisterRouteData extends GoRouteData
    with _$ConfirmFamilyRegisterRouteData {
  const ConfirmFamilyRegisterRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const ConfirmFamilyRegisterPage(),
    );
  }
}

/// 戸籍抄本の確認
class ConfirmFamilyRegisterExtractRouteData extends GoRouteData
    with _$ConfirmFamilyRegisterExtractRouteData {
  const ConfirmFamilyRegisterExtractRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const ConfirmFamilyRegisterExtract(),
    );
  }
}

/// ポイント購入
class PurchaseRouteData extends GoRouteData with _$PurchaseRouteData {
  const PurchaseRouteData({required this.type});

  final PurchasePageType type;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: PurchasePage(pointType: type),
    );
  }
}

class PurchaseHistoryRouteData extends GoRouteData
    with _$PurchaseHistoryRouteData {
  const PurchaseHistoryRouteData({
    required this.type,
  });

  // purchaseの子なので
  final PurchasePageType type;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const PurchaseHistoryPage(),
    );
  }
}


/// サブスクリプション購入
class SubscriptionRouteData extends GoRouteData with _$SubscriptionRouteData {
  const SubscriptionRouteData({required this.type});

  final SubscriptionPageType type;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: SubscriptionPage(type: type),
    );
  }
}

/// 足あと
class FootprintRouteData extends GoRouteData with _$FootprintRouteData {
  const FootprintRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const FootprintPage(),
    );
  }
}

/// お気に入り
class FavoriteRouteData extends GoRouteData with _$FavoriteRouteData {
  const FavoriteRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const FavoritePage(),
    );
  }
}

/// 設定
class SettingsRouteData extends GoRouteData with _$SettingsRouteData {
  const SettingsRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const SettingsPage(),
    );
  }
}

/// 通知設定
class NotificationSettingRouteData extends GoRouteData
    with _$NotificationSettingRouteData {
  const NotificationSettingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const NotificationSettingPage(),
    );
  }
}

/// 通知メールアドレス設定
class EmailAddressSettingRouteData extends GoRouteData
    with _$EmailAddressSettingRouteData {
  const EmailAddressSettingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const EmailAddressSettingPage(),
    );
  }
}

/// いいね受信設定
class LikeReceiveSettingRouteData extends GoRouteData
    with _$LikeReceiveSettingRouteData {
  const LikeReceiveSettingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const LikeReceiveSettingPage(),
    );
  }
}

/// 足あと設定
class FootprintSettingRouteData extends GoRouteData
    with _$FootprintSettingRouteData {
  const FootprintSettingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const FootprintSettingPage(),
    );
  }
}

/// 初回メッセージ設定
class FirstMessageSettingRouteData extends GoRouteData
    with _$FirstMessageSettingRouteData {
  const FirstMessageSettingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const FirstMessageSettingPage(),
    );
  }
}

/// オフライン設定
class OfflineSettingRouteData extends GoRouteData
    with _$OfflineSettingRouteData {
  const OfflineSettingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const OfflineSettingPage(),
    );
  }
}

/// プライベートモード設定
class PrivateModeSettingRouteData extends GoRouteData
    with _$PrivateModeSettingRouteData {
  const PrivateModeSettingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const PrivateModeSettingPage(),
    );
  }
}

/// プライベートモード購入
class PrivateModeRouteData extends GoRouteData with _$PrivateModeRouteData {
  const PrivateModeRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const PrivateModePage(),
    );
  }
}

/// 自動マッチング設定
class AutoMatchingSettingRouteData extends GoRouteData
    with _$AutoMatchingSettingRouteData {
  const AutoMatchingSettingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const AutoMatchingSettingPage(),
    );
  }
}

/// 非表示にしたお相手
class HideUserSettingRouteData extends GoRouteData
    with _$HideUserSettingRouteData {
  const HideUserSettingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const HideUserSettingPage(),
    );
  }
}

/// 非表示にしたやり取り
class HideChatRoomsSettingRouteData extends GoRouteData
    with _$HideChatRoomsSettingRouteData {
  const HideChatRoomsSettingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const HideChatRoomsSettingPage(),
    );
  }
}

/// ブロックしたお相手
class BlockUserSettingRouteData extends GoRouteData
    with _$BlockUserSettingRouteData {
  const BlockUserSettingRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const BlockUserSettingPage(),
    );
  }
}

/// 退会
class WithdrawalRouteData extends GoRouteData with _$WithdrawalRouteData {
  const WithdrawalRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const WithdrawalPage(),
    );
  }
}

/// 退会理由
class WithdrawalReasonRouteData extends GoRouteData
    with _$WithdrawalReasonRouteData {
  const WithdrawalReasonRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const WithdrawalReasonPage(),
    );
  }
}

/// 退会完了
class WithdrawalCompleteRouteData extends GoRouteData
    with _$WithdrawalCompleteRouteData {
  const WithdrawalCompleteRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return createSlideTransitionPage(
      key: state.pageKey,
      child: const WithdrawalCompletePage(),
    );
  }
}

/// WebView
class WebViewRouteData extends GoRouteData with _$WebViewRouteData {
  const WebViewRouteData({
    required this.url,
    required this.title,
  });

  final String url;
  final String title;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      WebViewPage(url: url, title: title);
}

class EkycWebViewRouteData extends GoRouteData with _$EkycWebViewRouteData {
  const EkycWebViewRouteData({required this.url});

  final String url;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EkycWebView(url: url);
}