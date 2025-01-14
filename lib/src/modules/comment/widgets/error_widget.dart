import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/page_header/page_header.dart';

class CommentPageErrorWidget extends StatefulWidget {
  const CommentPageErrorWidget({super.key});

  @override
  State<CommentPageErrorWidget> createState() => _CommentPageErrorWidgetState();
}

class _CommentPageErrorWidgetState extends State<CommentPageErrorWidget> {
  late CommentStore commentStore;

  @override
  void initState() {
    super.initState();
    commentStore = getIt<CommentStore>();
  }

  @override
  void dispose() {
    super.dispose();
    commentStore.onDispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MovieCommentsPageHeader(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                commentStore.errorMessage!,
                style: Get.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ElevatedButton(
                  onPressed: commentStore.getMovieComments,
                  child: Text('Try Again'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
