import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/create_account/store/create_account_store.dart';

class CreateUserAccountSecondPageFormsWidget extends StatefulWidget {
  const CreateUserAccountSecondPageFormsWidget({super.key});

  @override
  State<CreateUserAccountSecondPageFormsWidget> createState() =>
      _CreateUserAccountSecondPageFormsWidgetState();
}

class _CreateUserAccountSecondPageFormsWidgetState
    extends State<CreateUserAccountSecondPageFormsWidget> {
  late CreateAccountStore store;
  @override
  void initState() {
    super.initState();

    store = getIt<CreateAccountStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          label: 'Your name',
          onChanged: store.setName,
          textFormFieldType: TextFormFieldType.name,
          initalValue: store.name,
        ),
        const SizedBox(height: 40),
        CustomElevatedButton(
          label: 'Continue',
          onPressed: store.onCreateAccount,
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () => store.previousPage(),
          child: Text('Back'),
        ),
      ],
    );
  }
}
