import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/user_model/user_model.dart';

part 'movie_comment_model.g.dart';

@JsonSerializable()
class MovieCommentModel {
  @JsonKey(name: 'comment_id')
  String? commentId;
  final String comment;
  final UserModel user;
  @JsonKey(name: 'create_at')
  final DateTime createAt;
  final int replies;

  MovieCommentModel({
    required this.comment,
    required this.user,
    required this.createAt,
    required this.replies,
  });

  factory MovieCommentModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCommentModelToJson(this);
}
