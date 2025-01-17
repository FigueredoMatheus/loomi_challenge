import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/helpers/dio_exception_helper.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';
import 'package:loomi_challenge/src/models/response/user_services_response/user_services_response.dart';
import 'package:loomi_challenge/src/repositories/user_repository/firebase_user_repository/firebase_user_repository.dart';
import 'package:loomi_challenge/src/repositories/user_repository/user_repository.dart';
import 'package:loomi_challenge/src/services/user_services/user_services_impl.dart';
import 'package:provider/provider.dart';

class UserServices extends UserServicesImplement {
  final _repository = getIt<UserRepository>();
  final _firebaseUser = FirebaseUserRepository();

  Future<UserServicesResponse> updateUserData(Map<String, dynamic> data) async {
    try {
      final userProvider =
          Provider.of<UserProvider>(Get.context!, listen: false);

      final userId = userProvider.user.id!;

      final authToken = await userProvider.getAuthToken();

      await _repository.updateUserData(userId, authToken, data);

      return UserServicesResponse.success();
    } on DioException catch (exception) {
      final exceptionModel = DioExceptionHelper().getException(exception);

      return UserServicesResponse.fail(exceptionModel);
    }
  }

  @override
  Future<UserServicesResponse> deleteAccount() async {
    final userProvider = Provider.of<UserProvider>(Get.context!, listen: false);

    final authToken = await userProvider.getAuthToken();

    late bool isApiSuccess;

    late DioExceptionModel dioException;

    try {
      await _repository.deleteUser(authToken, userProvider.userId.toString());

      isApiSuccess = true;
    } on DioException catch (exception) {
      isApiSuccess = false;

      dioException = DioExceptionHelper().getException(exception);
    }

    final firebaseResponse = await _firebaseUser.deleteUserAccount();

    if (!firebaseResponse.success && !isApiSuccess) {
      print(
          '--- Firebase Exception on Delete Account\n: ${firebaseResponse.exception?.message}');
      return UserServicesResponse.fail(dioException);
    }

    return UserServicesResponse.success();
  }

  @override
  Future<UserServicesResponse> logoutFirebaseUser() async {
    return await _firebaseUser.signOut();
  }
}
