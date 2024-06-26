import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

class UserSettingsPageViewProfileInfoName extends StatelessWidget {
  const UserSettingsPageViewProfileInfoName({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<UserProvider>(context, listen: false).user;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Hello,',
          style: MyThemes.get().epilogueStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 3),
        Consumer<UserProvider>(
          builder: (context, value, child) {
            return Text(
              loggedUser.username,
              style: MyThemes.get().epilogueStyle.copyWith(
                    color: MyThemes.get().kWhiteColor,
                    fontSize: 24,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
      ],
    );
  }
}
