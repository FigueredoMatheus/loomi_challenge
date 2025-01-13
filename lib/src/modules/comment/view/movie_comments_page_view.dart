import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_challenge/src/common/widgets/custom_loading_widget.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comment_text_field.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comments_list.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/error_widget.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/page_header/page_header.dart';

class MovieCommentsPageView extends StatefulWidget {
  final MovieEntity movie;

  const MovieCommentsPageView({super.key, required this.movie});

  @override
  State<MovieCommentsPageView> createState() => _MovieCommentsPageViewState();
}

class _MovieCommentsPageViewState extends State<MovieCommentsPageView> {
  late CommentStore commentStore;

  @override
  void initState() {
    super.initState();
    commentStore = getIt<CommentStore>();

    commentStore.init(widget.movie);

    commentStore.loadMovieComments();
  }

  @override
  void dispose() {
    super.dispose();
    commentStore.onDispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + pageViewDefaultPadding,
            left: pageViewDefaultPadding,
            right: pageViewDefaultPadding,
            bottom: pageViewDefaultPadding,
          ),
          child: Observer(
            builder: (context) {
              return commentStore.isLoadingMovieComments
                  ? Center(child: CustomLoadingWidget())
                  : commentStore.hasError
                      ? CommentPageErrorWidget()
                      : Column(
                          children: [
                            MovieCommentsPageHeader(),
                            CommentsListWidget(),
                            CommentTextField(),
                          ],
                        );
            },
          )),
    );
  }
}
