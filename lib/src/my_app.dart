import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/flavors/flavors.dart';
import 'package:loomi_challenge/src/core/routes/pages_routes.dart';
import 'package:loomi_challenge/src/core/themes/my_app_themes.dart';
import 'package:loomi_challenge/src/modules/account/login/view/login_page_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FlavorSettings.title,
      getPages: PagesRoute.pages,
      debugShowCheckedModeBanner: false,
      theme: Get.find<MyAppThemes>().getLightTheme(),
      home: LoginPageView(),
    );
  }
}
