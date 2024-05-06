import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class UserSettingsPageViewSubscriptionSectionCard extends StatelessWidget {
  const UserSettingsPageViewSubscriptionSectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        color: MyAppKColors.kdarkShadeBlue.withOpacity(0.9),
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
        style: MyAppKColors.subscriptionCardTextButton(),
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
            style: MyAppKColors.subscriptionCardTitle(),
          ),
          Text('Jan 22, 2023', style: MyAppKColors.subscriptionCardSubtitle()),
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
