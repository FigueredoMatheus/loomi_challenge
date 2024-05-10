import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/movie_player/controller/movie_player_controller.dart';

class PausePlayMovieWidget extends StatelessWidget {
  const PausePlayMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<MoviePlayerController>().playPauseButton();
      },
      child: Icon(
        getIt<MoviePlayerController>().isMoviePlaying
            ? FontAwesomeIcons.circlePause
            : FontAwesomeIcons.circlePlay,
        color: Colors.white,
        size: 60,
      ),
    );
  }
}
