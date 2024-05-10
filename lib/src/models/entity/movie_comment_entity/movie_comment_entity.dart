import 'package:json_annotation/json_annotation.dart';

part 'movie_comment_entity.g.dart';

@JsonSerializable()
class MovieCommentEntity {
  final int id;
  final String comment;
  final String username;
  @JsonKey(name: 'image')
  final String userImage;
  final int replies;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'create_at')
  final DateTime createAt;

  MovieCommentEntity({
    required this.id,
    required this.username,
    required this.userImage,
    required this.comment,
    required this.createAt,
    required this.replies,
    required this.userId,
  });

  factory MovieCommentEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieCommentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCommentEntityToJson(this);
}
