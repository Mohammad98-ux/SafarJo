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
    apiKey: 'AIzaSyBhQ88BBeYJKKt09u1B5g9ryMdHIbdnAAA',
    appId: '1:356761232122:web:385c56b8ed84f6e976df43',
    messagingSenderId: '356761232122',
    projectId: 'safar-249d3',
    authDomain: 'safar-249d3.firebaseapp.com',
    storageBucket: 'safar-249d3.appspot.com',
    measurementId: 'G-PPTB14PQPS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNltnsXbDb7RXrl5LWOhOVQWaEI6n1X4Y',
    appId: '1:356761232122:android:23a8d0d00612dc5576df43',
    messagingSenderId: '356761232122',
    projectId: 'safar-249d3',
    storageBucket: 'safar-249d3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-jTnaqDAj0UZM3QbchH4CAnFu3yOHjjo',
    appId: '1:356761232122:ios:1d1c2fccdfa959a676df43',
    messagingSenderId: '356761232122',
    projectId: 'safar-249d3',
    storageBucket: 'safar-249d3.appspot.com',
    iosClientId: '356761232122-q5mid4b7pockn241fmthun0sk4rk9v3n.apps.googleusercontent.com',
    iosBundleId: 'com.example.safar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-jTnaqDAj0UZM3QbchH4CAnFu3yOHjjo',
    appId: '1:356761232122:ios:1d1c2fccdfa959a676df43',
    messagingSenderId: '356761232122',
    projectId: 'safar-249d3',
    storageBucket: 'safar-249d3.appspot.com',
    iosClientId: '356761232122-q5mid4b7pockn241fmthun0sk4rk9v3n.apps.googleusercontent.com',
    iosBundleId: 'com.example.safar',
  );
}
