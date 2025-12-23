/// アプリケーション全体で使用される処理タイプ
enum ProcessingType {
  /// 初期化処理
  initialization,

  /// データ取得
  dataFetch,

  /// データ保存
  dataSave,

  /// 画像処理
  imageProcessing,

  /// 画像アップロード
  imageUpload,

  /// バリデーション
  validation,

  /// API呼び出し
  apiCall,

  /// 画面遷移準備
  navigation,

  /// ファイル処理
  fileProcessing,
}

/// ProcessingTypeの拡張メソッド
extension ProcessingTypeExtension on ProcessingType {
  /// デフォルトのローディングメッセージを取得
  String get defaultMessage {
    switch (this) {
      case ProcessingType.initialization:
        return '初期化中...';
      case ProcessingType.dataFetch:
        return 'データを取得中...';
      case ProcessingType.dataSave:
        return 'データを保存中...';
      case ProcessingType.imageProcessing:
        return '画像を処理中...';
      case ProcessingType.imageUpload:
        return 'アップロード中...';
      case ProcessingType.validation:
        return '検証中...';
      case ProcessingType.apiCall:
        return '通信中...';
      case ProcessingType.navigation:
        return '画面を準備中...';
      case ProcessingType.fileProcessing:
        return 'ファイルを処理中...';
    }
  }
}