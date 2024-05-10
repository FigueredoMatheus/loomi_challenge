import 'package:dio/dio.dart' hide Headers;
import 'package:loomi_challenge/src/models/response/user_response/user_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repository.g.dart';

/// A repository for handling authentication-related API calls.
///
/// This repository provides methods for user authentication, including
/// registering a new user, logging in, requesting password resets, and
/// changing passwords.
///
@RestApi(baseUrl: 'https://untold-strapi.api.stage.loomi.com.br/api')
abstract class AuthRepository {
  /// Constructs an instance of [AuthRepository].
  ///
  /// The [dio] parameter is the Dio instance used for making HTTP requests.
  /// The optional [baseUrl] parameter specifies the base URL of the API.

  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;

  /// Initiates the Google Sign-In process.
  ///
  /// Returns a Future that resolves to the result of the Google Sign-In process.

  @GET('/connect/google')
  Future googleSignIn();

  /// Registers a new user with the provided user data.
  ///
  /// The [userData] parameter is a Map containing the user data.
  /// Returns a Future that resolves to a [UserResponse] object representing the registered user.

  @POST('/auth/local/register')
  Future<UserResponse> registerUser(@Body() Map<String, dynamic> userData);

  /// Logs in a user with the provided credentials.
  ///
  /// The [credentials] parameter is a Map containing the user credentials.
  /// Returns a Future that resolves to a [UserResponse] object representing the logged-in user.

  @POST('/auth/local')
  Future<UserResponse> loginUser(@Body() Map<String, dynamic> credentials);

  /// Sends a password reset request for the user associated with the provided credentials.
  ///
  /// The [credentials] parameter is a Map containing the user credentials.
  /// Returns a Future that resolves when the password reset request is successful.

  @POST('/auth/forgot-password')
  Future forgotUserPassword(@Body() Map<String, dynamic> credentials);

  /// Changes the password for the user associated with the provided authentication token.
  ///
  /// The [authToken] parameter is the authentication token of the user.
  /// The [data] parameter is a Map containing the new password data.
  /// Returns a Future that resolves when the password change is successful.

  @POST('/auth/change-password')
  Future changeUserPassword(
    @Header('Authorization') String authToken,
    @Body() Map<String, dynamic> data,
  );
}
