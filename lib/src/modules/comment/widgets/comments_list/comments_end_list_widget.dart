import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/widgets/custom_loading_widget.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';

class CommentsListEndWidget extends StatefulWidget {
  const CommentsListEndWidget({super.key});

  @override
  State<CommentsListEndWidget> createState() => _CommentsListEndWidgetState();
}

class _CommentsListEndWidgetState extends State<CommentsListEndWidget> {
  late CommentStore commentStore;

  @override
  void initState() {
    super.initState();
    commentStore = getIt<CommentStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return commentStore.hasOnFetchMoreCommentsErrorMessage
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    commentStore.fetchMoreCommentsErrorMessage!,
                    style: Get.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : commentStore.hasMoreUnloadedComments
                ? Center(child: CustomLoadingWidget(loadingSize: 45))
                : Container();
      },
    );
  }
}
