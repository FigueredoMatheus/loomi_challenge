import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/controller/settings_controller.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/store/profile_settings_store.dart';

class ChangeUserPasswordPageViewForms extends StatelessWidget {
  const ChangeUserPasswordPageViewForms({super.key});

  @override
  Widget build(BuildContext context) {
    final profileSettingsStore = getIt<ProfileSettingsStore>();
    final profileSettingsController = ProfileSettingsController();
    return Expanded(
      child: Column(
        children: [
          Obx(
            () => CustomTextFormField(
              onChanged: profileSettingsStore.setCurrentPassword,
              label: 'Current password',
              textFormFieldType: TextFormFieldType.password,
              initalValue: profileSettingsStore.currentPassword.value,
            ),
          ),
          const SizedBox(height: 45),
          Divider(
            color: MyThemes.get().kGainsboroGrayColor.withOpacity(0.2),
            height: 0,
          ),
          const SizedBox(height: 45),
          Obx(
            () => CustomTextFormField(
              onChanged: profileSettingsStore.setNewPassword,
              label: 'New password',
              textFormFieldType: TextFormFieldType.password,
              initalValue: profileSettingsStore.newPassword.value,
            ),
          ),
          const SizedBox(height: 15),
          Obx(
            () => CustomTextFormField(
              onChanged: profileSettingsStore.setConfirmNewPassword,
              label: 'Confirm new password',
              textFormFieldType: TextFormFieldType.password,
              initalValue: profileSettingsStore.confirmNewPassword.value,
            ),
          ),
          Spacer(),
          CustomElevatedButton(
            label: 'Update Password',
            onPressed: profileSettingsController.onChangeUserPassword,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
