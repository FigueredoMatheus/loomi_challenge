import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/permissions_helper.dart';

class ImageHelper {
  Future<String?> getDeviceImage(ImageSourceType imageSourceType) async {
    switch (imageSourceType) {
      case ImageSourceType.camera:
        return await _getImageFromCamera();
      case ImageSourceType.gallery:
      default:
        return await _getImageFromGallery();
    }
  }

  Future<String?> _getImageFromGallery() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'gif'],
      );

      if (result == null) return null;

      final selectedFile = result.files[0];

      return selectedFile.path;
    } on PlatformException catch (e) {
      print(e);

      PermissionsHelper().requestPermission(
        requiredPermission: RequiredPermission.photosPermission,
      );
      return null;
    }
  }

  Future<String?> _getImageFromCamera() async {
    try {
      final ImagePicker _picker = ImagePicker();

      final imgFile = await _picker.pickImage(source: ImageSource.camera);

      if (imgFile == null) {
        return null;
      }

      return imgFile.path;
    } on PlatformException catch (e) {
      print(e);

      PermissionsHelper().requestPermission(
        requiredPermission: RequiredPermission.cameraPermission,
      );
      return null;
    }
  }
}
