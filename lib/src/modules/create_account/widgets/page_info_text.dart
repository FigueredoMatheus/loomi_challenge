import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class CreateAccountPageInfoText extends StatelessWidget {
  final String title;
  final String subtitle;

  const CreateAccountPageInfoText({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Get.textTheme.displayMedium),
        const SizedBox(height: 15),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: MyThemes.get().montserratStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MyThemes.get().kWhiteColor.withOpacity(0.45),
              ),
        ),
      ],
    );
  }
}
