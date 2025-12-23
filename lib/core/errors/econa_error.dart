import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// エラーの原因を表すenum
enum EconaErrorCause {
  /// ネットワークエラー
  network,

  /// タイムアウトエラー
  timeout,

  /// 認証エラー
  authentication,

  /// 権限エラー
  permission,

  /// サーバーエラー
  server,

  /// 決済エラー
  purchase,

  /// その他のエラー
  unknown,
}

/// エラーが発生した処理を表すenum
enum EconaErrorOperation {
  // 検索関連
  /// おすすめユーザー取得
  recommendationUsersFetch,

  /// 検索条件取得
  latestUserSearchConditionsFetch,

  // Laviation関連
  /// カルテ取得
  karteFetch,

  /// らしさマッチユーザー取得
  rashisaMatchUsersFetch,

  /// 理想のアドバイス取得
  idealAdviceFetch,

  /// アプローチ分析取得
  approachAnalysisFetch,

  /// 恋愛アドバイス取得
  loveAdviceFetch,

  // チャット関連
  /// メッセージ取得
  chatMessageFetch,

  /// メッセージ送信
  chatMessageSend,
  /// 画像送信
  chatPhotoSend,

  /// チャット話題生成
  chatTopicsCreate,

  /// 話題取得
  chatTopicsFetch,

  /// なりきり挨拶生成
  personaGreetingCreate,

  /// なりきり返信生成
  personaReplyCreate,

  /// デート意向取得
  dateIntentionFetch,

  /// ピン止め更新
  pinnedMessageUpdate,

  /// チャットルーム作成
  chatRoomCreate,

  /// 既読機能開放
  forceReadPurchased,
  forceReadPurchasedAlready,

  /// 初回メッセージ取得
  initialMessageFetch,

  // カウンセリング関連
  /// カウンセリングメッセージ取得
  counselingMessageFetch,

  /// カウンセリング開始処理
  counselingStart,

  // シミュレーション関連
  /// お相手取得
  partnerFetch,

  /// シミュレーションチャットルーム作成
  simulatorChatRoomCreate,

  /// シミュレーションメッセージ取得
  simulatorChatMessageFetch,

  /// シミュレーションメッセージ送信
  simulatorChatMessageSend,

  // ユーザー関連
  /// ユーザーステータス取得
  userStatusFetch,

  /// ユーザー情報取得
  userInfoFetch,

  /// プロフィール取得
  profileFetch,

  /// プロフィール更新
  profileUpdate,

  // matching関連
  /// いいね処理
  like,

  /// いいね重複
  likeAlreadyExists,

  /// メッセージ付きいいね処理
  messageLike,

  /// like取得
  likeFetch,

  /// スキップ処理
  skip,

  /// ブースト処理
  boost,

  /// リバース処理
  reverse,

  /// お気に入りユーザー取得
  favoriteUsersFetch,

  /// お気に入りユーザー更新
  favoriteUsersUpdate,

  //　モデレーション関連
  /// ユーザー非表示処理
  hide,

  /// 非表示ユーザー取得処理
  hideFetch,

  /// ユーザーブロック処理
  block,

  //　質問関連
  /// 承認された質問取得処理
  approvedQuestionFetch,

  /// 質問作成処理
  questionCreate,

  /// しつもん承認
  questionApprove,

  /// 質問回答処理
  answerSend,

  /// Stream接続処理
  sessionConnect,

  /// 退会
  withdrawal,

  /// マイページ
  myPageFetch,

  // サブスクリプション加入状態取得
  subscriptionPlanFetch,

  //　画像関連
  /// 画像アップロード処理
  mediaUpload,

  /// プロフィール画像削除処理
  profilePhotoDelete,

  /// キャプション更新処理
  captionUpdate,

  //　タグ関連
  /// 共通タグ取得
  commonTagsFetch,

  // ポイント不足
  lackOfLp,
  lackOfMp,
  lackOfLike,

  // 決済関連
  /// 決済・購入処理
  purchaseCancelled,
  storeProblem,
  purchaseNotAllowed,
  purchaseInvalid,
  productNotAvailable,
  productAlreadyPurchased,
  receiptAlreadyInUse,
  invalidReceipt,
  missingReceiptFile,
  invalidCredentials,
  unexpectedBackendResponse,
  unknownBackend,
  invalidAppUserId,
  ineligible,
  insufficientPermissions,
  paymentPending,
  configuration,
  unsupported,
  customerInfo,
  signatureVerification,

  /// その他の処理
  unknown,
}

/// アプリケーションエラーを表すクラス
class EconaError implements Exception {
  const EconaError({
    required this.cause,
    required this.operation,
    required this.message,
    this.originalError,
    this.statusCode,
    this.errorCode,
  });

  /// ApiExceptionからEconaErrorを作成
  factory EconaError.fromApiException(
    Object error, {
    EconaErrorOperation operation = EconaErrorOperation.unknown,
  }) {
    if (error is ApiException) {
      final cause = _determineErrorCause(error);
      return EconaError(
        cause: cause,
        operation: operation,
        message: error.message,
        originalError: error,
        statusCode: error.statusCode,
        errorCode: error.code,
      );
    }

    return EconaError(
      cause: EconaErrorCause.unknown,
      operation: operation,
      message: error.toString(),
      originalError: error,
    );
  }

  /// 例外からEconaErrorを作成
  factory EconaError.fromException(
    Object error, {
    EconaErrorOperation operation = EconaErrorOperation.unknown,
  }) {
    // ExceptionはSentryに投げる
    Sentry.captureException(error);

    if (error is SocketException) {
      return EconaError(
        cause: EconaErrorCause.network,
        operation: operation,
        message: 'ネットワークに接続できません。通信環境をご確認ください。',
        originalError: error,
      );
    }

    if (error is TimeoutException) {
      return EconaError(
        cause: EconaErrorCause.timeout,
        operation: operation,
        message: '通信がタイムアウトしました。時間をおいて再試行してください。',
        originalError: error,
      );
    }

    if (error is ApiException) {
      return EconaError.fromApiException(error, operation: operation);
    }

    return EconaError(
      cause: EconaErrorCause.unknown,
      operation: operation,
      message: error.toString(),
      originalError: error,
    );
  }

  /// エラーの原因
  final EconaErrorCause cause;

  /// エラーが発生した処理
  final EconaErrorOperation operation;

  /// エラーメッセージ
  final String message;

  /// 元のエラーオブジェクト
  final Object? originalError;

  /// HTTPステータスコード
  final int? statusCode;

  /// エラーコード
  final String? errorCode;

  /// エラーの原因に基づいてユーザーフレンドリーなメッセージを生成
  String get causeMessage {
    return switch (cause) {
      EconaErrorCause.network => 'ネットワークに接続できません。通信環境をご確認ください。',
      EconaErrorCause.timeout => '通信がタイムアウトしました。時間をおいて再試行してください。',
      EconaErrorCause.authentication => '認証に問題が発生しました。再ログインをお試しください。',
      EconaErrorCause.permission => '権限がありません。',
      EconaErrorCause.server => 'サーバーでエラーが発生しました。しばらくしてから再試行してください。',
      EconaErrorCause.purchase => '決済に失敗しました。',
      EconaErrorCause.unknown => 'エラーが発生しました。しばらくしてから再試行してください。',
    };
  }

  /// エラーの操作に基づいてユーザーフレンドリーなメッセージを生成
  String get operationMessage {
    return switch (operation) {
      EconaErrorOperation.recommendationUsersFetch => 'おすすめユーザーの取得に失敗しました。',
      EconaErrorOperation.karteFetch => 'カルテの取得に失敗しました。',
      EconaErrorOperation.chatMessageFetch => 'チャットデータの取得に失敗しました。',
      EconaErrorOperation.personaGreetingCreate => 'なりきり挨拶の生成に失敗しました。',
      EconaErrorOperation.personaReplyCreate => 'なりきり返信の生成に失敗しました',
      EconaErrorOperation.chatTopicsCreate => '話題の生成に失敗しました。',
      EconaErrorOperation.chatTopicsFetch => '話題の取得に失敗しました。',
      EconaErrorOperation.dateIntentionFetch => 'チャットデータの取得に失敗しました。',
      EconaErrorOperation.chatMessageSend => 'メッセージの送信に失敗しました',
      EconaErrorOperation.chatPhotoSend => '画像の送信に失敗しました',
      EconaErrorOperation.pinnedMessageUpdate => 'メッセージのピン止めに失敗しました',
      EconaErrorOperation.forceReadPurchased => '既読機能の開放に失敗しました',
      EconaErrorOperation.forceReadPurchasedAlready => '既読機能は既に開放されています',
      EconaErrorOperation.chatRoomCreate => 'チャットルームの作成に失敗しました',
      EconaErrorOperation.counselingMessageFetch => 'カウンセリングメッセージの取得に失敗しました',
      EconaErrorOperation.counselingStart => 'カウンセリングの開始に失敗しました',
      EconaErrorOperation.partnerFetch => 'シミュレーション相手の取得に失敗しました',
      EconaErrorOperation.simulatorChatRoomCreate =>
        'シミュレーションチャットルームの作成に失敗しました',
      EconaErrorOperation.simulatorChatMessageFetch => 'メッセージの取得に失敗しました',
      EconaErrorOperation.simulatorChatMessageSend => 'メッセージの送信に失敗しました',
      EconaErrorOperation.userStatusFetch => 'ユーザー情報の取得に失敗しました',
      EconaErrorOperation.profileFetch => 'プロフィールの取得に失敗しました。',
      EconaErrorOperation.userInfoFetch => 'ユーザー情報の取得に失敗しました。',
      EconaErrorOperation.initialMessageFetch => '初回メッセージの取得に失敗しました。',
      EconaErrorOperation.like => 'いいねの処理に失敗しました。',
      EconaErrorOperation.likeAlreadyExists => '既にいいねをしています。',
      EconaErrorOperation.likeFetch => 'いいね情報の取得に失敗しました。',
      EconaErrorOperation.messageLike => 'メッセージ付きいいねの処理に失敗しました。',
      EconaErrorOperation.skip => 'スキップの処理に失敗しました。',
      EconaErrorOperation.boost => 'ブーストの処理に失敗しました。',
      EconaErrorOperation.reverse => 'リバースの処理に失敗しました。',
      EconaErrorOperation.favoriteUsersFetch => 'お気に入りユーザーの取得に失敗しました。',
      EconaErrorOperation.favoriteUsersUpdate => 'お気に入りユーザーの更新に失敗しました。',
      EconaErrorOperation.rashisaMatchUsersFetch => 'らしさマッチユーザーの取得に失敗しました。',
      EconaErrorOperation.idealAdviceFetch => '理想についての取得に失敗しました。',
      EconaErrorOperation.approachAnalysisFetch => 'アプローチ分析の取得に失敗しました。',
      EconaErrorOperation.latestUserSearchConditionsFetch =>
        '前回の検索条件の取得に失敗しました。',
      EconaErrorOperation.loveAdviceFetch => '恋愛アドバイスの取得に失敗しました。',
      EconaErrorOperation.hide => 'ユーザーの非表示処理に失敗しました。',
      EconaErrorOperation.hideFetch => '非表示ユーザーの取得に失敗しました。',
      EconaErrorOperation.block => 'ユーザーのブロック処理に失敗しました。',
      EconaErrorOperation.profileUpdate => '保存に失敗しました。',
      EconaErrorOperation.mediaUpload => '写真のアップロードに失敗しました。',
      EconaErrorOperation.profilePhotoDelete => 'プロフィール画像の削除に失敗しました。',
      EconaErrorOperation.captionUpdate => 'コメントの編集に失敗しました。',
      EconaErrorOperation.subscriptionPlanFetch => 'サブスクリプション情報取得に失敗しました。',
      EconaErrorOperation.purchaseCancelled => '購入がキャンセルされました。',
      EconaErrorOperation.storeProblem => 'ストア側で問題が発生しました。しばらくしてからお試しください。',
      EconaErrorOperation.purchaseNotAllowed => 'この端末では購入が許可されていません。',
      EconaErrorOperation.purchaseInvalid => '購入情報に誤りがあります。時間をおいて再試行してください。',
      EconaErrorOperation.productNotAvailable => 'この商品は現在ご購入いただけません。',
      EconaErrorOperation.productAlreadyPurchased => 'この商品は既に購入済みです。',
      EconaErrorOperation.receiptAlreadyInUse => 'この購入情報は既に使用されています。',
      EconaErrorOperation.invalidReceipt => '購入情報が確認できません。',
      EconaErrorOperation.missingReceiptFile => '購入情報を取得できませんでした。',
      EconaErrorOperation.invalidCredentials => 'アプリの設定に問題があるため、購入を完了できません。',
      EconaErrorOperation.unexpectedBackendResponse => 'サーバーから予期しない応答が返されました。',
      EconaErrorOperation.unknownBackend => 'サーバーでエラーが発生しました。',
      EconaErrorOperation.invalidAppUserId => 'ユーザー情報に問題があるため、購入を完了できません。',
      EconaErrorOperation.ineligible => 'ご利用条件を満たしていないため購入できません。',
      EconaErrorOperation.insufficientPermissions => '必要な権限がありません。',
      EconaErrorOperation.paymentPending => 'お支払いの確認中です。しばらくお待ちください。',
      EconaErrorOperation.configuration => '設定に問題があります。',
      EconaErrorOperation.unsupported => '現在の環境ではサポートされていません。',
      EconaErrorOperation.customerInfo => '購入情報の取得に失敗しました。',
      EconaErrorOperation.signatureVerification => '購入情報の検証に失敗しました。',
      EconaErrorOperation.commonTagsFetch => '共通タグの取得に失敗しました。',
      EconaErrorOperation.approvedQuestionFetch => '質問の取得に失敗しました。',
      EconaErrorOperation.questionCreate => '質問の作成に失敗しました',
      EconaErrorOperation.questionApprove => '質問の送信に失敗しました',
      EconaErrorOperation.answerSend => '回答の送信に失敗しました',
      EconaErrorOperation.sessionConnect => 'ネットワークの接続に失敗しました。',
      EconaErrorOperation.withdrawal => '退会処理に失敗しました。',
      EconaErrorOperation.myPageFetch => 'マイページデータの取得に失敗しました。',
      EconaErrorOperation.lackOfLp => 'LPが不足しています。',
      EconaErrorOperation.lackOfMp => 'MPが不足しています。',
      EconaErrorOperation.lackOfLike => 'いいねが不足しています',
      EconaErrorOperation.unknown => '処理に失敗しました。',
    };
  }

  /// エラーの原因と操作に基づいてユーザーフレンドリーなメッセージを生成
  String get userMessage {
    return '$operationMessage $causeMessage';
  }

  /// PlatformException(ReveneueCat) から EconaError を作成
  factory EconaError.fromPlatformException(
    Object error, {
    EconaErrorOperation operation = EconaErrorOperation.unknown,
  }) {
    if (error is PlatformException) {
      final code = _readableRevenueCatCode(error);
      final mapped = _mapRevenueCatCodeToCauseOperation(code);
      return EconaError(
        cause: mapped.cause,
        operation: mapped.operation,
        message: error.message ?? code,
        originalError: error,
        errorCode: code,
      );
    }
    return EconaError.fromException(error, operation: operation);
  }

  static String _readableRevenueCatCode(PlatformException e) {
    final details = e.details;
    if (details is Map) {
      final code =
          details['readableErrorCode'] ?? details['readable_error_code'];
      if (code is String) return code;
    }
    return e.code;
  }

  static ({EconaErrorCause cause, EconaErrorOperation operation})
      _mapRevenueCatCodeToCauseOperation(String code) {
    switch (code) {
      case 'PurchaseCancelledError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.purchaseCancelled
        );
      case 'NetworkError':
        return (
          cause: EconaErrorCause.network,
          operation: EconaErrorOperation.unknown
        );
      case 'StoreProblemError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.storeProblem
        );
      case 'PurchaseNotAllowedError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.purchaseNotAllowed
        );
      case 'PurchaseInvalidError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.purchaseInvalid
        );
      case 'ProductNotAvailableForPurchaseError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.productNotAvailable
        );
      case 'ProductAlreadyPurchasedError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.productAlreadyPurchased
        );
      case 'ReceiptAlreadyInUseError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.receiptAlreadyInUse
        );
      case 'InvalidReceiptError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.invalidReceipt
        );
      case 'MissingReceiptFileError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.missingReceiptFile
        );
      case 'InvalidCredentialsError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.invalidCredentials
        );
      case 'UnexpectedBackendResponseError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.unexpectedBackendResponse
        );
      case 'UnknownBackendError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.unknownBackend
        );
      case 'InvalidAppUserIdError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.invalidAppUserId
        );
      case 'IneligibleError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.ineligible
        );
      case 'InsufficientPermissionsError':
        return (
          cause: EconaErrorCause.permission,
          operation: EconaErrorOperation.insufficientPermissions
        );
      case 'OperationAlreadyInProgressError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.insufficientPermissions
        );
      case 'PaymentPendingError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.paymentPending
        );
      case 'ConfigurationError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.configuration
        );
      case 'UnsupportedError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.unsupported
        );
      case 'CustomerInfoError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.customerInfo
        );
      case 'SignatureVerificationError':
        return (
          cause: EconaErrorCause.purchase,
          operation: EconaErrorOperation.signatureVerification
        );
      default:
        return (
          cause: EconaErrorCause.unknown,
          operation: EconaErrorOperation.unknown
        );
    }
  }

  /// ApiExceptionの内容からエラーの原因を判定
  static EconaErrorCause _determineErrorCause(ApiException error) {
    final message = error.message.toLowerCase();
    final code = error.code?.toLowerCase();
    final statusCode = error.statusCode;

    // 認証エラー
    if (statusCode == 401 ||
        message.contains('unauthenticated') ||
        message.contains('unauthorized') ||
        code == 'unauthenticated' ||
        code == 'unauthorized') {
      return EconaErrorCause.authentication;
    }

    // 権限エラー
    if (statusCode == 403 ||
        message.contains('permission') ||
        code == 'permission_denied') {
      return EconaErrorCause.permission;
    }

    // ネットワークエラー
    if (message.contains('host lookup') ||
        message.contains('connect') ||
        message.contains('socket')) {
      return EconaErrorCause.network;
    }

    // タイムアウトエラー
    if (message.contains('timeout') || message.contains('deadline')) {
      return EconaErrorCause.timeout;
    }

    // サーバーエラー
    if (statusCode != null && statusCode >= 500) {
      return EconaErrorCause.server;
    }

    return EconaErrorCause.unknown;
  }

  @override
  String toString() {
    return 'EconaError(cause: $cause, operation: $operation, '
        'message: $message, statusCode: $statusCode, errorCode: $errorCode)';
  }
}

/// アクションボタン（いいね、メッセージ付きいいね、スキップ、ブースト、リバース）
/// のエラーかどうかを判定する
bool isActionButtonError(EconaError error) {
  return switch (error.operation) {
    EconaErrorOperation.reverse ||
    EconaErrorOperation.skip ||
    EconaErrorOperation.like =>
      true,
    _ => false,
  };
}

/// オプションモーダルのエラーかどうかを判定する
bool isOptionsModalError(EconaError error) {
  return switch (error.operation) {
    EconaErrorOperation.hide || EconaErrorOperation.block => true,
    _ => false,
  };
}
