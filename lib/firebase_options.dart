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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXY2FwE1o-W8ov-zBj1Z7LTDc2nN4cNPo',
    appId: '1:524161702646:android:882c2d8b8c131b24a0ead7',
    messagingSenderId: '524161702646',
    projectId: 'food-panda-8a6bd',
    storageBucket: 'food-panda-8a6bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPrDHsa-SFNK_BJfmJDXibmAyRBo-z1BI',
    appId: '1:524161702646:ios:718f0542410f32e7a0ead7',
    messagingSenderId: '524161702646',
    projectId: 'food-panda-8a6bd',
    storageBucket: 'food-panda-8a6bd.appspot.com',
    androidClientId: '524161702646-tb9nukv1fk2e8e812msbf7mre5cdgb07.apps.googleusercontent.com',
    iosClientId: '524161702646-qn3irmlplib488cvqc27cvff6npgoknd.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodpanda',
  );
}
