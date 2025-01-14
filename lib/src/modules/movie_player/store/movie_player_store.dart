import 'dart:async';

import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:video_player/video_player.dart';
import 'package:mobx/mobx.dart';

part 'movie_player_store.g.dart';

class MoviePlayerStore = _MoviePlayerStore with _$MoviePlayerStore;

abstract class _MoviePlayerStore with Store {
  late MovieEntity movie;
  late VideoPlayerController playerController;

  Timer? timer;

  @observable
  bool isCommetsDisplayed = false;

  @observable
  bool hideOverlays = false;

  double get videoHeight => playerController.value.size.height;
  double get videoWidth => playerController.value.size.height;
  double get videoAspectRatio => playerController.value.aspectRatio;

  bool get isMoviePlaying => playerController.value.isPlaying;

  Duration get movieTotalDuration => playerController.value.duration;
  Duration get movieCurrentPosition => playerController.value.position;

  String get movieTitle => movie.title;

  @action
  toggleOverlaysView() {
    hideOverlays = !hideOverlays;
  }

  @action
  openCommentsSection() {
    isCommetsDisplayed = true;
  }

  @action
  closeCommentsSection() {
    isCommetsDisplayed = false;
  }

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
    this.movie = movie;
    this.playerController = playerController;
    this.isCommetsDisplayed = false;
  }

  onDispose() {
    playerController.dispose();
  }
}
