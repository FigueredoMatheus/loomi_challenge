import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';
import 'package:loomi_challenge/src/models/user_model/user_model.dart';

class CircleAvatarProfileImage extends StatelessWidget {
  final UserModel user;
  final double containerSize;

  const CircleAvatarProfileImage({
    super.key,
    required this.user,
    this.containerSize = homePageViewCustomAppBarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerSize,
      width: containerSize,
      decoration: BoxDecoration(
        color: getContainerBgColor(),
        shape: BoxShape.circle,
        image: user.hasImage
            ? DecorationImage(image: NetworkImage(user.image!))
            : null,
      ),
      alignment: Alignment.center,
      child: user.hasImage
          ? Container()
          : Text(
              user.name[0].toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
    );
  }

  Color getContainerBgColor() {
    switch (user.name[0].toUpperCase()) {
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
