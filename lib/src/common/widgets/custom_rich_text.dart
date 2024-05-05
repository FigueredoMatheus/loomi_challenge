import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class CustomRichText extends StatelessWidget {
  final CustomRichTextType richTextType;

  const CustomRichText({super.key, required this.richTextType});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: labelText(),
            style: MyAppKColors.subtitle1(),
          ),
          TextSpan(
            text: tappedText(),
            style: Get.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w700,
              color: MyAppKColors.kPurpleColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = getOnTap,
          ),
        ],
      ),
    );
  }

  String labelText() {
    switch (richTextType) {
      case CustomRichTextType.signIn:
        return 'Already have an account? ';
      case CustomRichTextType.signUp:
      default:
        return 'Don\'t have an account? ';
    }
  }

  String tappedText() {
    switch (richTextType) {
      case CustomRichTextType.signIn:
        return 'Sign In!';
      case CustomRichTextType.signUp:
      default:
        return 'Sign Up!';
    }
  }

  getOnTap() {
    switch (richTextType) {
      case CustomRichTextType.signIn:
        return signInOnTap();
      case CustomRichTextType.signUp:
      default:
        return signUpOnTap();
    }
  }

  signInOnTap() => Get.toNamed(RoutesNames.loginPageView);

  signUpOnTap() => Get.toNamed(RoutesNames.createAccountPageView);
}
