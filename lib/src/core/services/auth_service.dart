import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/exception_warning_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
import 'package:loomi_challenge/src/core/helpers/dio_exception_helper.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/models/entity/user_model/user_entity.dart';
import 'package:loomi_challenge/src/repositories/auth_repository/auth_repository.dart';
import 'package:provider/provider.dart';

class AuthService {
  signInUserService(Map<String, dynamic> credentials) async {
    loadingDialog();

    try {
      final response = await getIt<AuthRepository>().loginUser(credentials);

      Provider.of<AuthService>(Get.context!, listen: false)
          .initUser(response.userEntity.toJson());

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

      Provider.of<AuthService>(Get.context!, listen: false)
          .initUser(response.userEntity.toJson());

      print('--- user: ${user.toJson()}');

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

  googleSignInService() async {
    try {
      final response = await getIt<AuthRepository>().googleSignIn();

      print('--- Response: $response');
    } on DioException catch (exception) {
      final exceptionModel = DioExceptionHelper().getException(exception);

      exceptionWarning(exceptionModel);
    }
  }

  static final _auth = FirebaseAuth.instance;

  bool get isUserLoggedIn => _auth.currentUser != null;

  late UserEntity user;

  initUser(Map<String, dynamic> json) {
    user = UserEntity.fromJson(json);
  }

  Future<void> logout() async {
    user.onLogout();
    loadingDialog();
    Get.offAllNamed(RoutesNames.loginPageView);
  }
}
