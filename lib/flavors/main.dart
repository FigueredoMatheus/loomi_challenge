import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/services/firebase/firebase_instances.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/my_app_themes.dart';
import '../src/my_app.dart';
import 'package:firebase_core/firebase_core.dart';

Future initServices() async {
  Get.log('Starting services...');

  setupGetItClasses();

  final firebaseManager = getIt<FirebaseManager>();

  final firebaseFirestoreApp = await Firebase.initializeApp(
    name: firebaseManager.firestoreAppName,
    options: firebaseManager.firestoreOptions,
  );

  final firebaseAuthApp = await Firebase.initializeApp(
    name: firebaseManager.authAppName,
    options: firebaseManager.authOptions,
  );

  firebaseManager.setInstances(firebaseAuthApp, firebaseFirestoreApp);

  Get.put(MyAppThemes());

  Get.log('All services started...');
}

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(const MyApp());
}
