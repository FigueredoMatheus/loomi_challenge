import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/my_app_icon.dart';
import 'package:loomi_challenge/src/common/widgets/social_media_login_buttons/social_media_icons_row.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/create_account/widgets/first_page/forms.dart';
import 'package:loomi_challenge/src/modules/create_account/widgets/page_info_text.dart';
import 'package:loomi_challenge/src/common/widgets/custom_rich_text.dart';

class CreateUserAccountFirstPage extends StatelessWidget {
  final PageController pageViewController;

  const CreateUserAccountFirstPage({
    super.key,
    required this.pageViewController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyAppIcon(showText: true),
          const SizedBox(height: 15),
          CustomRichText(richTextType: CustomRichTextType.signIn),
          const SizedBox(height: 40),
          CreateAccountPageInfoText(
            title: 'Create an account',
            subtitle:
                'To get started, please complete your account registration.',
          ),
          const SizedBox(height: 40),
          SocialMediaIconsRowWidget(),
          const SizedBox(height: 40),
          CreateUserAccountFirstPageFormsWidget(),
        ],
      ),
    );
  }
}
