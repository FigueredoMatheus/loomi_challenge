import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:provider/provider.dart';

class SettingsController {
  String? name;
  var image = ''.obs;

  init(Map<String, dynamic> json) {
    setName(json['username']);
    setImage(json['image']);
  }

  onUpdate() {
    final message =
        TextFieldValidatorsHelper().validateFields(name: name ?? '');

    if (message != null) {
      MyAppSnackBar(message: message, snackBarType: SnackBarType.fail)..show();
      return;
    }

    Provider.of<UserProvider>(Get.context!, listen: false).setUsername(name!);
  }

  setName(String? text) {
    name = text;
  }

  setImage(String? image) {
    this.image.value = image ?? '';
  }
}
