import 'package:get/get.dart';

class SettingsController {
  String? name;
  var image = ''.obs;

  init(Map<String, dynamic> json) {
    setName(json['name']);
    setImage(json['image']);
  }

  setName(String? text) {
    name = text;
  }

  setImage(String? image) {
    this.image.value = image ?? '';
  }
}
