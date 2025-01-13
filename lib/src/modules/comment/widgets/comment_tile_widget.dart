import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/images_widgets/circle_avatar_profile_image.dart';
import 'package:loomi_challenge/src/core/helpers/extensions/on_datetime_extension.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';

class CommentTileWidget extends StatefulWidget {
  final MovieCommentEntity comment;

  const CommentTileWidget({super.key, required this.comment});

  @override
  State<CommentTileWidget> createState() => _CommentTileWidgetState();
}

class _CommentTileWidgetState extends State<CommentTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: title(),
        subtitle: subtitle(),
        titleAlignment: ListTileTitleAlignment.top,
        contentPadding: EdgeInsets.zero,
        leading: leading(),
        trailing: trailingIcon(),
      ),
    );
  }

  Widget trailingIcon() {
    return InkWell(
      onTap: () {},
      child: InkWell(child: Icon(Icons.more_vert)),
    );
  }

  Widget leading() {
    return CircleAvatarProfileImage(
      user: widget.comment.user,
      containerSize: 50,
    );
  }

  Widget title() {
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

  Widget subtitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
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
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.arrow_drop_down,
                color: MyThemes.get().kPurpleColor,
              ),
              Text(
                'View 12 replies',
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
        ],
      ),
    );
  }
}
