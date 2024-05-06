import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class CustomPageViewHeaderBackButton extends StatelessWidget {
  const CustomPageViewHeaderBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
      child: Icon(
        Icons.arrow_back_ios,
        color: MyThemes.get().kPurpleColor,
      ),
    );
  }
}
