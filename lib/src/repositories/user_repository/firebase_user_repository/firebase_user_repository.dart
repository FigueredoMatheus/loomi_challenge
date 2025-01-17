import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_challenge/src/core/helpers/handle_firebase_exceptions_helper.dart';
import 'package:loomi_challenge/src/core/services/firebase/firebase_instances.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';
import 'package:loomi_challenge/src/models/response/user_services_response/user_services_response.dart';

class FirebaseUserRepository {
  final _firebaseAuthInstance = getIt<FirebaseManager>().authInstance;

  Future<UserServicesResponse> deleteUserAccount() async {
    try {
      await _firebaseAuthInstance.currentUser?.delete();

      return UserServicesResponse.success();
    } on FirebaseAuthException catch (exception) {
      final exceptionMessage =
          HandleFirebaseExceptionsHelper.getAuthExceptionMessage(exception);

      final exceptionModel = DioExceptionModel(
        title: 'Firebase Exception',
        message: exceptionMessage,
      );

      return UserServicesResponse.fail(exceptionModel);
    }
  }

  Future<UserServicesResponse> signOut() async {
    try {
      await _firebaseAuthInstance.signOut();
      return UserServicesResponse.success();
    } on FirebaseAuthException catch (exception) {
      final exceptionMessage =
          HandleFirebaseExceptionsHelper.getAuthExceptionMessage(exception);

      final exceptionModel = DioExceptionModel(
        title: 'Firebase Exception',
        message: exceptionMessage,
      );

      return UserServicesResponse.fail(exceptionModel);
    }
  }
}
