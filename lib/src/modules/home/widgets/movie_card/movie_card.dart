import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';
import 'package:loomi_challenge/src/models/movie_model/movie_model.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/card_bottom/card_bottom.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/movice_card_sinopse.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/movie_card_comments.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/movie_card_genre.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/movie_card_title.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/movie_card_watch_button.dart';

class HomePageViewMovieCard extends StatelessWidget {
  final MovieModel movie;

  const HomePageViewMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: pageViewDefaultPadding),
            child: Text(
              'Now Showing',
              style: MyAppKColors.title1(),
            ),
          ), // TODO implement correct fonts
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 10,
                left: pageViewDefaultPadding,
                right: pageViewDefaultPadding,
                bottom: pageViewDefaultPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: MyAppKColors.kMovieCardBorderColor),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieCardGenre(genreList: movie.genreList),
                        MovieCardTitle(title: movie.title),
                        MovieCardSinopse(sinopse: movie.sinopse),
                        MovieCardComments(movie: movie),
                        MovieCardWatchButton(movie: movie),
                      ],
                    ),
                  ),
                  MovieCardBottom(movie: movie),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
