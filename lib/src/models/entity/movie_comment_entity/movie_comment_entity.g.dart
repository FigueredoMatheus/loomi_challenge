// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_comment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCommentEntity _$MovieCommentEntityFromJson(Map<String, dynamic> json) =>
    MovieCommentEntity(
      commentText: json['comment_text'] as String,
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      createAt: DateTime.parse(json['create_at'] as String),
      replies: (json['replies'] as num).toInt(),
      movieId: (json['movie_id'] as num).toInt(),
    )..id = json['id'] as String?;

Map<String, dynamic> _$MovieCommentEntityToJson(MovieCommentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment_text': instance.commentText,
      'user': instance.user,
      'create_at': instance.createAt.toIso8601String(),
      'replies': instance.replies,
      'movie_id': instance.movieId,
    };
