import Flutter
import UIKit
import WebKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    if let controller = window?.rootViewController as? FlutterViewController {
      let securityChannel = FlutterMethodChannel(name: "app.security_integrity", binaryMessenger: controller.binaryMessenger)
      securityChannel.setMethodCallHandler { call, result in
        if call.method == "isDeviceCompromised" {
          result(NSNumber(value: Self.isDeviceCompromised()))
        } else {
          result(FlutterMethodNotImplemented)
        }
      }

      // WKWebView用のメソッドチャネル
      let webViewChannel = FlutterMethodChannel(name: "app.safari_view", binaryMessenger: controller.binaryMessenger)
            webViewChannel.setMethodCallHandler { [weak self] call, result in
              if call.method == "openSafariViewController" {
                guard let args = call.arguments as? [String: Any],
                      let urlString = args["url"] as? String,
                      let url = URL(string: urlString),
                      let backUrl = args["backUrl"] as? String else {
                  result(FlutterError(code: "INVALID_ARGUMENT", message: "URL and backUrl are required", details: nil))
                  return
                }

                // EKYCのCookieとキャッシュをクリア
                self?.clearEkycData(url: url) {
                  let webViewController = EkycWebViewController(url: url, backUrl: backUrl, channel: webViewChannel)
                  let navigationController = UINavigationController(rootViewController: webViewController)
                  navigationController.modalPresentationStyle = .pageSheet

                  controller.present(navigationController, animated: true) {
                    result(true)
                  }
                }
              } else {
                result(FlutterMethodNotImplemented)
              }
            }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private static func isDeviceCompromised() -> Bool {
#if targetEnvironment(simulator)
    return false
#else
    // File existence checks
    let suspiciousPaths = [
      "/Applications/Cydia.app",
      "/Library/MobileSubstrate/MobileSubstrate.dylib",
      "/bin/bash",
      "/usr/sbin/sshd",
      "/etc/apt",
      "/private/var/lib/apt/"
    ]
    for path in suspiciousPaths {
      if FileManager.default.fileExists(atPath: path) { return true }
    }

    // Write test outside sandbox
    let testPath = "/private/jb_test.txt"
    do {
      try "test".write(toFile: testPath, atomically: true, encoding: .utf8)
      try FileManager.default.removeItem(atPath: testPath)
      return true
    } catch {
      // ignore
    }

    // Cydia URL scheme
    if let url = URL(string: "cydia://package/com.example.package"), UIApplication.shared.canOpenURL(url) {
      return true
    }

    // Environment variable
    if let env = getenv("DYLD_INSERT_LIBRARIES"), String(cString: env).count > 0 {
      return true
    }

    return false
#endif
  }

  private func clearEkycData(url: URL, completion: @escaping () -> Void) {
    let dataStore = WKWebsiteDataStore.default()
    let websiteDataTypes: Set<String> = [
      WKWebsiteDataTypeCookies,
      WKWebsiteDataTypeDiskCache,
      WKWebsiteDataTypeMemoryCache
    ]
    
    dataStore.fetchDataRecords(ofTypes: websiteDataTypes) { records in
      // URLのドメインに一致するレコードを削除
      let recordsToDelete = records.filter { record in
         // displayNameはドメイン名（例: "example.com"）を直接返す
         return record.displayName == url.host
      }
      
      dataStore.removeData(ofTypes: websiteDataTypes, for: recordsToDelete) {
        DispatchQueue.main.async {
            completion()
        }
      }
    }
  }
}

// WKWebViewを使用するViewController
class EkycWebViewController: UIViewController, WKNavigationDelegate {
  private let webView: WKWebView
  private let initialUrl: URL
  private let backUrl: String
  private let channel: FlutterMethodChannel
  private var shouldCloseOnNextNavigation = false

  init(url: URL, backUrl: String, channel: FlutterMethodChannel) {
    self.initialUrl = url
    self.backUrl = backUrl
    self.channel = channel

    let configuration = WKWebViewConfiguration()
    configuration.allowsInlineMediaPlayback = true
    configuration.mediaTypesRequiringUserActionForPlayback = []

    self.webView = WKWebView(frame: .zero, configuration: configuration)
    super.init(nibName: nil, bundle: nil)

    self.webView.navigationDelegate = self
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "本人確認"

    // ナビゲーションバーの設定
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      barButtonSystemItem: .cancel,
      target: self,
      action: #selector(closeButtonTapped)
    )

    // ナビゲーションバーの背景色を設定
    if let navigationBar = navigationController?.navigationBar {
      navigationBar.barTintColor = UIColor(red: 0xED/255.0, green: 0xF1/255.0, blue: 0xFD/255.0, alpha: 1.0)
      navigationBar.isTranslucent = false
      // タイトルの色も設定（必要に応じて）
      navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
    }

    // WebViewの設定
    webView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(webView)

    NSLayoutConstraint.activate([
      webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])

    // URLを読み込む
    let request = URLRequest(url: initialUrl)
    webView.load(request)
  }

  @objc private func closeButtonTapped() {
    dismiss(animated: true)
  }

  // MARK: - WKNavigationDelegate

  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    guard let url = navigationAction.request.url else {
      decisionHandler(.allow)
      return
    }

    let urlString = url.absoluteString

    // 戻りURLをチェック
    if urlString == backUrl || urlString.hasPrefix(backUrl + "?") || urlString.hasPrefix(backUrl + "#") {
      // APIリクエストを実行させるために.allowを返す
      shouldCloseOnNextNavigation = true
      decisionHandler(.allow)
      return
    }

    // 外部スキームの処理
    if url.scheme != "https" {
      if UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url)
        decisionHandler(.cancel)
        return
      }
    }

    decisionHandler(.allow)
  }

  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    // 読み込み開始
  }

  func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    // ナビゲーションがコミットされた（リクエストが送信された）
    if shouldCloseOnNextNavigation {
      shouldCloseOnNextNavigation = false
      // Flutter側に通知
      channel.invokeMethod("onEkycBackUrlDetected", arguments: nil)
      dismiss(animated: true)
    }
  }

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    // 読み込み完了
  }

  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    // エラー処理
    channel.invokeMethod("onEkycWebViewError", arguments: ["error": error.localizedDescription])
  }

  func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    // プロビジョナルナビゲーションのエラー処理
    channel.invokeMethod("onEkycWebViewError", arguments: ["error": error.localizedDescription])
  }
}