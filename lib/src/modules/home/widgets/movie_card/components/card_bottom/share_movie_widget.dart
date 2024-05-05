import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';
import 'package:loomi_challenge/src/models/movie_model/movie_model.dart';
import 'package:share_plus/share_plus.dart';

class MovieCardBottomShareMovieWidget extends StatefulWidget {
  final MovieModel movie;
  const MovieCardBottomShareMovieWidget({super.key, required this.movie});

  @override
  State<MovieCardBottomShareMovieWidget> createState() =>
      _MovieCardBottomShareMovieWidgetState();
}

class _MovieCardBottomShareMovieWidgetState
    extends State<MovieCardBottomShareMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Share.share(widget.movie.title),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/rate_button_icon.svg',
            semanticsLabel: 'Share',
            fit: BoxFit.scaleDown,
            height: 30,
            width: 30,
          ),
          Text(
            'Gift to someone?',
            style: MyAppKColors.movieCardBottomButton(),
          ),
        ],
      ),
    );
  }
}
