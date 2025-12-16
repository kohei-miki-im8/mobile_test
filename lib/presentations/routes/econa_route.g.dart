// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'econa_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $econaStatefulShellRouteData,
      $splashRouteData,
      $loginRouteData,
      $emailLinkAuthRouteData,
      $emailLinkVerifyRouteData,
      $emailNotReceivedRouteData,
      $phoneNumberAuthRouteData,
      $phoneNumberVerifyRouteData,
      $userAgreementRouteData,
      $registrationFlowRouteData,
      $registrationProfileFieldRouteData,
      $mainProfileOnboardingRouteData,
      $photoOnboardingRouteData,
      $registrationPhotoRouteData,
      $registrationPhotoPreviewRouteData,
      $registrationPhotoUploadRouteData,
      $subProfileOnboardingRouteData,
      $tagOnboardingRouteData,
      $counselingOnboardingRouteData,
      $counselingOnboarding2RouteData,
      $registrationTagCategoryRouteData,
      $registrationTagRouteData,
      $registrationFinishRouteData,
      $matchingRouteData,
    ];

RouteBase get $econaStatefulShellRouteData => StatefulShellRouteData.$route(
      factory: $EconaStatefulShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/home',
              factory: _$HomeRouteData._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'detail/:userId',
                  factory: _$HomeUserDetailRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'question',
                  factory: _$QuestionRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'webview',
                  factory: _$WebViewRouteData._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/like',
              factory: _$LikeRouteData._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/lavigation',
              factory: _$LavigationRouteData._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'karute',
                  factory: _$KaruteRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'love-advice',
                  factory: _$LoveAdviceRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'counseling',
                  factory: _$CounselingRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'simulation',
                  factory: _$SimulationRouteData._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'simulation-top',
                      factory: _$SimulationTopRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'simulation-tutorial',
                      factory: _$SimulationTutorialRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'simulation-choose',
                      factory: _$SimulationChoosePartnerRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'simulation-chat/:chatRoomId',
                      factory: _$SimulationChatRouteData._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'rashisa-match',
                  factory: _$RashisaMatchRouteData._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'detail/:userId',
                      factory: _$RashisaMatchDetailRouteData._fromState,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/chatroom',
              factory: _$ChatRoomRouteData._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'chat/:chatRoomId',
                  factory: _$ChatRouteData._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/my-page',
              factory: _$MyPageRouteData._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'settings',
                  factory: _$SettingsRouteData._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'notification-setting',
                      factory: _$NotificationSettingRouteData._fromState,
                      routes: [
                        GoRouteData.$route(
                          path: 'email-address-setting',
                          factory: _$EmailAddressSettingRouteData._fromState,
                        ),
                      ],
                    ),
                    GoRouteData.$route(
                      path: 'like-receive-setting',
                      factory: _$LikeReceiveSettingRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'footprint-setting',
                      factory: _$FootprintSettingRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'first-message-setting',
                      factory: _$FirstMessageSettingRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'offline-setting',
                      factory: _$OfflineSettingRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'private-mode-setting',
                      factory: _$PrivateModeSettingRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'private-mode-purchase',
                      factory: _$PrivateModeRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'auto-matching-setting',
                      factory: _$AutoMatchingSettingRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'hide-user-setting',
                      factory: _$HideUserSettingRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'hide-chat-rooms-setting',
                      factory: _$HideChatRoomsSettingRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'block-user-setting',
                      factory: _$BlockUserSettingRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'withdrawal',
                      factory: _$WithdrawalRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'withdrawal-reason',
                      factory: _$WithdrawalReasonRouteData._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'withdrawal-conplete',
                      factory: _$WithdrawalCompleteRouteData._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'profile',
                  factory: _$ProfileRouteData._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'edit-profile',
                      factory: _$EditProfileRouteData._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'current-plan',
                  factory: _$CurrentPlanRouteData._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'subscription',
                      factory: _$SubscriptionRouteData._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'certificates',
                  factory: _$CertificatesRouteData._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'single-certificate',
                      factory: _$SingleCertificateRouteData._fromState,
                      routes: [
                        GoRouteData.$route(
                          path: 'confirm-single',
                          factory: _$ConfirmSingleRouteData._fromState,
                        ),
                        GoRouteData.$route(
                          path: 'confirm-family-register',
                          factory: _$ConfirmFamilyRegisterRouteData._fromState,
                        ),
                        GoRouteData.$route(
                          path: 'confirm-family-register-extract',
                          factory: _$ConfirmFamilyRegisterExtractRouteData
                              ._fromState,
                        ),
                      ],
                    ),
                    GoRouteData.$route(
                      path: 'ekycWebView',
                      factory: _$EkycWebViewRouteData._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'purchase',
                  factory: _$PurchaseRouteData._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'purchase-history',
                      factory: _$PurchaseHistoryRouteData._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'footprint',
                  factory: _$FootprintRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'favorite',
                  factory: _$FavoriteRouteData._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $EconaStatefulShellRouteDataExtension on EconaStatefulShellRouteData {
  static EconaStatefulShellRouteData _fromState(GoRouterState state) =>
      const EconaStatefulShellRouteData();
}

mixin _$HomeRouteData on GoRouteData {
  static HomeRouteData _fromState(GoRouterState state) => const HomeRouteData();

  @override
  String get location => GoRouteData.$location(
        '/home',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$HomeUserDetailRouteData on GoRouteData {
  static HomeUserDetailRouteData _fromState(GoRouterState state) =>
      HomeUserDetailRouteData(
        userId: state.pathParameters['userId']!,
        pageType: _$convertMapValue('page-type', state.uri.queryParameters,
                _$DetailPageTypeEnumMap._$fromName) ??
            DetailPageType.home,
        chatRoomId: state.uri.queryParameters['chat-room-id'],
      );

  HomeUserDetailRouteData get _self => this as HomeUserDetailRouteData;

  @override
  String get location => GoRouteData.$location(
        '/home/detail/${Uri.encodeComponent(_self.userId)}',
        queryParams: {
          if (_self.pageType != DetailPageType.home)
            'page-type': _$DetailPageTypeEnumMap[_self.pageType],
          if (_self.chatRoomId != null) 'chat-room-id': _self.chatRoomId,
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

const _$DetailPageTypeEnumMap = {
  DetailPageType.home: 'home',
  DetailPageType.rashisaMatch: 'rashisa-match',
  DetailPageType.profile: 'profile',
  DetailPageType.chat: 'chat',
  DetailPageType.like: 'like',
};

mixin _$QuestionRouteData on GoRouteData {
  static QuestionRouteData _fromState(GoRouterState state) =>
      const QuestionRouteData();

  @override
  String get location => GoRouteData.$location(
        '/home/question',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$WebViewRouteData on GoRouteData {
  static WebViewRouteData _fromState(GoRouterState state) => WebViewRouteData(
        url: state.uri.queryParameters['url']!,
        title: state.uri.queryParameters['title']!,
      );

  WebViewRouteData get _self => this as WebViewRouteData;

  @override
  String get location => GoRouteData.$location(
        '/home/webview',
        queryParams: {
          'url': _self.url,
          'title': _self.title,
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$LikeRouteData on GoRouteData {
  static LikeRouteData _fromState(GoRouterState state) => const LikeRouteData();

  @override
  String get location => GoRouteData.$location(
        '/like',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$LavigationRouteData on GoRouteData {
  static LavigationRouteData _fromState(GoRouterState state) =>
      const LavigationRouteData();

  @override
  String get location => GoRouteData.$location(
        '/lavigation',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$KaruteRouteData on GoRouteData {
  static KaruteRouteData _fromState(GoRouterState state) =>
      const KaruteRouteData();

  @override
  String get location => GoRouteData.$location(
        '/lavigation/karute',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$LoveAdviceRouteData on GoRouteData {
  static LoveAdviceRouteData _fromState(GoRouterState state) =>
      const LoveAdviceRouteData();

  @override
  String get location => GoRouteData.$location(
        '/lavigation/love-advice',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$CounselingRouteData on GoRouteData {
  static CounselingRouteData _fromState(GoRouterState state) =>
      CounselingRouteData(
        isRegistrationFlow: _$convertMapValue('is-registration-flow',
                state.uri.queryParameters, _$boolConverter) ??
            false,
      );

  CounselingRouteData get _self => this as CounselingRouteData;

  @override
  String get location => GoRouteData.$location(
        '/lavigation/counseling',
        queryParams: {
          if (_self.isRegistrationFlow != false)
            'is-registration-flow': _self.isRegistrationFlow.toString(),
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SimulationRouteData on GoRouteData {
  static SimulationRouteData _fromState(GoRouterState state) =>
      const SimulationRouteData();

  @override
  String get location => GoRouteData.$location(
        '/lavigation/simulation',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SimulationTopRouteData on GoRouteData {
  static SimulationTopRouteData _fromState(GoRouterState state) =>
      const SimulationTopRouteData();

  @override
  String get location => GoRouteData.$location(
        '/lavigation/simulation/simulation-top',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SimulationTutorialRouteData on GoRouteData {
  static SimulationTutorialRouteData _fromState(GoRouterState state) =>
      const SimulationTutorialRouteData();

  @override
  String get location => GoRouteData.$location(
        '/lavigation/simulation/simulation-tutorial',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SimulationChoosePartnerRouteData on GoRouteData {
  static SimulationChoosePartnerRouteData _fromState(GoRouterState state) =>
      const SimulationChoosePartnerRouteData();

  @override
  String get location => GoRouteData.$location(
        '/lavigation/simulation/simulation-choose',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SimulationChatRouteData on GoRouteData {
  static SimulationChatRouteData _fromState(GoRouterState state) =>
      SimulationChatRouteData(
        chatRoomId: state.pathParameters['chatRoomId']!,
      );

  SimulationChatRouteData get _self => this as SimulationChatRouteData;

  @override
  String get location => GoRouteData.$location(
        '/lavigation/simulation/simulation-chat/${Uri.encodeComponent(_self.chatRoomId)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$RashisaMatchRouteData on GoRouteData {
  static RashisaMatchRouteData _fromState(GoRouterState state) =>
      const RashisaMatchRouteData();

  @override
  String get location => GoRouteData.$location(
        '/lavigation/rashisa-match',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$RashisaMatchDetailRouteData on GoRouteData {
  static RashisaMatchDetailRouteData _fromState(GoRouterState state) =>
      RashisaMatchDetailRouteData(
        userId: state.pathParameters['userId']!,
      );

  RashisaMatchDetailRouteData get _self => this as RashisaMatchDetailRouteData;

  @override
  String get location => GoRouteData.$location(
        '/lavigation/rashisa-match/detail/${Uri.encodeComponent(_self.userId)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ChatRoomRouteData on GoRouteData {
  static ChatRoomRouteData _fromState(GoRouterState state) =>
      const ChatRoomRouteData();

  @override
  String get location => GoRouteData.$location(
        '/chatroom',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ChatRouteData on GoRouteData {
  static ChatRouteData _fromState(GoRouterState state) => ChatRouteData(
        chatRoomId: state.pathParameters['chatRoomId']!,
        isForceReadPurchased: _$convertMapValue('is-force-read-purchased',
            state.uri.queryParameters, _$boolConverter),
      );

  ChatRouteData get _self => this as ChatRouteData;

  @override
  String get location => GoRouteData.$location(
        '/chatroom/chat/${Uri.encodeComponent(_self.chatRoomId)}',
        queryParams: {
          if (_self.isForceReadPurchased != null)
            'is-force-read-purchased': _self.isForceReadPurchased!.toString(),
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$MyPageRouteData on GoRouteData {
  static MyPageRouteData _fromState(GoRouterState state) => MyPageRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SettingsRouteData on GoRouteData {
  static SettingsRouteData _fromState(GoRouterState state) =>
      const SettingsRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$NotificationSettingRouteData on GoRouteData {
  static NotificationSettingRouteData _fromState(GoRouterState state) =>
      const NotificationSettingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/notification-setting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$EmailAddressSettingRouteData on GoRouteData {
  static EmailAddressSettingRouteData _fromState(GoRouterState state) =>
      const EmailAddressSettingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/notification-setting/email-address-setting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$LikeReceiveSettingRouteData on GoRouteData {
  static LikeReceiveSettingRouteData _fromState(GoRouterState state) =>
      const LikeReceiveSettingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/like-receive-setting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$FootprintSettingRouteData on GoRouteData {
  static FootprintSettingRouteData _fromState(GoRouterState state) =>
      const FootprintSettingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/footprint-setting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$FirstMessageSettingRouteData on GoRouteData {
  static FirstMessageSettingRouteData _fromState(GoRouterState state) =>
      const FirstMessageSettingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/first-message-setting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$OfflineSettingRouteData on GoRouteData {
  static OfflineSettingRouteData _fromState(GoRouterState state) =>
      const OfflineSettingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/offline-setting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$PrivateModeSettingRouteData on GoRouteData {
  static PrivateModeSettingRouteData _fromState(GoRouterState state) =>
      const PrivateModeSettingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/private-mode-setting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$PrivateModeRouteData on GoRouteData {
  static PrivateModeRouteData _fromState(GoRouterState state) =>
      const PrivateModeRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/private-mode-purchase',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$AutoMatchingSettingRouteData on GoRouteData {
  static AutoMatchingSettingRouteData _fromState(GoRouterState state) =>
      const AutoMatchingSettingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/auto-matching-setting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$HideUserSettingRouteData on GoRouteData {
  static HideUserSettingRouteData _fromState(GoRouterState state) =>
      const HideUserSettingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/hide-user-setting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$HideChatRoomsSettingRouteData on GoRouteData {
  static HideChatRoomsSettingRouteData _fromState(GoRouterState state) =>
      const HideChatRoomsSettingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/hide-chat-rooms-setting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$BlockUserSettingRouteData on GoRouteData {
  static BlockUserSettingRouteData _fromState(GoRouterState state) =>
      const BlockUserSettingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/block-user-setting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$WithdrawalRouteData on GoRouteData {
  static WithdrawalRouteData _fromState(GoRouterState state) =>
      const WithdrawalRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/withdrawal',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$WithdrawalReasonRouteData on GoRouteData {
  static WithdrawalReasonRouteData _fromState(GoRouterState state) =>
      const WithdrawalReasonRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/withdrawal-reason',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$WithdrawalCompleteRouteData on GoRouteData {
  static WithdrawalCompleteRouteData _fromState(GoRouterState state) =>
      const WithdrawalCompleteRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/settings/withdrawal-conplete',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ProfileRouteData on GoRouteData {
  static ProfileRouteData _fromState(GoRouterState state) =>
      const ProfileRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/profile',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$EditProfileRouteData on GoRouteData {
  static EditProfileRouteData _fromState(GoRouterState state) =>
      EditProfileRouteData(
        fieldName: state.uri.queryParameters['field-name']!,
      );

  EditProfileRouteData get _self => this as EditProfileRouteData;

  @override
  String get location => GoRouteData.$location(
        '/my-page/profile/edit-profile',
        queryParams: {
          'field-name': _self.fieldName,
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$CurrentPlanRouteData on GoRouteData {
  static CurrentPlanRouteData _fromState(GoRouterState state) =>
      const CurrentPlanRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/current-plan',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SubscriptionRouteData on GoRouteData {
  static SubscriptionRouteData _fromState(GoRouterState state) =>
      SubscriptionRouteData(
        type: _$SubscriptionPageTypeEnumMap
            ._$fromName(state.uri.queryParameters['type']!)!,
      );

  SubscriptionRouteData get _self => this as SubscriptionRouteData;

  @override
  String get location => GoRouteData.$location(
        '/my-page/current-plan/subscription',
        queryParams: {
          'type': _$SubscriptionPageTypeEnumMap[_self.type],
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

const _$SubscriptionPageTypeEnumMap = {
  SubscriptionPageType.basic: 'basic',
  SubscriptionPageType.premium: 'premium',
};

mixin _$CertificatesRouteData on GoRouteData {
  static CertificatesRouteData _fromState(GoRouterState state) =>
      const CertificatesRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/certificates',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SingleCertificateRouteData on GoRouteData {
  static SingleCertificateRouteData _fromState(GoRouterState state) =>
      const SingleCertificateRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/certificates/single-certificate',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ConfirmSingleRouteData on GoRouteData {
  static ConfirmSingleRouteData _fromState(GoRouterState state) =>
      const ConfirmSingleRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/certificates/single-certificate/confirm-single',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ConfirmFamilyRegisterRouteData on GoRouteData {
  static ConfirmFamilyRegisterRouteData _fromState(GoRouterState state) =>
      const ConfirmFamilyRegisterRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/certificates/single-certificate/confirm-family-register',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ConfirmFamilyRegisterExtractRouteData on GoRouteData {
  static ConfirmFamilyRegisterExtractRouteData _fromState(
          GoRouterState state) =>
      const ConfirmFamilyRegisterExtractRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/certificates/single-certificate/confirm-family-register-extract',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$EkycWebViewRouteData on GoRouteData {
  static EkycWebViewRouteData _fromState(GoRouterState state) =>
      EkycWebViewRouteData(
        url: state.uri.queryParameters['url']!,
      );

  EkycWebViewRouteData get _self => this as EkycWebViewRouteData;

  @override
  String get location => GoRouteData.$location(
        '/my-page/certificates/ekycWebView',
        queryParams: {
          'url': _self.url,
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$PurchaseRouteData on GoRouteData {
  static PurchaseRouteData _fromState(GoRouterState state) => PurchaseRouteData(
        type: _$PurchasePageTypeEnumMap
            ._$fromName(state.uri.queryParameters['type']!)!,
      );

  PurchaseRouteData get _self => this as PurchaseRouteData;

  @override
  String get location => GoRouteData.$location(
        '/my-page/purchase',
        queryParams: {
          'type': _$PurchasePageTypeEnumMap[_self.type],
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

const _$PurchasePageTypeEnumMap = {
  PurchasePageType.lp: 'lp',
  PurchasePageType.mp: 'mp',
};

mixin _$PurchaseHistoryRouteData on GoRouteData {
  static PurchaseHistoryRouteData _fromState(GoRouterState state) =>
      PurchaseHistoryRouteData(
        type: _$PurchasePageTypeEnumMap
            ._$fromName(state.uri.queryParameters['type']!)!,
      );

  PurchaseHistoryRouteData get _self => this as PurchaseHistoryRouteData;

  @override
  String get location => GoRouteData.$location(
        '/my-page/purchase/purchase-history',
        queryParams: {
          'type': _$PurchasePageTypeEnumMap[_self.type],
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$FootprintRouteData on GoRouteData {
  static FootprintRouteData _fromState(GoRouterState state) =>
      const FootprintRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/footprint',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$FavoriteRouteData on GoRouteData {
  static FavoriteRouteData _fromState(GoRouterState state) =>
      const FavoriteRouteData();

  @override
  String get location => GoRouteData.$location(
        '/my-page/favorite',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) =>
      entries.where((element) => element.value == value).firstOrNull?.key;
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $splashRouteData => GoRouteData.$route(
      path: '/splash',
      factory: _$SplashRouteData._fromState,
    );

mixin _$SplashRouteData on GoRouteData {
  static SplashRouteData _fromState(GoRouterState state) =>
      const SplashRouteData();

  @override
  String get location => GoRouteData.$location(
        '/splash',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRouteData => GoRouteData.$route(
      path: '/login',
      factory: _$LoginRouteData._fromState,
    );

mixin _$LoginRouteData on GoRouteData {
  static LoginRouteData _fromState(GoRouterState state) =>
      const LoginRouteData();

  @override
  String get location => GoRouteData.$location(
        '/login',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $emailLinkAuthRouteData => GoRouteData.$route(
      path: '/email-link-auth',
      factory: _$EmailLinkAuthRouteData._fromState,
    );

mixin _$EmailLinkAuthRouteData on GoRouteData {
  static EmailLinkAuthRouteData _fromState(GoRouterState state) =>
      const EmailLinkAuthRouteData();

  @override
  String get location => GoRouteData.$location(
        '/email-link-auth',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $emailLinkVerifyRouteData => GoRouteData.$route(
      path: '/email-link-verify',
      factory: _$EmailLinkVerifyRouteData._fromState,
    );

mixin _$EmailLinkVerifyRouteData on GoRouteData {
  static EmailLinkVerifyRouteData _fromState(GoRouterState state) =>
      const EmailLinkVerifyRouteData();

  @override
  String get location => GoRouteData.$location(
        '/email-link-verify',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $emailNotReceivedRouteData => GoRouteData.$route(
      path: '/email-not-received',
      factory: _$EmailNotReceivedRouteData._fromState,
    );

mixin _$EmailNotReceivedRouteData on GoRouteData {
  static EmailNotReceivedRouteData _fromState(GoRouterState state) =>
      const EmailNotReceivedRouteData();

  @override
  String get location => GoRouteData.$location(
        '/email-not-received',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $phoneNumberAuthRouteData => GoRouteData.$route(
      path: '/phone-number-auth',
      factory: _$PhoneNumberAuthRouteData._fromState,
    );

mixin _$PhoneNumberAuthRouteData on GoRouteData {
  static PhoneNumberAuthRouteData _fromState(GoRouterState state) =>
      const PhoneNumberAuthRouteData();

  @override
  String get location => GoRouteData.$location(
        '/phone-number-auth',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $phoneNumberVerifyRouteData => GoRouteData.$route(
      path: '/phone-number-verify',
      factory: _$PhoneNumberVerifyRouteData._fromState,
    );

mixin _$PhoneNumberVerifyRouteData on GoRouteData {
  static PhoneNumberVerifyRouteData _fromState(GoRouterState state) =>
      const PhoneNumberVerifyRouteData();

  @override
  String get location => GoRouteData.$location(
        '/phone-number-verify',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userAgreementRouteData => GoRouteData.$route(
      path: '/user-agreement',
      factory: _$UserAgreementRouteData._fromState,
    );

mixin _$UserAgreementRouteData on GoRouteData {
  static UserAgreementRouteData _fromState(GoRouterState state) =>
      const UserAgreementRouteData();

  @override
  String get location => GoRouteData.$location(
        '/user-agreement',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registrationFlowRouteData => GoRouteData.$route(
      path: '/registration-flow',
      factory: _$RegistrationFlowRouteData._fromState,
    );

mixin _$RegistrationFlowRouteData on GoRouteData {
  static RegistrationFlowRouteData _fromState(GoRouterState state) =>
      const RegistrationFlowRouteData();

  @override
  String get location => GoRouteData.$location(
        '/registration-flow',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registrationProfileFieldRouteData => GoRouteData.$route(
      path: '/registration/profile/:field',
      factory: _$RegistrationProfileFieldRouteData._fromState,
    );

mixin _$RegistrationProfileFieldRouteData on GoRouteData {
  static RegistrationProfileFieldRouteData _fromState(GoRouterState state) =>
      RegistrationProfileFieldRouteData(
        field: state.pathParameters['field']!,
      );

  RegistrationProfileFieldRouteData get _self =>
      this as RegistrationProfileFieldRouteData;

  @override
  String get location => GoRouteData.$location(
        '/registration/profile/${Uri.encodeComponent(_self.field)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainProfileOnboardingRouteData => GoRouteData.$route(
      path: '/onboarding/main-profile',
      factory: _$MainProfileOnboardingRouteData._fromState,
    );

mixin _$MainProfileOnboardingRouteData on GoRouteData {
  static MainProfileOnboardingRouteData _fromState(GoRouterState state) =>
      const MainProfileOnboardingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/onboarding/main-profile',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $photoOnboardingRouteData => GoRouteData.$route(
      path: '/onboarding/photo',
      factory: _$PhotoOnboardingRouteData._fromState,
    );

mixin _$PhotoOnboardingRouteData on GoRouteData {
  static PhotoOnboardingRouteData _fromState(GoRouterState state) =>
      const PhotoOnboardingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/onboarding/photo',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registrationPhotoRouteData => GoRouteData.$route(
      path: '/registration/photo',
      factory: _$RegistrationPhotoRouteData._fromState,
    );

mixin _$RegistrationPhotoRouteData on GoRouteData {
  static RegistrationPhotoRouteData _fromState(GoRouterState state) =>
      const RegistrationPhotoRouteData();

  @override
  String get location => GoRouteData.$location(
        '/registration/photo',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registrationPhotoPreviewRouteData => GoRouteData.$route(
      path: '/registration/photo/preview',
      factory: _$RegistrationPhotoPreviewRouteData._fromState,
    );

mixin _$RegistrationPhotoPreviewRouteData on GoRouteData {
  static RegistrationPhotoPreviewRouteData _fromState(GoRouterState state) =>
      const RegistrationPhotoPreviewRouteData();

  @override
  String get location => GoRouteData.$location(
        '/registration/photo/preview',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registrationPhotoUploadRouteData => GoRouteData.$route(
      path: '/registration/photo/upload',
      factory: _$RegistrationPhotoUploadRouteData._fromState,
    );

mixin _$RegistrationPhotoUploadRouteData on GoRouteData {
  static RegistrationPhotoUploadRouteData _fromState(GoRouterState state) =>
      const RegistrationPhotoUploadRouteData();

  @override
  String get location => GoRouteData.$location(
        '/registration/photo/upload',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $subProfileOnboardingRouteData => GoRouteData.$route(
      path: '/onboarding/sub-profile',
      factory: _$SubProfileOnboardingRouteData._fromState,
    );

mixin _$SubProfileOnboardingRouteData on GoRouteData {
  static SubProfileOnboardingRouteData _fromState(GoRouterState state) =>
      const SubProfileOnboardingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/onboarding/sub-profile',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $tagOnboardingRouteData => GoRouteData.$route(
      path: '/onboarding/tag',
      factory: _$TagOnboardingRouteData._fromState,
    );

mixin _$TagOnboardingRouteData on GoRouteData {
  static TagOnboardingRouteData _fromState(GoRouterState state) =>
      const TagOnboardingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/onboarding/tag',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $counselingOnboardingRouteData => GoRouteData.$route(
      path: '/onboarding/counseling',
      factory: _$CounselingOnboardingRouteData._fromState,
    );

mixin _$CounselingOnboardingRouteData on GoRouteData {
  static CounselingOnboardingRouteData _fromState(GoRouterState state) =>
      const CounselingOnboardingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/onboarding/counseling',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $counselingOnboarding2RouteData => GoRouteData.$route(
      path: '/onboarding/counseling-2',
      factory: _$CounselingOnboarding2RouteData._fromState,
    );

mixin _$CounselingOnboarding2RouteData on GoRouteData {
  static CounselingOnboarding2RouteData _fromState(GoRouterState state) =>
      const CounselingOnboarding2RouteData();

  @override
  String get location => GoRouteData.$location(
        '/onboarding/counseling-2',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registrationTagCategoryRouteData => GoRouteData.$route(
      path: '/registration/tag-category',
      factory: _$RegistrationTagCategoryRouteData._fromState,
    );

mixin _$RegistrationTagCategoryRouteData on GoRouteData {
  static RegistrationTagCategoryRouteData _fromState(GoRouterState state) =>
      const RegistrationTagCategoryRouteData();

  @override
  String get location => GoRouteData.$location(
        '/registration/tag-category',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registrationTagRouteData => GoRouteData.$route(
      path: '/registration/tag',
      factory: _$RegistrationTagRouteData._fromState,
    );

mixin _$RegistrationTagRouteData on GoRouteData {
  static RegistrationTagRouteData _fromState(GoRouterState state) =>
      const RegistrationTagRouteData();

  @override
  String get location => GoRouteData.$location(
        '/registration/tag',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registrationFinishRouteData => GoRouteData.$route(
      path: '/registration/finish',
      factory: _$RegistrationFinishRouteData._fromState,
    );

mixin _$RegistrationFinishRouteData on GoRouteData {
  static RegistrationFinishRouteData _fromState(GoRouterState state) =>
      const RegistrationFinishRouteData();

  @override
  String get location => GoRouteData.$location(
        '/registration/finish',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $matchingRouteData => GoRouteData.$route(
      path: '/matching',
      factory: _$MatchingRouteData._fromState,
    );

mixin _$MatchingRouteData on GoRouteData {
  static MatchingRouteData _fromState(GoRouterState state) =>
      const MatchingRouteData();

  @override
  String get location => GoRouteData.$location(
        '/matching',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
