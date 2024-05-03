import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/create_account/controller/create_account_controller.dart';

class CreateUserAccountSecondPageFormsWidget extends StatelessWidget {
  const CreateUserAccountSecondPageFormsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = getIt<CreateUserAccountController>();

    return Column(
      children: [
        CustomTextFormField(
          label: 'Your name',
          onChanged: controller.setName,
          textFormFieldType: TextFormFieldType.name,
          initalValue: controller.name,
        ),
        const SizedBox(height: 40),
        CustomElevatedButton(
          label: 'Continue',
          onPressed: () {
            final isValid = controller.validatorFields();

            if (isValid) {
              print('PASSOU');
            } else {
              print('NÂO PASSOU');
            }
          },
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () => controller.previousPage(),
          child: Text('Back'),
        ),
      ],
    );
  }
}
