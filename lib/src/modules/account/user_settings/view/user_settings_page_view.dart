import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_outlined_button.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/button_tile/gruped_custom_button_tile.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/custom_header/custom_page_header.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/section/grouped_section.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/user_info/user_profile_info.dart';

class UserSettingsPageView extends StatelessWidget {
  const UserSettingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + pageViewDefaultPadding,
            bottom: pageViewDefaultPadding,
            left: pageViewDefaultPadding,
            right: pageViewDefaultPadding,
          ),
          child: Column(
            children: [
              UserSettingsPageViewCustomHeader(),
              UserSettingsPageViewUserProfileInfo(),
              GrupedCustomButtonTile(),
              UserSettingsPageViewGroupedSections(),
              Spacer(),
              CustomOutlinedButton(buttonType: CustomOutlinedButtonType.logout),
            ],
          ),
        ),
      ),
    );
  }
}
