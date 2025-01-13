import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comment_field_widget.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comments_list.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/page_header.dart';

class MovieCommentsPageView extends StatefulWidget {
  final MovieEntity movie;

  const MovieCommentsPageView({super.key, required this.movie});

  @override
  State<MovieCommentsPageView> createState() => _MovieCommentsPageViewState();
}

class _MovieCommentsPageViewState extends State<MovieCommentsPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + pageViewDefaultPadding,
          left: pageViewDefaultPadding,
          right: pageViewDefaultPadding,
          bottom: pageViewDefaultPadding,
        ),
        child: Column(
          children: [
            MovieCommentsPageHeader(movie: widget.movie),
            CommentsListWidget(movie: widget.movie),
            CommentFieldWidget(movie: widget.movie),
          ],
        ),
      ),
    );
  }
}
