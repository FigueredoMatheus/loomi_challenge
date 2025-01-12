import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:loomi_challenge/src/core/helpers/dio_exception_helper.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/services/movie_service/movie_services.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final movieServices = MovieServices();

  HomePageBloc() : super(HomePageInitial()) {
    on<LoadMovieEvent>(_onLoadMovieEvent);
  }

  _onLoadMovieEvent(LoadMovieEvent event, Emitter<HomePageState> emit) async {
    emit(LoadingMovieState());

    try {
      final response = await movieServices.getMovie(event.movieId.toString());

      final movie = MovieEntity.fromResponse(response);

      emit(SuccessOnLoadingMovieState(movie: movie));
    } on DioException catch (dioException) {
      final exception = DioExceptionHelper().getException(dioException);

      emit(FailOnLoadingMovieState(exception: exception));
    }
  }
}