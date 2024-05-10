import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/movie_player/controller/movie_player_controller.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/backward_15_button.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/forward_15_button.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/pause_play_video.dart';

class MoviePlayerGroupedMiddleOverlays extends StatelessWidget {
  const MoviePlayerGroupedMiddleOverlays({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return getIt<MoviePlayerController>().hideOverlays
          ? Container()
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MoviePlayerBackward(),
                PausePlayMovieWidget(),
                MoviePlayerForward(),
              ],
            );
    });
  }
}
