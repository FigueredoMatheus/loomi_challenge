import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comment_tile_widget.dart';

class CommentsListWidget extends StatelessWidget {
  final MovieEntity movie;

  const CommentsListWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: List.generate(movie.numberOfComments, (index) {
          final comment = movie.comments[index];

          return CommentTileWidget(comment: comment);
        }),
      ),
    );
  }
}
