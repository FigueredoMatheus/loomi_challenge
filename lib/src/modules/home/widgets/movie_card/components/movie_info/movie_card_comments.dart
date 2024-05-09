import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/common/widgets/circle_avatar_profile_image.dart';
import 'package:loomi_challenge/src/modules/home/widgets/custon_loading_shimmer_style.dart';

class MovieCardComments extends StatelessWidget {
  final MovieEntity? movie;

  const MovieCardComments({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final isLoading = movie == null;
    return !isLoading && !movie!.hasComment
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    commentsText(isLoading),
                    numberOfComments(isLoading),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    userImage(isLoading),
                    const SizedBox(width: 8),
                    comment(isLoading)
                  ],
                ),
              ],
            ),
          );
  }

  Widget commentsText(bool isLoading) {
    return isLoading
        ? CustomLoadingShimmerStyle(
            width: 80, height: 10, bottomPadding: 8, marginRight: 5)
        : Text('Comments ',
            style: MyThemes.get()
                .epilogueStyle
                .copyWith(fontSize: 12, fontWeight: FontWeight.w600));
  }

  Widget numberOfComments(bool isLoading) {
    return isLoading
        ? CustomLoadingShimmerStyle(width: 30, height: 10, bottomPadding: 8)
        : Text(
            '1.322',
            style: MyThemes.get()
                .epilogueStyle
                .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
          );
  }

  Widget userImage(bool isLoading) {
    return isLoading
        ? CustomLoadingShimmerStyle(width: 20, height: 20, bottomPadding: 8)
        : CircleAvatarProfileImage(
            user: movie!.mostRecenteComment.user, containerSize: 35);
  }

  Widget comment(bool isLoading) {
    return Expanded(
      child: isLoading
          ? CustomLoadingShimmerStyle(width: 230, height: 10, bottomPadding: 8)
          : Text(
              movie!.mostRecenteComment.comment,
              overflow: TextOverflow.ellipsis,
              style: MyThemes.get().epilogueStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
            ),
    );
  }
}
