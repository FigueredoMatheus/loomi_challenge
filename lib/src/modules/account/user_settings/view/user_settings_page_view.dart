import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_outlined_button.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/auth_service.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/controller/settings_controller.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/user_settings/button_tile/gruped_custom_button_tile.dart';
import 'package:loomi_challenge/src/common/widgets/custom_page_header/custom_page_header.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/user_settings/section/grouped_section.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/user_settings/user_info/user_profile_info.dart';
import 'package:provider/provider.dart';

class UserSettingsPageView extends StatefulWidget {
  const UserSettingsPageView({super.key});

  @override
  State<UserSettingsPageView> createState() => _UserSettingsPageViewState();
}

class _UserSettingsPageViewState extends State<UserSettingsPageView> {
  @override
  void initState() {
    super.initState();

    getIt<SettingsController>()
        .init(Provider.of<AuthService>(context, listen: false).user.toJson());
  }

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
