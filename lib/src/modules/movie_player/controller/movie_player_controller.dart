import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/exception_warning_dialog.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/models/response/subtitle_reponse/subtitle_data.dart';
import 'package:loomi_challenge/src/services/subtitle_services/subtitle_services.dart';
import 'package:subtitle_wrapper_package/subtitle_controller.dart';
import 'package:video_player/video_player.dart';

class MoviePlayerController {
  final _subtitleServices = SubtitleServices();

  late MovieEntity movie;
  late VideoPlayerController playerController;
  late SubtitleController subtitleController;

  double get videoHeight => playerController.value.size.height;
  double get videoWidth => playerController.value.size.height;
  double get videoAspectRatio => playerController.value.aspectRatio;

  String get movieTitle => movie.title;
  bool get hasMovieSubtitles => movie.subtitles.isNotEmpty;

  String? get getMovieDefaultLanguage => movie.subtitles
      .firstWhereOrNull((element) => element.attributes.isDefault)
      ?.attributes
      .file
      .data
      .attributes
      .url;

  bool get isMoviePlaying => playerController.value.isPlaying;
  Duration get movieProgressTime => playerController.value.position;
  Duration get movieTotalDuration => playerController.value.duration;

  initController(MovieEntity movie) {
    this.movie = movie;
    initializePlayerController();
  }

  initializeSubtitleController() {
    subtitleController = SubtitleController(
      subtitleUrl: getMovieDefaultLanguage,
      subtitleType: SubtitleType.srt,
    );
  }

  initializePlayerController() {
    playerController =
        VideoPlayerController.networkUrl(Uri.parse(movie.streamLink));

    playerController.setLooping(true);
    playerController.initialize();
    playerController.play();
  }

  setMovieSubtitles(List<SubtitleData> subtitles) {
    this.movie.setSubtitles(subtitles);
  }

  loadMovieSubtitles() async {
    final response = await _subtitleServices.getMovieSubtitles(movie.id!);
    if (response.success) {
      setMovieSubtitles(response.data);
      initializeSubtitleController();
    } else {
      await exceptionWarning(response.exception!);
      MyAppSnackBar(
              message: "Fail on set movie subtitles",
              snackBarType: SnackBarType.fail)
          .show();
    }
  }
}
