import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_challenge/src/models/user_model/user_model.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  bool get isUserLoggedIn => _auth.currentUser != null;

  late UserModel user;

  initUser(Map<String, dynamic> json) {
    user = UserModel.fromJson(json);
  }
}
