import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class UserSettingsDeleteAccountModalBottomBody extends StatelessWidget {
  const UserSettingsDeleteAccountModalBottomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 25),
          child: Text(
            'Are you sure you want to delete your account?',
            textAlign: TextAlign.center,
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontSize: 14,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 45),
          child: Text(
            'This action is irreversible and all of your data will be permanently deleted. If you\'re having any issues with our app, we\'d love to help you resolve them.',
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
              label: 'Delete account',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
