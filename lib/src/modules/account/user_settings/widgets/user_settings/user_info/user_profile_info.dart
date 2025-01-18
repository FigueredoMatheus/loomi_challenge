import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/common/widgets/images_widgets/circle_avatar_profile_image.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/user_settings/user_info/user_profile_name.dart';
import 'package:provider/provider.dart';

class UserSettingsPageViewUserProfileInfo extends StatelessWidget {
  const UserSettingsPageViewUserProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<UserProvider>(context, listen: false).user;
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: InkWell(
            onTap: () async {
              final token =
                  await Provider.of<UserProvider>(context, listen: false)
                      .getAuthToken();
              print('--- Auth Token: $token');
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Row(
              children: [
                CircleAvatarProfileImage(
                  username: loggedUser.username,
                  image: loggedUser.image,
                  containerSize: 100,
                ),
                const SizedBox(width: 10),
                Expanded(child: UserSettingsPageViewProfileInfoName()),
              ],
            ),
          ),
        );
      },
    );
  }
}
