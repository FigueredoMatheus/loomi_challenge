import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_outlined_button.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/user_settings/widgets/user_settings/button_tile/gruped_custom_button_tile.dart';
import 'package:loomi_challenge/src/common/widgets/custom_page_header/custom_page_header.dart';
import 'package:loomi_challenge/src/modules/user_settings/widgets/user_settings/section/grouped_section.dart';
import 'package:loomi_challenge/src/modules/user_settings/widgets/user_settings/user_info/user_profile_info.dart';

class UserSettingsPageView extends StatefulWidget {
  const UserSettingsPageView({super.key});

  @override
  State<UserSettingsPageView> createState() => _UserSettingsPageViewState();
}

class _UserSettingsPageViewState extends State<UserSettingsPageView> {
  final padding = ApplicationConstants.PAGE_VIEW_DEFAULT_PADDING;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + padding,
            bottom: padding,
            left: padding,
            right: padding,
          ),
          child: Column(
            children: [
              CustomPageViewHeader(
                headerType: CustomPageViewHeaderType.userSettings,
              ),
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
