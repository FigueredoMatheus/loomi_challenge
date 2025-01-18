import 'package:dio/dio.dart' hide Headers;
import 'package:loomi_challenge/src/models/response/subtitle_reponse/subtitle_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'subtitle_repository.g.dart';

@RestApi(baseUrl: 'https://untold-strapi.api.stage.loomi.com.br/api')
abstract class SubtitleRepository {
  factory SubtitleRepository(Dio dio, {String baseUrl}) = _SubtitleRepository;

  @GET('/subtitles?populate=file&filters%5Bmovie_id%5D={id}')
  Future<SubtitleResponse> getMovieSubtitles(
    @Path("id") int movieId,
    @Header('Authorization') String authToken,
  );
}
