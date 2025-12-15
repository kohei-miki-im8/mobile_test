# Fastlane ローカル実行ガイド

## 前提条件

Fastlaneをローカルで実行するには、以下のツールが必要です：

1. **Ruby** (3.0以上推奨)
2. **Bundler**
3. **CocoaPods** (iOSビルドの場合)

## セットアップ手順

### 1. RubyとBundlerのインストール

WSL2環境でRubyをインストール：

```bash
# Rubyをインストール
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

# インストール確認
ruby --version
bundle --version
```

### 2. Fastlaneの依存関係をインストール

```bash
# プロジェクトルートで実行
cd /mnt/d/my_programing/mobile_test
bundle install
```

### 3. Fastlaneの実行

#### iOS - 利用可能なLane一覧を確認

```bash
cd ios
bundle exec fastlane lanes
```

#### iOS - テストビルド（証明書なし）

```bash
cd ios
bundle exec fastlane build_test
```

このコマンドは以下を実行します：
- Flutterの依存関係を取得
- CocoaPodsの依存関係をインストール
- FlutterでiOSアプリをビルド（証明書なし）

#### iOS - テスト実行

```bash
cd ios
bundle exec fastlane test
```

#### Android - 利用可能なLane一覧を確認

```bash
cd android
bundle exec fastlane lanes
```

#### Android - ビルドコマンド

```bash
cd android

# デバッグビルド
bundle exec fastlane build_debug

# リリースビルド（署名なし・動作確認用）
bundle exec fastlane build_test

# リリースビルド（署名あり・本番用）
bundle exec fastlane build

# App Bundle（Google Play用）
bundle exec fastlane build_bundle

# テスト実行
bundle exec fastlane test
```

## 注意事項

### WSL2環境での制限

- **iOSのビルドにはmacOSが必要**です。WSL2環境では完全なビルドは実行できません
- **AndroidのビルドはLinux環境でも実行可能**です（macOS不要）
- ただし、以下のことは可能です：
  - Fastfileの構文チェック
  - Flutterコマンドの実行（`flutter pub get`など）
  - Fastlaneの設定確認

### macOS環境での実行（iOS）

macOS環境では、以下のコマンドで完全なビルドが可能です：

```bash
# 証明書ありのビルド（環境変数が必要）
export APPLE_ID="your-apple-id@example.com"
export APPLE_TEAM_ID="YOUR_TEAM_ID"
export CODE_SIGNING_IDENTITY="iPhone Distribution"
export PROVISIONING_PROFILE_NAME="match AppStore jp.co.ai-mate.lavi"

cd ios
bundle exec fastlane build
```

### Linux環境での実行（Android）

Linux環境（WSL2含む）では、Androidのビルドが可能です：

```bash
# 署名なしのリリースビルド（動作確認用）
cd android
bundle exec fastlane build_test

# 署名ありのビルド（key.propertiesファイルが必要）
cd android
bundle exec fastlane build
```

**注意**: Flutterコマンドの実行に改行コードの問題がある場合は、GitHub Actionsを使用することを推奨します。

## トラブルシューティング

### Rubyが見つからない

```bash
# Rubyのパスを確認
which ruby

# パスが通っていない場合は、~/.bashrcに追加
echo 'export PATH="$HOME/.gem/ruby/3.1.0/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### Bundlerのエラー

```bash
# Bundlerを再インストール
gem install bundler
bundle install
```

### CocoaPodsのエラー

```bash
cd ios
pod deintegrate
pod install
```

## GitHub Actionsでの実行

### iOSビルド

mainブランチにpushすると、自動的にGitHub Actionsが実行されます。

手動で実行する場合は、GitHubの「Actions」タブから「iOS Build」ワークフローを選択して「Run workflow」をクリックしてください。

### Androidビルド

mainブランチにpushすると、自動的にGitHub Actionsが実行されます。

手動で実行する場合は、GitHubの「Actions」タブから「Android Build」ワークフローを選択して「Run workflow」をクリックしてください。

**必要なSecrets**:
- iOS: `APPLE_ID`, `APPLE_TEAM_ID`, `CODE_SIGNING_IDENTITY`, `PROVISIONING_PROFILE_NAME`
- Android: `KEYSTORE_FILE`, `KEYSTORE_PASSWORD`, `KEY_ALIAS`, `KEY_PASSWORD`（署名ありビルドの場合）

## 参考

- [Fastlane公式ドキュメント](https://docs.fastlane.tools/)
- [Fastlane iOSガイド](https://docs.fastlane.tools/getting-started/ios/setup/)
- [Fastlane Androidガイド](https://docs.fastlane.tools/getting-started/android/setup/)

