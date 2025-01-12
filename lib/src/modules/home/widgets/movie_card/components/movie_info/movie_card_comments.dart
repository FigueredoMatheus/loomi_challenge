import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/common/widgets/circle_avatar_profile_image.dart';
import 'package:loomi_challenge/src/modules/home/widgets/custon_loading_shimmer_style.dart';

class MovieCardComments extends StatefulWidget {
  final MovieEntity? movie;

  const MovieCardComments({super.key, required this.movie});

  @override
  State<MovieCardComments> createState() => _MovieCardCommentsState();
}

class _MovieCardCommentsState extends State<MovieCardComments> {
  late bool isLoading;

  @override
  Widget build(BuildContext context) {
    isLoading = widget.movie == null;
    return InkWell(
      onTap: isLoading
          ? null
          : () => Get.toNamed(
                RoutesNames.MOVIE_COMMENTS_PAGE_VIEW,
                arguments: widget.movie,
              ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                commentsText(),
                numberOfComments(),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [userImage(), const SizedBox(width: 8), comment()],
            ),
          ],
        ),
      ),
    );
  }

  Widget commentsText() {
    return isLoading
        ? CustomLoadingShimmerStyle(
            width: 80, height: 10, bottomPadding: 8, marginRight: 5)
        : Text('Comments ',
            style: MyThemes.get()
                .epilogueStyle
                .copyWith(fontSize: 12, fontWeight: FontWeight.w600));
  }

  Widget numberOfComments() {
    return isLoading
        ? CustomLoadingShimmerStyle(width: 30, height: 10, bottomPadding: 8)
        : Text(
            '${widget.movie!.numberOfComments}',
            style: MyThemes.get()
                .epilogueStyle
                .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
          );
  }

  Widget userImage() {
    return isLoading
        ? CustomLoadingShimmerStyle(width: 20, height: 20, bottomPadding: 8)
        : widget.movie!.hasComment
            ? CircleAvatarProfileImage(
                user: widget.movie!.mostRecenteComment.user,
                containerSize: 35,
              )
            : Container();
  }

  Widget comment() {
    return Expanded(
      child: isLoading
          ? CustomLoadingShimmerStyle(width: 230, height: 10, bottomPadding: 8)
          : widget.movie!.hasComment
              ? Text(
                  widget.movie!.mostRecenteComment.commentText,
                  overflow: TextOverflow.ellipsis,
                  style: MyThemes.get().epilogueStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                )
              : Container(),
    );
  }
}
