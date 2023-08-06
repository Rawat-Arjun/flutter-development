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
    apiKey: 'AIzaSyC9LE-I03F7cPx4NAlHiPQPPrvrESEyJD0',
    appId: '1:673748284943:web:04823501c6da6b4447157a',
    messagingSenderId: '673748284943',
    projectId: 'my-notes-c1966',
    authDomain: 'my-notes-c1966.firebaseapp.com',
    storageBucket: 'my-notes-c1966.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpXM9gay9VmqnjNMMsUgrQ8MALJ8OxKvI',
    appId: '1:673748284943:android:6262a31b7e45062b47157a',
    messagingSenderId: '673748284943',
    projectId: 'my-notes-c1966',
    storageBucket: 'my-notes-c1966.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvkQU01mz6GMuxB4o1SGk4CEtvKoxIkQU',
    appId: '1:673748284943:ios:dbf2a33e2c4c84ac47157a',
    messagingSenderId: '673748284943',
    projectId: 'my-notes-c1966',
    storageBucket: 'my-notes-c1966.appspot.com',
    iosClientId: '673748284943-8edfmkvssf6b5ah5lap58062ma861buo.apps.googleusercontent.com',
    iosBundleId: 'com.example.mynotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvkQU01mz6GMuxB4o1SGk4CEtvKoxIkQU',
    appId: '1:673748284943:ios:8225c28f0bdc283747157a',
    messagingSenderId: '673748284943',
    projectId: 'my-notes-c1966',
    storageBucket: 'my-notes-c1966.appspot.com',
    iosClientId: '673748284943-8822401otjks54p8j7crvfso9u1v0pf5.apps.googleusercontent.com',
    iosBundleId: 'com.example.mynotes.RunnerTests',
  );
}