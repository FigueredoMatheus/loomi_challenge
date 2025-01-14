import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/home/bloc/home_bloc/home_page_bloc.dart';
import 'package:loomi_challenge/src/modules/home/widgets/movie_body.dart';

class HomePageViewMovieCard extends StatefulWidget {
  const HomePageViewMovieCard({super.key});

  @override
  State<HomePageViewMovieCard> createState() => _HomePageViewMovieCardState();
}

class _HomePageViewMovieCardState extends State<HomePageViewMovieCard> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(LoadMovieEvent(movieId: 1));
  }

  @override
  Widget build(BuildContext context) {
    final padding = ApplicationConstants.PAGE_VIEW_DEFAULT_PADDING;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: padding),
            child: Text(
              'Now Showing',
              style: MyThemes.get().epilogueStyle,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 10,
                left: padding,
                right: padding,
                bottom: padding,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(22),
              ),
              child: BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state is LoadingMovieState) {
                    return HomePageViewMovieCardBody();
                  }

                  if (state is ShowMovieState) {
                    return HomePageViewMovieCardBody(movie: state.movie);
                  }

                  if (state is FailOnLoadingMovieState) {
                    return Center(
                      child: Text(state.exception.title),
                    );
                  }

                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
