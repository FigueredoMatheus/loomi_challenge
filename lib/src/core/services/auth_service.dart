import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/alert_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/exception_warning_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
import 'package:loomi_challenge/src/core/helpers/dio_exception_helper.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/repositories/auth_repository/auth_repository.dart';
import 'package:provider/provider.dart';

class AuthService {
  signInUserService(Map<String, dynamic> credentials) async {
    loadingDialog();

    try {
      final response = await getIt<AuthRepository>().loginUser(credentials);

      Provider.of<UserProvider>(Get.context!, listen: false).initUser(
        response.userEntity.toJson(),
        response.jwt,
      );

      Get.offAllNamed(RoutesNames.homePageView);
    } on DioException catch (exception) {
      Get.back();
      final exceptionModel = DioExceptionHelper().getException(exception);

      exceptionWarning(exceptionModel);
    }
  }

  signUpAccountService(Map<String, dynamic> data) async {
    loadingDialog();

    try {
      final response = await getIt<AuthRepository>().registerUser(data);

      Provider.of<UserProvider>(Get.context!, listen: false).initUser(
        response.userEntity.toJson(),
        response.jwt,
      );

      Get.offAllNamed(RoutesNames.homePageView);
    } on DioException catch (exception) {
      Get.back();

      final exceptionModel = DioExceptionHelper().getException(exception);

      exceptionWarning(exceptionModel);
    }
  }

  forgotUserPasswordService(Map<String, dynamic> data) async {
    loadingDialog();

    try {
      await getIt<AuthRepository>().forgotUserPassword(data);

      Get.offAllNamed(RoutesNames.successOnSendResentEmailPageView);
    } on DioException catch (exception) {
      Get.back();

      final exceptionModel = DioExceptionHelper().getException(exception);

      exceptionWarning(exceptionModel);
    }
  }

  Future<bool> changeUserPasswordService(Map<String, dynamic> data) async {
    loadingDialog();
    print('--- data: $data');
    print('--- _authToken: ${_authToken()}');
    try {
      await getIt<AuthRepository>().changeUserPassword(_authToken(), data);

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

  String _authToken() {
    final jwt = Provider.of<UserProvider>(Get.context!, listen: false).jwt;

    return 'Bearer ' + jwt;
  }

  googleSignInService() async {
    try {
      final response = await getIt<AuthRepository>().googleSignIn();

      print('--- Response: $response');
    } on DioException catch (exception) {
      final exceptionModel = DioExceptionHelper().getException(exception);

      exceptionWarning(exceptionModel);
    }
  }
}
