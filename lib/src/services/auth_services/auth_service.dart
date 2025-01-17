import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/alert_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/exception_warning_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
import 'package:loomi_challenge/src/core/helpers/dio_exception_helper.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/models/response/auth_response/auth_response.dart';
import 'package:loomi_challenge/src/repositories/auth_repository/auth_repository.dart';
import 'package:loomi_challenge/src/repositories/auth_repository/firebase_auth_repository/firebase_auth_repository.dart';
import 'package:loomi_challenge/src/services/auth_services/auth_services_impl.dart';
import 'package:provider/provider.dart';

class AuthService implements AuthServicesImpl {
  final _repository = getIt<AuthRepository>();
  final _firebaseAuth = FirebaseAuthRepository();

  Future<AuthResponse> signInUserService(
    Map<String, dynamic> credentials,
  ) async {
    final firebaseResponse = await _firebaseAuth.userSignIn(
      credentials['identifier'],
      credentials['password'],
    );

    if (!firebaseResponse.success) {
      return firebaseResponse;
    }

    try {
      final firebaseUID = firebaseResponse.firebaseUID!;

      final response = await _repository.loginUser(credentials);

      Provider.of<UserProvider>(Get.context!, listen: false).initUser(
        response.userEntity.toJson(),
        response.jwt,
        firebaseUID,
      );

      return AuthResponse.apiSuccess();
    } on DioException catch (exception) {
      final exceptionModel = DioExceptionHelper().getException(exception);

      return AuthResponse.fail(exceptionModel);
    }
  }

  Future<AuthResponse> signUpAccountService(Map<String, dynamic> data) async {
    final firebaseResponse = await _firebaseAuth.registerUser(
      data['email'],
      data['password'],
    );

    if (!firebaseResponse.success) {
      return firebaseResponse;
    }

    try {
      final firebaseUID = firebaseResponse.firebaseUID!;

      data['firebase_UID'] = firebaseUID;

      final response = await _repository.registerUser(data);

      Provider.of<UserProvider>(Get.context!, listen: false).initUser(
        response.userEntity.toJson(),
        response.jwt,
        firebaseUID,
      );

      return AuthResponse.apiSuccess();
    } on DioException catch (exception) {
      final exceptionModel = DioExceptionHelper().getException(exception);

      return AuthResponse.fail(exceptionModel);
    }
  }

  Future<AuthResponse> forgotUserPasswordService(
      Map<String, dynamic> data) async {
    try {
      await _repository.forgotUserPassword(data);

      return AuthResponse.apiSuccess();
    } on DioException catch (exception) {
      final exceptionModel = DioExceptionHelper().getException(exception);

      return AuthResponse.fail(exceptionModel);
    }
  }

  Future<bool> changeUserPasswordService(Map<String, dynamic> data) async {
    loadingDialog();

    final authToken =
        Provider.of<UserProvider>(Get.context!, listen: false).authToken;

    print('--- authToken: $authToken');

    try {
      await _repository.changeUserPassword(authToken, data);

      Get.back();

      alertDialog(title: 'password changed successfully');
      return true;
    } on DioException catch (exception) {
      Get.back();

      final exceptionModel = DioExceptionHelper().getException(exception);

      exceptionWarning(exceptionModel);
      return false;
    }
  }

  googleSignInService() async {
    try {
      await getIt<AuthRepository>().googleSignIn();
    } on DioException catch (exception) {
      final exceptionModel = DioExceptionHelper().getException(exception);

      exceptionWarning(exceptionModel);
    }
  }
}
