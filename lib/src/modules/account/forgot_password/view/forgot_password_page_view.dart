import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/my_app_icon.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/create_account/widgets/page_info_text.dart';
import 'package:loomi_challenge/src/modules/account/forgot_password/widgets/forms.dart';

import '../controller/forgot_password_controller.dart';

class ForgotPasswordPageView extends StatefulWidget {
  const ForgotPasswordPageView({super.key});

  @override
  State<ForgotPasswordPageView> createState() => _ForgotPasswordPageViewState();
}

class _ForgotPasswordPageViewState extends State<ForgotPasswordPageView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + pageViewDefaultPadding,
              bottom: pageViewDefaultPadding,
              left: pageViewDefaultPadding,
              right: pageViewDefaultPadding,
            ),
            child: Column(
              children: [
                MyAppIcon(),
                const SizedBox(height: 40),
                CreateAccountPageInfoText(
                  title: 'Forgot Password?',
                  subtitle:
                      'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                ),
                const SizedBox(height: 40),
                ForgotPasswordPageForms(),
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
