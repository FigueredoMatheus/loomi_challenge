import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/common/widgets/my_app_icon.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/create_account/widgets/page_info_text.dart';

import '../controller/forgot_password_controller.dart';

class SucccessOnSendEmailPageView extends StatefulWidget {
  const SucccessOnSendEmailPageView({super.key});

  @override
  State<SucccessOnSendEmailPageView> createState() =>
      _SucccessOnSendEmailPageViewState();
}

class _SucccessOnSendEmailPageViewState
    extends State<SucccessOnSendEmailPageView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 30,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                MyAppIcon(),
                const SizedBox(height: 40),
                CreateAccountPageInfoText(
                  title: 'The instructions were sent!',
                  subtitle:
                      'If this was a valid email, instructions to reset your password will be sent to you. Please check your email.',
                ),
                Spacer(),
                CustomElevatedButton(
                  label: 'Login',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    getIt<ForgotPasswordController>().dispose();
  }
}
