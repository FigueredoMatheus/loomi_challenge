import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class MyAppIcon extends StatelessWidget {
  final bool showText;
  const MyAppIcon({super.key, this.showText = false});

  @override
  Widget build(BuildContext context) {
    final double biggerContainer = showText ? 60 : 0;
    final double mediumContainer = showText ? biggerContainer * 0.60 : 0;
    final double smallContainer = showText ? mediumContainer * 0.60 : 0;
    return Container(
      height: homePageViewCustomAppBarHeight + biggerContainer,
      width: homePageViewCustomAppBarHeight + biggerContainer,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: homePageViewCustomAppBarHeight + mediumContainer,
            width: homePageViewCustomAppBarHeight + mediumContainer,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyThemes.get().kWhiteColor.withOpacity(0.6),
            ),
          ),
          Container(
            height: homePageViewCustomAppBarHeight -
                homePageViewCustomAppBarHeight / 2 +
                smallContainer,
            width: homePageViewCustomAppBarHeight -
                homePageViewCustomAppBarHeight / 2 +
                smallContainer,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyThemes.get().kVeryDarkGrayColor,
            ),
          ),
          Container(
            height:
                homePageViewCustomAppBarHeight * 0.1 + mediumContainer / 3.5,
            width: homePageViewCustomAppBarHeight + biggerContainer,
            decoration: BoxDecoration(
              color: MyThemes.get().kVeryDarkGrayColor,
            ),
            child: !showText
                ? null
                : Center(
                    child: Text(
                      'Your story, now told.',
                      style: MyThemes.get().montserratStyle.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
