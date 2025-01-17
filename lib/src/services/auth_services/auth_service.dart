import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/exception_warning_dialog.dart';
import 'package:loomi_challenge/src/core/helpers/dio_exception_helper.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/models/response/auth_response/auth_response.dart';
import 'package:loomi_challenge/src/repositories/auth_repository/auth_repository.dart';
import 'package:loomi_challenge/src/repositories/auth_repository/firebase_auth_repository/firebase_auth_repository.dart';
import 'package:loomi_challenge/src/services/auth_services/auth_services_impl.dart';
import 'package:provider/provider.dart';

class AuthService implements AuthServicesImpl {
  final _ApiRepository = getIt<AuthRepository>();
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
      final response = await _ApiRepository.loginUser(credentials);

      Provider.of<UserProvider>(Get.context!, listen: false).initUser(
        response.userEntity.toJson(),
        response.jwt,
        firebaseResponse.firebaseUserCredential!,
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
      final response = await _ApiRepository.registerUser(data);

      final userData = response.userEntity.toJson();

      userData.addIf(data['image'] != null, 'image', data['image']);

      Provider.of<UserProvider>(Get.context!, listen: false).initUser(
        userData,
        response.jwt,
        firebaseResponse.firebaseUserCredential!,
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
      await _ApiRepository.forgotUserPassword(data);

      return AuthResponse.apiSuccess();
    } on DioException catch (exception) {
      final exceptionModel = DioExceptionHelper().getException(exception);

      return AuthResponse.fail(exceptionModel);
    }
  }

  Future<AuthResponse> changeUserPasswordService(
    Map<String, dynamic> data,
  ) async {
    final authToken =
        await Provider.of<UserProvider>(Get.context!, listen: false)
            .getAuthToken();

    try {
      await _ApiRepository.changeUserPassword(authToken, data);

      return AuthResponse.apiSuccess();
    } on DioException catch (exception) {
      final exceptionModel = DioExceptionHelper().getException(exception);

      return AuthResponse.fail(exceptionModel);
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
