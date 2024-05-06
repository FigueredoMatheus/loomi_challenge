import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class CustomPageViewTitle extends StatelessWidget {
  final CustomPageViewTitleType customPageViewTitleType;

  const CustomPageViewTitle({
    super.key,
    required this.customPageViewTitleType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            getTitle(),
            style: MyThemes.get().epilogueStyle.copyWith(
                  color: MyThemes.get().kWhiteColor,
                  fontSize: 24,
                ),
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
