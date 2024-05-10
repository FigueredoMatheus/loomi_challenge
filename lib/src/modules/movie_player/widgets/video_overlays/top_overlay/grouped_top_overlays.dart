import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/common/widgets/custom_back_button.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/top_overlay/movie_title.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/top_overlay/subtitle_audio_overlay.dart';

class MoviePlayerGroupedTopOverlays extends StatelessWidget {
  const MoviePlayerGroupedTopOverlays({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomBackButton(),
              const SizedBox(width: 10),
              MoviePlayerMovieTitleOverlay(),
            ],
          ),
          Row(
            children: [
              MoviePlayerSubtitlesAudioCommentsOverlay(
                  type: MoviePlayerSubtitlesAudioCommentsOverlayType
                      .subtitlesAudio),
              const SizedBox(width: 35),
              MoviePlayerSubtitlesAudioCommentsOverlay(
                  type: MoviePlayerSubtitlesAudioCommentsOverlayType.comments),
            ],
          )
        ],
      ),
    );
  }
}
