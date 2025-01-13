import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/comment/widgets/comment_text_field.dart';

class CommentFieldWidget extends StatefulWidget {
  final MovieEntity movie;

  const CommentFieldWidget({super.key, required this.movie});

  @override
  State<CommentFieldWidget> createState() => _CommentFieldWidgetState();
}

class _CommentFieldWidgetState extends State<CommentFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 13),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: MyThemes.get().kGainsboroGrayColor.withOpacity(0.2),
            ),
          ),
        ),
        child: CommentTextField());
  }
}
