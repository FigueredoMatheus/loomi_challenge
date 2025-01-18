import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_loading_widget.dart';

class LoadingMovieSubtitlesWidget extends StatelessWidget {
  const LoadingMovieSubtitlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomLoadingWidget(disableBackgroundColor: true),
    );
  }
}
