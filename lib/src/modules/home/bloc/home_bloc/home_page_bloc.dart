import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:loomi_challenge/src/core/helpers/dio_exception_helper.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/models/response/comment/comment_response.dart';
import 'package:loomi_challenge/src/services/comments_services/comments_services.dart';
import 'package:loomi_challenge/src/services/movie_service/movie_services.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final movieServices = MovieServices();
  final commentsServices = CommentsServices();
  HomePageBloc() : super(HomePageInitial()) {
    on<LoadMovieEvent>(_onLoadMovieEvent);
  }

  _onLoadMovieEvent(LoadMovieEvent event, Emitter<HomePageState> emit) async {
    emit(LoadingMovieState());

    try {
      final response = await movieServices.getMovie(event.movieId.toString());

      final movie = MovieEntity.fromResponse(response);

      final commentsResponse =
          await commentsServices.getMovieComment(movie.id!);

      movie.setComments(getComments(commentsResponse));

      emit(SuccessOnLoadingMovieState(movie: movie));
    } on DioException catch (dioException) {
      final exception = DioExceptionHelper().getException(dioException);

      emit(FailOnLoadingMovieState(exception: exception));
    }
  }

  List<MovieCommentEntity> getComments(Map<String, dynamic> response) {
    final List<MovieCommentEntity> comments = [];

    if (response['success']) {
      List<CommentResponse> commentsResponse = response['comments_response'];

      comments.addAll(
        commentsResponse
            .map((commentResponse) =>
                MovieCommentEntity.fromCommentResponse(commentResponse))
            .toList(),
      );
    }

    return comments;
  }
}
