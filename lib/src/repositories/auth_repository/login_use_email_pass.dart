part of 'auth_repository.dart';

Future<Map<String, dynamic>> implLoginUserEmailPass({
  required String email,
  required String password,
}) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return {'success': true, 'user_id': credential.user?.uid};
  } on FirebaseAuthException catch (e) {
    String message = 'Fail on log user in';

    if (e.code == 'user-not-found') {
      message = 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      message = 'Wrong password provided for that user.';
    }

    return {'success': false, 'message': message};
  }
}
