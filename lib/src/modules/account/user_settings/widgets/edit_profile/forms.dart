import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/store/profile_settings_store.dart';

class EditProfilePageViewForms extends StatelessWidget {
  const EditProfilePageViewForms({super.key});

  @override
  Widget build(BuildContext context) {
    final profileSettingsStore = getIt<ProfileSettingsStore>();

    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 35),
          CustomTextFormField(
            onChanged: profileSettingsStore.setName,
            label: 'Name',
            initalValue: profileSettingsStore.name,
            textFormFieldType: TextFormFieldType.name,
          ),
          Spacer(),
          CustomElevatedButton(
            label: 'Update profile',
            onPressed: profileSettingsStore.onUpdateUserData,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
