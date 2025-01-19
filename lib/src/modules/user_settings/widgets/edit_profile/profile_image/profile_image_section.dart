import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/edit_profile_image_info_text.dart';
import 'package:loomi_challenge/src/modules/user_settings/widgets/edit_profile/profile_image/profile_card_image.dart';

class EditProfilePageViewImageSection extends StatelessWidget {
  const EditProfilePageViewImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        EditProfilePageViewCustomProfileCardImage(),
        const SizedBox(width: 15),
        EditProfileImageInfoText(),
      ],
    );
  }
}
