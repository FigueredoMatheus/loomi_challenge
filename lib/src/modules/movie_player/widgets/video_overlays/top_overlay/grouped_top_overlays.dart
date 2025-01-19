import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/common/widgets/custom_back_button.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';

import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/top_overlay/movie_title.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/top_overlay/subtitle_audio_overlay.dart';

class MoviePlayerGroupedTopOverlays extends StatelessWidget {
  const MoviePlayerGroupedTopOverlays({super.key});

  @override
  Widget build(BuildContext context) {
    final moviePlayerStore = getIt<MoviePlayerStore>();

    return Observer(
      builder: (_) {
        final bool showBackBtn = moviePlayerStore.isLoadingMovieSubtitles ||
            !moviePlayerStore.hideOverlays;

        final bool showOverlays = !moviePlayerStore.hideOverlays &&
            !moviePlayerStore.isLoadingMovieSubtitles;

        return Observer(builder: (context) {
          return FractionallySizedBox(
            widthFactor: moviePlayerStore.isCommetsDisplayed
                ? 1 - ApplicationConstants.MOVIE_PLAYER_COMMENTS_WIDTH_FACTOR
                : 1,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (showBackBtn) CustomBackButton(),
                      const SizedBox(width: 10),
                      if (showBackBtn) MoviePlayerMovieTitleOverlay(),
                    ],
                  ),
                  if (showOverlays)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MoviePlayerSubtitlesAudioCommentsOverlay(
                          type: MoviePlayerSubtitlesAudioCommentsOverlayType
                              .subtitlesAudio,
                        ),
                        Visibility(
                          visible: !moviePlayerStore.isCommetsDisplayed,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: MoviePlayerSubtitlesAudioCommentsOverlay(
                              type: MoviePlayerSubtitlesAudioCommentsOverlayType
                                  .comments,
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
