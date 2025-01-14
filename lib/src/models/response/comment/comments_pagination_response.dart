import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';

class CommentsPaginationResponse {
  final bool success;
  final List<MovieCommentEntity> comments;
  final DocumentSnapshot? lastDocument;
  final String? errorMessage;

  CommentsPaginationResponse.onSuccess(this.comments, this.lastDocument)
      : errorMessage = null,
        success = true;

  CommentsPaginationResponse.onError(this.errorMessage)
      : lastDocument = null,
        comments = [],
        success = false;
}
