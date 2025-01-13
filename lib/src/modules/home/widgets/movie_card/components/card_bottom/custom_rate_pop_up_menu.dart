import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class CustomRatePopUpMenuWidget extends StatefulWidget {
  final CustomPopupMenuController popUpController;

  const CustomRatePopUpMenuWidget({super.key, required this.popUpController});

  @override
  State<CustomRatePopUpMenuWidget> createState() =>
      _CustomRatePopUpMenuWidgetState();
}

class _CustomRatePopUpMenuWidgetState extends State<CustomRatePopUpMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: MyThemes.get().kDarkShadeGrayColor.withOpacity(1),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        children: [
          rateIcon(RateMovieOptions.dislike),
          rateIcon(RateMovieOptions.like),
          rateIcon(RateMovieOptions.superLike),
          Spacer(),
          closeMenuIcon(),
        ],
      ),
    );
  }

  Widget closeMenuIcon() {
    return InkWell(
      onTap: () {
        widget.popUpController.hideMenu();
      },
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: MyThemes.get().kPurpleColor, width: 2),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Icon(
          Icons.close_rounded,
          color: MyThemes.get().kPurpleColor,
          size: 18,
        ),
      ),
    );
  }

  Widget rateIcon(RateMovieOptions rateOption) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SvgPicture.asset(
            getRateOptionIconPath(rateOption),
            semanticsLabel: 'rateIcon',
          ),
          const SizedBox(height: 5),
          Text(
            getRateOptionLabel(rateOption),
            style: MyThemes.get().epilogueStyle.copyWith(
                  color: MyThemes.get().kWhiteColor.withOpacity(0.45),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }

  String getRateOptionLabel(RateMovieOptions rateOption) {
    switch (rateOption) {
      case RateMovieOptions.dislike:
        return 'It\'s not for me';
      case RateMovieOptions.like:
        return 'I Like it';
      case RateMovieOptions.superLike:
      default:
        return 'I love it!';
    }
  }

  String getRateOptionIconPath(RateMovieOptions rateOption) {
    switch (rateOption) {
      case RateMovieOptions.dislike:
        return 'assets/icons/dislike_icon.dart.svg';
      case RateMovieOptions.like:
        return 'assets/icons/like_icon.svg';
      case RateMovieOptions.superLike:
      default:
        return 'assets/icons/super_like_icon.svg';
    }
  }
}
