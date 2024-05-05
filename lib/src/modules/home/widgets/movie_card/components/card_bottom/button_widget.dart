import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';
import 'package:loomi_challenge/src/models/movie_model/movie_model.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/card_bottom/custom_rate_pop_up_menu.dart';

class MovieCardBottomButton extends StatefulWidget {
  final MovieModel movie;
  final MovieCardBottomButtonType type;

  const MovieCardBottomButton(
      {super.key, required this.movie, required this.type});

  @override
  State<MovieCardBottomButton> createState() => _MovieCardBottomButtonState();
}

class _MovieCardBottomButtonState extends State<MovieCardBottomButton> {
  CustomPopupMenuController popUpController = CustomPopupMenuController();
  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            getButtonIconPath(),
            semanticsLabel: 'Rate',
            fit: BoxFit.scaleDown,
            height: 30,
            width: 30,
          ),
          Text(
            getLabel(),
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

  String getLabel() {
    switch (widget.type) {
      case MovieCardBottomButtonType.rate:
        return 'Rate';
      case MovieCardBottomButtonType.share:
        return 'Gift to someone?';
      default:
        return '';
    }
  }

  String getButtonIconPath() {
    switch (widget.type) {
      case MovieCardBottomButtonType.rate:
        return 'assets/icons/rate_button_icon.svg';
      case MovieCardBottomButtonType.share:
        return 'assets/icons/share_button_icon.svg';
      default:
        return '';
    }
  }
}
