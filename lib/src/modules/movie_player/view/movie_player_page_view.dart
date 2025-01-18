import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/loading_movie_subtitles.dart';
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
  late MoviePlayerStore moviePlayerStore;
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

    moviePlayerStore = getIt<MoviePlayerStore>();

    moviePlayerStore.initialize(
      movie: widget.movie,
      playerController: playerController,
    );

    moviePlayerStore.loadMovieSubtitles();
  }

  @override
  void dispose() {
    playerController.dispose();
    getIt<MoviePlayerStore>().onDispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void setLandScape() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onDoubleTap: moviePlayerStore.toggleOverlaysView,
        child: Scaffold(
          body: Observer(builder: (context) {
            return Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.expand,
              children: [
                Visibility(
                  visible: !moviePlayerStore.isLoadingMovieSubtitles,
                  child: Positioned.fill(child: MoviePlayer()),
                  replacement: LoadingMovieSubtitlesWidget(),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: MoviePlayerGroupedTopOverlays(),
                ),
                Positioned(
                  child: MoviePlayerGroupedMiddleOverlays(),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: MoviePlayerGroupedBottomOverlay(),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
