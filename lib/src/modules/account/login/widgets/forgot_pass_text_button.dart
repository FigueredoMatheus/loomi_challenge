import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';

class LoginPageForgotPasswordTextButton extends StatelessWidget {
  const LoginPageForgotPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Get.toNamed(RoutesNames.FORGOT_PASSWORD_PAGE_VIEW),
          child: Text('Forgot password?'),
        ),
      ],
    );
  }
}
