import 'package:flutter/services.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/movie_player.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/bottom_overlay/grouped_bottom_overlay.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/middle_overlay/grouped_middle_overlays.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/top_overlay/grouped_top_overlays.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class MoviePlayerPageView extends StatefulWidget {
  final MovieEntity movie;

  const MoviePlayerPageView({super.key, required this.movie});

  @override
  State<MoviePlayerPageView> createState() => _MoviePlayerPageViewState();
}

class _MoviePlayerPageViewState extends State<MoviePlayerPageView> {
  late VideoPlayerController playerController;

  @override
  void initState() {
    super.initState();
    setLandScape();
    playerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.movie.streamLink),
    );

    playerController.addListener(() {
      setState(() {});
    });

    playerController.setLooping(true);
    playerController.initialize().then((_) => setState(() {}));
    playerController.play();
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  void setLandScape() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode
          .immersiveSticky, //SystemUiMode.manual, //SystemUiMode.immersive,
      // overlays: [
      //   SystemUiOverlay.bottom
      // ],
      //Apenas o statusBar bottom será mostrado
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.expand,
          children: [
            MoviePlayer(playerController: playerController),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MoviePlayerGroupedTopOverlays(),
            ),
            Positioned(
              child: MoviePlayerGroupedMiddleOverlays(
                playerController: playerController,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MoviePlayerGroupedBottomOverlay(
                playerController: playerController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
