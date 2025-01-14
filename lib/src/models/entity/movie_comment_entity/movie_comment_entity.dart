import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/serialization_helper.dart';
import 'package:loomi_challenge/src/models/entity/user_entity/user_entity.dart';

part 'movie_comment_entity.g.dart';

@JsonSerializable()
class MovieCommentEntity {
  String? id;
  @JsonKey(name: 'comment_text')
  String commentText;
  final int replies;
  @JsonKey(name: 'movie_id')
  final int movieId;
  @JsonKey(
    toJson: SerializationHelper.userToJson,
    fromJson: SerializationHelper.userFromJson,
  )
  final UserEntity user;
  @JsonKey(
    toJson: SerializationHelper.commentStatusToJson,
    fromJson: SerializationHelper.commentStatusFromJson,
  )
  CommentStatus status;
  @JsonKey(
    name: 'create_at',
    toJson: SerializationHelper.dateTimeToJson,
    fromJson: SerializationHelper.dateTimeFromJson,
  )
  final DateTime createAt;

  MovieCommentEntity({
    this.id,
    required this.commentText,
    required this.user,
    required this.createAt,
    required this.replies,
    required this.movieId,
    required this.status,
  });

  setId(String id) {
    this.id = id;
  }

  setCommentText(String text) {
    this.commentText = text;
  }

  setCommentStatus(CommentStatus status) {
    this.status = status;
  }

  bool get isCommentSent => status == CommentStatus.Sent;
  bool get isCommentSending => status == CommentStatus.Sending;
  bool get isCommentEdited => status == CommentStatus.Edited;
  bool get isCommentEditing => status == CommentStatus.Editing;
  bool get isCommentFailure => status == CommentStatus.Failure;

  factory MovieCommentEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieCommentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCommentEntityToJson(this);
}
