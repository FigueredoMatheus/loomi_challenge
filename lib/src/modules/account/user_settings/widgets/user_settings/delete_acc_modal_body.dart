import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

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
            style: MyAppKColors.title2(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 45),
          child: Text(
            'This action is irreversible and all of your data will be permanently deleted. If you\'re having any issues with our app, we\'d love to help you resolve them.',
            textAlign: TextAlign.center,
            style: MyAppKColors.userSettingsProfileNamefollowUp(),
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
