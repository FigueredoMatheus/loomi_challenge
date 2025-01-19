import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/modal/open_modal_bottom_sheet.dart';
import 'package:loomi_challenge/src/common/widgets/images_widgets/circle_avatar_profile_image.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/create_account/widgets/second_page/choose_image_modal_body.dart';
import 'package:loomi_challenge/src/modules/user_settings/store/profile_settings_store.dart';
import 'package:provider/provider.dart';

class EditProfilePageViewCustomProfileCardImage extends StatelessWidget {
  const EditProfilePageViewCustomProfileCardImage({super.key});

  @override
  Widget build(BuildContext context) {
    final containerSize = 120.0;
    final imageContainerSize = containerSize * 0.95;
    final cameraIconContainerSize = containerSize * 0.40;
    final cameraIconSize = containerSize * 0.80;

    final user = Provider.of<UserProvider>(context).user;

    final store = getIt<ProfileSettingsStore>();

    return InkWell(
      onTap: () {
        openModalBottomSheet(
          title: 'CHOOSE IMAGE',
          child: ChooseUserProfileImageModalBody(
            setImage: store.setImage,
          ),
        );
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        width: containerSize,
        height: containerSize,
        child: Stack(
          children: [
            Obx(
              () => Positioned(
                top: 0,
                left: 0,
                child: CircleAvatarProfileImage(
                  image: store.image.value,
                  username: user.username,
                  containerSize: imageContainerSize,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: cameraIconContainerSize,
                height: cameraIconContainerSize,
                decoration: BoxDecoration(
                  color: MyThemes.get().kdarkShadeOliveGreen,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icons/camera_icon.svg',
                  semanticsLabel: 'Google',
                  fit: BoxFit.scaleDown,
                  height: cameraIconSize,
                  width: cameraIconSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}