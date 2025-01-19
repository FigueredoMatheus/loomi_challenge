import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class UserSubscriptionPageViewRenewalTile extends StatelessWidget {
  const UserSubscriptionPageViewRenewalTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: MyThemes.get().kWhiteColor.withOpacity(0.13),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Plan renewal',
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            'Dec 12, 2023',
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
