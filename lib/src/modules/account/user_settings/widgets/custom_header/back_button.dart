import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class UserSettingsPageViewCustomHeaderBackButton extends StatelessWidget {
  const UserSettingsPageViewCustomHeaderBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Icon(
        Icons.arrow_back_ios,
        color: MyAppKColors.kPurpleColor,
      ),
    );
  }
}
