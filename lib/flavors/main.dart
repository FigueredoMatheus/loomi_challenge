import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/my_app_themes.dart';
import '../src/my_app.dart';

Future initServices() async {
  Get.log('Starting services...');

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  Get.put(MyAppThemes());

  Get.log('All services started...');
}

FutureOr<void> main() async {
  await initServices();

  runApp(const MyApp());
}
