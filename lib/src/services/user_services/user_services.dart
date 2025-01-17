import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/helpers/dio_exception_helper.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/models/response/user_services_response/user_services_response.dart';
import 'package:loomi_challenge/src/repositories/user_repository/user_repository.dart';
import 'package:loomi_challenge/src/services/user_services/user_services_impl.dart';
import 'package:provider/provider.dart';

class UserServices extends UserServicesImplement {
  final _repository = getIt<UserRepository>();

  Future<UserServicesResponse> updateUserData(Map<String, dynamic> data) async {
    try {
      final userProvider =
          Provider.of<UserProvider>(Get.context!, listen: false);

      final userId = userProvider.user.id!;

      final authToken = userProvider.authToken;

      print('--- UpdateUserdata authToken: $authToken');

      await _repository.updateUserData(userId, authToken, data);

      return UserServicesResponse.success();
    } on DioException catch (exception) {
      final exceptionModel = DioExceptionHelper().getException(exception);

      return UserServicesResponse.fail(exceptionModel);
    }
  }
}
