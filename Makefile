# ==========================================================
# GitHub Actions Self-Hosted Runner 管理
# ==========================================================

# --- ランナー設定変数 ---
RUNNER_DIR ?= $(HOME)/actions-runner
RUNNER_VERSION ?= 2.311.0
RUNNER_URL ?= https://github.com/kohei-miki-im8/mobile_test
RUNNER_LABELS_LINUX ?= linux,android,self-hosted
RUNNER_LABELS_MACOS ?= macos,ios,self-hosted

# OS検出
UNAME_S := $(shell uname -s 2>/dev/null || echo "Linux")
IS_WSL := $(shell grep -qi microsoft /proc/version 2>/dev/null && echo "true" || echo "false")

# ランナーアーキテクチャとOSの判定
ifeq ($(UNAME_S),Darwin)
	RUNNER_OS := osx
	RUNNER_ARCH := x64
	RUNNER_LABELS := $(RUNNER_LABELS_MACOS)
	RUNNER_EXT := tar.gz
else
	RUNNER_OS := linux
	RUNNER_ARCH := x64
	RUNNER_LABELS := $(RUNNER_LABELS_LINUX)
	RUNNER_EXT := tar.gz
endif

RUNNER_PACKAGE := actions-runner-$(RUNNER_OS)-$(RUNNER_ARCH)-$(RUNNER_VERSION).$(RUNNER_EXT)
RUNNER_DOWNLOAD_URL := https://github.com/actions/runner/releases/download/v$(RUNNER_VERSION)/$(RUNNER_PACKAGE)

.PHONY: runner-setup runner-status runner-start runner-stop runner-restart \
        runner-remove runner-logs runner-diagnose runner-help \
        runner-install runner-configure runner-service-install \
        runner-service-uninstall runner-check

# ==========================================================
# メインコマンド
# ==========================================================

# ランナーの完全セットアップ（ダウンロード + 設定 + サービスインストール）
runner-setup:
	@echo ""
	@echo "==== GitHub Actions Self-Hosted Runner セットアップ ===="
	@echo ""
	@echo "📋 設定情報:"
	@echo "  - リポジトリURL: $(RUNNER_URL)"
	@echo "  - ランナーディレクトリ: $(RUNNER_DIR)"
	@echo "  - OS: $(RUNNER_OS)"
	@echo "  - アーキテクチャ: $(RUNNER_ARCH)"
	@echo "  - ラベル: $(RUNNER_LABELS)"
	@echo ""
	@if [ -d "$(RUNNER_DIR)" ] && [ -f "$(RUNNER_DIR)/config.sh" ]; then \
		echo "⚠️  ランナーは既にインストールされています: $(RUNNER_DIR)"; \
		echo ""; \
		echo "再セットアップする場合:"; \
		echo "  1. 既存のランナーを削除: make runner-remove"; \
		echo "  2. 再度セットアップ: make runner-setup"; \
		exit 1; \
	fi
	@echo "📥 ステップ1: ランナーのインストール..."
	@$(MAKE) --no-print-directory runner-install
	@echo ""
	@echo "⚙️  ステップ2: ランナーの設定..."
	@echo "  ⚠️  ランナートークンが必要です"
	@echo "  GitHubリポジトリの「Settings」→「Actions」→「Runners」→「New self-hosted runner」から取得してください"
	@echo ""
	@read -p "ランナートークンを入力してください: " token; \
	if [ -z "$$token" ]; then \
		echo "❌ トークンが入力されませんでした"; \
		exit 1; \
	fi; \
	$(MAKE) --no-print-directory runner-configure RUNNER_TOKEN="$$token"
	@echo ""
	@echo "🔧 ステップ3: サービスとしてインストール（オプション）..."
	@read -p "サービスとしてインストールしますか? [y/N] " install_service; \
	if [ "$$install_service" = "y" ] || [ "$$install_service" = "Y" ]; then \
		$(MAKE) --no-print-directory runner-service-install; \
	else \
		echo "  ⚠️  サービスインストールをスキップしました"; \
		echo "  手動で起動する場合: cd $(RUNNER_DIR) && ./run.sh"; \
	fi
	@echo ""
	@echo "✅ ランナーのセットアップが完了しました"
	@echo ""
	@echo "📚 次のステップ:"
	@echo "  1. GitHub上でランナーの状態を確認: https://github.com/kohei-miki-im8/mobile_test/settings/actions/runners"
	@echo "  2. ランナーの状態確認: make runner-status"
	@echo "  3. テストワークフローを実行して動作確認"
	@echo ""

# ランナーのインストール（ダウンロード + 解凍）
runner-install:
	@echo ""
	@echo "==== ランナーのインストール ===="
	@echo ""
	@if [ -d "$(RUNNER_DIR)" ]; then \
		echo "⚠️  ディレクトリが既に存在します: $(RUNNER_DIR)"; \
		echo "  削除してから再インストールしてください"; \
		exit 1; \
	fi
	@echo "📁 ディレクトリを作成: $(RUNNER_DIR)"
	@mkdir -p $(RUNNER_DIR)
	@cd $(RUNNER_DIR) && \
	echo "📥 ランナーをダウンロード中: $(RUNNER_DOWNLOAD_URL)" && \
	curl -L -o $(RUNNER_PACKAGE) $(RUNNER_DOWNLOAD_URL) || \
	(echo ""; echo "❌ ダウンロードに失敗しました"; \
	 echo "  手動でダウンロード: $(RUNNER_DOWNLOAD_URL)"; \
	 exit 1) && \
	echo "📦 解凍中..." && \
	tar xzf $(RUNNER_PACKAGE) && \
	rm -f $(RUNNER_PACKAGE) && \
	echo "✅ インストールが完了しました"
	@echo ""

# ランナーの設定（config.sh実行）
runner-configure:
	@if [ -z "$(RUNNER_TOKEN)" ]; then \
		echo "❌ RUNNER_TOKENが指定されていません"; \
		echo ""; \
		echo "使用方法:"; \
		echo "  make runner-configure RUNNER_TOKEN=your_token_here"; \
		exit 1; \
	fi
	@if [ ! -f "$(RUNNER_DIR)/config.sh" ]; then \
		echo "❌ ランナーがインストールされていません"; \
		echo "  まず実行: make runner-install"; \
		exit 1; \
	fi
	@echo ""
	@echo "==== ランナーの設定 ===="
	@echo ""
	@cd $(RUNNER_DIR) && \
	./config.sh \
		--url $(RUNNER_URL) \
		--token $(RUNNER_TOKEN) \
		--labels $(RUNNER_LABELS) \
		--replace || \
	(echo ""; echo "❌ 設定に失敗しました"; \
	 echo "  トークンが有効か確認してください"; \
	 exit 1)
	@echo ""
	@echo "✅ ランナーの設定が完了しました"
	@echo ""

# サービスとしてインストール
runner-service-install:
	@echo ""
	@echo "==== ランナーをサービスとしてインストール ===="
	@echo ""
	@if [ ! -f "$(RUNNER_DIR)/svc.sh" ]; then \
		echo "❌ ランナーがインストールされていません"; \
		echo "  まず実行: make runner-install runner-configure"; \
		exit 1; \
	fi
	@cd $(RUNNER_DIR) && \
	if sudo ./svc.sh status >/dev/null 2>&1; then \
		echo "⚠️  サービスは既にインストールされています"; \
		echo "  再インストールする場合は、まず実行: make runner-service-uninstall"; \
		exit 0; \
	fi; \
	service_file=$$(ls /etc/systemd/system/actions.runner.*.service 2>/dev/null | head -1); \
	if [ -n "$$service_file" ]; then \
		echo "⚠️  既存のサービスファイルが見つかりました: $$service_file"; \
		echo "🧹 既存のサービスを停止・アンインストール中..."; \
		sudo ./svc.sh stop 2>/dev/null || true; \
		sudo ./svc.sh uninstall 2>/dev/null || true; \
		sudo systemctl daemon-reload 2>/dev/null || true; \
		echo "✅ 既存のサービスを削除しました"; \
		echo ""; \
	fi; \
	echo "🔧 サービスをインストール中..." && \
	sudo ./svc.sh install && \
	echo "🚀 サービスを起動中..." && \
	sudo ./svc.sh start && \
	echo "✅ サービスとしてインストールされました"
	@echo ""
	@echo "📋 サービス管理コマンド:"
	@echo "  - 状態確認: make runner-status"
	@echo "  - 停止: make runner-stop"
	@echo "  - 開始: make runner-start"
	@echo "  - 再起動: make runner-restart"
	@echo ""

# サービスをアンインストール
runner-service-uninstall:
	@echo ""
	@echo "==== ランナーサービスのアンインストール ===="
	@echo ""
	@if [ ! -f "$(RUNNER_DIR)/svc.sh" ]; then \
		echo "⚠️  サービスがインストールされていません"; \
		exit 0; \
	fi
	@cd $(RUNNER_DIR) && \
	echo "🛑 サービスを停止中..." && \
	sudo ./svc.sh stop || true && \
	echo "🗑️  サービスをアンインストール中..." && \
	sudo ./svc.sh uninstall || true && \
	echo "✅ サービスのアンインストールが完了しました"
	@echo ""

# ==========================================================
# ランナー管理コマンド
# ==========================================================

# ランナーの状態確認
runner-status:
	@echo ""
	@echo "==== GitHub Actions Runner 状態 ===="
	@echo ""
	@echo "📋 基本情報:"
	@echo "  - ランナーディレクトリ: $(RUNNER_DIR)"
	@echo "  - OS: $(UNAME_S)"
	@if [ "$(IS_WSL)" = "true" ]; then \
		echo "  - 環境: WSL2"; \
	fi
	@echo ""
	@if [ ! -d "$(RUNNER_DIR)" ]; then \
		echo "❌ ランナーがインストールされていません"; \
		echo ""; \
		echo "セットアップ:"; \
		echo "  make runner-setup"; \
		exit 0; \
	fi
	@echo "📦 インストール状態:"
	@if [ -f "$(RUNNER_DIR)/config.sh" ]; then \
		echo "  ✅ ランナーがインストールされています"; \
	else \
		echo "  ⚠️  ランナーのインストールが不完全です"; \
	fi
	@if [ -f "$(RUNNER_DIR)/.runner" ]; then \
		echo "  ✅ ランナーが設定されています"; \
		runner_name=$$(grep -oP 'agentName=\K[^,]+' $(RUNNER_DIR)/.runner 2>/dev/null || echo "不明"); \
		echo "  📝 ランナー名: $$runner_name"; \
	else \
		echo "  ⚠️  ランナーが設定されていません"; \
		echo "    実行: make runner-configure RUNNER_TOKEN=your_token"; \
	fi
	@echo ""
	@echo "🔧 サービス状態:"
	@if [ -f "$(RUNNER_DIR)/svc.sh" ]; then \
		cd $(RUNNER_DIR) && \
		if sudo ./svc.sh status >/dev/null 2>&1; then \
			echo "  ✅ サービスとして実行中"; \
			sudo ./svc.sh status 2>/dev/null | head -3 || true; \
		else \
			echo "  ⚠️  サービスとしてインストールされていません"; \
			if pgrep -f "Runner.Listener" >/dev/null 2>&1; then \
				echo "  ✅ プロセスとして実行中"; \
			else \
				echo "  ❌ 実行されていません"; \
			fi; \
		fi; \
	else \
		echo "  ⚠️  サービススクリプトが見つかりません"; \
	fi
	@echo ""
	@echo "🌐 GitHub上での確認:"
	@echo "  https://github.com/kohei-miki-im8/mobile_test/settings/actions/runners"
	@echo ""

# ランナーの起動
runner-start:
	@echo ""
	@echo "==== ランナーの起動 ===="
	@echo ""
	@if [ ! -d "$(RUNNER_DIR)" ]; then \
		echo "❌ ランナーがインストールされていません"; \
		echo "  まず実行: make runner-setup"; \
		exit 1; \
	fi
	@cd $(RUNNER_DIR) && \
	if [ -f "./svc.sh" ] && sudo ./svc.sh status >/dev/null 2>&1; then \
		echo "🔧 サービスとして起動中..."; \
		sudo ./svc.sh start || \
		(echo "❌ サービスの起動に失敗しました"; exit 1); \
		echo "✅ サービスを起動しました"; \
	else \
		echo "🚀 プロセスとして起動中..."; \
		if pgrep -f "Runner.Listener" >/dev/null 2>&1; then \
			echo "⚠️  ランナーは既に実行中です"; \
		else \
			nohup ./run.sh > /dev/null 2>&1 & \
			sleep 2 && \
			if pgrep -f "Runner.Listener" >/dev/null 2>&1; then \
				echo "✅ ランナーを起動しました"; \
			else \
				echo "❌ ランナーの起動に失敗しました"; \
				echo "  ログを確認: make runner-logs"; \
				exit 1; \
			fi; \
		fi; \
	fi
	@echo ""

# ランナーの停止
runner-stop:
	@echo ""
	@echo "==== ランナーの停止 ===="
	@echo ""
	@if [ ! -d "$(RUNNER_DIR)" ]; then \
		echo "⚠️  ランナーがインストールされていません"; \
		exit 0; \
	fi
	@cd $(RUNNER_DIR) && \
	if [ -f "./svc.sh" ] && sudo ./svc.sh status >/dev/null 2>&1; then \
		echo "🔧 サービスを停止中..."; \
		sudo ./svc.sh stop || true; \
		echo "✅ サービスを停止しました"; \
	else \
		echo "🛑 プロセスを停止中..."; \
		pkill -f "Runner.Listener" || echo "⚠️  実行中のプロセスが見つかりませんでした"; \
		echo "✅ プロセスを停止しました"; \
	fi
	@echo ""

# ランナーの再起動
runner-restart:
	@echo ""
	@echo "==== ランナーの再起動 ===="
	@echo ""
	@$(MAKE) --no-print-directory runner-stop
	@sleep 2
	@$(MAKE) --no-print-directory runner-start
	@echo "✅ ランナーを再起動しました"
	@echo ""

# ランナーのログ確認
runner-logs:
	@echo ""
	@echo "==== ランナーのログ ===="
	@echo ""
	@if [ ! -d "$(RUNNER_DIR)" ]; then \
		echo "❌ ランナーがインストールされていません"; \
		exit 1; \
	fi
	@if [ -d "$(RUNNER_DIR)/_diag" ]; then \
		echo "📋 診断ログ:"; \
		latest_log=$$(ls -t $(RUNNER_DIR)/_diag/Runner_*.log 2>/dev/null | head -1); \
		if [ -n "$$latest_log" ]; then \
			echo "  最新ログ: $$latest_log"; \
			echo ""; \
			tail -50 "$$latest_log" || true; \
		else \
			echo "  ⚠️  ログファイルが見つかりません"; \
		fi; \
	else \
		echo "⚠️  ログディレクトリが見つかりません"; \
	fi
	@echo ""
	@if [ -f "$(RUNNER_DIR)/svc.sh" ] && sudo ./svc.sh status >/dev/null 2>&1 2>/dev/null; then \
		service_name=$$(sudo systemctl list-units --type=service | grep actions.runner | awk '{print $$1}' | head -1); \
		if [ -n "$$service_name" ]; then \
			echo "📋 サービスログ (最新20行):"; \
			echo ""; \
			sudo journalctl -u "$$service_name" -n 20 --no-pager || true; \
		fi; \
	fi
	@echo ""

# ランナーの診断
runner-diagnose:
	@echo ""
	@echo "==== ランナーの診断 ===="
	@echo ""
	@echo "🔍 環境情報:"
	@echo "  - OS: $(UNAME_S)"
	@if [ "$(IS_WSL)" = "true" ]; then \
		echo "  - 環境: WSL2"; \
	fi
	@echo "  - シェル: $${SHELL:-Unknown}"
	@echo "  - ユーザー: $${USER:-$${USERNAME:-Unknown}}"
	@echo ""
	@echo "📦 必須ツール:"
	@if command -v curl >/dev/null 2>&1; then \
		echo "  ✅ curl: $$(curl --version | head -1)"; \
	else \
		echo "  ❌ curl: 未インストール"; \
	fi
	@if command -v tar >/dev/null 2>&1; then \
		echo "  ✅ tar: インストール済み"; \
	else \
		echo "  ❌ tar: 未インストール"; \
	fi
	@echo ""
	@echo "📁 ディレクトリ:"
	@echo "  - ランナーディレクトリ: $(RUNNER_DIR)"
	@if [ -d "$(RUNNER_DIR)" ]; then \
		echo "    ✅ 存在する"; \
		ls -la $(RUNNER_DIR) | head -10 || true; \
	else \
		echo "    ❌ 存在しない"; \
	fi
	@echo ""
	@echo "🔧 ランナー状態:"
	@$(MAKE) --no-print-directory runner-status
	@echo ""
	@echo "💡 推奨アクション:"
	@if [ ! -d "$(RUNNER_DIR)" ]; then \
		echo "  → セットアップ: make runner-setup"; \
	elif [ ! -f "$(RUNNER_DIR)/.runner" ]; then \
		echo "  → 設定: make runner-configure RUNNER_TOKEN=your_token"; \
	elif ! pgrep -f "Runner.Listener" >/dev/null 2>&1 && ! sudo systemctl is-active --quiet actions.runner.* 2>/dev/null; then \
		echo "  → 起動: make runner-start"; \
	else \
		echo "  ✅ ランナーは正常に動作しています"; \
	fi
	@echo ""

# ランナーの削除
runner-remove:
	@echo ""
	@echo "==== ランナーの削除 ===="
	@echo ""
	@if [ ! -d "$(RUNNER_DIR)" ]; then \
		echo "⚠️  ランナーがインストールされていません"; \
		exit 0; \
	fi
	@echo "⚠️  以下の操作を実行します:"
	@echo "  1. ランナーサービスを停止・アンインストール"
	@echo "  2. ランナーディレクトリを削除: $(RUNNER_DIR)"
	@echo ""
	@read -p "続行しますか? [y/N] " confirm; \
	if [ "$$confirm" != "y" ] && [ "$$confirm" != "Y" ]; then \
		echo ""; \
		echo "❌ キャンセルしました"; \
		exit 0; \
	fi
	@echo ""
	@echo "🛑 サービスを停止・アンインストール中..."
	@$(MAKE) --no-print-directory runner-service-uninstall || true
	@echo ""
	@echo "🗑️  ランナーディレクトリを削除中..."
	@if [ -d "$(RUNNER_DIR)" ]; then \
		rm -rf $(RUNNER_DIR) && \
		echo "✅ ランナーディレクトリを削除しました" || \
		echo "⚠️  ディレクトリの削除に失敗しました（手動で削除してください）"; \
	fi
	@echo ""
	@echo "✅ ランナーの削除が完了しました"
	@echo ""
	@echo "📝 注意: GitHub上でランナーを削除する場合は、リポジトリの「Settings」→「Actions」→「Runners」から手動で削除してください"
	@echo ""

# ランナーのチェック（簡易版）
runner-check:
	@if [ ! -d "$(RUNNER_DIR)" ]; then \
		echo "❌ ランナーがインストールされていません"; \
		exit 1; \
	fi
	@if [ ! -f "$(RUNNER_DIR)/.runner" ]; then \
		echo "❌ ランナーが設定されていません"; \
		exit 1; \
	fi
	@if pgrep -f "Runner.Listener" >/dev/null 2>&1 || sudo systemctl is-active --quiet actions.runner.* 2>/dev/null; then \
		echo "✅ ランナーは実行中です"; \
		exit 0; \
	else \
		echo "❌ ランナーは実行されていません"; \
		exit 1; \
	fi

# ランナーのヘルプ
runner-help:
	@echo ""
	@echo "==== GitHub Actions Self-Hosted Runner 管理 ===="
	@echo ""
	@echo "🎯 主要コマンド:"
	@echo "  make runner-setup          : ランナーの完全セットアップ（推奨）"
	@echo "  make runner-status         : ランナーの状態確認"
	@echo ""
	@echo "🔧 ランナー管理:"
	@echo "  make runner-start          : ランナーを起動"
	@echo "  make runner-stop           : ランナーを停止"
	@echo "  make runner-restart        : ランナーを再起動"
	@echo "  make runner-remove         : ランナーを削除"
	@echo ""
	@echo "📋 詳細情報:"
	@echo "  make runner-logs           : ランナーのログを表示"
	@echo "  make runner-diagnose       : ランナーの診断"
	@echo "  make runner-check          : ランナーの簡易チェック"
	@echo ""
	@echo "⚙️  個別セットアップ:"
	@echo "  make runner-install        : ランナーをダウンロード・インストール"
	@echo "  make runner-configure      : ランナーを設定（RUNNER_TOKEN=your_token）"
	@echo "  make runner-service-install : サービスとしてインストール"
	@echo ""
	@echo "📝 環境変数:"
	@echo "  RUNNER_DIR                 : ランナーディレクトリ（デフォルト: ~/actions-runner）"
	@echo "  RUNNER_VERSION             : ランナーバージョン（デフォルト: 2.311.0）"
	@echo "  RUNNER_URL                 : リポジトリURL（デフォルト: https://github.com/kohei-miki-im8/mobile_test）"
	@echo "  RUNNER_TOKEN               : ランナートークン（設定時のみ必要）"
	@echo ""
	@echo "📚 例:"
	@echo "  # カスタムディレクトリでセットアップ"
	@echo "  make runner-setup RUNNER_DIR=/opt/actions-runner"
	@echo ""
	@echo "  # カスタムトークンで設定"
	@echo "  make runner-configure RUNNER_TOKEN=your_token_here"
	@echo ""
	@echo "🌐 GitHub上での確認:"
	@echo "  https://github.com/kohei-miki-im8/mobile_test/settings/actions/runners"
	@echo ""

# ==========================================================
# Fastlane / Flutter ビルド（Android）
# ==========================================================

.PHONY: android-setup android-lanes android-build-debug android-build-test \
        android-build android-build-bundle android-test android-build-and-test

android-setup:
	@flutter pub get
	@bundle install

android-lanes:
	@cd android && bundle exec fastlane lanes

android-build-debug:
	@cd android && bundle exec fastlane build_debug

android-build-test:
	@cd android && bundle exec fastlane build_test

android-build:
	@cd android && bundle exec fastlane build

android-build-bundle:
	@cd android && bundle exec fastlane build_bundle

android-test:
	@cd android && bundle exec fastlane test

android-build-and-test:
	@cd android && bundle exec fastlane build_and_test
