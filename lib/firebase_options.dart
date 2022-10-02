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
    apiKey: 'AIzaSyD7J_EHEh_pOSeACindv7--JqFYYVLUgtU',
    appId: '1:830711303647:web:c0231876e5a4747a22c86a',
    messagingSenderId: '830711303647',
    projectId: 'notely-693b9',
    authDomain: 'notely-693b9.firebaseapp.com',
    storageBucket: 'notely-693b9.appspot.com',
    measurementId: 'G-1HNR3Q85EE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzqLUh_LIhf3pqr53BIMLFsd4yK4wJ1Ok',
    appId: '1:830711303647:android:c90369b6d7b1595122c86a',
    messagingSenderId: '830711303647',
    projectId: 'notely-693b9',
    storageBucket: 'notely-693b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAl78n-CN36GYTMl9IomWM53PQNvMfCEbM',
    appId: '1:830711303647:ios:de346fba90120b2122c86a',
    messagingSenderId: '830711303647',
    projectId: 'notely-693b9',
    storageBucket: 'notely-693b9.appspot.com',
    iosClientId: '830711303647-m72vsa0gv8ig15igho19k988c7638qjh.apps.googleusercontent.com',
    iosBundleId: 'com.example.notely',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAl78n-CN36GYTMl9IomWM53PQNvMfCEbM',
    appId: '1:830711303647:ios:de346fba90120b2122c86a',
    messagingSenderId: '830711303647',
    projectId: 'notely-693b9',
    storageBucket: 'notely-693b9.appspot.com',
    iosClientId: '830711303647-m72vsa0gv8ig15igho19k988c7638qjh.apps.googleusercontent.com',
    iosBundleId: 'com.example.notely',
  );
}