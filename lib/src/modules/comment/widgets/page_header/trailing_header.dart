import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/close_modal_button.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';

class CommentPageTrailingHeader extends StatefulWidget {
  const CommentPageTrailingHeader({super.key});

  @override
  State<CommentPageTrailingHeader> createState() =>
      _CommentPageTrailingHeaderState();
}

class _CommentPageTrailingHeaderState extends State<CommentPageTrailingHeader> {
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
        return commentStore.editCommentMode
            ? cancelEditCommentBtn()
            : isMovieCommentsPageView
                ? CommentPageTextCommentsInfo()
                : moviePlayerCloseCommentsBtn();
      },
    );
  }

  Widget moviePlayerCloseCommentsBtn() {
    return CustomCloseButton(
      onTap: getIt<MoviePlayerStore>().closeCommentsSection,
    );
  }

  Widget cancelEditCommentBtn() {
    return TextButton(
      onPressed: commentStore.cancelEditMode,
      child: Text(
        'Cancel',
        style: MyThemes.get().epilogueStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: MyThemes.get().kPurpleColor,
            ),
      ),
    );
  }

  Widget CommentPageTextCommentsInfo() {
    return Text(
      commentStore.hasError ? '' : '${commentStore.commentsCount} Comments',
      style: MyThemes.get().epilogueStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: MyThemes.get().kWhiteColor,
          ),
    );
  }
}
