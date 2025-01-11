import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/models/response/movie/movie_response.dart';
import 'package:loomi_challenge/src/services/movie_service/movie_service_impl.dart';
import 'package:loomi_challenge/src/repositories/movie_repository/movie_repository.dart';

class MovieServices implements MovieServicesImpl {
  final repository = getIt<MovieRepository>();

  @override
  Future<MovieResponse> getMovie(String movieId) =>
      repository.getMovie(movieId);
}
