import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';

class CreateUserAccountSecondtPageFormsWidget extends StatelessWidget {
  const CreateUserAccountSecondtPageFormsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          label: 'Your name',
          onChanged: (_) {},
          textFormFieldType: TextFormFieldType.name,
        ),
        const SizedBox(height: 40),
        CustomElevatedButton(
          label: 'Continue',
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: Text('Back'),
        ),
      ],
    );
  }
}
