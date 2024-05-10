import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class MoviePlayerSubtitlesAudioCommentsOverlay extends StatelessWidget {
  final MoviePlayerSubtitlesAudioCommentsOverlayType type;

  const MoviePlayerSubtitlesAudioCommentsOverlay({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          getIconPath(),
          semanticsLabel: 'subtitle_audio_comments',
          fit: BoxFit.scaleDown,
          height: 30,
          width: 30,
        ),
        const SizedBox(width: 5),
        Text(
          getLabel(),
          style: MyThemes.get().epilogueStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }

  String getLabel() {
    switch (type) {
      case MoviePlayerSubtitlesAudioCommentsOverlayType.comments:
        return 'Comments';
      case MoviePlayerSubtitlesAudioCommentsOverlayType.subtitlesAudio:
      default:
        return 'subtitles / audio';
    }
  }

  String getIconPath() {
    switch (type) {
      case MoviePlayerSubtitlesAudioCommentsOverlayType.comments:
        return 'assets/icons/comments_icon.svg';
      case MoviePlayerSubtitlesAudioCommentsOverlayType.subtitlesAudio:
      default:
        return 'assets/icons/subtitle_audio_icon.svg';
    }
  }
}
