import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class CreateAccountSignInWidget extends StatelessWidget {
  const CreateAccountSignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: MyAppKColors.subtitle1(),
          ),
          TextSpan(
              text: 'Sign In!',
              style: Get.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w700,
                color: MyAppKColors.kPurpleColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('TAPPED');
                }),
        ],
      ),
    );
  }
}
