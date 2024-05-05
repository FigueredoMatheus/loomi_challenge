import 'package:firebase_auth/firebase_auth.dart';

class HandleFirebaseExceptionsHelper {
  static String getExceptionMessage(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'invalid-credential' || 'channel-error':
        return 'Email or password is invalid';
      case 'invalid-email':
        return 'Invalid Email';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'weak-password':
        return 'The password provided is too weak.';

      default:
        return 'Unknown error';
    }
  }
}
