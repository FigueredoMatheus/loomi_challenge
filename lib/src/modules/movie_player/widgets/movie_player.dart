import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/comments_card.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatelessWidget {
  const MoviePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final moviePlayerStore = getIt<MoviePlayerStore>();

    return AspectRatio(
      aspectRatio: moviePlayerStore.videoAspectRatio,
      child: SizedBox(
        height: screenWidth,
        width: screenHeight,
        child: Observer(
          builder: (context) {
            return Row(
              children: [
                Expanded(
                  child: VideoPlayer(moviePlayerStore.playerController),
                ),
                MoviePlayerCommentsCard(),
              ],
            );
          },
        ),
      ),
    );
  }
}
