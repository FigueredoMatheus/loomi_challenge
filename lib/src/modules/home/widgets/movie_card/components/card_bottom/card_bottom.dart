import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/card_bottom/rate_movie_widget.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/card_bottom/expires_date_widget.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/card_bottom/share_movie_widget.dart';

class MovieCardBottom extends StatelessWidget {
  final MovieEntity movie;

  const MovieCardBottom({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: MyThemes.get().kGainsboroGrayColor.withOpacity(0.2),
          height: 0,
        ),
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MovieCardBottomRateMovieWidget(movie: movie),
              const SizedBox(width: 30),
              MovieCardBottomShareMovieWidget(movie: movie),
              Spacer(),
              MovieCardBottomMovieExpiresDate(movie: movie),
            ],
          ),
        ),
      ],
    );
  }
}
