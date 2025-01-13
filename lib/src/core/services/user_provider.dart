import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/models/entity/user_entity/user_entity.dart';

class UserProvider extends ChangeNotifier {
  late UserEntity user;

  int get userId => user.id!;

  String get username => user.username;

  String get email => user.email;

  String? get image => user.image;

  String get jwt => user.jwt!;

  bool get isUserLoggedIn => user.jwt != null;

  Map<String, dynamic> get userData => user.toJson();

  initUser(Map<String, dynamic> data, String jwt) {
    user = UserEntity.fromJson(data);
    user.setJwt(jwt);
  }

  setUsername(String text) {
    user.setName(text);
    notifyListeners();
  }

  Future<void> logout() async {
    user.onLogout();
  }
}
