import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/flavors/flavors.dart';
import 'package:loomi_challenge/src/core/routes/pages_routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FlavorSettings.title,
      getPages: PagesRoute.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
