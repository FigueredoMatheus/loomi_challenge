import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/comments_card.dart';
import 'package:video_player/video_player.dart';
import 'package:subtitle_wrapper_package/subtitle_wrapper_package.dart';

class MoviePlayer extends StatefulWidget {
  const MoviePlayer({super.key});

  @override
  State<MoviePlayer> createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<MoviePlayer> {
  late MoviePlayerStore moviePlayerStore;

  @override
  void initState() {
    super.initState();

    moviePlayerStore = getIt<MoviePlayerStore>();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AspectRatio(
      aspectRatio: moviePlayerStore.controller.videoAspectRatio,
      child: SizedBox(
        height: screenWidth,
        width: screenHeight,
        child: Row(
          children: [
            Expanded(
              child: SubtitleWrapper(
                videoPlayerController:
                    moviePlayerStore.controller.playerController,
                subtitleController:
                    moviePlayerStore.controller.subtitleController,
                subtitleStyle: SubtitleStyle(
                  textColor: Colors.white,
                  hasBorder: true,
                  fontSize: 18,
                  position: SubtitlePosition(
                    bottom: 50,
                  ),
                ),
                backgroundColor: Colors.black,
                videoChild:
                    VideoPlayer(moviePlayerStore.controller.playerController),
              ),
            ),
            MoviePlayerCommentsCard(),
          ],
        ),
      ),
    );
  }
}
