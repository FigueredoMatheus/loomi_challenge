import 'package:flutter/material.dart';
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
    final controller = getIt<MoviePlayerController>();

    final movieProgressTime = calculateTotalDuration(
      controller.movieCurrentPosition.inHours,
      controller.movieCurrentPosition.inMinutes,
      controller.movieCurrentPosition.inSeconds,
    );

    final movieTotalDuration = calculateTotalDuration(
      controller.movieTotalDuration.inHours,
      controller.movieTotalDuration.inMinutes,
      controller.movieTotalDuration.inSeconds,
    );

    return Text(
      '$movieProgressTime / $movieTotalDuration',
      style: MyThemes.get().epilogueStyle.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  String calculateTotalDuration(int hours, int minutes, int seconds) {
    int totalSeconds = hours * 3600 + minutes * 60 + seconds;

    int calculatedHours = totalSeconds ~/ 3600;

    int remainingSeconds = totalSeconds % 3600;
    int calculatedMinutes = remainingSeconds ~/ 60;

    int calculatedSeconds = remainingSeconds % 60;

    String formattedDuration = '';
    if (calculatedHours > 0) {
      formattedDuration += '${calculatedHours.toString().padLeft(2, '0')}:';
    }
    formattedDuration +=
        '${calculatedMinutes.toString().padLeft(2, '0')}:${calculatedSeconds.toString().padLeft(2, '0')}';

    return formattedDuration;
  }
}
