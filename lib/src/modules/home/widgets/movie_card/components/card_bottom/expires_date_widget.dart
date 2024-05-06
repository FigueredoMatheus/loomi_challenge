import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/utils/extensions/date_extension.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/movie_model/movie_model.dart';

class MovieCardBottomMovieExpiresDate extends StatelessWidget {
  final MovieModel movie;

  const MovieCardBottomMovieExpiresDate({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Available until\n',
        style: MyThemes.get().epilogueStyle.copyWith(
              color: MyThemes.get().kWhiteColor.withOpacity(0.45),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
        children: [
          TextSpan(
            text: movie.expiresDate.monthDayYearFormt(),
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
