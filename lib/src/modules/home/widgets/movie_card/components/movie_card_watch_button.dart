import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/home/widgets/custon_loading_shimmer_style.dart';

class MovieCardWatchButton extends StatelessWidget {
  final MovieEntity? movie;

  const MovieCardWatchButton({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final isLoading = movie == null;

    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 20),
      child: Align(
        alignment: Alignment.center,
        child: isLoading
            ? CustomLoadingShimmerStyle(
                width: 207, height: 41.58, bottomPadding: 0)
            : CustomElevatedButton(
                label: 'Watch',
                onPressed: () => Get.toNamed(
                  RoutesNames.MOVIE_PLAYER_PAGE_VIEW,
                  arguments: movie,
                ),
              ),
      ),
    );
  }
}
