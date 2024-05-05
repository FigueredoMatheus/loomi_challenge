import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';

class CircleAvatarProfileImage extends StatelessWidget {
  const CircleAvatarProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: homePageViewCustomAppBarHeight,
      width: homePageViewCustomAppBarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
