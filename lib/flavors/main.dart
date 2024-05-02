import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/services/firebase_options.dart';
import 'package:loomi_challenge/src/core/themes/my_app_themes.dart';
import '../src/my_app.dart';
import 'package:firebase_core/firebase_core.dart';

Future initServices() async {
  Get.log('Starting services...');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(MyAppThemes());

  Get.log('All services started...');
}

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(const MyApp());
}
