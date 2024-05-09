import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/home/widgets/custon_loading_shimmer_style.dart';

class MovieCardSynopse extends StatelessWidget {
  final MovieEntity? movie;

  const MovieCardSynopse({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final isLoading = movie == null;

    return isLoading
        ? Column(
            children: [
              CustomLoadingShimmerStyle(
                  width: 260, height: 10, bottomPadding: 8),
              CustomLoadingShimmerStyle(
                  width: 260, height: 10, bottomPadding: 8),
              CustomLoadingShimmerStyle(
                  width: 260, height: 10, bottomPadding: 8),
              CustomLoadingShimmerStyle(
                  width: 260, height: 10, bottomPadding: 8),
              CustomLoadingShimmerStyle(
                  width: 260, height: 10, bottomPadding: 0),
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: Text(
              movie!.synopsis,
              style: MyThemes.get().epilogueStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          );
  }
}
