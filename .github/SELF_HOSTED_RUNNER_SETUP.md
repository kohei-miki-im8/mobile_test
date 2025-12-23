# Self-Hosted Runner セットアップガイド

このプロジェクトでは、GitHub Actionsのself-hostedランナーを使用してビルドを実行します。

## 前提条件

### iOS用ランナー（macOS）
- macOS 12.0以上
- Xcode（最新版推奨）
- Flutter SDK 3.24.0以上
- Ruby 3.2以上
- CocoaPods
- インターネット接続

### Android用ランナー（Linux）
- Ubuntu 20.04以上（または同等のLinuxディストリビューション）
- Flutter SDK 3.24.0以上
- Ruby 3.2以上
- Java 17以上
- Android SDK（コマンドラインツール）
- インターネット接続

## セットアップ手順

### 1. GitHub Runnerのインストール

#### macOS（iOS用）

```bash
# ランナーディレクトリを作成
mkdir actions-runner && cd actions-runner

# 最新のランナーをダウンロード
curl -o actions-runner-osx-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-osx-x64-2.311.0.tar.gz

# 解凍
tar xzf ./actions-runner-osx-x64-2.311.0.tar.gz

# 設定スクリプトを実行
./config.sh --url https://github.com/YOUR_ORG/YOUR_REPO --token YOUR_RUNNER_TOKEN

# ランナーをサービスとしてインストール（オプション）
sudo ./svc.sh install
sudo ./svc.sh start
```

#### Linux（Android用）

```bash
# ランナーディレクトリを作成
mkdir actions-runner && cd actions-runner

# 最新のランナーをダウンロード
curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz

# 解凍
tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz

# 設定スクリプトを実行
./config.sh --url https://github.com/YOUR_ORG/YOUR_REPO --token YOUR_RUNNER_TOKEN

# ランナーをサービスとしてインストール（オプション）
sudo ./svc.sh install
sudo ./svc.sh start
```

#### Windows（WSL2経由でAndroid用）

Windows環境でWSL2を使用する場合：

```powershell
# PowerShellで実行
# WSL2内でランナーを設定
wsl

# WSL2内で以下を実行
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz
tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz
./config.sh --url https://github.com/YOUR_ORG/YOUR_REPO --token YOUR_RUNNER_TOKEN --labels linux,android,self-hosted
```

#### Windows（ネイティブ - 推奨しない）

Windowsネイティブでランナーを設定する場合（AndroidビルドはWSL2推奨）：

```powershell
# PowerShellで実行
# ランナーディレクトリを作成
mkdir actions-runner
cd actions-runner

# 最新のランナーをダウンロード
Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-win-x64-2.311.0.zip -OutFile actions-runner-win-x64-2.311.0.zip

# 解凍
Expand-Archive -Path actions-runner-win-x64-2.311.0.zip -DestinationPath .

# 設定スクリプトを実行
.\config.cmd --url https://github.com/YOUR_ORG/YOUR_REPO --token YOUR_RUNNER_TOKEN --labels windows,self-hosted
```

**注意**: Windowsネイティブランナーを使用する場合は、ワークフローの`runs-on`を`[self-hosted, windows]`に変更する必要があります。ただし、AndroidビルドはWSL2を使用することを強く推奨します。

**注意**: `YOUR_ORG`, `YOUR_REPO`, `YOUR_RUNNER_TOKEN`は実際の値に置き換えてください。
ランナートークンは、GitHubリポジトリの「Settings」→「Actions」→「Runners」→「New self-hosted runner」から取得できます。

### 2. ランナーのラベル設定

ランナーを設定する際に、以下のラベルを追加することを推奨します：

#### iOS用ランナー
```bash
./config.sh --url https://github.com/YOUR_ORG/YOUR_REPO --token YOUR_RUNNER_TOKEN --labels macos,ios,self-hosted
```

#### Android用ランナー（Linux/WSL2）
```bash
./config.sh --url https://github.com/YOUR_ORG/YOUR_REPO --token YOUR_RUNNER_TOKEN --labels linux,android,self-hosted
```

#### Android用ランナー（Windows WSL2）
WSL2内で実行：
```bash
./config.sh --url https://github.com/kohei-miki-im8/mobile_test --token YOUR_RUNNER_TOKEN --labels linux,android,self-hosted
```

### 3. 必要なツールのインストール

#### macOS（iOS用）

```bash
# Homebrewのインストール（未インストールの場合）
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Flutterのインストール
brew install --cask flutter

# Rubyのインストール（Homebrew経由）
brew install ruby

# CocoaPodsのインストール
sudo gem install cocoapods

# Xcode Command Line Toolsのインストール
xcode-select --install
```

#### Linux（Android用）

```bash
# Flutterのインストール
cd ~
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Rubyのインストール
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

# Java 17のインストール
sudo apt install -y openjdk-17-jdk

# Android SDKのインストール（コマンドラインツール）
cd ~
mkdir android-sdk
cd android-sdk
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip commandlinetools-linux-9477386_latest.zip
mkdir -p cmdline-tools/latest
mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true
rm -rf cmdline-tools/NOTICE.txt cmdline-tools/SOURCE.txt

# 環境変数の設定（~/.bashrcまたは~/.zshrcに追加）
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

# Android SDKのライセンスに同意
yes | sdkmanager --licenses

# 必要なSDKコンポーネントのインストール
sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.0"
```

### 4. ランナーの動作確認

GitHubリポジトリの「Settings」→「Actions」→「Runners」で、ランナーが「Idle」状態になっていることを確認してください。

## ワークフローの実行

### 自動実行
mainブランチにpushすると、自動的にself-hostedランナーでビルドが実行されます。

### 手動実行
1. GitHubの「Actions」タブを開く
2. 「iOS Build」または「Android Build」を選択
3. 「Run workflow」をクリック

## セキュリティに関する注意事項

### ランナーのセキュリティ
- self-hostedランナーは、リポジトリのコードとSecretsにアクセスできます
- ランナーを実行するマシンは、信頼できる環境に配置してください
- ランナーを共有する場合は、適切なアクセス制御を設定してください

### Secretsの管理
- GitHub Secretsは、ランナー上で環境変数として利用可能です
- ランナーのログにSecretsが表示されないよう注意してください
- 必要に応じて、ランナーのログ出力を制限してください

## トラブルシューティング

### ランナーがオフラインになっている

```bash
# ランナーの状態を確認
cd actions-runner
./run.sh
```

### ランナーの再起動

```bash
# サービスとしてインストールしている場合
sudo ./svc.sh stop
sudo ./svc.sh start

# サービスとしてインストールしていない場合
# ランナープロセスを停止してから再起動
./run.sh
```

### ランナーの削除

```bash
# サービスとしてインストールしている場合
sudo ./svc.sh stop
sudo ./svc.sh uninstall

# ランナーの設定を削除
./config.sh remove --token YOUR_RUNNER_TOKEN
```

## 参考資料

- [GitHub Actions Self-Hosted Runners](https://docs.github.com/en/actions/hosting-your-own-runners)
- [Runner Installation](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/adding-self-hosted-runners)
- [Runner Security](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners#self-hosted-runner-security)

