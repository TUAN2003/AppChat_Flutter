import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCrGlpyMqABZlvXhaaWQll23XmkKhkf5QI',
    appId: '1:319202423442:web:2e536217eb04ce30eaac4b',
    messagingSenderId: '319202423442',
    projectId: 'app-chat-b411d',
    authDomain: 'app-chat-b411d.firebaseapp.com',
    storageBucket: 'app-chat-b411d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFChRN41dOMlGuzhSGeUeqn2nfj8f_LpM',
    appId: '1:319202423442:android:8ce462367e9349d5eaac4b',
    messagingSenderId: '319202423442',
    projectId: 'app-chat-b411d',
    storageBucket: 'app-chat-b411d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3B2QIUuSAOHN6_icsgW3BdI2onmoFX-o',
    appId: '1:319202423442:ios:cde75f1450661035eaac4b',
    messagingSenderId: '319202423442',
    projectId: 'app-chat-b411d',
    storageBucket: 'app-chat-b411d.appspot.com',
    iosBundleId: 'com.example.appchat',
  );
}
