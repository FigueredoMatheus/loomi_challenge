import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/modal/open_modal_bottom_sheet.dart';
import 'package:loomi_challenge/src/common/widgets/edit_profile_image_info_text.dart';
import 'package:loomi_challenge/src/common/widgets/images_widgets/show_image_widget.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/create_account/store/create_account_store.dart';
import 'package:loomi_challenge/src/modules/create_account/widgets/second_page/choose_image_modal_body.dart';

class CreateUserAccountChooseUserProfileImageWidget extends StatefulWidget {
  const CreateUserAccountChooseUserProfileImageWidget({super.key});

  @override
  State<CreateUserAccountChooseUserProfileImageWidget> createState() =>
      _CreateUserAccountChooseUserProfileImageWidgetState();
}

class _CreateUserAccountChooseUserProfileImageWidgetState
    extends State<CreateUserAccountChooseUserProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        profileImageContainer(),
        EditProfileImageInfoText(),
      ],
    );
  }

  Widget profileImageContainer() {
    final store = getIt<CreateAccountStore>();
    return InkWell(
      onTap: () {
        openModalBottomSheet(
          title: 'CHOOSE IMAGE',
          child: ChooseUserProfileImageModalBody(
            setImage: store.setProfileImage,
          ),
        );
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Obx(
        () => Container(
          width: 116,
          height: 116,
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: MyThemes.get().kLightPurpleColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(34),
          ),
          child: store.hasImage
              ? CustomShowImageWidget(
                  imagePath: store.profileImage.value,
                  radius: 34,
                  size: 116,
                )
              : SvgPicture.asset(
                  'assets/icons/camera_icon.svg',
                  semanticsLabel: 'Camera',
                  fit: BoxFit.scaleDown,
                  height: 18,
                  width: 20,
                ),
        ),
      ),
    );
  }
}