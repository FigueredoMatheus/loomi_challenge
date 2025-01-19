import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_back_button.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class UserSubscriptionPageViewAppBar extends StatelessWidget {
  const UserSubscriptionPageViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBackButton(),
        Spacer(),
        Text(
          'Subscription',
          style: MyThemes.get().epilogueStyle.copyWith(fontSize: 18),
        ),
        Spacer(),
      ],
    );
  }
}
