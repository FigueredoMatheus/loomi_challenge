import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/common/widgets/circle_avatar_profile_image.dart';
import 'package:loomi_challenge/src/core/data/temp_file.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/user_info/user_profile_name.dart';

class UserSettingsPageViewUserProfileInfo extends StatelessWidget {
  const UserSettingsPageViewUserProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          CircleAvatarProfileImage(user: user, containerSize: 110),
          const SizedBox(width: 10),
          Expanded(child: UserSettingsPageViewProfileInfoName()),
        ],
      ),
    );
  }
}
