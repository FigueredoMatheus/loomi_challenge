import 'package:loomi_challenge/src/models/movie_comment_model/movie_comment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  String? id;
  final String title;
  final String sinopse;
  @JsonKey(name: 'genre')
  final List<String> genreList;
  @JsonKey(name: 'expires_date')
  final DateTime expiresDate;
  final List<MovieCommentModel> comments;

  int get numberOfComments => comments.length;

  MovieCommentModel get mostRecenteComment =>
      comments.reduce((value, element) =>
          value.createAt.isAfter(element.createAt) ? value : element);

  MovieModel({
    required this.title,
    required this.sinopse,
    required this.genreList,
    required this.expiresDate,
    required this.comments,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
