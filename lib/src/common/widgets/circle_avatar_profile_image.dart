import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/show_image_widget.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/user_entity/user_entity.dart';

class CircleAvatarProfileImage extends StatefulWidget {
  final UserEntity user;
  final double containerSize;
  final bool isFromHomePageViewHeader;

  const CircleAvatarProfileImage({
    super.key,
    required this.user,
    this.containerSize = homePageViewCustomAppBarHeight,
    this.isFromHomePageViewHeader = false,
  });

  @override
  State<CircleAvatarProfileImage> createState() =>
      _CircleAvatarProfileImageState();
}

class _CircleAvatarProfileImageState extends State<CircleAvatarProfileImage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isFromHomePageViewHeader
          ? () => Get.toNamed(RoutesNames.userSettingsPageView)
          : null,
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
      child: Container(
        height: widget.containerSize,
        width: widget.containerSize,
        decoration: BoxDecoration(
          color: getContainerBgColor(),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: widget.user.hasImage
            ? CustomShowImageWidget(
                imagePath: widget.user.image!,
                bottomLeftRadius: widget.containerSize,
                bottomRightRadius: widget.containerSize,
                topLeftRadius: widget.containerSize,
                topRightRadius: widget.containerSize,
              )
            : Text(
                widget.user.username[0].toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: widget.containerSize * 0.40,
                ),
              ),
      ),
    );
  }

  Color getContainerBgColor() {
    switch (widget.user.username[0].toUpperCase()) {
      case 'J':
        return MyThemes.get().kUserProfileImgeBgColorJ;
      case 'L':
        return MyThemes.get().kUserProfileImgeBgColorL;
      case 'S':
        return MyThemes.get().kUserProfileImgeBgColorS;
      default:
        return MyThemes.get().kUserProfileImgeBgColorS;
    }
  }
}
