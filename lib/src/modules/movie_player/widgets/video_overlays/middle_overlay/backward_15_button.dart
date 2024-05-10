import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/movie_player/controller/movie_player_controller.dart';

class MoviePlayerBackward extends StatelessWidget {
  const MoviePlayerBackward({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getIt<MoviePlayerController>().backward,
      child: SvgPicture.asset(
        'assets/icons/backward_15_icon.svg',
        semanticsLabel: 'backward_15',
        fit: BoxFit.scaleDown,
        height: 30,
        width: 30,
      ),
    );
  }
}
