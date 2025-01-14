import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comment_list_tile/comment_tile_widget.dart';

class EditCommentsModeListWidget extends StatefulWidget {
  const EditCommentsModeListWidget({super.key});

  @override
  State<EditCommentsModeListWidget> createState() =>
      _EditCommentsModeListWidgetState();
}

class _EditCommentsModeListWidgetState
    extends State<EditCommentsModeListWidget> {
  late CommentStore commentStore;

  @override
  void initState() {
    super.initState();
    commentStore = getIt<CommentStore>();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: List.generate([1].length, (index) {
        final comment = commentStore.commentToBeEdited;
        return CommentTileWidget(comment: comment);
      }),
    );
  }
}
