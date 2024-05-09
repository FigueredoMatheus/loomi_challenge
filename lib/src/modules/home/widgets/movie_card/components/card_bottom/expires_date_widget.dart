import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/utils/extensions/date_extension.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/home/widgets/custon_loading_shimmer_style.dart';

class MovieCardBottomMovieExpiresDate extends StatelessWidget {
  final MovieEntity? movie;

  const MovieCardBottomMovieExpiresDate({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final isLoading = movie == null;
    return isLoading
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomLoadingShimmerStyle(width: 65, height: 8, bottomPadding: 8),
              CustomLoadingShimmerStyle(width: 65, height: 8, bottomPadding: 0),
            ],
          )
        : RichText(
            text: TextSpan(
              text: 'Available until\n',
              style: MyThemes.get().epilogueStyle.copyWith(
                    color: MyThemes.get().kWhiteColor.withOpacity(0.45),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
              children: [
                TextSpan(
                  text: movie!.endDate.monthDayYearFormt(),
                  style: MyThemes.get().epilogueStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: MyThemes.get().kPurpleColor,
                      ),
                ),
              ],
            ),
          );
  }
}
