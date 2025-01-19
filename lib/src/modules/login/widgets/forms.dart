import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/login/store/login_store.dart';
import 'package:loomi_challenge/src/modules/login/widgets/forgot_pass_text_button.dart';

class LoginPageForms extends StatelessWidget {
  const LoginPageForms({super.key});

  @override
  Widget build(BuildContext context) {
    final store = getIt<LoginStore>();
    return Column(
      children: [
        CustomTextFormField(
          label: 'Email',
          onChanged: store.setEmail,
          textFormFieldType: TextFormFieldType.email,
          initalValue: store.email,
        ),
        const SizedBox(height: 15),
        CustomTextFormField(
          label: 'Password',
          onChanged: store.setPassword,
          textFormFieldType: TextFormFieldType.password,
          initalValue: store.password,
        ),
        LoginPageForgotPasswordTextButton(),
        const SizedBox(height: 40),
        CustomElevatedButton(
          label: 'Login',
          onPressed: store.onLogin,
        ),
      ],
    );
  }
}
