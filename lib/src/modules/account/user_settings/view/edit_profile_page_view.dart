import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_page_header/custom_page_header.dart';
import 'package:loomi_challenge/src/common/widgets/custom_page_view_title.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/edit_profile/forms.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/edit_profile/profile_image/profile_image_section.dart';

class EditProfilePageView extends StatelessWidget {
  const EditProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              CustomPageViewHeader(
                  headerType: CustomPageViewHeaderType.editProfile),
              CustomPageViewTitle(
                  customPageViewTitleType: CustomPageViewTitleType.editProfile),
              EditProfilePageViewImageSection(),
              EditProfilePageViewForms(),
            ],
          ),
        ),
      ),
    );
  }
}
