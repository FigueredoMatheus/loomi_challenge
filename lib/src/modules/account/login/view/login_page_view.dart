import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_rich_text.dart';
import 'package:loomi_challenge/src/common/widgets/sign_up_with_widget.dart';
import 'package:loomi_challenge/src/common/widgets/my_app_icon.dart';
import 'package:loomi_challenge/src/common/widgets/social_media_login_buttons/social_media_icons_row.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/account/create_account/widgets/page_info_text.dart';
import 'package:loomi_challenge/src/modules/account/login/widgets/forms.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 30,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                MyAppIcon(),
                const SizedBox(height: 15),
                CreateAccountPageInfoText(
                  title: 'Welcome Back',
                  subtitle: 'Look who is here!',
                ),
                const SizedBox(height: 50),
                LoginPageForms(),
                const SizedBox(height: 30),
                SignUpWithWidget(),
                const SizedBox(height: 30),
                SocialMediaIconsRowWidget(),
                const SizedBox(height: 30),
                CustomRichText(richTextType: CustomRichTextType.signUp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
