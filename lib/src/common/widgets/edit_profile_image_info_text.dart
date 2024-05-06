import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

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
            style: MyAppKColors.title3(),
          ),
          Text(
            'A square .jpg, .gif, or .png image 200x200 or larger',
            style: MyAppKColors.subtitle3(),
          ),
        ],
      ),
    );
  }
}
