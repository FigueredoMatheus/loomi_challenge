import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/user_settings/section/section.dart';

class UserSettingsPageViewGroupedSections extends StatelessWidget {
  const UserSettingsPageViewGroupedSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserSettingsPageViewSubscriptionSection(
          sectionType: UserSettingSectionType.subscription,
        ),
        const SizedBox(height: 20),
        UserSettingsPageViewSubscriptionSection(
          sectionType: UserSettingSectionType.history,
        ),
      ],
    );
  }
}
