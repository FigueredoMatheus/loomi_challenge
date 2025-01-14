import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/common/utils/modal/open_modal_bottom_sheet.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comment_actions_modal_body.dart';

class TrailingCommentTile extends StatefulWidget {
  final MovieCommentEntity comment;

  const TrailingCommentTile({super.key, required this.comment});

  @override
  State<TrailingCommentTile> createState() => _TrailingCommentTileState();
}

class _TrailingCommentTileState extends State<TrailingCommentTile> {
  late CommentStore commentStore;

  @override
  void initState() {
    super.initState();
    commentStore = getIt<CommentStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return commentStore.editCommentMode ||
                (!widget.comment.isCommentEdited &&
                    !widget.comment.isCommentSent)
            ? Container(width: 1)
            : InkWell(
                onTap: () {
                  openModalBottomSheet(
                    title: 'Comment',
                    child: CommentActionsModalBody(comment: widget.comment),
                  );
                },
                child: InkWell(child: Icon(Icons.more_vert)),
              );
      },
    );
  }
}
