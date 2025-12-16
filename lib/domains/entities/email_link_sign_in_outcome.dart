class EmailLinkSignInOutcome {
  const EmailLinkSignInOutcome({
    required this.isSuccess,
    required this.isNewUser,
    this.isDuplicate = false,
  });

  final bool isSuccess;
  final bool isNewUser;
  final bool isDuplicate;

  // --- 二重起動防止用（プロセス全体で共有） ---
  static bool _isProcessing = false;
  static bool _isCompleted = false;
  static final Set<String> _consumedOobCodes = <String>{};

  /// 認証処理を開始してよいかを判定し、同時にロックを取得する
  /// すでに処理中または完了済みなら false を返す
  static bool begin() {
    if (_isProcessing || _isCompleted) return false;
    _isProcessing = true;
    return true;
  }

  /// 認証成功で完了をマーク（以降は実行不可）
  static void completeSuccess() {
    _isProcessing = false;
    _isCompleted = true;
  }

  /// 認証失敗でロックのみ解除（再試行可）
  static void completeFailure() {
    _isProcessing = false;
  }

  /// このoobCodeが既に処理済みかどうか
  static bool isConsumed(String oobCode) => _consumedOobCodes.contains(oobCode);

  /// oobCodeを処理済みにマーク
  static void markConsumed(String oobCode) => _consumedOobCodes.add(oobCode);
}


