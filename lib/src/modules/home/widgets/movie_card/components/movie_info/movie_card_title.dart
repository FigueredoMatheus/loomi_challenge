import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/home/widgets/custon_loading_shimmer_style.dart';

class MovieCardTitle extends StatelessWidget {
  final MovieEntity? movie;

  const MovieCardTitle({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final isLoading = movie == null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: isLoading
          ? CustomLoadingShimmerStyle(
              width: 150,
              height: 20,
              bottomPadding: 15,
            )
          : Text(
              movie!.title,
              style: MyThemes.get().epilogueStyle.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
            ),
    );
  }
}
