import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';
import 'package:loomi_challenge/src/models/movie_model/movie_model.dart';

class MovieCardBottomButton extends StatefulWidget {
  final MovieModel movie;
  final MovieCardBottomButtonType type;

  const MovieCardBottomButton(
      {super.key, required this.movie, required this.type});

  @override
  State<MovieCardBottomButton> createState() => _MovieCardBottomButtonState();
}

class _MovieCardBottomButtonState extends State<MovieCardBottomButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
