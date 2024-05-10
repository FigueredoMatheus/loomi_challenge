import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/bottom_overlay/maximize_minimize_button.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/bottom_overlay/movie_progress_bar.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/bottom_overlay/movie_remaining%20_time.dart';
import 'package:video_player/video_player.dart';

class MoviePlayerGroupedBottomOverlay extends StatelessWidget {
  final VideoPlayerController playerController;
  const MoviePlayerGroupedBottomOverlay({
    super.key,
    required this.playerController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: MovieProgressBar(playerController: playerController)),
          const SizedBox(width: 15),
          MovieProgressTime(playerController: playerController),
          const SizedBox(width: 15),
          MaximizeMinimizeButton(),
        ],
      ),
    );
  }
}
