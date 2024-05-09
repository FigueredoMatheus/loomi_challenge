import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:loomi_challenge/src/core/helpers/dio_exception_helper.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/repositories/movie_repository/movie_repository.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<LoadMovieEvent>(_onLoadMovieEvent);
  }

  _onLoadMovieEvent(LoadMovieEvent event, Emitter<HomePageState> emit) async {
    emit(LoadingMovieState());

    try {
      final response =
          await getIt<MovieRepository>().getMovie(event.movieId.toString());

      final movie = MovieEntity(
        id: response.movieDataResponse.id.toString(),
        title: response.movieDataResponse.attributes.name,
        endDate: response.movieDataResponse.attributes.endDate,
        genre: response.movieDataResponse.attributes.genre,
        synopsis: response.movieDataResponse.attributes.synopsis,
        posterImage: response.movieDataResponse.attributes.poster
            .posterDataResponse.attributes.posterImage,
        streamLink: response.movieDataResponse.attributes.streamLink,
        comments: [],
      );

      emit(SuccessOnLoadingMovieState(movie: movie));
    } on DioException catch (dioException) {
      final exception = DioExceptionHelper().getException(dioException);

      emit(FailOnLoadingMovieState(exception: exception));
    }
  }
}
