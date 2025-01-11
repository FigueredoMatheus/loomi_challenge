import 'package:loomi_challenge/src/models/response/movie/movie_response.dart';

abstract class MovieServicesImpl {
  Future<MovieResponse> getMovie(String movieId);
}
