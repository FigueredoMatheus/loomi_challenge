import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/my_app_icon.dart';
import 'package:loomi_challenge/src/modules/account/create_account/widgets/page_info_text.dart';
import 'package:loomi_challenge/src/modules/account/create_account/widgets/second_page/choose_user_profile_image_widget.dart';
import 'package:loomi_challenge/src/modules/account/create_account/widgets/second_page/forms.dart';

class CreateUserAccountSecondPage extends StatelessWidget {
  final PageController pageViewController;

  const CreateUserAccountSecondPage({
    super.key,
    required this.pageViewController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyAppIcon(),
          const SizedBox(height: 40),
          CreateAccountPageInfoText(
            title: 'Tell us more!',
            subtitle: 'Complete your profile',
          ),
          const SizedBox(height: 40),
          CreateUserAccountChooseUserProfileImageWidget(),
          const SizedBox(height: 40),
          CreateUserAccountSecondPageFormsWidget(),
        ],
      ),
    );
  }
}
