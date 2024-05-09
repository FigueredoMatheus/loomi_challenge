import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/card_bottom/custom_rate_pop_up_menu.dart';

class MovieCardBottomRateMovieWidget extends StatefulWidget {
  final MovieEntity movie;

  const MovieCardBottomRateMovieWidget({super.key, required this.movie});

  @override
  State<MovieCardBottomRateMovieWidget> createState() =>
      _MovieCardBottomRateMovieWidgetState();
}

class _MovieCardBottomRateMovieWidgetState
    extends State<MovieCardBottomRateMovieWidget> {
  CustomPopupMenuController popUpController = CustomPopupMenuController();
  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/rate_button_icon.svg',
            semanticsLabel: 'Rate',
            fit: BoxFit.scaleDown,
            height: 30,
            width: 30,
          ),
          Text(
            'Rate',
            style: MyThemes.get().epilogueStyle.copyWith(
                  color: MyThemes.get().kWhiteColor.withOpacity(0.45),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
      menuBuilder: () =>
          CustomRatePopUpMenuWidget(popUpController: popUpController),
      pressType: PressType.singleClick,
      position: PreferredPosition.top,
      controller: popUpController,
      barrierColor: Colors.black.withOpacity(0.25),
    );
  }
}
