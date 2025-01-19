import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';

class PausePlayMovieWidget extends StatelessWidget {
  const PausePlayMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getIt<MoviePlayerStore>().playPauseButton,
      child: Observer(
        builder: (context) => getIt<MoviePlayerStore>().isMoviePlaying
            ? SvgPicture.asset(
                'assets/icons/pause_player_icon.svg',
                semanticsLabel: 'backward_15',
                fit: BoxFit.scaleDown,
                height: 60,
                width: 60,
              )
            : Icon(
                FontAwesomeIcons.circlePlay,
                color: Colors.white,
                size: 60,
              ),
      ),
    );
  }
}
