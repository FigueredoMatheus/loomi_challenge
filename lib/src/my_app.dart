import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/flavors/flavors.dart';
import 'package:loomi_challenge/src/core/routes/pages_routes.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/core/themes/my_app_themes.dart';
import 'package:loomi_challenge/src/modules/home/bloc/bloc/home_page_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageBloc(),
      child: ChangeNotifierProvider(
        create: (context) => UserProvider(),
        child: GetMaterialApp(
          title: FlavorSettings.title,
          getPages: PagesRoutes.pages,
          debugShowCheckedModeBanner: false,
          theme: Get.find<MyAppThemes>().getLightTheme(),
          initialRoute: RoutesNames.createAccountPageView,
        ),
      ),
    );
  }
}
