import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:permission_handler/permission_handler.dart';

requestPermissionDialog({
  required String bodyText,
}) {
  Get.defaultDialog(
    title: 'Permissão necessária',
    middleText: bodyText,
    backgroundColor: MyThemes.get().kVeryDarkGrayColor,
    titleStyle: MyThemes.get().epilogueStyle.copyWith(
          fontSize: 14,
        ),
    middleTextStyle: MyThemes.get().montserratStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: MyThemes.get().kWhiteColor.withOpacity(0.45)),
    titlePadding: const EdgeInsets.only(top: 15),
    radius: 15,
    actions: [
      TextButton(
        child: const Text('Permitir'),
        onPressed: () {
          openAppSettings();
          Get.back();
        },
      ),
      TextButton(
        child: const Text('Cancelar'),
        onPressed: () {
          Get.back();
        },
      ),
    ],
  );
}
