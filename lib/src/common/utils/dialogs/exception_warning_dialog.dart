import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';

exceptionWarning(DioExceptionModel exception) {
  Get.defaultDialog(
    title: exception.title,
    middleText: exception.message,
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
    ],
  );
}
