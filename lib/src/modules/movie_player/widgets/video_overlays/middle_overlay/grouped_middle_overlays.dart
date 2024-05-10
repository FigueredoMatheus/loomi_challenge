import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/backward_15_button.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/forward_15_button.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/pause_play_video.dart';

class MoviePlayerGroupedMiddleOverlays extends StatelessWidget {
  const MoviePlayerGroupedMiddleOverlays({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MoviePlayerBackward(),
        PausePlayMovieWidget(),
        MoviePlayerForward(),
      ],
    );
  }
}
