import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

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
              color: MyThemes.get().kWhiteColor.withOpacity(0.6),
            ),
          ),
          Container(
            height: homePageViewCustomAppBarHeight -
                homePageViewCustomAppBarHeight / 2,
            width: homePageViewCustomAppBarHeight -
                homePageViewCustomAppBarHeight / 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyThemes.get().kVeryDarkGrayColor,
            ),
          ),
          Container(
            height: homePageViewCustomAppBarHeight * 0.1,
            width: homePageViewCustomAppBarHeight,
            decoration: BoxDecoration(
              color: MyThemes.get().kVeryDarkGrayColor,
            ),
          ),
        ],
      ),
    );
  }
}
