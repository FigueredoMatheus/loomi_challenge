import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/movie_player.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/video_overlays/pause_play_video.dart';
import 'package:video_player/video_player.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          MoviePlayer(playerController: playerController),
          PausePlayMovieWidget(playerController: playerController),
        ],
      ),
    );
  }
}
