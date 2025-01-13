import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/flavors/flavors.dart';
import 'package:loomi_challenge/src/common/widgets/custom_loading_widget.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

loadingDialog({String? title}) {
  final context = Get.context!;
  final bool hasTitle = title != null && title.isNotEmpty;

  showDialog(
    context: context,
    barrierDismissible: FlavorSettings.isHomo || FlavorSettings.isDev,
    builder: (context) {
      return PopScope(
        canPop: FlavorSettings.isHomo || FlavorSettings.isDev,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomLoadingWidget(),
              if (hasTitle) SizedBox(height: 10),
              if (hasTitle)
                Text(
                  title,
                  style: MyThemes.get().epilogueStyle.copyWith(
                        fontSize: 14,
                      ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      );
    },
  );
}
