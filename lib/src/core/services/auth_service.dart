import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loomi_challenge/src/models/entity/user_model/user_entity.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  bool get isUserLoggedIn => _auth.currentUser != null;

  late UserEntity user;

  initUser(Map<String, dynamic> json) {
    user = UserEntity.fromJson(json);
  }

  Future<void> logout() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
    user.onLogout();
  }
}
