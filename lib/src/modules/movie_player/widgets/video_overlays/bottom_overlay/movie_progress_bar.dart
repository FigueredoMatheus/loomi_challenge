import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/movie_player/controller/movie_player_controller.dart';
import 'package:video_player/video_player.dart';

class MovieProgressBar extends StatelessWidget {
  const MovieProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return VideoProgressIndicator(
      getIt<MoviePlayerController>().playerController,
      allowScrubbing: true,
      colors: VideoProgressColors(
        backgroundColor: Colors.white.withOpacity(0.33),
        playedColor: MyThemes.get().kLightPurpleColor,
      ),
    );
  }
}
