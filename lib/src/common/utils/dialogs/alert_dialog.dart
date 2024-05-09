import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

alertDialog({required String title, String? message}) {
  return Get.defaultDialog(
      title: title,
      middleText: message ?? '',
      backgroundColor: MyThemes.get().kVeryDarkGrayColor,
      titleStyle: MyThemes.get().epilogueStyle.copyWith(fontSize: 16),
      middleTextStyle: MyThemes.get().montserratStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: MyThemes.get().kWhiteColor.withOpacity(0.45)),
      titlePadding: const EdgeInsets.only(top: 15),
      radius: 15,
      actions: [
        TextButton(
          child: const Text('Ok'),
          onPressed: () => Get.back(),
        ),
      ]);
}
