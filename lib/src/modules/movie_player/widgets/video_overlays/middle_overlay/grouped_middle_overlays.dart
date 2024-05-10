import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/backward_15_button.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/forward_15_button.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/pause_play_video.dart';
import 'package:video_player/video_player.dart';

class MoviePlayerGroupedMiddleOverlays extends StatelessWidget {
  final VideoPlayerController playerController;
  const MoviePlayerGroupedMiddleOverlays(
      {super.key, required this.playerController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MoviePlayerBackward(playerController: playerController),
        PausePlayMovieWidget(playerController: playerController),
        MoviePlayerForward(playerController: playerController),
      ],
    );
  }
}
