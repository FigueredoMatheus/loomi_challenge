import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/common/widgets/form_head.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/create_account/store/create_account_store.dart';

class CreateUserAccountFirstPageFormsWidget extends StatelessWidget {
  const CreateUserAccountFirstPageFormsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final store = getIt<CreateAccountStore>();

    return Column(
      children: [
        SignUpWithWidget(),
        const SizedBox(height: 40),
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
        const SizedBox(height: 15),
        CustomTextFormField(
          label: 'Confirm your Password',
          onChanged: store.setConfirmPassword,
          textFormFieldType: TextFormFieldType.confirmPassword,
          initalValue: store.confirmPassword,
        ),
        const SizedBox(height: 20),
        CustomElevatedButton(
          label: 'Create Account',
          onPressed: () => store.nextPage(),
        ),
      ],
    );
  }
}
