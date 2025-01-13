import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/entity/user_entity/user_entity.dart';

part 'movie_comment_entity.g.dart';

@JsonSerializable()
class MovieCommentEntity {
  String? id;
  @JsonKey(name: 'comment_text')
  String commentText;
  final UserEntity user;
  @JsonKey(name: 'create_at')
  final DateTime createAt;
  final int replies;
  @JsonKey(name: 'movie_id')
  final int movieId;

  MovieCommentEntity({
    this.id,
    required this.commentText,
    required this.user,
    required this.createAt,
    required this.replies,
    required this.movieId,
  });

  setId(String id) {
    this.id = id;
  }

  setCommentText(String text) {
    this.commentText = text;
  }

  factory MovieCommentEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieCommentEntityFromJson(json);

  Map<String, dynamic> toJson() {
    final json = _$MovieCommentEntityToJson(this);
    json['user'] = user.toJson();
    return json;
  }
}
