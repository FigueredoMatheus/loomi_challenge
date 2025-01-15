import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/controller/settings_controller.dart';

class EditProfilePageViewForms extends StatelessWidget {
  const EditProfilePageViewForms({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = getIt<SettingsController>();
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 35),
          CustomTextFormField(
            onChanged: controller.setName,
            label: 'Name',
            initalValue: controller.name,
            textFormFieldType: TextFormFieldType.name,
          ),
          Spacer(),
          CustomElevatedButton(
            label: 'Update profile',
            onPressed: controller.updateUserData,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
