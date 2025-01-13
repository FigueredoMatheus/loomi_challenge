import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/extensions/date_extension.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';

class CommentTitleTile extends StatefulWidget {
  final MovieCommentEntity comment;

  const CommentTitleTile({super.key, required this.comment});

  @override
  State<CommentTitleTile> createState() => _CommentTitleTileState();
}

class _CommentTitleTileState extends State<CommentTitleTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.comment.user.username,
          style: Get.textTheme.titleLarge,
        ),
        const SizedBox(height: 5),
        Text(
          widget.comment.createAt.toCustomCommentDateFormat(),
          style: MyThemes.get().epilogueStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: MyThemes.get().kGrayColor,
              ),
        ),
      ],
    );
  }
}
