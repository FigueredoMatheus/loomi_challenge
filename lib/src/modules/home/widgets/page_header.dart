import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/my_app_icon.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/data/temp_file.dart';
import 'package:loomi_challenge/src/modules/home/widgets/circle_avatar_profile_image.dart';

class HomePageViewHeader extends StatelessWidget {
  const HomePageViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: homePageViewCustomAppBarHeight,
      width: double.infinity,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 50,
        bottom: 15,
      ),
      padding: const EdgeInsets.symmetric(horizontal: pageViewDefaultPadding),
      child: Stack(
        children: [
          Positioned(
            child: Center(
              child: MyAppIcon(),
            ),
          ),
          Positioned(
            right: 0,
            child: CircleAvatarProfileImage(user: user),
          ),
        ],
      ),
    );
  }
}
