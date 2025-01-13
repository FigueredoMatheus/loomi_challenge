import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';

class SubtitleCommentTile extends StatefulWidget {
  final MovieCommentEntity comment;

  const SubtitleCommentTile({super.key, required this.comment});

  @override
  State<SubtitleCommentTile> createState() => _SubtitleCommentTileState();
}

class _SubtitleCommentTileState extends State<SubtitleCommentTile> {
  late CommentStore commentStore;
  @override
  void initState() {
    super.initState();
    commentStore = getIt<CommentStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Observer(
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.comment.commentText,
                style: MyThemes.get().epilogueStyle.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: MyThemes.get().kWhiteColor,
                    ),
              ),
              getCommentReplyWidget(),
            ],
          );
        },
      ),
    );
  }

  Widget getCommentReplyWidget() {
    return commentStore.editCommentMode
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_drop_down,
                  color: MyThemes.get().kPurpleColor,
                ),
                Text(
                  'View ${widget.comment.replies} replies',
                  style: MyThemes.get().epilogueStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: MyThemes.get().kPurpleColor,
                      ),
                ),
                const SizedBox(width: 8),
                Text(
                  'REPLY',
                  style: MyThemes.get().epilogueStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: MyThemes.get().kGrayColor,
                      ),
                ),
              ],
            ),
          );
  }
}

/*

    Row(
            children: [
              CustomLoadingWidget(loadingSize: 30),
              Text(
                'Enviando...',
                style: MyThemes.get().epilogueStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: MyThemes.get().kDarkGrayColor,
                    ),
              ),
            ],
          ),

*/