import 'package:loomi_challenge/src/models/movie_comment_model/movie_comment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  String? id;
  final String title;
  final String sinopse;
  final String genre;
  final DateTime expiresDate;
  final List<MovieCommentModel> comments;

  MovieModel({
    required this.title,
    required this.sinopse,
    required this.genre,
    required this.expiresDate,
    required this.comments,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
