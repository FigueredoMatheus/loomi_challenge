import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/models/entity/user_entity/user_entity.dart';

class UserProvider extends ChangeNotifier {
  late UserEntity user;

  User? firebaseUser;

  int get userId => user.id!;

  String get username => user.username;

  String get email => user.email;

  String? get image => user.image;

  String get jwt => user.jwt!;

  bool get isUserLoggedIn => firebaseUser != null;

  Map<String, dynamic> get userData => user.toJson();

  initUser(
      Map<String, dynamic> data, String jwt, UserCredential userCredential) {
    user = UserEntity.fromJson(data);
    user.setJwt(jwt);
    firebaseUser = userCredential.user;
  }

  setUsername(String text) {
    user.setName(text);
    notifyListeners();
  }

  Future<String> getAuthToken() async {
    final authToken = await firebaseUser?.getIdToken() ?? '';

    return 'Bearer ' + authToken;
  }

  Future<void> logout() async {
    firebaseUser = null;
  }
}
