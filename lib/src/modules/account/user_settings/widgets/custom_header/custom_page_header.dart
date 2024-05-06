import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_outlined_button.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/custom_header/back_button.dart';

class UserSettingsPageViewCustomHeader extends StatelessWidget {
  const UserSettingsPageViewCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserSettingsPageViewCustomHeaderBackButton(),
          CustomOutlinedButton(
              buttonType: CustomOutlinedButtonType.editProfile),
        ],
      ),
    );
  }
}
