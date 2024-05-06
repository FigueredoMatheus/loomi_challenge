import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/custom_header/back_button.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/custom_header/edit_profile_button.dart';

class UserSettingsPageViewCustomHeader extends StatelessWidget {
  const UserSettingsPageViewCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UserSettingsPageViewCustomHeaderBackButton(),
        UserSettingsPageViewCustomHeaderEditProfileButton(),
      ],
    );
  }
}
