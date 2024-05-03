import 'package:flutter/material.dart';

class LoginPageForgotPasswordTextButton extends StatelessWidget {
  const LoginPageForgotPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text('Forgot password?'),
        ),
      ],
    );
  }
}
