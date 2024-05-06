import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/common/widgets/circle_avatar_profile_image.dart';
import 'package:loomi_challenge/src/core/services/auth_service.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/user_settings/user_info/user_profile_name.dart';
import 'package:provider/provider.dart';

class UserSettingsPageViewUserProfileInfo extends StatelessWidget {
  const UserSettingsPageViewUserProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<AuthService>(context, listen: false).user;
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          CircleAvatarProfileImage(user: loggedUser, containerSize: 100),
          const SizedBox(width: 10),
          Expanded(child: UserSettingsPageViewProfileInfoName()),
        ],
      ),
    );
  }
}
