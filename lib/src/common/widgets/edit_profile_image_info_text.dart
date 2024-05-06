import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class EditProfileImageInfoText extends StatelessWidget {
  const EditProfileImageInfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 91,
      child: Column(
        children: [
          Text(
            'Choose Image',
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontSize: 12,
                ),
          ),
          Text(
            'A square .jpg, .gif, or .png image 200x200 or larger',
            style: MyThemes.get().outfitStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}
