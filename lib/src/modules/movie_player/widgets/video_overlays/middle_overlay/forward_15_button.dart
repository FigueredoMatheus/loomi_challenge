import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';

class MoviePlayerForward extends StatelessWidget {
  const MoviePlayerForward({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getIt<MoviePlayerController>().forward,
      child: SvgPicture.asset(
        'assets/icons/forward_15_icon.svg',
        semanticsLabel: 'forward_15',
        fit: BoxFit.scaleDown,
        height: 30,
        width: 30,
      ),
    );
  }
}
