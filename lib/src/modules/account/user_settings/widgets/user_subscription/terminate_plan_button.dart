import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/utils/modal/open_modal_bottom_sheet.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_modal_body.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';

class UserSubscriptionPageViewTerminatePlanButton extends StatelessWidget {
  const UserSubscriptionPageViewTerminatePlanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 30),
      child: CustomElevatedButton(
        label: 'Terminate Plan',
        onPressed: () {
          openModalBottomSheet(
            title: 'Warning',
            child: CustomModalBody(type: CustomModalBodyType.terminatePlan),
          );
        },
      ),
    );
  }
}
