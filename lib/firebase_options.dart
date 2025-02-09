// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyB30iV_iAggFP0oTWIQtlqxDc82xrsh-Uk',
    appId: '1:618840842008:web:31b0aa86c1c8360396886d',
    messagingSenderId: '618840842008',
    projectId: 'daily-106e4',
    authDomain: 'daily-106e4.firebaseapp.com',
    storageBucket: 'daily-106e4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqXLx5B-f4Syugui06ISjhNRMl-kN7bdE',
    appId: '1:618840842008:android:fc352ee21b24724c96886d',
    messagingSenderId: '618840842008',
    projectId: 'daily-106e4',
    storageBucket: 'daily-106e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsHESfQ9Pm0OhoJ2yunZvGhDs4X9-1Y3M',
    appId: '1:618840842008:ios:3116983972ce8e0d96886d',
    messagingSenderId: '618840842008',
    projectId: 'daily-106e4',
    storageBucket: 'daily-106e4.appspot.com',
    iosBundleId: 'com.example.daily',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBsHESfQ9Pm0OhoJ2yunZvGhDs4X9-1Y3M',
    appId: '1:618840842008:ios:3116983972ce8e0d96886d',
    messagingSenderId: '618840842008',
    projectId: 'daily-106e4',
    storageBucket: 'daily-106e4.appspot.com',
    iosBundleId: 'com.example.daily',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB30iV_iAggFP0oTWIQtlqxDc82xrsh-Uk',
    appId: '1:618840842008:web:c7d27426444afe1896886d',
    messagingSenderId: '618840842008',
    projectId: 'daily-106e4',
    authDomain: 'daily-106e4.firebaseapp.com',
    storageBucket: 'daily-106e4.appspot.com',
  );
}
