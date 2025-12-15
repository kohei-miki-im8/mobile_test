# Self-Hosted Runner セットアップ完了

## セットアップ完了日時
2025年12月16日

## セットアップ内容

### ランナー情報
- **ランナー名**: BDH-IM8W-659362
- **ランナーID**: 2
- **プール**: Default
- **ラベル**: linux, android, self-hosted
- **状態**: サービスとして起動中

### インストール済みツール

#### ✅ Java
- **バージョン**: OpenJDK 17.0.17
- **パス**: `/usr/lib/jvm/java-17-openjdk-amd64`

#### ✅ Ruby
- **バージョン**: 3.2.3
- **Bundler**: 2.4.20

#### ✅ Flutter
- **パス**: `/mnt/c/Users/KoheiMiki/Source/flutter/bin/flutter`
- **注意**: WindowsのFlutter実行ファイルを使用（改行コードの問題あり）
- **推奨**: GitHub Actionsワークフローでは`subosito/flutter-action@v2`を使用してFlutterをセットアップ

### ランナーの場所
- **ディレクトリ**: `~/actions-runner`
- **サービス名**: `actions.runner.kohei-miki-im8-mobile_test.BDH-IM8W-659362.service`

## ランナーの管理コマンド

### サービスの状態確認
```bash
cd ~/actions-runner
sudo ./svc.sh status
```

### サービスの停止
```bash
cd ~/actions-runner
sudo ./svc.sh stop
```

### サービスの開始
```bash
cd ~/actions-runner
sudo ./svc.sh start
```

### サービスの再起動
```bash
cd ~/actions-runner
sudo ./svc.sh restart
```

### サービスの削除
```bash
cd ~/actions-runner
sudo ./svc.sh stop
sudo ./svc.sh uninstall
```

### ランナーの削除
```bash
cd ~/actions-runner
sudo ./svc.sh stop
sudo ./svc.sh uninstall
./config.sh remove --token YOUR_RUNNER_TOKEN
```

## 動作確認

### GitHub上での確認
1. GitHubリポジトリの「Settings」→「Actions」→「Runners」に移動
2. ランナー「BDH-IM8W-659362」が「Idle」状態で表示されていることを確認

### ワークフローの実行
1. GitHubの「Actions」タブを開く
2. 「Android Build」ワークフローを選択
3. 「Run workflow」をクリック
4. ランナーがジョブを実行することを確認

## 注意事項

### Flutterコマンドについて
- WindowsのFlutter実行ファイルには改行コードの問題があります
- GitHub Actionsワークフローでは、`subosito/flutter-action@v2`を使用してFlutterをセットアップするため、この問題は回避されます

### 環境変数について
- ランナーはWSL2環境で実行されています
- Windowsのパス（`C:\`など）は直接アクセスできません
- プロジェクトファイルはWSL2のファイルシステム（`/mnt/d/`など）に配置されている必要があります

### セキュリティについて
- ランナーはリポジトリのコードとSecretsにアクセスできます
- ランナーを実行するマシンは信頼できる環境に配置してください
- ランナーのログにSecretsが表示されないよう注意してください

## 次のステップ

1. GitHub上でランナーの状態を確認
2. テストワークフローを実行して動作確認
3. 必要に応じて、Android SDKなどの追加ツールをインストール

## トラブルシューティング

### ランナーがオフラインになっている
```bash
cd ~/actions-runner
sudo ./svc.sh restart
```

### ログの確認
```bash
cd ~/actions-runner
cat _diag/Runner_*.log
```

### サービスのログ確認
```bash
sudo journalctl -u actions.runner.kohei-miki-im8-mobile_test.BDH-IM8W-659362.service -f
```

