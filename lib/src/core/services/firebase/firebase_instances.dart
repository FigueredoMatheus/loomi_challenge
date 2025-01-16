import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loomi_challenge/src/core/services/firebase/firebase_options/firebase_options_auth.dart';
import 'package:loomi_challenge/src/core/services/firebase/firebase_options/firebase_options_firestore.dart';

class FirebaseManager {
  final firebaseFirestoreOptions = FirebaseFirestoreOptions();
  final firebaseAuthOptions = FirebaseAuthOptions();

  late FirebaseAuth authIntance;
  late FirebaseFirestore firestoreInstance;

  String get firestoreAppName => firebaseFirestoreOptions.APP_NAME;
  String get authAppName => firebaseAuthOptions.APP_NAME;

  FirebaseOptions get firestoreOptions =>
      firebaseFirestoreOptions.currentPlatformOptions;
  FirebaseOptions get authOptions => firebaseAuthOptions.currentPlatformOptions;

  setInstances(FirebaseApp firebaseAuthApp, FirebaseApp firebaseFirestoreApp) {
    authIntance = FirebaseAuth.instanceFor(app: firebaseAuthApp);
    firestoreInstance =
        FirebaseFirestore.instanceFor(app: firebaseFirestoreApp);
  }
}
