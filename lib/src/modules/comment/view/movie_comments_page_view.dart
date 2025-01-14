import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comments_body.dart';
import 'package:loomi_challenge/src/modules/home/bloc/home_bloc/home_page_bloc.dart';

class MovieCommentsPageView extends StatefulWidget {
  final MovieEntity movie;

  const MovieCommentsPageView({super.key, required this.movie});

  @override
  State<MovieCommentsPageView> createState() => _MovieCommentsPageViewState();
}

class _MovieCommentsPageViewState extends State<MovieCommentsPageView> {
  late CommentStore commentStore;

  @override
  void initState() {
    super.initState();
    commentStore = getIt<CommentStore>();
  }

  @override
  void dispose() {
    super.dispose();

    commentStore.onDispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (_) => context
          .read<HomePageBloc>()
          .add(UpdateMovieCommentsEvent(comments: commentStore.comments)),
      child: Scaffold(
        body: MovieCommentsBody(movie: widget.movie),
      ),
    );
  }
}
