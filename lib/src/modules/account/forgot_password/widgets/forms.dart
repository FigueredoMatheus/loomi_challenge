import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordPageForms extends StatelessWidget {
  const ForgotPasswordPageForms({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = getIt<ForgotPasswordController>();

    return Expanded(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Email',
            onChanged: controller.setEmail,
            textFormFieldType: TextFormFieldType.email,
            initalValue: controller.email,
          ),
          Spacer(),
          CustomElevatedButton(
            label: 'Send reset instructions',
            onPressed: controller.sendEmailButtonOnTap,
            containerWidth: 240,
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}
