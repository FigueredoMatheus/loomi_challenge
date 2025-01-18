import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/images_widgets/circle_avatar_profile_image.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';

class LeadingCommentTile extends StatefulWidget {
  final MovieCommentEntity comment;

  const LeadingCommentTile({super.key, required this.comment});

  @override
  State<LeadingCommentTile> createState() => _LeadingCommentTileState();
}

class _LeadingCommentTileState extends State<LeadingCommentTile> {
  late bool isMovieCommentsPageView;
  @override
  void initState() {
    super.initState();

    isMovieCommentsPageView =
        Get.currentRoute == RoutesNames.MOVIE_COMMENTS_PAGE_VIEW;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatarProfileImage(
      username: widget.comment.user.username,
      image: widget.comment.user.image,
      containerSize: isMovieCommentsPageView ? 50 : 35,
    );
  }
}
