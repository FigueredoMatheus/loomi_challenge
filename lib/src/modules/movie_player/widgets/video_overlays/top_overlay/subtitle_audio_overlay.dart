import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/common/utils/modal/movie_subtitles_audio.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';

class MoviePlayerSubtitlesAudioCommentsOverlay extends StatefulWidget {
  final MoviePlayerSubtitlesAudioCommentsOverlayType type;

  const MoviePlayerSubtitlesAudioCommentsOverlay({
    super.key,
    required this.type,
  });

  @override
  State<MoviePlayerSubtitlesAudioCommentsOverlay> createState() =>
      _MoviePlayerSubtitlesAudioCommentsOverlayState();
}

class _MoviePlayerSubtitlesAudioCommentsOverlayState
    extends State<MoviePlayerSubtitlesAudioCommentsOverlay> {
  late MoviePlayerStore moviePlayerStore;
  @override
  void initState() {
    super.initState();
    moviePlayerStore = getIt<MoviePlayerStore>();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getOnTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            getIconPath(),
            semanticsLabel: 'subtitle_audio_comments',
            fit: BoxFit.scaleDown,
            height: 30,
            width: 30,
          ),
          Text(
            getLabel(),
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  String getLabel() {
    switch (widget.type) {
      case MoviePlayerSubtitlesAudioCommentsOverlayType.comments:
        return 'Comments';
      case MoviePlayerSubtitlesAudioCommentsOverlayType.subtitlesAudio:
      default:
        return 'subtitles / audio';
    }
  }

  String getIconPath() {
    switch (widget.type) {
      case MoviePlayerSubtitlesAudioCommentsOverlayType.comments:
        return 'assets/icons/comments_icon.svg';
      case MoviePlayerSubtitlesAudioCommentsOverlayType.subtitlesAudio:
      default:
        return 'assets/icons/subtitle_audio_icon.svg';
    }
  }

  getOnTap() {
    switch (widget.type) {
      case MoviePlayerSubtitlesAudioCommentsOverlayType.comments:
        return commentsOnTap();
      case MoviePlayerSubtitlesAudioCommentsOverlayType.subtitlesAudio:
      default:
        return subtitleAudioOnTap();
    }
  }

  subtitleAudioOnTap() {
    moviePlayerStore.hasMovieSubtitles
        ? showMovieSubtitleAudioModal()
        : MyAppSnackBar(
                message: 'No subtitles or audio',
                snackBarType: SnackBarType.alert)
            .show();
  }

  commentsOnTap() {
    moviePlayerStore.openCommentsSection();
  }
}
