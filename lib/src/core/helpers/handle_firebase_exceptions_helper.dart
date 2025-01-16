import 'package:firebase_auth/firebase_auth.dart';

class HandleFirebaseExceptionsHelper {
  static String getAuthExceptionMessage(FirebaseAuthException exception) {
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

  static String getFirebaseException(FirebaseException exception) {
    switch (exception.code) {
      case 'not-found':
        return 'The requested document does not exist.';
      case 'permission-denied':
        return 'Missing or insufficient permissions.';
      case 'resource-exhausted':
        return 'Resource quota exceeded or system overloaded.';
      case 'unavailable':
        return 'The service is currently unavailable.';
      case 'unauthorized':
        return 'User doesn\'t have permission to access the object.';
      case 'cancelled':
        return 'The operation was canceled.';
      case 'no-app':
        return 'No app';
      default:
        return 'Unknown error';
    }
  }
}
