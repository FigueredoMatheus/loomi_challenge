import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/my_app_icon.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/modules/user_settings/widgets/user_subscription/app_bar.dart';
import 'package:loomi_challenge/src/modules/user_settings/widgets/user_subscription/plan_renewal_tile.dart';
import 'package:loomi_challenge/src/modules/user_settings/widgets/user_subscription/subscription_benefits.dart';
import 'package:loomi_challenge/src/modules/user_settings/widgets/user_subscription/terminate_plan_button.dart';

class UserSubscriptionPageView extends StatelessWidget {
  const UserSubscriptionPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = ApplicationConstants.PAGE_VIEW_DEFAULT_PADDING;
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
              UserSubscriptionPageViewAppBar(),
              const SizedBox(height: 20),
              MyAppIcon(showText: true),
              const SizedBox(height: 40),
              UserSubscriptionPageviewSubscriptionBenefits(),
              Spacer(),
              UserSubscriptionPageViewRenewalTile(),
              UserSubscriptionPageViewTerminatePlanButton(),
            ],
          ),
        ),
      ),
    );
  }
}
