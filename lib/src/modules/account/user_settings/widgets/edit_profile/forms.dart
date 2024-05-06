import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';

class EditProfilePageViewForms extends StatelessWidget {
  const EditProfilePageViewForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 35),
          CustomTextFormField(
            onChanged: (_) {},
            label: 'Eva Mendes',
            textFormFieldType: TextFormFieldType.name,
          ),
          Spacer(),
          CustomElevatedButton(label: 'Update profile', onPressed: () {}),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
