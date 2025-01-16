import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/services/firebase/firebase_instances.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/my_app_themes.dart';
import '../src/my_app.dart';

Future initServices() async {
  Get.log('Starting services...');

  setupGetItClasses();

  final firebaseManager = getIt<FirebaseManager>();

  try {
    await firebaseManager.initializeInstances();
  } catch (e) {
    print('Firebase initialization error: $e');
  }

  Get.put(MyAppThemes());

  Get.log('All services started...');
}

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(const MyApp());
}
