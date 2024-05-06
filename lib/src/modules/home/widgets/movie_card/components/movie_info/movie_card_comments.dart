import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/movie_model/movie_model.dart';
import 'package:loomi_challenge/src/common/widgets/circle_avatar_profile_image.dart';

class MovieCardComments extends StatelessWidget {
  final MovieModel movie;

  const MovieCardComments({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comments 1.322',
            style: MyThemes.get().epilogueStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              CircleAvatarProfileImage(
                user: movie.mostRecenteComment.user,
                containerSize: 35,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  movie.mostRecenteComment.comment,
                  overflow: TextOverflow.ellipsis,
                  style: MyThemes.get().epilogueStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
