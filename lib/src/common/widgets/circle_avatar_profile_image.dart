import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/show_image_widget.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';
import 'package:loomi_challenge/src/models/user_model/user_model.dart';

class CircleAvatarProfileImage extends StatelessWidget {
  final UserModel user;
  final double containerSize;
  final bool isFromHomePageViewHeader;

  const CircleAvatarProfileImage({
    super.key,
    required this.user,
    this.containerSize = homePageViewCustomAppBarHeight,
    this.isFromHomePageViewHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isFromHomePageViewHeader
          ? () => Get.toNamed(RoutesNames.userSettingsPageView)
          : null,
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
      child: Container(
        height: containerSize,
        width: containerSize,
        decoration: BoxDecoration(
          color: getContainerBgColor(),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: user.hasImage
            ? CustomShowImageWidget(
                imagePath: user.image!,
                bottomLeftRadius: containerSize,
                bottomRightRadius: containerSize,
                topLeftRadius: containerSize,
                topRightRadius: containerSize,
              )
            : Text(
                user.name![0].toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: containerSize * 0.40,
                ),
              ),
      ),
    );
  }

  Color getContainerBgColor() {
    switch (user.name![0].toUpperCase()) {
      case 'J':
        return MyAppKColors.kUserProfileImgeBgColorJ;
      case 'L':
        return MyAppKColors.kUserProfileImgeBgColorL;
      case 'S':
        return MyAppKColors.kUserProfileImgeBgColorS;
      default:
        return MyAppKColors.kUserProfileImgeBgColorS;
    }
  }
}
