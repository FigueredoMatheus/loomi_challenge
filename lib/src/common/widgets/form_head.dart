import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class SignUpWithWidget extends StatefulWidget {
  const SignUpWithWidget({super.key});

  @override
  State<SignUpWithWidget> createState() => _SignUpWithWidgetState();
}

class _SignUpWithWidgetState extends State<SignUpWithWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        divider(),
        const SizedBox(width: 20),
        Text(
          'Or Sign up With',
          style: MyThemes.get().outfitStyle.copyWith(
                color: MyThemes.get().kDarkGrayColor,
              ),
        ),
        const SizedBox(width: 20),
        divider()
      ],
    );
  }

  Widget divider() {
    return Expanded(
        child: Divider(
      color: MyThemes.get().kOffWhiteColor.withOpacity(0.2),
    ));
  }
}
