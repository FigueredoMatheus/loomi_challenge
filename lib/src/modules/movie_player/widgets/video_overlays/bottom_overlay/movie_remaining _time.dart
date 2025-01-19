import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/common/utils/extensions/on_duration_extension.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';

class MovieProgressTime extends StatefulWidget {
  const MovieProgressTime({super.key});

  @override
  State<MovieProgressTime> createState() => _MovieProgressTimeState();
}

class _MovieProgressTimeState extends State<MovieProgressTime> {
  @override
  Widget build(BuildContext context) {
    final moviePlayerStore = getIt<MoviePlayerStore>();

    return Observer(builder: (context) {
      final movieProgressTime =
          moviePlayerStore.currentProgress.playerTimerFormat();

      final movieTotalDuration =
          moviePlayerStore.controller.movieTotalDuration.playerTimerFormat();
      return Text(
        '$movieProgressTime / $movieTotalDuration',
        style: MyThemes.get().epilogueStyle.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
      );
    });
  }
}
