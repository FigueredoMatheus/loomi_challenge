import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comment_list_tile/comment_tile_widget.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comments_list/comments_end_list_widget.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comments_list/edit_comment_mode_widget.dart';

class CommentsListWidget extends StatefulWidget {
  const CommentsListWidget({super.key});

  @override
  State<CommentsListWidget> createState() => _CommentsListWidgetState();
}

class _CommentsListWidgetState extends State<CommentsListWidget> {
  late CommentStore commentStore;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    commentStore = getIt<CommentStore>();

    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        commentStore.fetchNextCommentsPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (context) {
          return commentStore.editCommentMode
              ? EditCommentsModeListWidget()
              : ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: commentStore.commentsCount + 1,
                  itemBuilder: (context, index) {
                    if (index == commentStore.comments.length) {
                      return CommentsListEndWidget();
                    }

                    final comment = commentStore.comments[index];
                    return CommentTileWidget(comment: comment);
                  },
                );
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    commentStore.onDispose();
    super.dispose();
  }
}
