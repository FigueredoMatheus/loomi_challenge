import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

Future<int?>? confirmationAlertDialog({required String title}) async {
  return await Get.defaultDialog(
      title: title,
      middleText: '',
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
          child: const Text('Cancel'),
          onPressed: () => Get.back(result: 0),
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: () => Get.back(result: 1),
        ),
      ]);
}
