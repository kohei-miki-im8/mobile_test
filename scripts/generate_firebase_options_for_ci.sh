#!/bin/bash
# Generate a dummy firebase_options.dart file for CI builds

FIREBASE_OPTIONS_DART="lib/firebase_options.dart"

cat > "$FIREBASE_OPTIONS_DART" << 'EOF'
// File generated for CI builds - DO NOT USE IN PRODUCTION
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError('Web not supported in CI build');
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError('Platform not supported in CI build');
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'CI_DUMMY_API_KEY',
    appId: '1:000000000000:android:000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'ci-dummy-project',
    storageBucket: 'ci-dummy-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'CI_DUMMY_API_KEY',
    appId: '1:000000000000:ios:000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'ci-dummy-project',
    storageBucket: 'ci-dummy-project.appspot.com',
    iosBundleId: 'com.example.dummy',
  );
}
EOF

echo "Generated $FIREBASE_OPTIONS_DART for CI builds"

