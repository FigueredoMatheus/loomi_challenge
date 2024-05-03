import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/account/create_account/widgets/first_page/form_head.dart';

class CreateUserAccountFirstPageFormsWidget extends StatelessWidget {
  const CreateUserAccountFirstPageFormsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreateUserAccountFirstPageFormHeadWidget(),
        const SizedBox(height: 40),
        CustomTextFormField(
          label: 'Email',
          onChanged: (_) {},
          textFormFieldType: TextFormFieldType.email,
        ),
        const SizedBox(height: 15),
        CustomTextFormField(
          label: 'Password',
          onChanged: (_) {},
          textFormFieldType: TextFormFieldType.password,
        ),
        const SizedBox(height: 15),
        CustomTextFormField(
          label: 'Confirm your Password',
          onChanged: (_) {},
          textFormFieldType: TextFormFieldType.password,
        ),
        const SizedBox(height: 20),
        CustomElevatedButton(
          label: 'Create Account',
          onPressed: () {},
        ),
      ],
    );
  }
}
