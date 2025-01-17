import 'package:loomi_challenge/src/models/response/user_services_response/user_services_response.dart';

abstract class UserServicesImplement {
  Future<UserServicesResponse> updateUserData(Map<String, dynamic> data);
}
