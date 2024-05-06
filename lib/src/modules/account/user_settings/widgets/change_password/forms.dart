import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class ChangeUserPasswordPageViewForms extends StatelessWidget {
  const ChangeUserPasswordPageViewForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomTextFormField(
            onChanged: (_) {},
            label: 'Current password',
            textFormFieldType: TextFormFieldType.password,
          ),
          const SizedBox(height: 45),
          Divider(
            color: MyAppKColors.kGainsboroGrayColor.withOpacity(0.2),
            height: 0,
          ),
          const SizedBox(height: 45),
          CustomTextFormField(
            onChanged: (_) {},
            label: 'New password',
            textFormFieldType: TextFormFieldType.password,
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            onChanged: (_) {},
            label: 'Confirm new password',
            textFormFieldType: TextFormFieldType.password,
          ),
          Spacer(),
          CustomElevatedButton(label: 'Update Password', onPressed: () {})
        ],
      ),
    );
  }
}
