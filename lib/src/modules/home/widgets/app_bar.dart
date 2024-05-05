import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/my_app_icon.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/modules/home/widgets/circle_avatar_profile_image.dart';

class HomePageViewCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomePageViewCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: pageViewDefaultPadding),
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: MyAppIcon(),
              ),
            ),
            Positioned(
              right: 0,
              child: CircleAvatarProfileImage(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.infinity,
        homePageViewCustomAppBarHeight,
      );
}
