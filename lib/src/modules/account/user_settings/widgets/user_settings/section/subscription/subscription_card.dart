import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class UserSettingsPageViewSubscriptionSectionCard extends StatefulWidget {
  const UserSettingsPageViewSubscriptionSectionCard({super.key});

  @override
  State<UserSettingsPageViewSubscriptionSectionCard> createState() =>
      _UserSettingsPageViewSubscriptionSectionCardState();
}

class _UserSettingsPageViewSubscriptionSectionCardState
    extends State<UserSettingsPageViewSubscriptionSectionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        color: MyThemes.get().kdarkShadeBlue.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [leadingWidget(), titleWidget(), Spacer(), textButton()],
      ),
    );
  }

  Widget textButton() {
    return InkWell(
      onTap: () {
        print('COMING SOON TAPPED');
      },
      child: Text(
        'Coming soon',
        style: MyThemes.get().epilogueStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: MyThemes.get().kPurpleColor,
            ),
      ),
    );
  }

  Widget titleWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'STREAM Premium',
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            'Jan 22, 2023',
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  Widget leadingWidget() {
    return Container(
      height: 68,
      width: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Image.asset(
        'assets/images/subscription_image.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
