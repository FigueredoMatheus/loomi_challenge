import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/entity/user_entity/user_entity.dart';
import 'package:loomi_challenge/src/models/response/comment/comment_response.dart';

part 'movie_comment_entity.g.dart';

@JsonSerializable()
class MovieCommentEntity {
  String? id;
  @JsonKey(name: 'comment_text')
  final String commentText;
  final UserEntity user;
  @JsonKey(name: 'create_at')
  final DateTime createAt;
  final int replies;
  @JsonKey(name: 'movie_id')
  final int movieId;

  MovieCommentEntity({
    required this.commentText,
    required this.user,
    required this.createAt,
    required this.replies,
    required this.movieId,
  });

  factory MovieCommentEntity.fromCommentResponse(
      CommentResponse commentResponse) {
    return MovieCommentEntity(
      commentText: commentResponse.comment.commentText,
      user: commentResponse.comment.user,
      createAt: commentResponse.comment.createAt,
      replies: commentResponse.comment.replies,
      movieId: commentResponse.comment.movieId,
    );
  }

  factory MovieCommentEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieCommentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCommentEntityToJson(this);
}
