import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_back_button.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';

class MovieCommentsPageHeader extends StatefulWidget {
  final MovieEntity movie;

  const MovieCommentsPageHeader({super.key, required this.movie});

  @override
  State<MovieCommentsPageHeader> createState() =>
      _MovieCommentsPageHeaderState();
}

class _MovieCommentsPageHeaderState extends State<MovieCommentsPageHeader> {
  late bool isMovieCommentsPageView;

  @override
  void initState() {
    super.initState();
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
    return Text(
      isMovieCommentsPageView
          ? widget.movie.title
          : '${widget.movie.numberOfComments} Comments',
      style: MyThemes.get().epilogueStyle.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: isMovieCommentsPageView ? 19.8 : 16,
          ),
    );
  }

  Widget headerTrailing() {
    return InkWell(
      onTap: isMovieCommentsPageView ? null : () {},
      child: Text(
        isMovieCommentsPageView
            ? '${widget.movie.numberOfComments} Comments'
            : 'Close',
        style: MyThemes.get().epilogueStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: isMovieCommentsPageView ? 15.4 : 14,
              color: isMovieCommentsPageView
                  ? MyThemes.get().kWhiteColor
                  : MyThemes.get().kPurpleColor,
            ),
      ),
    );
  }
}
