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
    apiKey: 'AIzaSyCjdRZN8sQn2kzE0nPkKPm68y8WW7Qcv_A',
    appId: '1:81502817243:web:78fc6513b8579834e135fe',
    messagingSenderId: '81502817243',
    projectId: 'inventory-org-c25fe',
    authDomain: 'inventory-org-c25fe.firebaseapp.com',
    storageBucket: 'inventory-org-c25fe.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbzJLJlY-P6XZR7dVSXhL0Dl053eDoGcY',
    appId: '1:81502817243:android:4b46f1afdbdc2269e135fe',
    messagingSenderId: '81502817243',
    projectId: 'inventory-org-c25fe',
    storageBucket: 'inventory-org-c25fe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDudYktz_oSNToG6osKze2qDj2xO3eJEl0',
    appId: '1:81502817243:ios:cfb1862715912b5be135fe',
    messagingSenderId: '81502817243',
    projectId: 'inventory-org-c25fe',
    storageBucket: 'inventory-org-c25fe.appspot.com',
    iosBundleId: 'com.example.orgTemplatev2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDudYktz_oSNToG6osKze2qDj2xO3eJEl0',
    appId: '1:81502817243:ios:3cac543f86e3d46de135fe',
    messagingSenderId: '81502817243',
    projectId: 'inventory-org-c25fe',
    storageBucket: 'inventory-org-c25fe.appspot.com',
    iosBundleId: 'com.example.orgTemplatev2.RunnerTests',
  );
}
