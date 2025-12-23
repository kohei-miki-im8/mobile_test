# Windows環境でのSelf-Hosted Runnerセットアップ

このガイドでは、Windows環境（WSL2使用）でGitHub Actionsのself-hostedランナーを設定する方法を説明します。

## 前提条件

- Windows 10/11
- WSL2がインストールされていること
- Ubuntu 20.04以上がWSL2にインストールされていること

## セットアップ手順

### 1. WSL2でランナーを設定

#### ステップ1: WSL2を起動

PowerShellまたはコマンドプロンプトから：
```powershell
wsl
```

#### ステップ2: ランナーディレクトリを作成

```bash
mkdir actions-runner
cd actions-runner
```

#### ステップ3: ランナーをダウンロード

```bash
curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz
```

#### ステップ4: 解凍

```bash
tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz
```

#### ステップ5: ランナーを設定

```bash
./config.sh --url https://github.com/kohei-miki-im8/mobile_test --token BODSLXFCALQOBPTINP27KMLJIBPKY --labels linux,android,self-hosted
```

設定時に以下の質問が表示されます：
- **Enter the name of the runner**: ランナー名を入力（例: `windows-wsl2-android`）
- **Enter additional labels**: 追加のラベル（既に`linux,android,self-hosted`を指定しているので、Enterでスキップ可能）

#### ステップ6: ランナーを起動

```bash
./run.sh
```

### 2. ランナーをサービスとして登録（オプション）

WSL2を再起動してもランナーが自動起動するように設定：

```bash
# サービスとしてインストール
sudo ./svc.sh install

# サービスを開始
sudo ./svc.sh start

# サービスの状態を確認
sudo ./svc.sh status
```

### 3. 必要なツールのインストール

WSL2内で以下を実行：

```bash
# Flutterのインストール
cd ~
git clone https://github.com/flutter/flutter.git -b stable
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
source ~/.bashrc

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

# 環境変数の設定（~/.bashrcに追加）
echo 'export ANDROID_HOME=$HOME/android-sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> ~/.bashrc
source ~/.bashrc

# Android SDKのライセンスに同意
yes | sdkmanager --licenses

# 必要なSDKコンポーネントのインストール
sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.0"
```

### 4. 動作確認

GitHubリポジトリの「Settings」→「Actions」→「Runners」で、ランナーが「Idle」状態になっていることを確認してください。

## トラブルシューティング

### ランナーがオフラインになっている

```bash
cd actions-runner
./run.sh
```

### WSL2の再起動後にランナーが起動しない

サービスとして登録している場合：
```bash
cd actions-runner
sudo ./svc.sh start
```

### ランナーのログを確認

```bash
cd actions-runner
cat _diag/Runner_*.log
```

### ランナーの削除

```bash
cd actions-runner
sudo ./svc.sh stop
sudo ./svc.sh uninstall
./config.sh remove --token YOUR_RUNNER_TOKEN
```

## 注意事項

- WSL2内でランナーを実行するため、Windowsのパス（`C:\`など）は直接アクセスできません
- プロジェクトファイルはWSL2のファイルシステム（`/mnt/c/`など）に配置されている必要があります
- ランナーはWSL2が起動している間のみ動作します

## 参考資料

- [GitHub Actions Self-Hosted Runners](https://docs.github.com/en/actions/hosting-your-own-runners)
- [WSL2 Documentation](https://docs.microsoft.com/en-us/windows/wsl/)

