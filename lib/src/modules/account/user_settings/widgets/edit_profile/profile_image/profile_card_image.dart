import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/common/widgets/images_widgets/circle_avatar_profile_image.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
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
    return Container(
      width: containerSize,
      height: containerSize,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: CircleAvatarProfileImage(
              user: user,
              containerSize: imageContainerSize,
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
    );
  }
}
