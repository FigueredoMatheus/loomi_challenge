import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';

class PausePlayMovieWidget extends StatelessWidget {
  const PausePlayMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<MoviePlayerStore>().playPauseButton();
      },
      child: Icon(
        getIt<MoviePlayerStore>().isMoviePlaying
            ? FontAwesomeIcons.circlePause
            : FontAwesomeIcons.circlePlay,
        color: Colors.white,
        size: 60,
      ),
    );
  }
}
