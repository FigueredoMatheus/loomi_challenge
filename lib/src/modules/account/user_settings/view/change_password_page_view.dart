import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_page_header/custom_page_header.dart';
import 'package:loomi_challenge/src/common/widgets/custom_page_view_title.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/change_password/forms.dart';

class ChangeUserPasswordPageView extends StatelessWidget {
  const ChangeUserPasswordPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = ApplicationConstants.PAGE_VIEW_DEFAULT_PADDING;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + padding,
              bottom: padding,
              left: padding,
              right: padding,
            ),
            child: Column(
              children: [
                CustomPageViewHeader(
                    headerType: CustomPageViewHeaderType.changePassword),
                CustomPageViewTitle(
                    customPageViewTitleType:
                        CustomPageViewTitleType.changePassword),
                ChangeUserPasswordPageViewForms(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
