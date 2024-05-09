import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/controller/settings_controller.dart';

class ChangeUserPasswordPageViewForms extends StatelessWidget {
  const ChangeUserPasswordPageViewForms({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = getIt<SettingsController>();
    return Expanded(
      child: Column(
        children: [
          Obx(
            () => CustomTextFormField(
              onChanged: controller.setCurrentPassword,
              label: 'Current password',
              textFormFieldType: TextFormFieldType.password,
              initalValue: controller.currentPassword.value,
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
              onChanged: controller.setNewPassword,
              label: 'New password',
              textFormFieldType: TextFormFieldType.password,
              initalValue: controller.newPassword.value,
            ),
          ),
          const SizedBox(height: 15),
          Obx(
            () => CustomTextFormField(
              onChanged: controller.setConfirmNewPassword,
              label: 'Confirm new password',
              textFormFieldType: TextFormFieldType.password,
              initalValue: controller.confirmNewPassword.value,
            ),
          ),
          Spacer(),
          CustomElevatedButton(
            label: 'Update Password',
            onPressed: controller.onChangeUserPassword,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
