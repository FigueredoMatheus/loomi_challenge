import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class UserSettingsPageViewSectionTitle extends StatelessWidget {
  final UserSettingSectionType sectionType;

  const UserSettingsPageViewSectionTitle({
    super.key,
    required this.sectionType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            getSectionTitle(),
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          )
        ],
      ),
    );
  }

  String getSectionTitle() {
    switch (sectionType) {
      case UserSettingSectionType.history:
        return 'History';
      case UserSettingSectionType.subscription:
      default:
        return 'Subscriptions';
    }
  }
}
