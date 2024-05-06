import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

Future<dynamic>? openModalBottomSheet({
  required String title,
  required Widget child,
}) async {
  final context = Get.context!;
  return await showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    backgroundColor: MyThemes.get().kVeryDarkGrayColor,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Wrap(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: MyThemes.get().kPurpleColor,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: MyThemes.get().epilogueStyle.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
                Spacer(),
              ],
            ),
            child
          ],
        ),
      );
    },
  );
}
