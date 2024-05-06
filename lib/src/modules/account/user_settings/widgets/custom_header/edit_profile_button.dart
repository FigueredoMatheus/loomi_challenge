import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_outlined_button.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';

class UserSettingsPageViewCustomHeaderEditProfileButton
    extends StatelessWidget {
  const UserSettingsPageViewCustomHeaderEditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      buttonType: CustomOutlinedButtonType.editProfile,
    );
  }
}
