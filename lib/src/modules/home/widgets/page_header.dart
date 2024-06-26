import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/my_app_icon.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/common/widgets/circle_avatar_profile_image.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:provider/provider.dart';

class HomePageViewHeader extends StatelessWidget {
  const HomePageViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<UserProvider>(context).user;
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
            child: Center(child: MyAppIcon()),
          ),
          Positioned(
            right: 0,
            child: CircleAvatarProfileImage(
              user: loggedUser,
              isFromHomePageViewHeader: true,
            ),
          ),
        ],
      ),
    );
  }
}
