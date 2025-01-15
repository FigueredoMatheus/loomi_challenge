import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_page_header/custom_page_header.dart';
import 'package:loomi_challenge/src/common/widgets/custom_page_view_title.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/store/profile_settings_store.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/edit_profile/forms.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/edit_profile/profile_image/profile_image_section.dart';
import 'package:provider/provider.dart';

class EditProfilePageView extends StatefulWidget {
  const EditProfilePageView({super.key});

  @override
  State<EditProfilePageView> createState() => _EditProfilePageViewState();
}

class _EditProfilePageViewState extends State<EditProfilePageView> {
  @override
  void initState() {
    super.initState();

    getIt<ProfileSettingsStore>().init(
      Provider.of<UserProvider>(context, listen: false).userData,
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = ApplicationConstants.PAGE_VIEW_DEFAULT_PADDING;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + padding,
              bottom: padding,
              left: padding,
              right: padding,
            ),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).padding.top + padding),
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPageViewHeader(
                          headerType: CustomPageViewHeaderType.editProfile),
                      CustomPageViewTitle(
                          customPageViewTitleType:
                              CustomPageViewTitleType.editProfile),
                      EditProfilePageViewImageSection(),
                      EditProfilePageViewForms(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
