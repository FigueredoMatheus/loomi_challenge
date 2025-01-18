import 'package:loomi_challenge/src/common/utils/dialogs/exception_warning_dialog.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/models/response/subtitle_reponse/subtitle_data.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';
import 'package:loomi_challenge/src/services/subtitle_services/subtitle_services.dart';

class MoviePlayerController {
  final _subtitleServices = SubtitleServices();

  Future<List<SubtitleData>> loadMovieSubtitles() async {
    final _store = getIt<MoviePlayerStore>();

    final response =
        await _subtitleServices.getMovieSubtitles(_store.movie.id!);

    if (!response.success) {
      await exceptionWarning(response.exception!);
      MyAppSnackBar(
              message: "Fail on set movie subtitles",
              snackBarType: SnackBarType.fail)
          .show();
    }

    return response.data;
  }
}
