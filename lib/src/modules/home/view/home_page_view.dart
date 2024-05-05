import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/temp_file.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_card/movie_card.dart';
import 'package:loomi_challenge/src/modules/home/widgets/page_header.dart';

class HomePageViewModel extends StatelessWidget {
  const HomePageViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          children: [
            HomePageViewHeader(),
            HomePageViewMovieCard(movie: movie),
          ],
        ),
      ),
    );
  }
}
