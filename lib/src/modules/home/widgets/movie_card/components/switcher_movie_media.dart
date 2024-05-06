import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieCardSwitcherMovieMedia extends StatefulWidget {
  const MovieCardSwitcherMovieMedia({super.key});

  @override
  State<MovieCardSwitcherMovieMedia> createState() =>
      _MovieCardSwitcherMovieMediaState();
}

class _MovieCardSwitcherMovieMediaState
    extends State<MovieCardSwitcherMovieMedia> {
  late final Timer timer;

  int _index = 0;

  int tansitionDuration = 3000;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: tansitionDuration), (timer) {
      setState(() {
        _index++;
        if (_index == images.length) {
          _index = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  final images = [
    Container(
      child: ClipRRect(
        key: Key('1'),
        borderRadius: BorderRadius.circular(22),
        child: Image.asset(
          'assets/images/Barbie movie image.png',
        ),
      ),
    ),
    Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        key: Key('2'),
        child: Image.asset(
          'assets/images/image.png',
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeOut,
        duration: Duration(milliseconds: 300),
        child: images[_index],
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
}
