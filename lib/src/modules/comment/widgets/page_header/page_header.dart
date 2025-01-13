import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_back_button.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/page_header/title_header.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/page_header/trailing_header.dart';

class MovieCommentsPageHeader extends StatefulWidget {
  const MovieCommentsPageHeader({super.key});

  @override
  State<MovieCommentsPageHeader> createState() =>
      _MovieCommentsPageHeaderState();
}

class _MovieCommentsPageHeaderState extends State<MovieCommentsPageHeader> {
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
        final showBackBtn =
            isMovieCommentsPageView && !commentStore.editCommentMode;
        return Row(
          children: [
            if (showBackBtn) CustomBackButton(),
            CommentPageTitleHeader(),
            Spacer(),
            CommentPageTrailingHeader(),
          ],
        );
      },
    );
  }
}
