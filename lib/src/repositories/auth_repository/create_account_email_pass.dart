part of 'auth_repository.dart';

Future<Map<String, dynamic>> implCreateUserEmailPass({
  required String email,
  required String password,
}) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return {'success': true, 'user_id': credential.user?.uid};
  } on FirebaseAuthException catch (exception) {
    String message =
        HandleFirebaseExceptionsHelper.getExceptionMessage(exception);

    return {'success': false, 'message': message};
  }
}
