import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_outlined_button.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/common/widgets/custom_page_header/back_button.dart';

class CustomPageViewHeader extends StatelessWidget {
  final CustomPageViewHeaderType headerType;
  const CustomPageViewHeader({
    super.key,
    required this.headerType,
  });

  @override
  Widget build(BuildContext context) {
    final bool isUserSettingsPage =
        headerType == CustomPageViewHeaderType.userSettings;
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomPageViewHeaderBackButton(),
          if (isUserSettingsPage)
            CustomOutlinedButton(
              buttonType: CustomOutlinedButtonType.editProfile,
            ),
        ],
      ),
    );
  }
}
