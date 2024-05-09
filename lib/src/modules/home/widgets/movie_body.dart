import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/card_bottom/card_bottom.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/movie_card_watch_button.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/movie_info/movice_card_sinopse.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/movie_info/movie_card_comments.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/movie_info/movie_card_genre.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/movie_info/movie_card_title.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/components/switcher_movie_media.dart';

class HomePageViewMovieCardBody extends StatelessWidget {
  final MovieEntity? movie;

  const HomePageViewMovieCardBody({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieCardSwitcherMovieMedia(movie: movie),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieCardGenre(movie: movie),
                  MovieCardTitle(movie: movie),
                  MovieCardSynopse(movie: movie),
                  MovieCardComments(movie: movie),
                  MovieCardWatchButton(movie: movie),
                  MovieCardBottom(movie: movie),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
