import 'package:dio/dio.dart' hide Headers;
import 'package:loomi_challenge/src/models/response/user_response/user_register_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repository.g.dart';

@RestApi(baseUrl: 'https://untold-strapi.api.stage.loomi.com.br/api')
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;

  @GET('/connect/google')
  Future googleSignIn();

  @POST('/auth/local/register')
  Future<UserRegisterResponse> registerUser(
      @Body() Map<String, dynamic> userData);

  @POST('/auth/local')
  Future<UserRegisterResponse> loginUser(
      @Body() Map<String, dynamic> credentials);

  @POST('/auth/forgot-password')
  Future forgotUserPassword(@Body() Map<String, dynamic> credentials);
}
