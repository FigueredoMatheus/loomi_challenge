part of 'firebase_database_repository.dart';

Future<Map<String, dynamic>> implGetUserData(String userId) async {
  try {
    final getResponse =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    final data = getResponse.data();

    return {'success': true, 'user_data': data};
  } on FirebaseException catch (_) {
    return {
      'success': false,
      'message': 'Fail on save user data',
    };
  }
}
