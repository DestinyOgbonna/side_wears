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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAHWHZMeYcKIDIt_9z4zOKjIvU7nrnS-vY',
    appId: '1:104631576829:web:04d2b86e206118300db694',
    messagingSenderId: '104631576829',
    projectId: 'sidewears-760e4',
    authDomain: 'sidewears-760e4.firebaseapp.com',
    storageBucket: 'sidewears-760e4.appspot.com',
    measurementId: 'G-TXCH77KBK8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDq00zn9gFWSycASpYqp7SMp6pR8omu1R0',
    appId: '1:104631576829:android:302e5ce1d7894b3e0db694',
    messagingSenderId: '104631576829',
    projectId: 'sidewears-760e4',
    storageBucket: 'sidewears-760e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRs4BKIIPMxDTn8q72VdZTCOgp6IdOfp0',
    appId: '1:104631576829:ios:07159f7a696f95d20db694',
    messagingSenderId: '104631576829',
    projectId: 'sidewears-760e4',
    storageBucket: 'sidewears-760e4.appspot.com',
    iosClientId: '104631576829-capvattmuj8qn8vh3ec9u4fej2q660co.apps.googleusercontent.com',
    iosBundleId: 'com.example.buildingUi',
  );
}
