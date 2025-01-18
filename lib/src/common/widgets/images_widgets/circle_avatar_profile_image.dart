import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/images_widgets/show_image_widget.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class CircleAvatarProfileImage extends StatefulWidget {
  final String? image;
  final String username;
  final double containerSize;
  final bool isFromHomePageViewHeader;

  const CircleAvatarProfileImage({
    super.key,
    required this.username,
    this.image,
    this.containerSize =
        ApplicationConstants.HOME_PAGE_VIEW_CUSTOM_APP_BAR_HEIGHT,
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
          ? () => Get.toNamed(RoutesNames.USER_SETTINGS_PAGE_VIEW)
          : null,
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
      child: widget.image != null
          ? CustomShowImageWidget(
              imagePath: widget.image!,
              size: widget.containerSize,
              radius: widget.containerSize,
            )
          : Container(
              height: widget.containerSize,
              width: widget.containerSize,
              decoration: BoxDecoration(
                color: getContainerBgColor(),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  widget.username[0].toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.containerSize * 0.45,
                  ),
                ),
              ),
            ),
    );
  }

  Color getContainerBgColor() {
    switch (widget.username[0].toUpperCase()) {
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
