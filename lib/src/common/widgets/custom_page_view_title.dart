import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class CustomPageViewTitle extends StatelessWidget {
  final CustomPageViewTitleType customPageViewTitleType;

  const CustomPageViewTitle({
    super.key,
    required this.customPageViewTitleType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            getTitle(),
            style: MyAppKColors.userSettingsProfileName(),
          ),
        ],
      ),
    );
  }

  String getTitle() {
    switch (customPageViewTitleType) {
      case CustomPageViewTitleType.changePassword:
        return 'Change\nPassword';
      case CustomPageViewTitleType.editProfile:
      default:
        return 'Edit\nProfile';
    }
  }
}
