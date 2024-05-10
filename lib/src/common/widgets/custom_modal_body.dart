import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class CustomModalBody extends StatelessWidget {
  final CustomModalBodyType type;

  const CustomModalBody({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 25),
          child: Text(
            getTitle(),
            textAlign: TextAlign.center,
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontSize: 14,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 45),
          child: Text(
            getBodyText(),
            textAlign: TextAlign.center,
            style: MyThemes.get().epilogueStyle.copyWith(
                  color: MyThemes.get().kWhiteColor.withOpacity(0.45),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancel'),
            ),
            CustomElevatedButton(
              label: getButtonLabel(),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  String getButtonLabel() {
    switch (type) {
      case CustomModalBodyType.deleteAccount:
        return 'Delete account';
      case CustomModalBodyType.terminatePlan:
      default:
        return 'Terminate Plan';
    }
  }

  String getBodyText() {
    switch (type) {
      case CustomModalBodyType.deleteAccount:
        return 'This action is irreversible and all of your data will be permanently deleted. If you\'re having any issues with our app, we\'d love to help you resolve them.';
      case CustomModalBodyType.terminatePlan:
      default:
        return 'Please note that cancelling your plan will immediately revoke your access to all features. If you\'re experiencing any issues with our app, we\'d love to help you resolve them.';
    }
  }

  String getTitle() {
    switch (type) {
      case CustomModalBodyType.deleteAccount:
        return 'Are you sure you want to delete your account?';
      case CustomModalBodyType.terminatePlan:
      default:
        return 'Are you sure you want to cancel your subscription? ';
    }
  }
}
