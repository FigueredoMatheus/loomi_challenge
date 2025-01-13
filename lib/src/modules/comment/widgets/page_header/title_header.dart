import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';

class CommentPageTitleHeader extends StatefulWidget {
  const CommentPageTitleHeader({super.key});

  @override
  State<CommentPageTitleHeader> createState() => _CommentPageTitleHeaderState();
}

class _CommentPageTitleHeaderState extends State<CommentPageTitleHeader> {
  late bool isMovieCommentsPageView;
  late CommentStore commentStore;
  @override
  void initState() {
    super.initState();
    commentStore = getIt<CommentStore>();

    isMovieCommentsPageView =
        Get.currentRoute == RoutesNames.MOVIE_COMMENTS_PAGE_VIEW;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Text(
          getText(),
          style: MyThemes.get().epilogueStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: isMovieCommentsPageView ? 19.8 : 16,
              ),
        );
      },
    );
  }

  String getText() {
    if (commentStore.editCommentMode) {
      return 'Edit Comment';
    } else if (isMovieCommentsPageView) {
      return commentStore.movie.title;
    } else {
      return '${commentStore.commentsCount} Comments';
    }
  }
}
