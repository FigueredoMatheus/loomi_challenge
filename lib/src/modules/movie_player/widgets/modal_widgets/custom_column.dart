import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';

class SubtitlesAudioCustomColumn extends StatelessWidget {
  final SubtitleAudioModalColumnType columnType;

  const SubtitlesAudioCustomColumn({super.key, required this.columnType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          getTitle(),
          style: MyThemes.get().epilogueStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 20),
        Column(
          children: List.generate(getOpstions().length, (index) {
            final isSelectedOption = index == 0;
            final option = getOpstions()[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: isSelectedOption ? const EdgeInsets.all(6) : null,
              decoration: BoxDecoration(
                color: isSelectedOption
                    ? MyThemes.get().kLightPurpleColor.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius:
                    isSelectedOption ? BorderRadius.circular(49) : null,
              ),
              child: Text(
                option,
                style: MyThemes.get().epilogueStyle.copyWith(
                      color: isSelectedOption
                          ? MyThemes.get().kPurpleColor
                          : MyThemes.get().kWhiteColor.withOpacity(0.45),
                      fontWeight:
                          isSelectedOption ? FontWeight.w500 : FontWeight.w600,
                    ),
              ),
            );
          }),
        ),
      ],
    );
  }

  String getTitle() {
    switch (columnType) {
      case SubtitleAudioModalColumnType.audio:
        return 'Audio';

      case SubtitleAudioModalColumnType.subtitles:
      default:
        return 'Subtitle';
    }
  }

  List<String> getOpstions() {
    final moviePlayerStore = getIt<MoviePlayerStore>();

    final languages = moviePlayerStore.movie.getSubtitlesAttributes;

    final audios = languages.map((element) => element.language).toList();
    final subtitles = languages.map((element) => element.language).toList();
    print('--- subtitles.length: ${subtitles.length}');

    switch (columnType) {
      case SubtitleAudioModalColumnType.audio:
        return audios;

      case SubtitleAudioModalColumnType.subtitles:
      default:
        subtitles.insert(0, 'Off');
        return subtitles;
    }
  }
}
