import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comment_list_tile/leading_comment_tile.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comment_list_tile/subtitle_comment_tile.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comment_list_tile/title_comment_tile.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comment_list_tile/trailing_comment_tile.dart';

class CommentTileWidget extends StatefulWidget {
  final MovieCommentEntity comment;

  const CommentTileWidget({super.key, required this.comment});

  @override
  State<CommentTileWidget> createState() => _CommentTileWidgetState();
}

class _CommentTileWidgetState extends State<CommentTileWidget> {
  late CommentStore commentStore;

  @override
  void initState() {
    super.initState();
    commentStore = getIt<CommentStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: CommentTitleTile(comment: widget.comment),
        subtitle: SubtitleCommentTile(comment: widget.comment),
        titleAlignment: ListTileTitleAlignment.top,
        contentPadding: EdgeInsets.zero,
        leading: LeadingCommentTile(comment: widget.comment),
        trailing: TrailingCommentTile(comment: widget.comment),
      ),
    );
  }
}
