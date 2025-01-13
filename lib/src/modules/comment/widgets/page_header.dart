import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_back_button.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';

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
    return Row(
      children: [
        if (isMovieCommentsPageView) CustomBackButton(),
        headerTitle(),
        Spacer(),
        headerTrailing(),
      ],
    );
  }

  Widget headerTitle() {
    return Observer(
      builder: (context) {
        return Text(
          isMovieCommentsPageView
              ? commentStore.movie.title
              : '${commentStore.commentsCount} Comments',
          style: MyThemes.get().epilogueStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: isMovieCommentsPageView ? 19.8 : 16,
              ),
        );
      },
    );
  }

  Widget headerTrailing() {
    return InkWell(
        onTap: isMovieCommentsPageView ? null : () {},
        child: Observer(builder: (context) {
          return Text(
            isMovieCommentsPageView
                ? '${commentStore.commentsCount} Comments'
                : 'Close',
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: isMovieCommentsPageView ? 15.4 : 14,
                  color: isMovieCommentsPageView
                      ? MyThemes.get().kWhiteColor
                      : MyThemes.get().kPurpleColor,
                ),
          );
        }));
  }
}
