import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_loading_widget.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

showProgressDownload(RxString progress) {
  return Get.defaultDialog(
    onWillPop: () async => false,
    title: 'Progress',
    middleText: '',
    backgroundColor: MyThemes.get().kVeryDarkGrayColor,
    titleStyle: MyThemes.get().epilogueStyle.copyWith(fontSize: 16),
    radius: 15,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomLoadingWidget(
          disableBackgroundColor: true,
        ),
        const SizedBox(height: 10),
        Obx(
          () => Text(
            progress.value,
            style: Get.textTheme.bodyMedium,
          ),
        ),
      ],
    ),
  );
}
