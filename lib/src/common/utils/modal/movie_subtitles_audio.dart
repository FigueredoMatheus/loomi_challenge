import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/movie_player/widgets/modal_widgets/modal_body.dart';

showMovieSubtitleAudioModal() async {
  return await showModalBottomSheet(
    context: Get.context!,
    backgroundColor: MyThemes.get().kVeryDarkGrayColor,
    isScrollControlled: true,
    enableDrag: false,
    constraints: BoxConstraints(maxWidth: Get.width),
    builder: (_) {
      return Container(
        padding: const EdgeInsets.all(25),
        height: double.infinity,
        child: SubtitleAudioModalBody(),
      );
    },
  );
}
