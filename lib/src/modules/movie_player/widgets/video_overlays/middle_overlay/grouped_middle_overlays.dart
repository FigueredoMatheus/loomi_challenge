import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/backward_15_button.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/forward_15_button.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/pause_play_video.dart';

class MoviePlayerGroupedMiddleOverlays extends StatelessWidget {
  const MoviePlayerGroupedMiddleOverlays({super.key});

  @override
  Widget build(BuildContext context) {
    final moviePlayerStore = getIt<MoviePlayerStore>();
    return Observer(builder: (_) {
      return moviePlayerStore.hideOverlays ||
              moviePlayerStore.isLoadingMovieSubtitles
          ? Container()
          : FractionallySizedBox(
              widthFactor: moviePlayerStore.isCommetsDisplayed
                  ? 1 - ApplicationConstants.MOVIE_PLAYER_COMMENTS_WIDTH_FACTOR
                  : 1,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MoviePlayerBackward(),
                  PausePlayMovieWidget(),
                  MoviePlayerForward(),
                ],
              ),
            );
    });
  }
}
