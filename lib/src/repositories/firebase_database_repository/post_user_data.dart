part of 'firebase_database_repository.dart';

Future<Map<String, dynamic>> implPostUserData(
  Map<String, dynamic> data,
) async {
  final id = data['user_id'];

  try {
    await FirebaseFirestore.instance.collection('users').doc(id).set(data);

    return {'success': true};
  } on FirebaseException catch (_) {
    return {
      'success': false,
      'message': 'Fail on save user data',
    };
  }
}
