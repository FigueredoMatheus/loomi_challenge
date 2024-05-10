import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class SubtitleAudioCloseModalButton extends StatelessWidget {
  const SubtitleAudioCloseModalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            'Close',
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: MyThemes.get().kPurpleColor,
                ),
          ),
        )
      ],
    );
  }
}
