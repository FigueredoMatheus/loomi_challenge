import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

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
    builder: (context) {
      return Container(
        height: 255,
        decoration: BoxDecoration(
          color: MyAppKColors.kVeryDarkGrayColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: MyAppKColors.kPurpleColor,
                  ),
                ),
                Spacer(),
                Text(
                  title,
                  style: MyAppKColors.title3(),
                ),
                Spacer(),
              ],
            ),
            child,
          ],
        ),
      );
    },
  );
}
