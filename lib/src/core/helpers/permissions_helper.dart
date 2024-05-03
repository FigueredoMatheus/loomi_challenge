import 'package:loomi_challenge/src/common/utils/dialogs/request_permission_dialog.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsHelper {
  requestPermission({required RequiredPermission requiredPermission}) async {
    late bool result;

    switch (requiredPermission) {
      case RequiredPermission.photosPermission:
        result = await _requestFilePermission();
        break;
      case RequiredPermission.cameraPermission:
      default:
        result = await _requestCameraPermission();
        break;
    }

    if (!result) {
      requestPermissionDialog(
        bodyText: _bodyTextDialog(requiredPermission),
      );
    }
  }

  Future<bool> _requestFilePermission() async {
    PermissionStatus result;

    result = await Permission.photos.request();

    if (result.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _requestCameraPermission() async {
    PermissionStatus result;

    result = await Permission.camera.request();

    if (result.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  String _bodyTextDialog(RequiredPermission requiredPermission) {
    switch (requiredPermission) {
      case RequiredPermission.photosPermission:
        return 'Para executar essa ação, as permisões para acessar arquivos e mídia precisam ser definidas.';

      case RequiredPermission.cameraPermission:
      default:
        return 'Para executar essa ação, as permisões para acessar a câmera precisam ser definidas.';
    }
  }
}
