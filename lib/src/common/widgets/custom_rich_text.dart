import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

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
            style: MyThemes.get().montserratStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: MyThemes.get().kWhiteColor.withOpacity(0.45),
                ),
          ),
          TextSpan(
            text: tappedText(),
            style: Get.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w700,
              color: MyThemes.get().kPurpleColor,
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

  signInOnTap() => Get.toNamed(RoutesNames.LOGIN_PAGE_VIEW);

  signUpOnTap() => Get.toNamed(RoutesNames.CREATE_ACCOUNT_PAGE_VIEW);
}
