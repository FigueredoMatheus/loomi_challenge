class ForgotPasswordController {
  String? email;

  sendEmailButtonOnTap() {}

  setEmail(String? text) {
    this.email = text;
  }

  dispose() {
    setEmail(null);
  }
}
