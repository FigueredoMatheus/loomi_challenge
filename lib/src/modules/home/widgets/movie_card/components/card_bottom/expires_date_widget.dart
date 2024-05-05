import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/utils/extensions/date_extension.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';
import 'package:loomi_challenge/src/models/movie_model/movie_model.dart';

class MovieCardBottomMovieExpiresDate extends StatelessWidget {
  final MovieModel movie;

  const MovieCardBottomMovieExpiresDate({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Available until\n',
        style: MyAppKColors.movieCardBottomExpiresDateLabel(),
        children: [
          TextSpan(
            text: movie.expiresDate.monthDayYearFormt(),
            style: MyAppKColors.movieCardBottomExpiresDate(),
          ),
        ],
      ),
    );
  }
}
