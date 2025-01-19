import 'package:flutter/material.dart';

class UserSettingsPageViewHistorySectionList extends StatefulWidget {
  const UserSettingsPageViewHistorySectionList({super.key});

  @override
  State<UserSettingsPageViewHistorySectionList> createState() =>
      _UserSettingsPageViewHistorySectionListState();
}

class _UserSettingsPageViewHistorySectionListState
    extends State<UserSettingsPageViewHistorySectionList> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final historyList = <String>[
      'assets/images/Barbie movie image.png',
      'assets/images/everything_everywhere_image.png'
    ];
    return Container(
      width: double.infinity,
      height: 100,
      child: Scrollbar(
        thumbVisibility: true,
        controller: scrollController,
        scrollbarOrientation: ScrollbarOrientation.bottom,
        radius: Radius.circular(10),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => SizedBox(),
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: historyList.length,
          itemBuilder: (context, index) {
            final bool applyMargin = index < historyList.length - 1;

            final movieImage = historyList[index];

            return Container(
              margin: EdgeInsets.fromLTRB(0, 0, applyMargin ? 10 : 5, 5),
              width: 150,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(movieImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
            );
          },
        ),
      ),
    );
  }
}
