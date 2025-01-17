import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'user_repository.g.dart';

@RestApi(baseUrl: 'https://untold-strapi.api.stage.loomi.com.br/api')
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @PUT('/users/{id}')
  Future updateUserData(
    @Path("id") int userId,
    @Header('Authorization') String authToken,
    @Body() Map<String, dynamic> data,
  );

  @DELETE('/users/{id}')
  Future deleteUser(
    @Path("id") String userId,
    @Header('Authorization') String authToken,
  );
}
