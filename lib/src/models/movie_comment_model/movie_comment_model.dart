import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/entity/user_model/user_entity.dart';

part 'movie_comment_model.g.dart';

@JsonSerializable()
class MovieCommentModel {
  String? id;
  final String comment;
  final UserEntity user;
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
