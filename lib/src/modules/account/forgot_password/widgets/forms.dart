import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/forgot_password/store/forgot_password_store.dart';

class ForgotPasswordPageForms extends StatelessWidget {
  const ForgotPasswordPageForms({super.key});

  @override
  Widget build(BuildContext context) {
    final store = getIt<ForgotPasswordStore>();

    return Expanded(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Email',
            onChanged: store.setEmail,
            textFormFieldType: TextFormFieldType.email,
            initalValue: store.email,
          ),
          Spacer(),
          CustomElevatedButton(
            label: 'Send reset instructions',
            onPressed: store.onSendEmail,
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
