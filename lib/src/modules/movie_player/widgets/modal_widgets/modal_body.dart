import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/modal_widgets/close_modal_button.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/modal_widgets/custom_column.dart';

class SubtitleAudioModalBody extends StatelessWidget {
  const SubtitleAudioModalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubtitleAudioCloseModalButton(),
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubtitlesAudioCustomColumn(
                columnType: SubtitleAudioModalColumnType.audio),
            Spacer(),
            SubtitlesAudioCustomColumn(
                columnType: SubtitleAudioModalColumnType.subtitles),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
