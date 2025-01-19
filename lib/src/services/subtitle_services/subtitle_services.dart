import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/helpers/dio_exception_helper.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/models/response/subtitle_reponse/subtitle_response.dart';
import 'package:loomi_challenge/src/repositories/subtitle_repository/subtitle_repository.dart';
import 'package:loomi_challenge/src/services/subtitle_services/subtitle_services_impl.dart';
import 'package:provider/provider.dart';

class SubtitleServices extends SubtitleServicesImpl {
  final _repository = getIt<SubtitleRepository>();

  @override
  Future<SubtitleResponse> getMovieSubtitles(int movieId) async {
    try {
      final authToken =
          await Provider.of<UserProvider>(Get.context!).getAuthToken();

      final response = await _repository.getMovieSubtitles(movieId, authToken);

      return response;
    } on DioException catch (exception) {
      final exceptionModel = DioExceptionHelper().getException(exception);

      final response = SubtitleResponse(data: []);

      response.setException(exceptionModel);

      return response;
    }
  }
}
