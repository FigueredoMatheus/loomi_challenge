import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comments_body.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';

class MoviePlayerCommentsCard extends StatelessWidget {
  const MoviePlayerCommentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final moviePlayerStore = getIt<MoviePlayerStore>();
    return Observer(builder: (context) {
      return AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final slideAnimation = Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset(0.0, 0.0),
          ).animate(animation);
          return SlideTransition(
            position: slideAnimation,
            child: child,
          );
        },
        child: moviePlayerStore.isCommetsDisplayed
            ? SizedBox(
                width: MediaQuery.of(context).size.width *
                    ApplicationConstants.MOVIE_PLAYER_COMMENTS_WIDTH_FACTOR,
                child: MovieCommentsBody(movie: moviePlayerStore.movie),
              )
            : SizedBox.shrink(
                key: ValueKey('empty_space'),
              ),
      );
    });
  }
}
