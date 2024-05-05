import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class MyAppIcon extends StatelessWidget {
  const MyAppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: homePageViewCustomAppBarHeight,
      width: homePageViewCustomAppBarHeight,
      //color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: homePageViewCustomAppBarHeight,
            width: homePageViewCustomAppBarHeight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyAppKColors.kWhiteColor.withOpacity(0.6),
            ),
          ),
          Container(
            height: homePageViewCustomAppBarHeight -
                homePageViewCustomAppBarHeight / 2,
            width: homePageViewCustomAppBarHeight -
                homePageViewCustomAppBarHeight / 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyAppKColors.kVeryDarkGrayColor,
            ),
          ),
          Container(
            height: homePageViewCustomAppBarHeight * 0.1,
            width: homePageViewCustomAppBarHeight,
            decoration: BoxDecoration(
              color: MyAppKColors.kVeryDarkGrayColor,
            ),
          ),
        ],
      ),
    );
  }
}
