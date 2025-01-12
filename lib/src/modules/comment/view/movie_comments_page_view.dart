import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';

class MovieCommentsPageView extends StatefulWidget {
  final MovieEntity movie;

  const MovieCommentsPageView({super.key, required this.movie});

  @override
  State<MovieCommentsPageView> createState() => _MovieCommentsPageViewState();
}

class _MovieCommentsPageViewState extends State<MovieCommentsPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + pageViewDefaultPadding,
          left: pageViewDefaultPadding,
          right: pageViewDefaultPadding,
          bottom: pageViewDefaultPadding,
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
