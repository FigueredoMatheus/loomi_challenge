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
  } on FirebaseAuthException catch (e) {
    String message = 'Fail on create user account';

    if (e.code == 'weak-password') {
      message = 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      message = 'The account already exists for that email.';
    }
    return {'success': false, 'message': message};
  }
}
