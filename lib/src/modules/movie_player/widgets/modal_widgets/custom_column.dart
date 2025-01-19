import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';

class SubtitlesAudioCustomColumn extends StatefulWidget {
  final SubtitleAudioModalColumnType columnType;

  const SubtitlesAudioCustomColumn({super.key, required this.columnType});

  @override
  State<SubtitlesAudioCustomColumn> createState() =>
      _SubtitlesAudioCustomColumnState();
}

class _SubtitlesAudioCustomColumnState
    extends State<SubtitlesAudioCustomColumn> {
  late MoviePlayerStore moviePlayerStore;
  late List<String> listOptions;
  late int currentSelectedOptionIndex;
  late bool isSubtitles;
  @override
  void initState() {
    super.initState();

    moviePlayerStore = getIt<MoviePlayerStore>();

    isSubtitles = widget.columnType == SubtitleAudioModalColumnType.subtitles;

    listOptions = isSubtitles
        ? moviePlayerStore.controller.subtitlesAvailable
        : moviePlayerStore.controller.audioAvailable;
  }

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
        Observer(builder: (context) {
          currentSelectedOptionIndex =
              widget.columnType == SubtitleAudioModalColumnType.audio
                  ? moviePlayerStore.currentAudioIndex
                  : moviePlayerStore.currentSubtitleIndex;

          return Column(
            children: List.generate(listOptions.length, (index) {
              final isSelectedOption = index == currentSelectedOptionIndex;

              final option = listOptions[index];

              return InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => isSubtitles
                    ? moviePlayerStore.setCurrentSubtitleIndex(index)
                    : moviePlayerStore.setCurrentAudioIndex(index),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: isSelectedOption ? const EdgeInsets.all(6) : null,
                  decoration: BoxDecoration(
                    color: isSelectedOption
                        ? MyThemes.get().kLightPurpleColor.withOpacity(0.2)
                        : Colors.transparent,
                    borderRadius:
                        isSelectedOption ? BorderRadius.circular(30) : null,
                  ),
                  child: Text(
                    option,
                    style: MyThemes.get().epilogueStyle.copyWith(
                          color: isSelectedOption
                              ? MyThemes.get().kPurpleColor
                              : MyThemes.get().kWhiteColor.withOpacity(0.45),
                          fontWeight: isSelectedOption
                              ? FontWeight.w500
                              : FontWeight.w600,
                        ),
                  ),
                ),
              );
            }),
          );
        }),
      ],
    );
  }

  String getTitle() {
    switch (widget.columnType) {
      case SubtitleAudioModalColumnType.audio:
        return 'Audio';

      case SubtitleAudioModalColumnType.subtitles:
      default:
        return 'Subtitle';
    }
  }
}
