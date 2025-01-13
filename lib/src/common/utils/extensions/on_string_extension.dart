extension onStringExtensions on String {
  bool isNetworkUrl() {
    RegExp regex = RegExp(r'^https?://');

    final isValid = regex.hasMatch(this);

    return isValid;
  }
}
