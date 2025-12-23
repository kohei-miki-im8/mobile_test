# econa-mobile-app


## ■ コード生成の自動化
以下のコマンドを実行しておくと、コードの変更を検知して自動で`build_runner`でのコード生成が行われます。
```
dart run build_runner watch -d
```

## ■ ディレクトリ構造
以下のアーキテクチャに従います。
```
lib/
├── core                  // アプリ全体で共通して使用されるコード
│   └── errors            // 共通のエラークラス
├── domains
│   ├── entities
│   └── repositories      // リポジトリのinterface
│       └── gen           // proto関連の自動生成ファイル
├── i18n                  // 多言語化ファイル
├── infrastructures
│   └── constants         // API関連の定数
│   └── repositories
├── l10n                  // ローカライゼーションファイル     
├── presentations
│   ├── components        // 共通コンポーネント
│   ├── gen               // アセット関連の自動生成ファイル
│   ├── pages
│   │   └── home_page
│   │       ├── home_page.dart
│   │       ├── home_page_view_model.dart
│   │       └── home_page_state.dart  // 各ページのstate
│   ├── routes            // 画面遷移の定義
│   ├── helpers           // 表示に関する補助的な処理を定義
│   ├── providers         // 共通のProviderを定義
│   ├── states            // 共通のstate
│   ├── app.dart
│   ├── color.dart        // カラー定義
│   ├── layout.dart       // 共通のpadding等を定義
│   ├── const.dart        // 定数(文字列etc)定義
│   ├── shadow.dart       // シャドウの定義
│   ├── style.dart        // 共通のスタイル定義
│   └── theme.dart        // 共通のデザインtheme定義
└── main.dart
```

## ■ アセット管理

### 画像の管理方法
[flutter_gen](https://pub.dev/packages/flutter_gen)パッケージを利用します。


#### 画像の追加
1. assets/images/配下に画像を格納します。

    (アイコン、ロゴ、イラストの場合は基本SVG形式を使用します。）

#### アプリ内での画像の利用
1. ターミナルで`dart run build_runner build -d`を実行し、`lib\presentations\gen\assets.gen.dart`にコードが自動生成されていることを確認します。

    (`dart run build_runner watch -d`コマンドを起動している場合は自動検知。)

2. 以下のサンプルのようにコード内で画像を使用します。

    ```
    @override
    Widget build(BuildContext context, WidgetRef ref) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(ref.watch(labelProvider)),
            Assets.images.home.svg(width: 100),
          ],
        ),
      );
    }
    ```

### フォントとカラーの管理方法
フォントは画像と同じく[flutter_gen](https://pub.dev/packages/flutter_gen)パッケージを利用します。

#### フォントの追加とカラーの確認
1. フォントはFigmaで対象のテキストの`Typography`を確認します。

    (対象のテキストを指定し、右側サイドバーの`Inspect`で確認できます。)

    ![Image](https://github.com/user-attachments/assets/f531b403-4a91-4115-b087-94030e3474d8)

1. [Google Fonts](https://fonts.google.com/specimen/Inter)等から該当のフォントファイルをダウンロードします。

    (リンク先はInterフォントのページです。右上のGet fontからフォントファイルをダウンロードできます。)

1. ダウンロードしたフォントファイルの内、Regular, SemiBoldなど利用したいフォントファイルを`assets\fonts`配下に格納します。

1. `pubspec.yaml`内で以下サンプルのようにパスを記載します。

    ```
    fonts:
      - family: Inter
        fonts:
          - asset: assets\fonts\Inter_24pt-SemiBold.ttf
            weight: 600
    ```

    その際、weight, style(italic)も適宜指定します。
    weightの数値と名前の対応は以下にならいます。([参照](https://pub.dev/packages/google_fonts#bundling-fonts-when-releasing))
    ```
    {
      FontWeight.w100: 'Thin',
      FontWeight.w200: 'ExtraLight',
      FontWeight.w300: 'Light',
      FontWeight.w400: 'Regular',
      FontWeight.w500: 'Medium',
      FontWeight.w600: 'SemiBold',
      FontWeight.w700: 'Bold',
      FontWeight.w800: 'ExtraBold',
      FontWeight.w900: 'Black',
    }
    ```

1. カラーはFigmaで対象パーツを選択し、右側サイドバーの`Inspect`で名前とHex値を確認します。

    ![Image](https://github.com/user-attachments/assets/4bb99f36-e567-486b-9813-dd11ce6ba5eb)

#### アプリ内でのフォントとカラーの利用
1. フォントは`lib\presentations\style.dart`に`TextStyle`として定義します。

    ```
    class EconaTextStyle {
      static TextStyle headlineLarge({
        Color? color,
        List<Shadow>? shadows,
        Paint? foreground,
      }) =>
          TextStyle(
            fontFamily: FontFamily.inter,
            fontSize: 27,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.30,
            height: 1.22,
            leadingDistribution: TextLeadingDistribution.proportional,
            color: color,
            shadows: shadows,
            foreground: foreground,
          );
    }
    ```

    変数名は"フォントの追加 - 手順1"でFigmaの`Typography`で確認した`Name`を指定します。

    Codeモードではfont-family: の上に`/* Headline large */`のようにコメントで表示されます。


    後から`Color`等を注入できるような形で定義しておきます。

1. カラーは`lib\presentations\color.dart`に`Color`として定義します。

    ```
    class EconaColor {
      static const grayGrayPurple400 = Color(0xFF8792CF);
    }
    ```

    変数名はFigmaで確認した名前の頭の`Color`を除いたものとします。

    Figmaで確認したHex値の頭の#を除き0xFFを頭に付けることで、Flutterで`Color`として定義できます。

2. 以下サンプルのようにコード内で利用します。

    ```
    @override
    Widget build(BuildContext context, WidgetRef ref) {
      return Center(
        child: Text(
          ref.watch(labelProvider),
          style: EconaTextStyle.headlineLarge(EconaColor.grayGrayPurple400),
        ),
      );
    }
    ```

    ただし実際にはデザインの適用は極力個々のパーツではなく`lib\presentations\theme.dart`で共通に定義します。

### シャドウの定義
`lib\presentations\shadow.dart`に定義します。

テキストのインナーシャドウはMaskFilter.blur()として定義します。

詳細は既存コード参照。

### テキストのインナーシャドウについて
`lib\presentations\components\inner_shadow_text.dart`のInnerShadowText()を使用します。

詳細は上記ファイル内のコメント参照。

## ■ 画面のレイアウトについて
各ページ共通のpadding(画面両サイド、最下部など)は`lib\presentations\layout.dart`で管理します。

## ■ fastlane CI/CD セットアップ

このプロジェクトでは、fastlaneを使用してiOSアプリのビルドとデプロイを自動化しています。

### 必要な環境

- Ruby 3.2以上
- Bundler
- Flutter SDK
- Xcode（ローカル環境のみ）

### セットアップ手順

#### 1. 依存関係のインストール

```bash
# Rubyの依存関係をインストール
bundle install

# iOSディレクトリに移動してCocoaPodsをインストール
cd ios
pod install
```

#### 2. 環境変数の設定（ローカル環境）

ローカル環境でfastlaneを実行する場合は、以下の環境変数を設定してください：

```bash
export APPLE_ID="your-apple-id@example.com"
export APPLE_TEAM_ID="YOUR_TEAM_ID"
export CODE_SIGNING_IDENTITY="iPhone Distribution"
export PROVISIONING_PROFILE_NAME="match AppStore jp.co.ai-mate.lavi"
```

または、`.env`ファイルを作成して設定することもできます。

#### 3. GitHub Secretsの設定（CI/CD環境）

GitHub ActionsでCI/CDを実行する場合は、以下のSecretsを設定してください：

1. GitHubリポジトリの「Settings」→「Secrets and variables」→「Actions」に移動
2. 以下のSecretsを追加：

#### iOS用Secrets
   - `APPLE_ID`: Apple Developerアカウントのメールアドレス
   - `APPLE_TEAM_ID`: Apple Developer Team ID
   - `CODE_SIGNING_IDENTITY`: コード署名のID（例: "iPhone Distribution"）
   - `PROVISIONING_PROFILE_NAME`: プロビジョニングプロファイル名（例: "match AppStore jp.co.ai-mate.lavi"）

#### Android用Secrets（オプション）
   - `KEYSTORE_FILE`: キーストアファイルのBase64エンコード（またはファイルパス）
   - `KEYSTORE_PASSWORD`: キーストアのパスワード
   - `KEY_ALIAS`: キーエイリアス
   - `KEY_PASSWORD`: キーのパスワード

**注意**: Androidの署名なしビルド（`build_test`）はSecrets不要で実行可能です。

### fastlaneコマンド

#### iOS - ローカル環境での実行

```bash
cd ios

# アプリをビルド（証明書なし・動作確認用）
bundle exec fastlane build_test

# アプリをビルド（証明書あり・本番用）
bundle exec fastlane build

# テストを実行
bundle exec fastlane test

# ビルドとテストの両方を実行
bundle exec fastlane build_and_test
```

#### Android - ローカル環境での実行

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

# テストを実行
bundle exec fastlane test

# ビルドとテストの両方を実行
bundle exec fastlane build_and_test
```

#### CI/CDでの実行

mainブランチにpushすると、自動的にGitHub Actionsが実行されます。

**注意**: このプロジェクトでは**self-hostedランナー**を使用しています。
self-hostedランナーのセットアップについては、[`.github/SELF_HOSTED_RUNNER_SETUP.md`](.github/SELF_HOSTED_RUNNER_SETUP.md)を参照してください。

手動で実行する場合は、GitHubの「Actions」タブから以下のワークフローを選択して「Run workflow」をクリックしてください：
- **iOS Build**: iOSアプリのビルド（macOS self-hostedランナー）
- **Android Build**: Androidアプリのビルド（Linux self-hostedランナー）

### ビルド成果物

#### iOS
- ローカル環境: `ios/build/`ディレクトリに`.ipa`ファイルが生成されます
- CI/CD環境: GitHub Actionsの「Artifacts」からダウンロードできます（7日間保持）

#### Android
- ローカル環境:
  - Debug APK: `build/app/outputs/flutter-apk/app-debug.apk`
  - Release APK: `build/app/outputs/flutter-apk/app-release.apk`
  - App Bundle: `build/app/outputs/bundle/release/app-release.aab`
- CI/CD環境: GitHub Actionsの「Artifacts」からダウンロードできます（7日間保持）

### トラブルシューティング

#### 証明書関連のエラー

証明書やプロビジョニングプロファイルが見つからない場合は、以下を確認してください：

1. GitHub Secretsに正しい値が設定されているか
2. Apple Developer Portalで証明書とプロビジョニングプロファイルが有効か
3. ローカル環境の場合は、Keychainに証明書がインストールされているか

#### CocoaPodsのエラー

```bash
cd ios
pod deintegrate
pod install
```

#### Flutterビルドのエラー

```bash
flutter clean
flutter pub get

# iOSの場合
cd ios
pod install

# Androidの場合
cd android
./gradlew clean
```

#### Android署名のエラー

`android/key.properties`ファイルが正しく設定されているか確認してください：

```properties
storePassword=your-store-password
keyPassword=your-key-password
keyAlias=your-key-alias
storeFile=path/to/your/keystore.jks
```

### 注意事項

- このセットアップは試験的な動作確認用です
- 実際のApp Store/Google Playへのデプロイには、追加の設定が必要な場合があります
- iOSの証明書管理には`fastlane match`の使用を推奨します（将来的な拡張として）
- AndroidのビルドはLinux環境でも実行可能ですが、iOSのビルドにはmacOSが必要です
