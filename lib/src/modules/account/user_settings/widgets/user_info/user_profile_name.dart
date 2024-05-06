import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/core/data/temp_file.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class UserSettingsPageViewProfileInfoName extends StatelessWidget {
  const UserSettingsPageViewProfileInfoName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Hello,',
          style: MyAppKColors.userSettingsProfileNamefollowUp(),
        ),
        const SizedBox(height: 3),
        Text(
          user.name,
          style: MyAppKColors.userSettingsProfileName(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
