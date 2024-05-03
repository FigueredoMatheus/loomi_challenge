class LoginController {
  String? email;
  String? password;

  setEmail(String email) {
    this.email = email;
  }

  setPassword(String text) {
    password = text;
  }

  dispose() {
    email = null;
    password = null;
  }
}
