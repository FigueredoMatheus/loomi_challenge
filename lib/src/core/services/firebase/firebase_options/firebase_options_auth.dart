// File generated by FlutterFire CLI.
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:loomi_challenge/flavors/flavors.dart';

class FirebaseAuthOptions {
  String APP_NAME = 'auth_app';

  FirebaseOptions get currentPlatformOptions {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    print('Current App Environment: ${FlavorSettings.appFlavor}');
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android_auth;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for IOS - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android_auth = FirebaseOptions(
    apiKey: 'AIzaSyAHfsGU0-XC1rWd2PiBe245eOeethkP2tQ',
    appId: '1:787952710825:android:d65eb905a7dcfac58b25b8',
    messagingSenderId: '787952710825',
    projectId: 'untold-app-prod',
    storageBucket: 'untold-app-prod.appspot.com',
  );
}