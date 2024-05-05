import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/flavors/flavors.dart';
import 'package:loomi_challenge/src/core/routes/pages_routes.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/themes/my_app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FlavorSettings.title,
      getPages: PagesRoutes.pages,
      debugShowCheckedModeBanner: false,
      theme: Get.find<MyAppThemes>().getLightTheme(),
      initialRoute: RoutesNames.HomePageView,
    );
  }
}
