import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/images_widgets/circle_avatar_profile_image.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';

class LeadingCommentTile extends StatefulWidget {
  final MovieCommentEntity comment;

  const LeadingCommentTile({super.key, required this.comment});

  @override
  State<LeadingCommentTile> createState() => _LeadingCommentTileState();
}

class _LeadingCommentTileState extends State<LeadingCommentTile> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatarProfileImage(
      user: widget.comment.user,
      containerSize: 50,
    );
  }
}
