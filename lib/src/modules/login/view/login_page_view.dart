import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_rich_text.dart';
import 'package:loomi_challenge/src/common/widgets/form_head.dart';
import 'package:loomi_challenge/src/common/widgets/my_app_icon.dart';
import 'package:loomi_challenge/src/common/widgets/social_media_login_buttons/social_media_icons_row.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/create_account/widgets/page_info_text.dart';

import 'package:loomi_challenge/src/modules/login/store/login_store.dart';
import 'package:loomi_challenge/src/modules/login/widgets/forms.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final padding = ApplicationConstants.PAGE_VIEW_DEFAULT_PADDING;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + padding,
              bottom: padding,
              left: padding,
              right: padding,
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

  @override
  void dispose() {
    super.dispose();
    getIt<LoginStore>().dispose();
  }
}
