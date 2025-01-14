import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatelessWidget {
  const MoviePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        height: getIt<MoviePlayerController>().videoHeight,
        width: getIt<MoviePlayerController>().videoWidth,
        child: AspectRatio(
          aspectRatio: getIt<MoviePlayerController>().videoAspectRatio,
          child: VideoPlayer(getIt<MoviePlayerController>().playerController),
        ),
      ),
    );
  }
}
