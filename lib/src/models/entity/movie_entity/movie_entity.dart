import 'package:loomi_challenge/src/models/movie_comment_model/movie_comment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
class MovieEntity {
  String? id;
  final String title;
  final String synopsis;
  final String genre;
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  final List<MovieCommentModel> comments;

  int get numberOfComments => comments.length;

  MovieCommentModel get mostRecenteComment =>
      comments.reduce((value, element) =>
          value.createAt.isAfter(element.createAt) ? value : element);

  MovieEntity({
    required this.title,
    required this.endDate,
    required this.genre,
    required this.id,
    required this.synopsis,
    required this.comments,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);
}
