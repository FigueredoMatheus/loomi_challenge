import 'package:loomi_challenge/src/models/response/subtitle_reponse/subtitle_response.dart';

abstract class SubtitleServicesImpl {
  Future<SubtitleResponse> getMovieSubtitles(int movieId);
}
