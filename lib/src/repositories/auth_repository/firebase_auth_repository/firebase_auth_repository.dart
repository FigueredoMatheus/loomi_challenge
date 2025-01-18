import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_challenge/src/core/helpers/handle_firebase_exceptions_helper.dart';
import 'package:loomi_challenge/src/core/services/firebase/firebase_instances.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';
import 'package:loomi_challenge/src/models/response/auth_response/auth_response.dart';

class FirebaseAuthRepository {
  final _firebaseAuthInstance = getIt<FirebaseManager>().authInstance;

  Future<AuthResponse> registerUser(String email, String password) async {
    try {
      final userCredentials =
          await _firebaseAuthInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return AuthResponse.firebaseSuccess(userCredentials);
    } on FirebaseAuthException catch (exception) {
      final exceptionMessage =
          HandleFirebaseExceptionsHelper.getAuthExceptionMessage(exception);

      final exceptionModel = ExceptionModel.firebaseException(
        message: exceptionMessage,
        exceptionCode: exception.code,
      );

      return AuthResponse.fail(exceptionModel);
    }
  }

  Future<AuthResponse> userSignIn(String email, String password) async {
    try {
      final userCredentials =
          await _firebaseAuthInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return AuthResponse.firebaseSuccess(userCredentials);
    } on FirebaseAuthException catch (exception) {
      final exceptionMessage =
          HandleFirebaseExceptionsHelper.getAuthExceptionMessage(exception);

      final exceptionModel = ExceptionModel.firebaseException(
        message: exceptionMessage,
        exceptionCode: exception.code,
      );

      return AuthResponse.fail(exceptionModel);
    }
  }
}
