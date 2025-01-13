import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/permissions_helper.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class ImageHelper {
  Future<String?> getDeviceImage(ImageSourceType imageSourceType) async {
    String? imagePath;

    switch (imageSourceType) {
      case ImageSourceType.camera:
        imagePath = await _getImageFromCamera();
      case ImageSourceType.gallery:
      default:
        imagePath = await _getImageFromGallery();
    }
    return imagePath;
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

  Future<String?> _croppImage(String imagePath) async {
    final CroppedFile? imgCropped = await ImageCropper.platform.cropImage(
      uiSettings: [
        AndroidUiSettings(
          toolbarColor: MyThemes.get().kVeryDarkGrayColor,
          backgroundColor: MyThemes.get().kSilverGrayColor,
          cropFrameColor: MyThemes.get().kDarkGrayColor,
          showCropGrid: false,
          toolbarTitle: 'Ajustar Imagem',
          toolbarWidgetColor: MyThemes.get().kOffWhiteColor,
          statusBarColor: MyThemes.get().kVeryDarkGrayColor,
        ),
        IOSUiSettings(
          title: 'Ajustar Imagem',
          doneButtonTitle: 'Ok',
          cancelButtonTitle: 'Cancelar',
        ),
      ],
      sourcePath: imagePath,
      compressQuality: 90,
      maxHeight: 200,
      maxWidth: 200,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    );

    if (imgCropped == null) {
      return null;
    }

    return imgCropped.path;
  }
}
