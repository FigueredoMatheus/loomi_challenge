import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
part 'post_user_data.dart';
part 'get_comments_data.dart';
part 'upload_file.dart';

class FirebaseDatabaseRepository {
  Future<Map<String, dynamic>> getMovieCommentsData(int movieId) async =>
      implGetMovieCommentsData(movieId);

  Future<Map<String, dynamic>> postMovieCommentData(
    Map<String, dynamic> data,
  ) async =>
      implPostUserData(data);
}
