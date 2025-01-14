// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_comment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCommentEntity _$MovieCommentEntityFromJson(Map<String, dynamic> json) =>
    MovieCommentEntity(
      id: json['id'] as String?,
      commentText: json['comment_text'] as String,
      user: SerializationHelper.userFromJson(
          json['user'] as Map<String, dynamic>),
      createAt: SerializationHelper.dateTimeFromJson(json['create_at']),
      replies: (json['replies'] as num).toInt(),
      movieId: (json['movie_id'] as num).toInt(),
      status:
          SerializationHelper.commentStatusFromJson(json['status'] as String),
    );

Map<String, dynamic> _$MovieCommentEntityToJson(MovieCommentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment_text': instance.commentText,
      'replies': instance.replies,
      'movie_id': instance.movieId,
      'user': SerializationHelper.userToJson(instance.user),
      'status': SerializationHelper.commentStatusToJson(instance.status),
      'create_at': SerializationHelper.dateTimeToJson(instance.createAt),
    };
