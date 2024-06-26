import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/flavors/flavors.dart';
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
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: MyThemes.get().kVeryDarkGrayColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CircularProgressIndicator(
                    color: MyThemes.get().kPurpleColor,
                  ),
                ),
              ),
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
