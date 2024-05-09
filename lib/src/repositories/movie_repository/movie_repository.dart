import 'package:dio/dio.dart' hide Headers;
import 'package:loomi_challenge/src/models/response/movie/movie_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_repository.g.dart';

@RestApi(baseUrl: 'https://untold-strapi.api.stage.loomi.com.br/api')
abstract class MovieRepository {
  factory MovieRepository(Dio dio, {String baseUrl}) = _MovieRepository;

  @GET('/movies/{id}?populate=poster')
  Future<MovieResponse> getMovie(@Path('id') String id);
}
