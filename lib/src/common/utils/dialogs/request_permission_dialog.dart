import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';
import 'package:permission_handler/permission_handler.dart';

requestPermissionDialog({
  required String bodyText,
}) {
  Get.defaultDialog(
    title: 'Permissão necessária',
    middleText: bodyText,
    backgroundColor: MyAppKColors.kVeryDarkGrayColor,
    titleStyle: MyAppKColors.title2(),
    middleTextStyle: MyAppKColors.subtitle1(),
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
