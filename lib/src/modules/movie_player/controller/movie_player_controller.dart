import 'dart:async';

import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:video_player/video_player.dart';
import 'package:mobx/mobx.dart';

part 'movie_player_controller.g.dart';

class MoviePlayerController = _MoviePlayerController
    with _$MoviePlayerController;

abstract class _MoviePlayerController with Store {
  late MovieEntity movie;
  late VideoPlayerController playerController;

  Timer? timer;

  @observable
  bool hideOverlays = false;

  @action
  toggleOverlaysView() {
    hideOverlays = !hideOverlays;
  }

  double get videoHeight => playerController.value.size.height;
  double get videoWidth => playerController.value.size.height;
  double get videoAspectRatio => playerController.value.aspectRatio;

  bool get isMoviePlaying => playerController.value.isPlaying;

  Duration get movieTotalDuration => playerController.value.duration;
  Duration get movieCurrentPosition => playerController.value.position;

  String get movieTitle => movie.title;

  backward() => playerController.seekTo(
        Duration(seconds: playerController.value.position.inSeconds - 15),
      );

  forward() => playerController.seekTo(
        Duration(seconds: playerController.value.position.inSeconds + 15),
      );

  playPauseButton() {
    isMoviePlaying ? playerController.pause() : playerController.play();
  }

  initialize({
    required MovieEntity movie,
    required VideoPlayerController playerController,
  }) {
    this.movie = movie;
    this.playerController = playerController;
  }

  onDispose() {
    playerController.dispose();
  }
}
