// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBmWF8FcH1SlTpIHznGVr09AmzhHUOrgP4',
    appId: '1:525233591772:web:8dfd4295ba5af65239ab19',
    messagingSenderId: '525233591772',
    projectId: 'fir-d7973',
    authDomain: 'fir-d7973.firebaseapp.com',
    storageBucket: 'fir-d7973.appspot.com',
    measurementId: 'G-7FD3GRE8WK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBm8M428aC8RwWlthxzmxOwlZPsO6R5qTQ',
    appId: '1:525233591772:android:65f7b8b79d476a8339ab19',
    messagingSenderId: '525233591772',
    projectId: 'fir-d7973',
    storageBucket: 'fir-d7973.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnoPREsi2PIsmmWkLizf1T-RnRRqYj42c',
    appId: '1:525233591772:ios:8f7a6828caac4e1f39ab19',
    messagingSenderId: '525233591772',
    projectId: 'fir-d7973',
    storageBucket: 'fir-d7973.appspot.com',
    iosBundleId: 'com.example.amazon',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCnoPREsi2PIsmmWkLizf1T-RnRRqYj42c',
    appId: '1:525233591772:ios:ae233f002d2af8a339ab19',
    messagingSenderId: '525233591772',
    projectId: 'fir-d7973',
    storageBucket: 'fir-d7973.appspot.com',
    iosBundleId: 'com.example.amazon.RunnerTests',
  );
}
