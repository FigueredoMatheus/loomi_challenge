import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/bottom_overlay/maximize_minimize_button.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/bottom_overlay/movie_progress_bar.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/bottom_overlay/movie_remaining%20_time.dart';

import '../../../controller/movie_player_controller.dart';

class MoviePlayerGroupedBottomOverlay extends StatelessWidget {
  const MoviePlayerGroupedBottomOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return getIt<MoviePlayerController>().hideOverlays
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: MovieProgressBar()),
                  const SizedBox(width: 15),
                  MovieProgressTime(),
                  const SizedBox(width: 15),
                  MaximizeMinimizeButton(),
                ],
              ),
            );
    });
  }
}
