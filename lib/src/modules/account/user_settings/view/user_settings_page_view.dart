import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';

class UserSettingsPageView extends StatelessWidget {
  const UserSettingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + pageViewDefaultPadding,
          bottom: pageViewDefaultPadding,
          left: pageViewDefaultPadding,
          right: pageViewDefaultPadding,
        )),
      ),
    );
  }
}
