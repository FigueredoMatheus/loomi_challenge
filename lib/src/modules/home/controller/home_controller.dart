import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/services/file_services/file_services.dart';
import 'package:share_plus/share_plus.dart';

class HomeController {
  final fileServices = FileServices();

  Future shareMovie(MovieEntity movie) async {
    final url = movie.streamLink;

    final response = await fileServices.downloadFile(url, 'video.mp4');

    if (response.success) {
      final file = XFile(response.filePath);
      Share.shareXFiles([file]);
    } else {
      MyAppSnackBar(
        message: response.errorMessage,
        snackBarType: SnackBarType.fail,
      );
    }
  }
}
