import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loomi_challenge/src/core/services/firebase/firebase_options/firebase_options_auth.dart';
import 'package:loomi_challenge/src/core/services/firebase/firebase_options/firebase_options_firestore.dart';

class FirebaseManager {
  final _firebaseFirestoreOptions = FirebaseFirestoreOptions();
  final _firebaseAuthOptions = FirebaseAuthOptions();

  late FirebaseAuth _authInstance;
  late FirebaseFirestore _firestoreInstance;

  FirebaseAuth get authInstance => _authInstance;
  FirebaseFirestore get firestoreInstance => _firestoreInstance;

  Future initializeInstances() async {
    final firebaseFirestoreApp = await Firebase.initializeApp(
      name: _firebaseFirestoreOptions.APP_NAME,
      options: _firebaseFirestoreOptions.currentPlatformOptions,
    );

    final firebaseAuthApp = await Firebase.initializeApp(
      name: _firebaseAuthOptions.APP_NAME,
      options: _firebaseAuthOptions.currentPlatformOptions,
    );

    _authInstance = FirebaseAuth.instanceFor(app: firebaseAuthApp);

    _firestoreInstance =
        FirebaseFirestore.instanceFor(app: firebaseFirestoreApp);
  }
}
