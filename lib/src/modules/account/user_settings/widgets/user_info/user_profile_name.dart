import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/core/services/auth_service.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';
import 'package:provider/provider.dart';

class UserSettingsPageViewProfileInfoName extends StatelessWidget {
  const UserSettingsPageViewProfileInfoName({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<AuthService>(context, listen: false).user;
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
          loggedUser.name!,
          style: MyAppKColors.userSettingsProfileName(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
