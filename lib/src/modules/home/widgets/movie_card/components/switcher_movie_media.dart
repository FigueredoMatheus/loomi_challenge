import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/common/widgets/images_widgets/show_image_widget.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';

class MovieCardSwitcherMovieMedia extends StatefulWidget {
  final MovieEntity? movie;

  const MovieCardSwitcherMovieMedia({super.key, this.movie});

  @override
  State<MovieCardSwitcherMovieMedia> createState() =>
      _MovieCardSwitcherMovieMediaState();
}

class _MovieCardSwitcherMovieMediaState
    extends State<MovieCardSwitcherMovieMedia> {
  late final Timer timer;

  int _index = 0;

  int tansitionDuration = 3000;

  List<Widget> mediaList = [];

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  initTimer() {
    timer = Timer.periodic(Duration(milliseconds: tansitionDuration), (timer) {
      if (mediaList.isEmpty) return;
      setState(() {
        _index++;
        if (_index == mediaList.length) {
          _index = 0;
        }
      });
    });
  }

  initMediaList() {
    if (widget.movie == null) return;

    mediaList = [
      Container(
        key: Key('1'),
        child: CustomShowImageWidget(
          radius: 22,
          size: MediaQuery.of(context).size.width,
          imagePath: widget.movie!.posterImage,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initMediaList();

    final isLoading = widget.movie == null;

    return isLoading
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  Color(0xFF7C7C7C),
                  Color(0xFF4B2472),
                ],
              ),
            ),
          )
        : FittedBox(
            fit: BoxFit.fill,
            child: AnimatedSwitcher(
              switchInCurve: Curves.elasticInOut,

              duration: Duration(milliseconds: 1000),
              child: mediaList[_index],
              // transitionBuilder: (Widget child, Animation<double> animation) {
              //   return FadeTransition(
              //     opacity: animation,
              //     child: ScaleTransition(
              //       scale: animation.status == AnimationStatus.dismissed
              //           ? Tween<double>(begin: .5, end: 1).animate(animation)
              //           : AlwaysStoppedAnimation(1.0),
              //       child: child,
              //     ),
              //   );
              // },
            ),
          );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
