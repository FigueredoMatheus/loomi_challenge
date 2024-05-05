part of 'auth_repository.dart';

Future<Map<String, dynamic>> implSendPasswordResetEmail({
  required String email,
}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    return {
      'success': true,
      'message': 'Email to change password was sent successfully'
    };
  } on FirebaseAuthException catch (exception) {
    String message =
        HandleFirebaseExceptionsHelper.getExceptionMessage(exception);

    return {'success': false, 'message': message};
  }
}
