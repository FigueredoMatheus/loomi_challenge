import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/user_settings/widgets/user_settings/section/history/history_list.dart';
import 'package:loomi_challenge/src/modules/user_settings/widgets/user_settings/section/subscription/subscription_card.dart';
import 'package:loomi_challenge/src/modules/user_settings/widgets/user_settings/section/section_title.dart';

class UserSettingsPageViewSubscriptionSection extends StatelessWidget {
  final UserSettingSectionType sectionType;
  const UserSettingsPageViewSubscriptionSection({
    super.key,
    required this.sectionType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserSettingsPageViewSectionTitle(sectionType: sectionType),
        getSectionChild(),
      ],
    );
  }

  Widget getSectionChild() {
    switch (sectionType) {
      case UserSettingSectionType.history:
        return UserSettingsPageViewHistorySectionList();
      case UserSettingSectionType.subscription:
      default:
        return UserSettingsPageViewSubscriptionSectionCard();
    }
  }
}
