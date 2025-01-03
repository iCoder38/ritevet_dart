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
    apiKey: 'AIzaSyBCVKzYsKHjKaAfZj5dJT8bQ6dlRLTzDEM',
    appId: '1:214731614603:web:86dd06f64ce33bab7c278e',
    messagingSenderId: '214731614603',
    projectId: 'bert-alert-free',
    authDomain: 'bert-alert-free.firebaseapp.com',
    databaseURL: 'https://bert-alert-free.firebaseio.com',
    storageBucket: 'bert-alert-free.firebasestorage.app',
    measurementId: 'G-X3JH7FVV1H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAntA0RTOY4P5TbHcg7kYORrAVe4ACUVps',
    appId: '1:214731614603:android:567b7f4a6df6b7c37c278e',
    messagingSenderId: '214731614603',
    projectId: 'bert-alert-free',
    databaseURL: 'https://bert-alert-free.firebaseio.com',
    storageBucket: 'bert-alert-free.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAykcAuucvJ_UvhJbwLz0-vkhhf5lxamPs',
    appId: '1:214731614603:ios:1c5a76507b9440da7c278e',
    messagingSenderId: '214731614603',
    projectId: 'bert-alert-free',
    databaseURL: 'https://bert-alert-free.firebaseio.com',
    storageBucket: 'bert-alert-free.firebasestorage.app',
    androidClientId: '214731614603-3hm66sj1rr0jidvqr4h4gg2vk6iphkuo.apps.googleusercontent.com',
    iosBundleId: 'com.example.ritevetDart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAykcAuucvJ_UvhJbwLz0-vkhhf5lxamPs',
    appId: '1:214731614603:ios:1c5a76507b9440da7c278e',
    messagingSenderId: '214731614603',
    projectId: 'bert-alert-free',
    databaseURL: 'https://bert-alert-free.firebaseio.com',
    storageBucket: 'bert-alert-free.firebasestorage.app',
    androidClientId: '214731614603-3hm66sj1rr0jidvqr4h4gg2vk6iphkuo.apps.googleusercontent.com',
    iosBundleId: 'com.example.ritevetDart',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBCVKzYsKHjKaAfZj5dJT8bQ6dlRLTzDEM',
    appId: '1:214731614603:web:67338368434a72d57c278e',
    messagingSenderId: '214731614603',
    projectId: 'bert-alert-free',
    authDomain: 'bert-alert-free.firebaseapp.com',
    databaseURL: 'https://bert-alert-free.firebaseio.com',
    storageBucket: 'bert-alert-free.firebasestorage.app',
    measurementId: 'G-6EB914NMG2',
  );
}
