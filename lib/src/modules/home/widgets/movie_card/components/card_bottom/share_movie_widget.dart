import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/home/widgets/custon_loading_shimmer_style.dart';
import 'package:share_plus/share_plus.dart';

class MovieCardBottomShareMovieWidget extends StatefulWidget {
  final MovieEntity? movie;
  const MovieCardBottomShareMovieWidget({super.key, required this.movie});

  @override
  State<MovieCardBottomShareMovieWidget> createState() =>
      _MovieCardBottomShareMovieWidgetState();
}

class _MovieCardBottomShareMovieWidgetState
    extends State<MovieCardBottomShareMovieWidget> {
  @override
  Widget build(BuildContext context) {
    final isLoading = widget.movie == null;

    return isLoading
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomLoadingShimmerStyle(
                  width: 22, height: 22, bottomPadding: 8),
              CustomLoadingShimmerStyle(width: 60, height: 7, bottomPadding: 5),
            ],
          )
        : InkWell(
            onTap: () => Share.share(widget.movie!.title),
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
                  style: MyThemes.get().epilogueStyle.copyWith(
                        color: MyThemes.get().kWhiteColor.withOpacity(0.45),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          );
  }
}
