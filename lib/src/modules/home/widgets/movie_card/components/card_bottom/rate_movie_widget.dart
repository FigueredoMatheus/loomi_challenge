import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';
import 'package:loomi_challenge/src/models/movie_model/movie_model.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/card_bottom/custom_rate_pop_up_menu.dart';

class MovieCardBottomRateMovieWidget extends StatefulWidget {
  final MovieModel movie;

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
            style: MyAppKColors.movieCardBottomButton(),
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
