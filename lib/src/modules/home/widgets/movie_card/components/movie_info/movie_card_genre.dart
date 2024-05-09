import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/home/widgets/custon_loading_shimmer_style.dart';

class MovieCardGenre extends StatelessWidget {
  final MovieEntity? movie;
  const MovieCardGenre({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final isLoading = movie == null;

    return isLoading
        ? CustomLoadingShimmerStyle(
            width: 100,
            height: 15,
            bottomPadding: 10,
          )
        : Text(
            movie?.genre ?? 'movie_genre',
            maxLines: 2,
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
          );
  }
}
