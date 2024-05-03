import 'package:cloud_firestore/cloud_firestore.dart';

part 'post_user_data.dart';

class FirebaseDatabaseRepository {
  Future<Map<String, dynamic>> postUserData(
    Map<String, dynamic> data,
  ) async =>
      implPostUserData(data);
}
