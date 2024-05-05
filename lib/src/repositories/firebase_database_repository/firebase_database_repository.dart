import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
part 'post_user_data.dart';
part 'get_user_data.dart';
part 'upload_file.dart';

class FirebaseDatabaseRepository {
  Future<Map<String, dynamic>> GetUserData(String userId) async =>
      implGetUserData(userId);

  Future<Map<String, dynamic>> postUserData(
    Map<String, dynamic> data,
  ) async =>
      implPostUserData(data);

  Future<Map<String, dynamic>> uploadFile({
    required String userId,
    required String imagePath,
  }) async =>
      implUploadFile(userId: userId, filePath: imagePath);
}
