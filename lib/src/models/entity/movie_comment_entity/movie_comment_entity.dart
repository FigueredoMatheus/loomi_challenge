import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/entity/user_entity/user_entity.dart';

part 'movie_comment_entity.g.dart';

@JsonSerializable()
class MovieCommentEntity {
  String? id;
  final String comment;
  final UserEntity user;
  @JsonKey(name: 'create_at')
  final DateTime createAt;
  final int replies;

  MovieCommentEntity({
    required this.comment,
    required this.user,
    required this.createAt,
    required this.replies,
  });

  factory MovieCommentEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieCommentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCommentEntityToJson(this);
}
