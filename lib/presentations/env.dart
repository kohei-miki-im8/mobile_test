import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'REVENUE_CAT_GOOGLE_PUBLIC_API_KEY', obfuscate: true)
  static String revenueCatGooglePublicApiKey = _Env.revenueCatGooglePublicApiKey;

  @EnviedField(varName: 'REVENUE_CAT_IOS_PUBLIC_API_KEY', obfuscate: true)
  static String revenueCatIosPublicApiKey = _Env.revenueCatIosPublicApiKey;

  @EnviedField(varName: 'RECAPTCHA_KEY_ANDROID', obfuscate: true)
  static String recaptchaKeyAndroid = _Env.recaptchaKeyAndroid;

  @EnviedField(varName: 'RECAPTCHA_KEY_IOS', obfuscate: true)
  static String recaptchaKeyIOS = _Env.recaptchaKeyIOS;

  @EnviedField(varName: 'LINE_CHANNEL_ID', obfuscate: true)
  static String lineChannelId = _Env.lineChannelId;

  @EnviedField(varName: 'LINE_OAUTH_PROVIDER_ID', obfuscate: true)
  static String lineOauthProviderId = _Env.lineOauthProviderId;

  @EnviedField(varName: 'SENTRY_DSN', obfuscate: true)
  static String sentryDsn = _Env.sentryDsn;
  
  @EnviedField(varName: 'ADJUST_TOKEN', obfuscate: true)
  static String adjustToken = _Env.adjustToken;

  /// 100LPの購入
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_LP_100', obfuscate: true)
  static String adjustEventTokenPurchaseLp100 = _Env.adjustEventTokenPurchaseLp100;

  /// 100MPの購入
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_MP_100', obfuscate: true)
  static String adjustEventTokenPurchaseMp100 = _Env.adjustEventTokenPurchaseMp100;

  /// 10LPの購入
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_LP_10', obfuscate: true)
  static String adjustEventTokenPurchaseLp10 = _Env.adjustEventTokenPurchaseLp10;

  /// 10MPの購入
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_MP_10', obfuscate: true)
  static String adjustEventTokenPurchaseMp10 = _Env.adjustEventTokenPurchaseMp10;

  /// 1か月のプライベートモードの購入
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_PRIVATE_MODE_1M', obfuscate: true)
  static String adjustEventTokenPurchasePrivateMode1m = _Env.adjustEventTokenPurchasePrivateMode1m;

  /// 1か月のプレミアムプランの購入（女性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_PREMIUM_1M_FEMALE', obfuscate: true)
  static String adjustEventTokenPurchasePremium1mFemale = _Env.adjustEventTokenPurchasePremium1mFemale;

  /// 1か月のプレミアムプランの購入（男性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_PREMIUM_1M_MALE', obfuscate: true)
  static String adjustEventTokenPurchasePremium1mMale = _Env.adjustEventTokenPurchasePremium1mMale;

  /// 1か月のベーシックプランの購入（男性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_BASIC_1M_MALE', obfuscate: true)
  static String adjustEventTokenPurchaseBasic1mMale = _Env.adjustEventTokenPurchaseBasic1mMale;

  /// 1か月のベーシックプラン無料トライアル
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_BASIC_1M_TRIAL', obfuscate: true)
  static String adjustEventTokenPurchaseBasic1mTrial = _Env.adjustEventTokenPurchaseBasic1mTrial;

  /// 30LPの購入
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_LP_30', obfuscate: true)
  static String adjustEventTokenPurchaseLp30 = _Env.adjustEventTokenPurchaseLp30;

  /// 30MPの購入
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_MP_30', obfuscate: true)
  static String adjustEventTokenPurchaseMp30 = _Env.adjustEventTokenPurchaseMp30;

  /// 3か月のプライベートモードの購入
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_PRIVATE_MODE_3M', obfuscate: true)
  static String adjustEventTokenPurchasePrivateMode3m = _Env.adjustEventTokenPurchasePrivateMode3m;

  /// 3か月のプレミアムプランの購入（女性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_PREMIUM_3M_FEMALE', obfuscate: true)
  static String adjustEventTokenPurchasePremium3mFemale = _Env.adjustEventTokenPurchasePremium3mFemale;

  /// 3か月のプレミアムプランの購入（男性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_PREMIUM_3M_MALE', obfuscate: true)
  static String adjustEventTokenPurchasePremium3mMale = _Env.adjustEventTokenPurchasePremium3mMale;

  /// 3か月のベーシックプランの購入（男性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_BASIC_3M_MALE', obfuscate: true)
  static String adjustEventTokenPurchaseBasic3mMale = _Env.adjustEventTokenPurchaseBasic3mMale;

  /// 50LPの購入
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_LP_50', obfuscate: true)
  static String adjustEventTokenPurchaseLp50 = _Env.adjustEventTokenPurchaseLp50;

  /// 50MPの購入
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_MP_50', obfuscate: true)
  static String adjustEventTokenPurchaseMp50 = _Env.adjustEventTokenPurchaseMp50;

  /// 6か月のプライベートモードの購入
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_PRIVATE_MODE_6M', obfuscate: true)
  static String adjustEventTokenPurchasePrivateMode6m = _Env.adjustEventTokenPurchasePrivateMode6m;

  /// 6か月のプレミアムプランの購入（女性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_PREMIUM_6M_FEMALE', obfuscate: true)
  static String adjustEventTokenPurchasePremium6mFemale = _Env.adjustEventTokenPurchasePremium6mFemale;

  /// 6か月のプレミアムプランの購入（男性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_PREMIUM_6M_MALE', obfuscate: true)
  static String adjustEventTokenPurchasePremium6mMale = _Env.adjustEventTokenPurchasePremium6mMale;

  /// 6か月のベーシックプランの購入（男性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PURCHASE_BASIC_6M_MALE', obfuscate: true)
  static String adjustEventTokenPurchaseBasic6mMale = _Env.adjustEventTokenPurchaseBasic6mMale;

  /// AIカウンセリング
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_AI_COUNSELING', obfuscate: true)
  static String adjustEventTokenAiCounseling = _Env.adjustEventTokenAiCounseling;

  /// アピール！
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_APPEAL', obfuscate: true)
  static String adjustEventTokenAppeal = _Env.adjustEventTokenAppeal;

  /// いいね
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_LIKE', obfuscate: true)
  static String adjustEventTokenLike = _Env.adjustEventTokenLike;

  /// いいね ありがとう
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_LIKE_THANKS', obfuscate: true)
  static String adjustEventTokenLikeThanks = _Env.adjustEventTokenLikeThanks;

  /// サブスク再課金
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SUBSCRIPTION_RENEWAL', obfuscate: true)
  static String adjustEventTokenSubscriptionRenewal = _Env.adjustEventTokenSubscriptionRenewal;

  /// サブスク終了
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SUBSCRIPTION_END', obfuscate: true)
  static String adjustEventTokenSubscriptionEnd = _Env.adjustEventTokenSubscriptionEnd;

  /// しつもん
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_QUESTION_POST', obfuscate: true)
  static String adjustEventTokenQuestionPost = _Env.adjustEventTokenQuestionPost;

  /// しつもんへの回答
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_QUESTION_ANSWER', obfuscate: true)
  static String adjustEventTokenQuestionAnswer = _Env.adjustEventTokenQuestionAnswer;

  /// しつもん回答の閲覧
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_QUESTION_ANSWER_VIEW', obfuscate: true)
  static String adjustEventTokenQuestionAnswerView = _Env.adjustEventTokenQuestionAnswerView;

  /// スキップ
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SKIP', obfuscate: true)
  static String adjustEventTokenSkip = _Env.adjustEventTokenSkip;

  /// なりきり挨拶・返信
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PERSONA_GREETING_REPLY', obfuscate: true)
  static String adjustEventTokenPersonaGreetingReply = _Env.adjustEventTokenPersonaGreetingReply;

  /// なりきり自己紹介
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PERSONA_SELF_INTRO', obfuscate: true)
  static String adjustEventTokenPersonaSelfIntro = _Env.adjustEventTokenPersonaSelfIntro;

  /// ブースト
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_BOOST', obfuscate: true)
  static String adjustEventTokenBoost = _Env.adjustEventTokenBoost;

  /// ブロック
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_BLOCK', obfuscate: true)
  static String adjustEventTokenBlock = _Env.adjustEventTokenBlock;

  /// プロフィール詳細閲覧
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_PROFILE_DETAIL_VIEW', obfuscate: true)
  static String adjustEventTokenProfileDetailView = _Env.adjustEventTokenProfileDetailView;

  /// マッチング
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_MATCHING', obfuscate: true)
  static String adjustEventTokenMatching = _Env.adjustEventTokenMatching;

  /// メッセージの受信
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_MESSAGE_RECEIVED', obfuscate: true)
  static String adjustEventTokenMessageReceived = _Env.adjustEventTokenMessageReceived;

  /// メッセージの送信
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_MESSAGE_SENT', obfuscate: true)
  static String adjustEventTokenMessageSent = _Env.adjustEventTokenMessageSent;

  /// メッセージの送信（2通目以降）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_MESSAGE_SENT_2ND_PLUS', obfuscate: true)
  static String adjustEventTokenMessageSent2ndPlus = _Env.adjustEventTokenMessageSent2ndPlus;

  /// メッセージ付きいいね
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_LIKE_WITH_MESSAGE', obfuscate: true)
  static String adjustEventTokenLikeWithMessage = _Env.adjustEventTokenLikeWithMessage;

  /// やりとりシミュレーション
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_CHAT_SIMULATION', obfuscate: true)
  static String adjustEventTokenChatSimulation = _Env.adjustEventTokenChatSimulation;

  /// らしさマッチ
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_RASHISA_MATCH', obfuscate: true)
  static String adjustEventTokenRashisaMatch = _Env.adjustEventTokenRashisaMatch;

  /// リバース
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_REVERSE', obfuscate: true)
  static String adjustEventTokenReverse = _Env.adjustEventTokenReverse;

  /// ログイン
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_LOGIN', obfuscate: true)
  static String adjustEventTokenLogin = _Env.adjustEventTokenLogin;

  /// 会員登録
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SIGN_UP', obfuscate: true)
  static String adjustEventTokenSignUp = _Env.adjustEventTokenSignUp;

  /// 有料プランの自動更新の解除
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_CANCEL_AUTO_RENEWAL', obfuscate: true)
  static String adjustEventTokenCancelAutoRenewal = _Env.adjustEventTokenCancelAutoRenewal;

  /// 本人確認
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_IDENTITY_VERIFICATION', obfuscate: true)
  static String adjustEventTokenIdentityVerification = _Env.adjustEventTokenIdentityVerification;

  /// 【独身割】1か月のプレミアムプランの購入（女性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SINGLE_DISCOUNT_PREMIUM_1M_FEMALE', obfuscate: true)
  static String adjustEventTokenSingleDiscountPremium1mFemale = _Env.adjustEventTokenSingleDiscountPremium1mFemale;

  /// 【独身割】1か月のプレミアムプランの購入（男性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SINGLE_DISCOUNT_PREMIUM_1M_MALE', obfuscate: true)
  static String adjustEventTokenSingleDiscountPremium1mMale = _Env.adjustEventTokenSingleDiscountPremium1mMale;

  /// 【独身割】1か月のベーシックプランの購入（男性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SINGLE_DISCOUNT_BASIC_1M_MALE', obfuscate: true)
  static String adjustEventTokenSingleDiscountBasic1mMale = _Env.adjustEventTokenSingleDiscountBasic1mMale;

  /// 【独身割】3か月のプレミアムプランの購入（女性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SINGLE_DISCOUNT_PREMIUM_3M_FEMALE', obfuscate: true)
  static String adjustEventTokenSingleDiscountPremium3mFemale = _Env.adjustEventTokenSingleDiscountPremium3mFemale;

  /// 【独身割】3か月のプレミアムプランの購入（男性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SINGLE_DISCOUNT_PREMIUM_3M_MALE', obfuscate: true)
  static String adjustEventTokenSingleDiscountPremium3mMale = _Env.adjustEventTokenSingleDiscountPremium3mMale;

  /// 【独身割】3か月のベーシックプランの購入（男性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SINGLE_DISCOUNT_BASIC_3M_MALE', obfuscate: true)
  static String adjustEventTokenSingleDiscountBasic3mMale = _Env.adjustEventTokenSingleDiscountBasic3mMale;

  /// 【独身割】6か月のプレミアムプランの購入（女性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SINGLE_DISCOUNT_PREMIUM_6M_FEMALE', obfuscate: true)
  static String adjustEventTokenSingleDiscountPremium6mFemale = _Env.adjustEventTokenSingleDiscountPremium6mFemale;

  /// 【独身割】6か月のプレミアムプランの購入（男性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SINGLE_DISCOUNT_PREMIUM_6M_MALE', obfuscate: true)
  static String adjustEventTokenSingleDiscountPremium6mMale = _Env.adjustEventTokenSingleDiscountPremium6mMale;

  /// 【独身割】6か月のベーシックプランの購入（男性）
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SINGLE_DISCOUNT_BASIC_6M_MALE', obfuscate: true)
  static String adjustEventTokenSingleDiscountBasic6mMale = _Env.adjustEventTokenSingleDiscountBasic6mMale;

  /// 独身証明
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_SINGLE_VERIFICATION', obfuscate: true)
  static String adjustEventTokenSingleVerification = _Env.adjustEventTokenSingleVerification;

  /// 登録フロー完了
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_REGISTRATION_COMPLETE', obfuscate: true)
  static String adjustEventTokenRegistrationComplete = _Env.adjustEventTokenRegistrationComplete;

  /// 自動更新
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_AUTO_RENEWAL', obfuscate: true)
  static String adjustEventTokenAutoRenewal = _Env.adjustEventTokenAutoRenewal;

  /// 話題
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_CHAT_TOPICS', obfuscate: true)
  static String adjustEventTokenChatTopics = _Env.adjustEventTokenChatTopics;

  /// 退会
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_ACCOUNT_WITHDRAWAL', obfuscate: true)
  static String adjustEventTokenAccountWithdrawal = _Env.adjustEventTokenAccountWithdrawal;

  /// 違反報告
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_REPORT', obfuscate: true)
  static String adjustEventTokenReport = _Env.adjustEventTokenReport;

  /// 非表示
  @EnviedField(varName: 'ADJUST_EVENT_TOKEN_HIDE', obfuscate: true)
  static String adjustEventTokenHide = _Env.adjustEventTokenHide;
}