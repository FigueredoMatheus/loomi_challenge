import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';

class MoviePlayerMovieTitleOverlay extends StatelessWidget {
  const MoviePlayerMovieTitleOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      getIt<MoviePlayerController>().movieTitle,
      style: MyThemes.get().epilogueStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
