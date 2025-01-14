import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:loomi_challenge/src/core/helpers/dio_exception_helper.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/services/comments_services/comments_services.dart';
import 'package:loomi_challenge/src/services/movie_service/movie_services.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final movieServices = MovieServices();
  final commentsServices = CommentsServices();
  late MovieEntity movie;

  HomePageBloc() : super(HomePageInitial()) {
    on<ShowMovieEvent>(_onShowMovieEvent);
    on<LoadMovieEvent>(_onLoadMovieEvent);
    on<UpdateMovieCommentsEvent>(_onUpdateMovieCommentsEvent);
  }

  _onShowMovieEvent(ShowMovieEvent event, Emitter<HomePageState> emit) {
    final timestamp = DateTime.now().microsecondsSinceEpoch;

    emit(ShowMovieState(movie: movie, timestamp: timestamp));
  }

  _onLoadMovieEvent(LoadMovieEvent event, Emitter<HomePageState> emit) async {
    emit(LoadingMovieState());

    try {
      final response = await movieServices.getMovie(event.movieId.toString());

      movie = MovieEntity.fromResponse(response);

      final commentsResponse =
          await commentsServices.getMovieComments(movie.id!, null);

      movie.setComments(commentsResponse.comments);

      add(ShowMovieEvent());
    } on DioException catch (dioException) {
      final exception = DioExceptionHelper().getException(dioException);

      emit(FailOnLoadingMovieState(exception: exception));
    }
  }

  _onUpdateMovieCommentsEvent(
    UpdateMovieCommentsEvent event,
    Emitter<HomePageState> emit,
  ) async {
    movie.setComments(event.comments);

    add(ShowMovieEvent());
  }
}
