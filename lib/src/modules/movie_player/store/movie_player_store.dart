import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/movie_player/controller/movie_player_controller.dart';
import 'package:mobx/mobx.dart';

part 'movie_player_store.g.dart';

class MoviePlayerStore = _MoviePlayerStore with _$MoviePlayerStore;

abstract class _MoviePlayerStore with Store {
  final controller = MoviePlayerController();

  MovieEntity get movie => controller.movie;

  @observable
  int currentSubtitleIndex = 0;

  @observable
  int currentAudioIndex = 0;

  @observable
  Duration currentProgress = Duration.zero;

  @observable
  bool isMoviePlaying = true;

  @observable
  bool isLoadingMovieSubtitles = false;

  @observable
  bool isCommetsDisplayed = false;

  @observable
  bool hideOverlays = true;

  loadMovieSubtitles() async {
    isLoadingMovieSubtitles = true;

    await controller.loadMovieSubtitles();

    isLoadingMovieSubtitles = false;
    hideOverlays = false;
    setCurrentAudioIndex(controller.indexOfDefaultLanguage);
    setCurrentSubtitleIndex(controller.indexOfDefaultLanguage + 1);
  }

  @action
  setCurrentSubtitleIndex(int index) {
    this.currentSubtitleIndex = index;
    controller.updateSubtitleUrl(index);
  }

  @action
  setCurrentAudioIndex(int index) {
    this.currentAudioIndex = index;
  }

  @action
  void updateProgress() {
    currentProgress = controller.playerController.value.position;
  }

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

  @action
  backward() => controller.playerController.seekTo(
        Duration(
            seconds: controller.playerController.value.position.inSeconds - 15),
      );

  @action
  forward() => controller.playerController.seekTo(
        Duration(
            seconds: controller.playerController.value.position.inSeconds + 15),
      );

  @action
  playPauseButton() {
    isMoviePlaying
        ? controller.playerController.pause()
        : controller.playerController.play();

    isMoviePlaying = !isMoviePlaying;
  }

  initialize({required MovieEntity movie}) {
    this.isCommetsDisplayed = false;
    controller.initController(movie);
    controller.playerController.addListener(updateProgress);
  }

  onDispose() {
    controller.playerController.removeListener(updateProgress);
    controller.playerController.dispose();
    isMoviePlaying = true;
  }
}
